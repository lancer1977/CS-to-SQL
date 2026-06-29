# CS-to-SQL portfolio roadmap

## Snapshot
- 90-day evidence: 3 commits, 15 files changed
- Last signal: `90eae2d`
- Top modified areas: `docs`, `00_agile`, `README`
- Stack: Other/Assets
- Docs folder: yes
- Roadmap folder: no
- Features docs: yes
- Tests indexed: no

## Implemented now (V1 baseline)
- Repository guidance is strongly documented in `sub-module-repo.md`, `sub-module-repository-example.md`, and `standardized-project-layout.md`.
- GitHub Pages setup and onboarding guidance are documented in `basic---how-to-setup-for-hosting-on-github-pages.md`.
- Core capabilities and application logic docs exist as baseline product framing.

## Gaps identified
- No runtime tests visible, so docs and examples can drift from actual repo contract.
- Setup-hosting guidance should be backed by a reproducible checklist.
- Change risk is mostly in docs, but deployment behavior can still break consumers.

## V1 (stability)
- [x] Add one deterministic docs-to-source consistency check for setup and repo files. See `scripts/validate.sh`.
- [x] Add a reproducible checklist for hosted-docs configuration and repository examples. See `docs/validation.md`.
- [x] Add versioned notes for example payloads and required repo metadata. The validation baseline is dated in `docs/validation.md`.
- [x] Add release gate for docs changes affecting deploy and hosting. See `docs/validation.md`.

## V2 (confidence)
- [ ] Create a lightweight validation command suite for `repository.example` and generated files.
- [ ] Add ownership and signoff rules for setup-related documentation changes.
- [ ] Add changelog notes for schema/contract or hosting changes.
- [ ] Introduce update cadence with periodic docs smoke checks.

## V10 (scale)
- [ ] Build a reusable repository template governance policy used across related repos.
- [ ] Add automated diff checks that detect stale references and missing docs.
- [ ] Add a long-range support plan for deprecated examples and migration paths.
- [ ] Create structured release and rollback process for hosting/config updates.

## Readiness checklist
- [ ] Any docs/setup change has at least one validation command.
- [ ] Example outputs are kept in sync with docs.
- [ ] Consumer impact and compatibility are explicitly recorded.
