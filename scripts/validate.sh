#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

required_paths=(
  "README.md"
  "docs/README.md"
  "docs/roadmaps/portfolio-roadmap.md"
  "repo"
)

for path in "${required_paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required path: $path" >&2
    exit 1
  fi
done

if ! find repo -type f -name '*.cs' -print -quit | grep -q .; then
  echo "No C# source files found under repo/" >&2
  exit 1
fi

required_readme_terms=(
  "GitHub Pages"
  "repository.example"
  "_repo_xml_generator.py"
  "zips/addons.xml"
)

for term in "${required_readme_terms[@]}"; do
  if ! grep -Fq "$term" README.md; then
    echo "README.md is missing expected setup term: $term" >&2
    exit 1
  fi
done

echo "CS-to-SQL validation passed"
