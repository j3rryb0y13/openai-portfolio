#!/usr/bin/env bash
set -euo pipefail

START="${1:-}"; END="${2:-}"
if [[ -z "${START}" || -z "${END}" || ! "${START}" =~ ^[0-9]+$ || ! "${END}" =~ ^[0-9]+$ || "${START}" -gt "${END}" ]]; then
  echo "Usage: bash scripts/scaffold_weeks.sh <START_WEEK_NUM> <END_WEEK_NUM>"
  echo "Example: bash scripts/scaffold_weeks.sh 5 12"
  exit 1
fi

GUIDE_REL="../docs/Systematic_Thinking_Guide.md"

for i in $(seq "${START}" "${END}"); do
  dir="Week${i}_TBD"
  mkdir -p "$dir"/{data,notebooks,src,reports}
  touch "$dir"/{data,notebooks,src,reports}/.gitkeep

  title="$(echo "${dir%/}" | sed 's/[_-]/ /g')"

  cat > "$dir/README.md" <<MD
# ${title}

[í³˜ Systematic Thinking Guide](${GUIDE_REL})

---

## Phase Goal Alignment
- 

## Systematic Layers
**Concept** â€”  
**Practice** â€”  
**Meta-Reflection** â€”  

## Goals
- 

## Deliverables
- 

## Notes
- 
MD

  echo "Scaffolded $dir"
done

git add Week*/README.md Week*/data/.gitkeep Week*/notebooks/.gitkeep Week*/src/.gitkeep Week*/reports/.gitkeep || true
git commit -m "Scaffold weeks ${START}â€“${END} with README and standard folders" || echo "No changes to commit."
git push || true
