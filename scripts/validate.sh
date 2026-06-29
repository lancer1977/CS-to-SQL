#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

required_paths=(
  "README.md"
  "docs/README.md"
  "docs/validation.md"
  "docs/roadmaps/portfolio-roadmap.md"
  "repo/Program.cs"
  "repo/Constants.cs"
  "repo/TsProp.cs"
  "repo/TypeScriptInterfacesExtension.cs"
  "code_health.md"
  "docs/project-atlas/README.md"
  ".devstudio/project.yaml"
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

if find . -name '*.csproj' -o -name '*.sln' | grep -q .; then
  dotnet test
else
  echo "No .NET project or solution found; skipping dotnet test"
fi

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  docker compose -f deploy/docker-compose.local.yml config --quiet
  docker compose -f deploy/nginx/docker-compose.local.yml config --quiet
  docker compose -f deploy/nginx/docker-compose.portainer.yml config --quiet
  docker compose -f deploy/portainer-stack.yml config --quiet
else
  echo "docker compose not available; skipping compose syntax validation"
fi

if command -v devstudio >/dev/null 2>&1; then
  devstudio validate --repo "$repo_root"
else
  echo "devstudio not available; skipping DevStudio validation"
fi

echo "CS-to-SQL validation passed"
