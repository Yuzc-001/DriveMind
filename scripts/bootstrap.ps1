[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Target = '',

    [Parameter(Position = 1)]
    [string]$Path,

    [string]$Repo = 'Yuzc-001/DriveMind',

    [string]$Ref = 'main'
)

$repoName = ($Repo -split '/')[-1]
$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("drivemind-install-" + [guid]::NewGuid().ToString('n'))
$archivePath = Join-Path $tempRoot 'repo.zip'

try {
    New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
    $archiveUrl = "https://github.com/$Repo/archive/refs/heads/$Ref.zip"
    Write-Host "Downloading DriveMind from $archiveUrl"
    Invoke-WebRequest -Uri $archiveUrl -OutFile $archivePath
    Expand-Archive -LiteralPath $archivePath -DestinationPath $tempRoot -Force

    $checkout = Get-ChildItem -Path $tempRoot -Directory | Where-Object { $_.Name -like "$repoName-*" } | Select-Object -First 1
    if (-not $checkout) {
        throw 'Could not find extracted repository contents.'
    }

    $installer = Join-Path $checkout.FullName 'scripts/install.ps1'
    if (-not (Test-Path $installer)) {
        throw "Could not find installer at $installer"
    }

    function Invoke-Install {
        param([string]$T, [string]$P = '')
        if ($P) {
            & $installer $T $P
        } else {
            & $installer $T
        }
    }

    # Auto-detect mode: no target specified
    if (-not $Target) {
        $targets = @()

        $claudeDir = Join-Path $HOME '.claude'
        if (Test-Path $claudeDir) {
            $targets += 'claude-personal'
        }

        $codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
        if (Test-Path $codexHome) {
            $targets += 'codex-personal'
        }

        if ($targets.Count -eq 0) {
            Write-Host "No AI tool directories detected. Installing to ~/.claude/skills as default."
            $targets += 'claude-personal'
        }

        Write-Host ""
        Write-Host "Detected targets: $($targets -join ', ')"
        Write-Host ""

        foreach ($t in $targets) {
            Invoke-Install -T $t
        }

        Write-Host ""
        Write-Host "DriveMind install complete."
        return
    }

    # Explicit target mode
    $validTargets = @('codex', 'codex-personal', 'claude', 'claude-personal', 'claude-project', 'custom')
    if ($Target -notin $validTargets) {
        throw "Unknown target: $Target. Supported: $($validTargets -join ' | ')"
    }

    if ($PSBoundParameters.ContainsKey('Path')) {
        Invoke-Install -T $Target -P $Path
    } else {
        Invoke-Install -T $Target
    }
}
finally {
    if (Test-Path $tempRoot) {
        Remove-Item -Recurse -Force $tempRoot
    }
}
