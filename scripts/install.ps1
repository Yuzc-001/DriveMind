[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet('auto', 'codex', 'codex-personal', 'claude', 'claude-personal', 'claude-project', 'custom')]
    [string]$Target = 'codex-personal',

    [Parameter(Position = 1)]
    [string]$Path
)

$ErrorActionPreference = 'Stop'

$SkillName = 'drivemind'
$RepoRoot = Split-Path -Parent $PSScriptRoot
$SourceDir = Join-Path $RepoRoot 'skill'

function Assert-DriveMindPackage {
    $required = @(
        'SKILL.md',
        'references/drift-prevention.md',
        'references/boundary-preservation.md',
        'references/continuity-preservation.md',
        'references/stuck-recovery.md',
        'references/closure-compounding.md',
        'references/execution-ceiling.md',
        'templates/review-template.md'
    )

    foreach ($item in $required) {
        $candidate = Join-Path $SourceDir $item
        if (-not (Test-Path -LiteralPath $candidate)) {
            throw "DriveMind package is incomplete. Missing: $item"
        }
    }
}

function Get-CodexSkillsRoot {
    $codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
    return Join-Path $codexHome 'skills'
}

function Get-ClaudeSkillsRoot {
    return Join-Path (Join-Path $HOME '.claude') 'skills'
}

function Resolve-InstallTargets {
    param([string]$InstallTarget, [string]$TargetPath)

    switch ($InstallTarget) {
        'auto' {
            $targets = @()
            $claudeHome = Join-Path $HOME '.claude'
            $codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }

            if (Test-Path -LiteralPath $claudeHome) {
                $targets += [pscustomobject]@{ Name = 'claude-personal'; Root = Get-ClaudeSkillsRoot }
            }
            if (Test-Path -LiteralPath $codexHome) {
                $targets += [pscustomobject]@{ Name = 'codex-personal'; Root = Get-CodexSkillsRoot }
            }
            if ($targets.Count -eq 0) {
                $targets += [pscustomobject]@{ Name = 'claude-personal'; Root = Get-ClaudeSkillsRoot }
            }
            return $targets
        }
        'codex' { return @([pscustomobject]@{ Name = 'codex-personal'; Root = Get-CodexSkillsRoot }) }
        'codex-personal' { return @([pscustomobject]@{ Name = 'codex-personal'; Root = Get-CodexSkillsRoot }) }
        'claude' { return @([pscustomobject]@{ Name = 'claude-personal'; Root = Get-ClaudeSkillsRoot }) }
        'claude-personal' { return @([pscustomobject]@{ Name = 'claude-personal'; Root = Get-ClaudeSkillsRoot }) }
        'claude-project' {
            if (-not $TargetPath) {
                throw 'Provide the target project path as the second argument.'
            }
            if (-not (Test-Path -LiteralPath $TargetPath)) {
                throw "Project path does not exist: $TargetPath"
            }
            $projectPath = (Resolve-Path -LiteralPath $TargetPath).Path
            return @([pscustomobject]@{ Name = 'claude-project'; Root = Join-Path (Join-Path $projectPath '.claude') 'skills' })
        }
        'custom' {
            if (-not $TargetPath) {
                throw 'Provide the destination skills directory as the second argument.'
            }
            return @([pscustomobject]@{ Name = 'custom'; Root = $TargetPath })
        }
    }
}

function Install-DriveMindPackage {
    param([string]$TargetName, [string]$DestinationRoot)

    New-Item -ItemType Directory -Force -Path $DestinationRoot | Out-Null
    $destination = Join-Path $DestinationRoot $SkillName

    if (Test-Path -LiteralPath $destination) {
        Remove-Item -LiteralPath $destination -Recurse -Force
    }

    New-Item -ItemType Directory -Force -Path $destination | Out-Null
    Copy-Item -LiteralPath (Join-Path $SourceDir 'SKILL.md') -Destination $destination -Force
    Copy-Item -LiteralPath (Join-Path $SourceDir 'references') -Destination $destination -Recurse -Force
    Copy-Item -LiteralPath (Join-Path $SourceDir 'templates') -Destination $destination -Recurse -Force

    if (-not (Test-Path -LiteralPath (Join-Path $destination 'SKILL.md'))) {
        throw "Install failed. Missing installed SKILL.md at $destination"
    }

    Write-Host "Installed DriveMind ($TargetName) to $destination"
}

Assert-DriveMindPackage
$targets = Resolve-InstallTargets -InstallTarget $Target -TargetPath $Path
foreach ($targetInfo in $targets) {
    Install-DriveMindPackage -TargetName $targetInfo.Name -DestinationRoot $targetInfo.Root
}
Write-Host 'DriveMind install complete.'
