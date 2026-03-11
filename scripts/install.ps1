[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet('codex', 'codex-personal', 'claude', 'claude-personal', 'claude-project', 'custom')]
    [string]$Target = 'codex-personal',

    [Parameter(Position = 1)]
    [string]$Path
)

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceDir = Join-Path $repoRoot 'skill'
$skillName = 'drivemind'

if (-not (Test-Path (Join-Path $sourceDir 'SKILL.md'))) {
    throw "Could not find source skill at $sourceDir"
}

function Install-Skill {
    param([string]$DestinationRoot)

    New-Item -ItemType Directory -Force -Path $DestinationRoot | Out-Null
    $destination = Join-Path $DestinationRoot $skillName
    New-Item -ItemType Directory -Force -Path $destination | Out-Null
    Copy-Item -Path (Join-Path $sourceDir '*') -Destination $destination -Recurse -Force
    return $destination
}

switch ($Target) {
    'codex' {
        $Target = 'codex-personal'
        $codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
        $destinationRoot = Join-Path $codexHome 'skills'
    }
    'codex-personal' {
        $codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
        $destinationRoot = Join-Path $codexHome 'skills'
    }
    'claude' {
        $Target = 'claude-personal'
        $destinationRoot = Join-Path (Join-Path $HOME '.claude') 'skills'
    }
    'claude-personal' {
        $destinationRoot = Join-Path (Join-Path $HOME '.claude') 'skills'
    }
    'claude-project' {
        if (-not $Path) {
            throw 'Provide the target project path as the second argument.'
        }
        if (-not (Test-Path $Path)) {
            throw "Project path does not exist: $Path"
        }
        $projectPath = (Resolve-Path $Path).Path
        $destinationRoot = Join-Path (Join-Path $projectPath '.claude') 'skills'
    }
    'custom' {
        if (-not $Path) {
            throw 'Provide the destination skills directory as the second argument.'
        }
        $destinationRoot = $Path
    }
}

$installedPath = Install-Skill -DestinationRoot $destinationRoot
Write-Host "Installed DriveMind ($Target) to $installedPath"
Write-Host 'Re-run this installer to update the skill in place.'
