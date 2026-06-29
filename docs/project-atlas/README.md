# Project Atlas

## Purpose

`CS-to-SQL` contains early C# generator code and supporting repo scaffolding.

## Entry points

- `repo/` - current C# source files.
- `README.md` - repo overview and legacy notes.
- `deploy/` - reusable deployment scaffold.
- `scripts/validate.sh` - CI validation entry point.

## Validation

Run `bash scripts/validate.sh` from the repository root. The script performs structural checks today and will run `dotnet test` when a `.csproj` or `.sln` is added.
