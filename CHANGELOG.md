# Changelog

All notable changes to DriveMind should be recorded here.

## `v0.4.0` - 2026-03-17

### Added
- `session-handoff.md` for cross-session continuity: passive by default, triggered by user signals, one-line prompt in Execution/Intensive mode at natural stopping points
- `confidence-signaling.md` for structured uncertainty communication: three levels (evidence-based, inference, hypothesis) with verification paths and anti-pattern guidance
- zero-config auto-detect install: `bootstrap.sh` and `bootstrap.ps1` now detect installed AI tools and install to all targets automatically — no flags required
- `irm ... | iex` support for Windows PowerShell one-liner install

### Changed
- translated `decision-gates.md`, `stuck-resolution.md`, and `task-typing.md` from Chinese to English for language consistency across all skill references
- updated `SKILL.md` description to include session continuity triggers
- updated `SKILL.md` to reference `session-handoff.md` and `confidence-signaling.md`
- removed internal development note from `SKILL.md`
- updated `docs/roadmap.md` to reflect accurate v0.4 direction
- simplified README install section: zero-param command is now the primary path, advanced options folded into a collapsible block

## `v0.3.0` - 2026-03-12

### Added
- `task-typing.md` for lightweight internal task classification
- `decision-gates.md` for boundary, pressure, release/production, external representation, and data/deletion decisions
- `stuck-resolution.md` for blocker diagnosis and momentum recovery
- a compression rule to keep short answers natural and avoid visible framework over-expansion
- release notes for the formal v0.3.0 iteration

### Changed
- upgraded DriveMind from a validated reliability layer toward a sharper decision layer
- strengthened persistence behavior so stuck work is resolved by blocker diagnosis rather than brute repetition
- strengthened safety-boundary behavior so urgency does not weaken authorization or release discipline
- improved output guidance so judgment, boundary, and stuck tasks can stay concise while still preserving clarity and next-step value
- updated mode guidance so higher intensity never weakens authority boundaries
- refined escalation guidance with clearer high-pressure and missing-authority handling

### Validated
- judgment-oriented responses
- boundary-sensitive responses
- high-pressure / urgency handling
- stuck / progress-unblocking behavior
- lightweight distillation behavior
- regression checks against over-structured output

## `v0.2.0` - 2026-03-11

### Added
- `review-style-guide.md` for structured-but-natural retrospectives
- release notes for the validated v0.2.0 iteration

### Changed
- expanded natural-language trigger coverage for calm persistence and boundary-aware instructions
- renamed the strongest mode from `Focused` to `Intensive`
- improved non-trivial output guidance so implicit activation expands beyond one-line acknowledgements
- changed review guidance from rigid template enforcement to structured-and-adaptive retrospectives
- preserved a stable six-part review spine while reducing mechanical phrasing

### Validated
- explicit trigger behavior
- implicit trigger behavior
- escalation and safety-boundary handling
- real troubleshooting flow
- real boundary/judgment flow
- real post-task review flow

## `v0.1.0` - 2026-03-11

### Added
- the first reusable DriveMind skill package
- one-click bootstrap installers for Codex and Claude Code
- portable local install scripts for personal, project, and custom targets
- source-available licensing under BUSL-1.1
- logo source assets and rendering script
- bilingual public README entry points in English and Chinese
- governance docs: contributing, changelog, conduct, security, and trademark policy
- a minimal GitHub Actions validation workflow
- issue contact guidance with public issues and maintainer email
- GitHub About, topic, and social preview copy for repository presentation.

### Changed
- unified product language around calm reliability, safety boundaries, and human collaboration
- consolidated repeated brand copy into a single brand kit
- cleaned redundant logo exports and kept source assets only
- aligned roadmap language under the `v0.x` version line
- added README badges for version, license, and install targets.
