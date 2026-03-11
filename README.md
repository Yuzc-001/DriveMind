# DriveMind

![DriveMind lockup](assets/logo/drivemind-lockup.svg)

[English](./README.md) · [简体中文](./README.zh-CN.md) · [GitHub Repository](https://github.com/Yuzc-001/DriveMind) · [Issues](https://github.com/Yuzc-001/DriveMind/issues)

[![Version](https://img.shields.io/badge/version-v0.1.0-0B1738?style=flat-square)](./CHANGELOG.md)
[![License](https://img.shields.io/badge/license-BUSL--1.1-23C993?style=flat-square)](./LICENSE.md)
[![Codex](https://img.shields.io/badge/install-codex-29A8D8?style=flat-square)](./docs/installation.md)
[![Claude%20Code](https://img.shields.io/badge/install-claude%20code-4466F2?style=flat-square)](./docs/installation.md)

> **A calm reliability layer for AI agents.**
>
> Thoughtful execution, clear safety boundaries, and human collaboration for real work.

DriveMind is for people who want agents to work like careful collaborators, not reckless operators. It helps agents stay with meaningful work, keep humans informed, stop at unclear boundaries, and leave behind reusable lessons after the task is done.

**Current release:** `v0.1 Foundation`

This repository ships the first public DriveMind package: the skill, one-click installers, operating references, templates, examples, governance docs, and brand assets needed to use it like a real product.

## What DriveMind stands for

DriveMind is a gentler and more rational form of reliability.
It is built around three commitments:
1. continue with evidence, not stubbornness
2. escalate when the safety boundary becomes unclear
3. turn finished work into reusable memory, not disposable output.

## Why DriveMind exists

Long-running agent work usually breaks in four ways:
1. context gets lost
2. work stops too early
3. the agent waits passively instead of helping
4. uncertainty turns into bad tradeoffs.

DriveMind exists to make that behavior calmer, safer, and easier to trust.

## What ships in this repo

DriveMind `v0.1 Foundation` includes:
- a reusable DriveMind skill in `skill/SKILL.md`
- persistence, escalation, and mode references in `skill/references/`
- diary, review, and distillation templates in `skill/templates/`
- local and remote install helpers in `scripts/`
- product, licensing, and operating docs in `docs/`
- contributor and governance docs at the repository root
- a minimal validation workflow in `.github/workflows/`
- first-party logo assets in `assets/logo/`
- practical walkthroughs and comparisons in `examples/`.

## Install

DriveMind ships one portable skill package with multiple install targets.

### One-click install

#### Codex personal skill

```powershell
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp codex-personal; Remove-Item $tmp
```

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- codex-personal
```

#### Claude personal skill

```powershell
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp claude-personal; Remove-Item $tmp
```

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- claude-personal
```

#### Claude project skill

```powershell
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp claude-project D:\path\to\your-project; Remove-Item $tmp
```

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- claude-project /path/to/your-project
```

### Install from a cloned repo

```powershell
./scripts/install.ps1 codex-personal
./scripts/install.ps1 claude-personal
./scripts/install.ps1 claude-project D:\path\to\your-project
```

```bash
bash ./scripts/install.sh codex-personal
bash ./scripts/install.sh claude-personal
bash ./scripts/install.sh claude-project /path/to/your-project
```

See [docs/installation.md](docs/installation.md) for the full install matrix, aliases, update flow, and target paths.

## Distribution model

DriveMind does not ship separate personal and project packages.
It ships one portable `drivemind` skill package with different install targets.

That keeps the product coherent, easier to maintain, and easier to trust.
See [docs/distribution-strategy.md](docs/distribution-strategy.md).

## What DriveMind changes

DriveMind adds four operating behaviors to agent work:
- **calm persistence**: keep working on important tasks without turning every obstacle into drama
- **clear safety boundaries**: ask before crossing unclear or high-risk lines
- **human collaboration**: keep the human informed and return decisions at the right moment
- **review and reusable memory**: distill what happened so the next run starts smarter.

## Who it is for

DriveMind is built for:
- developers shipping agent workflows
- advanced AI users running recurring tasks
- researchers exploring agent reliability
- teams that want calmer human-in-the-loop collaboration.

## What it is not

DriveMind is not:
- a hype persona or roleplay wrapper
- a diary-only tool
- a memory plugin by itself
- a permission slip for reckless retries.

It is a reliability layer that makes agents steadier, more legible, and easier to supervise.

## Basic activation

Examples:
- `Enable DriveMind in execution mode.`
- `Use DriveMind for this task. Stay steady and keep me informed.`
- `Stay with this a little longer before concluding, but ask me before crossing an unclear boundary.`
- `Review this task after completion and preserve what should be remembered.`

When DriveMind is active, the agent should:
1. gather evidence before concluding failure
2. try bounded alternatives before escalation
3. surface boundary questions clearly and early
4. leave behind reusable lessons after meaningful work.

## Repository map

- `README.md` / `README.zh-CN.md`: public entry points in English and Chinese
- `PROJECT.md`: product definition and scope
- `PROMO.md`: launch and release copy
- `CHANGELOG.md`, `CONTRIBUTING.md`, `TRADEMARKS.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md`: governance, release history, and project boundaries
- `.github/workflows/`: validation workflow for scripts and markdown links
- `.github/ISSUE_TEMPLATE/`: issue entry guidance and contact links
- ssets/logo/: official logo system and source assets
- ssets/social/: GitHub social preview asset and release-ready repository artwork
- docs/: brand kit, installation, licensing, principles, activation, interaction model, roadmap, and supporting product docs
- `scripts/`: local installers, remote bootstrap entry points, and reproducible logo export tooling
- `skill/`: the DriveMind skill, references, and templates
- `examples/`: walkthroughs that show DriveMind in practice.

## Roadmap

### `v0.1 Foundation`
- stable positioning and brand voice
- first reusable DriveMind skill
- one-click install for Codex and Claude Code
- portable personal and project install modes
- a standard source-available licensing model
- first logo and brand assets
- persistence, escalation, and collaboration references
- review, diary, and distillation templates
- examples, bilingual README, governance docs, and validation workflow.

### `v0.2`
- better retry heuristics and failure signatures
- stronger memory categorization
- tighter collaboration patterns for real tool use.

### `v0.3`
- review timeline and dashboard ideas
- configurable execution intensity
- shared memory across roles or agents.

## Usage boundary

DriveMind is currently **source-available under BUSL-1.1**, not Open Source.
Production use before **March 11, 2030** requires separate permission from the licensor.
The repository is scheduled to convert to **GPL-2.0-or-later** on **March 11, 2030**.
See [LICENSE.md](LICENSE.md) and [docs/licensing.md](docs/licensing.md).

## Collaboration & Contact

- Issues: <https://github.com/Yuzc-001/DriveMind/issues>
- Email: `zxyu24@outlook.com`

Use Issues for bugs, install problems, documentation gaps, and feature discussion.
Use email for licensing, private collaboration, or questions that should not start in a public thread.


## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Yuzc-001/DriveMind&type=Date)](https://star-history.com/#Yuzc-001/DriveMind&Date)
## Read next

- [README.zh-CN.md](README.zh-CN.md)
- [PROJECT.md](PROJECT.md)
- [CHANGELOG.md](CHANGELOG.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [TRADEMARKS.md](TRADEMARKS.md)
- [PROMO.md](PROMO.md)
- [docs/github-presence.md](docs/github-presence.md)
- [docs/brand-kit.md](docs/brand-kit.md)
- [docs/licensing.md](docs/licensing.md)
- [docs/installation.md](docs/installation.md)
- [docs/distribution-strategy.md](docs/distribution-strategy.md)
- [docs/principles.md](docs/principles.md)
- [docs/interaction-model.md](docs/interaction-model.md)
- [docs/activation.md](docs/activation.md)
- [docs/use-cases.md](docs/use-cases.md)
- [docs/with-vs-without.md](docs/with-vs-without.md)
- [docs/release-notes-v0.1.md](docs/release-notes-v0.1.md)
- [skill/SKILL.md](skill/SKILL.md)