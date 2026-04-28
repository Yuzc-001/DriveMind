# Installation

## Quickstart — zero configuration

The installer auto-detects which AI tools you have installed (Claude Code, Codex) and installs DriveMind to all of them. No flags, no choices.

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 | iex
```

**What happens:**
- Detects `~/.claude` → installs `claude-personal`
- Detects `~/.codex` (or `$CODEX_HOME`) → installs `codex-personal`
- Neither found → installs `claude-personal` as default

---

DriveMind ships as one portable skill package with multiple install targets:
- personal skill install
- project skill install
- custom directory install.

The package stays the same. The install target changes.

For normal use, install DriveMind as a personal/global skill. DriveMind is designed to improve execution quality across projects, so `codex-personal` or `claude-personal` is usually the right target. Use a project install only when a team or repository needs to pin a specific DriveMind copy.

## Supported targets

- `codex-personal`: installs to `$CODEX_HOME/skills/drivemind` or `~/.codex/skills/drivemind`
- `claude-personal`: installs to `~/.claude/skills/drivemind`
- `claude-project`: installs to `<your-project>/.claude/skills/drivemind`
- `custom`: copies the same package into any directory you choose

Aliases kept for convenience:
- `codex` = `codex-personal`
- `claude` = `claude-personal`

## Install to a specific target

### Windows PowerShell

```powershell
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp codex-personal; Remove-Item $tmp
```

```powershell
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp claude-personal; Remove-Item $tmp
```

```powershell
$tmp = New-TemporaryFile; Invoke-WebRequest https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.ps1 -OutFile $tmp; & $tmp claude-project D:\path\to\your-project; Remove-Item $tmp
```

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- codex-personal
```

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- claude-personal
```

```bash
curl -fsSL https://raw.githubusercontent.com/Yuzc-001/DriveMind/main/scripts/bootstrap.sh | bash -s -- claude-project /path/to/your-project
```

## Local install from a cloned repo

### Windows PowerShell

```powershell
./scripts/install.ps1 codex-personal
./scripts/install.ps1 claude-personal
./scripts/install.ps1 claude-project D:\path\to\your-project
./scripts/install.ps1 custom D:\path\to\skills
```

### macOS / Linux

```bash
bash ./scripts/install.sh codex-personal
bash ./scripts/install.sh claude-personal
bash ./scripts/install.sh claude-project /path/to/your-project
bash ./scripts/install.sh custom /path/to/skills
```

## What the installer copies

The installers copy everything inside `skill/` into a target folder named `drivemind`:
- `SKILL.md`
- `references/`
- `templates/`

Before copying, the v0.7 installers validate that the package contains the current core references, including `execution-ceiling.md`. Existing installed `drivemind` folders are replaced cleanly so removed or renamed reference files do not linger from older versions.

That keeps one source of truth in this repo while making installs repeatable.

## Distribution decision

DriveMind does not ship separate personal and project packages.
It ships one portable skill package with multiple install targets.

Why:
- one source of truth is easier to review and trust
- documentation and examples stay in sync
- release management stays simple
- different tools can share the same product identity.

## Updating

Re-run the same install command. The installer validates the local package and replaces the existing DriveMind skill directory.

## Uninstalling

Delete the installed `drivemind` folder from the target skills directory.

## Why Claude Code is included

Claude Code documents skills as markdown packages placed under `~/.claude/skills/<skill-name>` or project-local `.claude/skills/`, and it explicitly supports the Agent Skills open standard. That makes DriveMind portable instead of tied to one tool.

Source:
- Anthropic Claude Code skills docs: <https://docs.anthropic.com/en/docs/claude-code/skills>

## Note on Codex

Codex support in this repo uses the same portable skill-folder approach and installs into the current Codex personal skills location used in this environment: `$CODEX_HOME/skills/drivemind` or `~/.codex/skills/drivemind`.
