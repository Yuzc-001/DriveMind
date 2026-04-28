$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$suitePath = Join-Path $root 'evals/drivemind-v0.7-pressure-cases.json'

if (-not (Test-Path $suitePath)) {
  throw "Missing eval suite: $suitePath"
}

$suite = Get-Content $suitePath -Raw | ConvertFrom-Json
$cases = @($suite.cases)

if ($suite.suite -ne 'drivemind-v0.7-pressure-cases') {
  throw "Unexpected suite name: $($suite.suite)"
}

if ($cases.Count -lt 8) {
  throw "Expected at least 8 pressure cases; found $($cases.Count)"
}

$requiredModes = @(
  'goal drift',
  'boundary drift',
  'continuity decay',
  'stuck degeneration',
  'capability underuse',
  'closure failure'
)

$seenModes = @{}
$seenIds = @{}

foreach ($case in $cases) {
  foreach ($field in @('id', 'failureMode', 'pressure', 'prompt')) {
    $value = $case.PSObject.Properties[$field].Value
    if ([string]::IsNullOrWhiteSpace([string]$value)) {
      throw "Case is missing required field '$field'"
    }
  }

  if ($seenIds.ContainsKey($case.id)) {
    throw "Duplicate eval case id: $($case.id)"
  }
  $seenIds[$case.id] = $true
  $seenModes[$case.failureMode] = $true

  foreach ($arrayField in @('expectedMoves', 'forbiddenMoves', 'passCriteria', 'requiredReferences')) {
    $items = @($case.PSObject.Properties[$arrayField].Value)
    if ($items.Count -eq 0) {
      throw "Case $($case.id) has no $arrayField"
    }
    foreach ($item in $items) {
      if ([string]::IsNullOrWhiteSpace([string]$item)) {
        throw "Case $($case.id) contains an empty $arrayField item"
      }
    }
  }

  foreach ($reference in @($case.requiredReferences)) {
    $referencePath = Join-Path $root ([string]$reference)
    if (-not (Test-Path $referencePath)) {
      throw "Case $($case.id) references missing file: $reference"
    }
  }
}

foreach ($mode in $requiredModes) {
  if (-not $seenModes.ContainsKey($mode)) {
    throw "Eval suite does not cover failure mode: $mode"
  }
}

Write-Host "DriveMind eval suite validated: $($cases.Count) cases, $($requiredModes.Count) failure modes."
