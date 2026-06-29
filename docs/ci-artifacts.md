# CI Artifacts

The artifact workflow lives at `.github/workflows/artifacts.yml`.

This repository does not currently include a solution, project file, package manifest, Dockerfile, or compose file on the default branch. The CI path therefore validates the source/documentation layout and publishes a source bundle instead of pretending there is a container or package artifact.

## Validation path

- `test -f README.md`
- `test -d docs`
- `test -d repo`
- `find repo -type f -name '*.cs' -print -quit | grep -q .`
- `git archive --format=zip --output=artifacts/cs-to-sql-source.zip HEAD`

## Artifact destinations

- Workflow artifact: `cs-to-sql-source`

## Secrets and permissions

No repository secrets are required. The workflow only needs read access to repository contents.
