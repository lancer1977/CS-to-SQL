# Code Health

## Current state

- The repository contains C# source files under `repo/`.
- No `.csproj` or `.sln` is currently present, so CI cannot compile or run .NET tests yet.
- CI runs structural validation through `scripts/validate.sh` and will run `dotnet test` automatically once a project or solution is added.

## Validation

- `bash scripts/validate.sh`

## Follow-ups

- Add a buildable .NET project/solution for the generator.
- Add unit tests around C# type-to-TypeScript conversion once the project is buildable.
- Replace deployment placeholders if this repo becomes a packaged service instead of a generator utility.
