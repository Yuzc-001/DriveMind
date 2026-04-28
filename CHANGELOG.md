# Changelog

## Unreleased

### Added

- added `evals/drivemind-v0.7-pressure-cases.json` as the canonical pressure suite for v0.7 behavior
- added `scripts/validate-evals.ps1` and CI coverage for eval suite shape, failure-mode coverage, and reference validity

### Changed

- rewrote `skill/references/mode-guide.md` so normal, execution, and intensive modes each express a concrete execution-ceiling move
- replaced the static stress-case doc with an eval-linked scoring guide

## `v0.7.0` - 2026-04-28

### Changed

- rebuilt the repository as a pure v0.7 work surface
- centered DriveMind on **execution integrity + execution ceiling + experience compounding**
- rewrote the public README, Chinese README, product definition, promo copy, brand docs, and repo map around the v0.7 failure model
- replaced the old visual direction with the Signal Gate identity and image2.0-generated v0.7 release lockup
- hardened install and bootstrap scripts so installs validate the package and replace old skill copies cleanly
- removed non-current release notes, redirect references, examples, and stress docs from the current tree

### Added

- `skill/references/execution-ceiling.md`
- `docs/drivemind-v0.7-execution-ceiling.md`
- `docs/drivemind-v0.7-stress-cases.md`
- `docs/github-release-v0.7.0.md`
- `assets/logo/drivemind-v0.7-lockup.png`
- `assets/social/drivemind-v0.7-preview.png`

### Standard

DriveMind v0.7 is judged by whether it improves real task execution:

- fewer premature stops
- fewer fake retries
- clearer blocker diagnosis
- stricter boundaries under pressure
- stronger concrete next moves
- better handoff and closure residue
