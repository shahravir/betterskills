#!/usr/bin/env zsh
# Validates all skills registered in catalogue.yaml
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
errors=0

err() {
  echo "${RED}ERROR:${NC} $1" >&2
  errors=$((errors + 1))
}

ok() {
  echo "${GREEN}OK:${NC} $1"
}

# --- Parse catalogue skill paths (minimal yaml: path: skills/...) ---
skill_paths=()
while IFS= read -r line; do
  skill_paths+=("$line")
done < <(awk '/^[[:space:]]+path:/ { print $2 }' catalogue.yaml)

if [[ ${#skill_paths[@]} -eq 0 ]]; then
  err "No skills found in catalogue.yaml"
  exit 1
fi

echo "Validating ${#skill_paths[@]} skills..."

for rel in "${skill_paths[@]}"; do
  dir="$ROOT/$rel"
  name="${rel##*/}"

  [[ -d "$dir" ]] || { err "$rel: directory missing"; continue; }
  [[ -f "$dir/SKILL.md" ]] || { err "$rel: missing SKILL.md"; continue; }
  [[ -f "$dir/skill.manifest.yaml" ]] || { err "$rel: missing skill.manifest.yaml"; continue; }

  # Frontmatter: name + description
  if ! head -n 30 "$dir/SKILL.md" | grep -q '^---'; then
    err "$rel: SKILL.md missing YAML frontmatter"
  fi
  if ! grep -qE '^name:\s+' "$dir/SKILL.md"; then
    err "$rel: SKILL.md missing 'name:' in frontmatter"
  fi
  if ! grep -qE '^description:\s+' "$dir/SKILL.md"; then
    err "$rel: SKILL.md missing 'description:' in frontmatter"
  fi

  # name matches folder id (convention)
  fm_name=$(awk -F': *' '/^name:/ { print $2; exit }' "$dir/SKILL.md" | tr -d '\r')
  if [[ "$fm_name" != "$name" ]]; then
    err "$rel: frontmatter name '$fm_name' != directory id '$name'"
  fi

  # manifest id
  manifest_id=$(awk -F': *' '/^id:/ { print $2; exit }' "$dir/skill.manifest.yaml" | tr -d '\r')
  if [[ "$manifest_id" != "$name" ]]; then
    err "$rel: manifest id '$manifest_id' != directory id '$name'"
  fi

  # Line count
  lines=$(wc -l < "$dir/SKILL.md" | tr -d ' ')
  if [[ "$lines" -gt 500 ]]; then
    err "$rel: SKILL.md has $lines lines (max 500)"
  fi

  ok "$rel"
done

# Catalogue count matches discovered paths
catalogue_count=$(grep -cE '^\s+path:\s+' catalogue.yaml || true)
if [[ "$catalogue_count" -ne "${#skill_paths[@]}" ]]; then
  err "catalogue path count mismatch"
fi

if [[ $errors -gt 0 ]]; then
  echo ""
  echo "${RED}$errors validation error(s).${NC}" >&2
  exit 1
fi

echo ""
echo "${GREEN}All skills passed validation.${NC}"
