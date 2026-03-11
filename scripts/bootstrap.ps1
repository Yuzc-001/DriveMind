[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet('codex', 'codex-personal', 'claude', 'claude-personal', 'claude-project', 'custom')]
    [string]$Target = 'codex-personal',

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

    if ($PSBoundParameters.ContainsKey('Path')) {
        & $installer $Target $Path
    }
    else {
        & $installer $Target
    }
}
finally {
    if (Test-Path $tempRoot) {
        Remove-Item -Recurse -Force $tempRoot
    }
}
