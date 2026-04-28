[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet('', 'auto', 'codex', 'codex-personal', 'claude', 'claude-personal', 'claude-project', 'custom')]
    [string]$Target = '',

    [Parameter(Position = 1)]
    [string]$Path,

    [string]$Repo = 'Yuzc-001/DriveMind',

    [string]$Ref = 'main'
)

$ErrorActionPreference = 'Stop'

if (-not $Target) {
    $Target = 'auto'
}

$repoName = ($Repo -split '/')[-1]
$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("drivemind-install-" + [guid]::NewGuid().ToString('n'))
$archivePath = Join-Path $tempRoot 'repo.zip'

try {
    New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
    $archiveUrl = "https://github.com/$Repo/archive/$Ref.zip"
    Write-Host "Downloading DriveMind from $archiveUrl"
    Invoke-WebRequest -Uri $archiveUrl -OutFile $archivePath
    Expand-Archive -LiteralPath $archivePath -DestinationPath $tempRoot -Force

    $checkout = Get-ChildItem -LiteralPath $tempRoot -Directory |
        Where-Object { $_.Name -like "$repoName-*" } |
        Select-Object -First 1

    if (-not $checkout) {
        throw 'Could not find extracted DriveMind repository contents.'
    }

    $installer = Join-Path $checkout.FullName 'scripts/install.ps1'
    if (-not (Test-Path -LiteralPath $installer)) {
        throw "Could not find installer at $installer"
    }

    if ($PSBoundParameters.ContainsKey('Path')) {
        & $installer $Target $Path
    } else {
        & $installer $Target
    }
}
finally {
    if (Test-Path -LiteralPath $tempRoot) {
        Remove-Item -LiteralPath $tempRoot -Recurse -Force
    }
}
