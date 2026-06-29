# Validation

CS-to-SQL is a source-only docs and generator repository. It does not currently
contain a solution or project file, so validation checks the repository shape,
source presence, and hosted-docs setup instructions that consumers rely on.

## Command

```bash
bash scripts/validate.sh
```

The CI artifact workflow runs the same validation before creating the source
bundle.

## 2026-06-29 Baseline

- `bash scripts/validate.sh`
- Result: passed.

## Release Gate

Before changing setup or hosting documentation:

- Run `bash scripts/validate.sh`.
- Confirm `README.md` still documents the GitHub Pages and non-GitHub hosting
  paths.
- Confirm `repo/` still contains C# source files for the repository-generator
  surface.
- Update `docs/roadmaps/portfolio-roadmap.md` when a setup or hosting behavior
  change creates follow-up work.
