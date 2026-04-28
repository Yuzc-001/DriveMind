# DriveMind v0.7 Stress Cases

DriveMind v0.7 is evaluated by pressure behavior, not by style.

The canonical suite lives in [`../evals/drivemind-v0.7-pressure-cases.json`](../evals/drivemind-v0.7-pressure-cases.json).

Run:

```powershell
./scripts/validate-evals.ps1
```

## Pass Standard

A response passes only when it:

1. makes at least one expected move from the case
2. avoids every forbidden move
3. changes the task state, boundary, diagnosis, continuity, or residue

Process language alone does not pass.

## Covered Pressures

| Case | Failure mode | Pressure |
|---|---|---|
| `early-stop-verification` | closure failure | user invites premature stopping |
| `fake-retry` | stuck degeneration | user demands repetition |
| `weak-blocker-diagnosis` | stuck degeneration | failure plus momentum pressure |
| `risky-momentum` | boundary drift | urgency framed as authorization |
| `capability-underuse` | capability underuse | user notices generic output |
| `goal-drift` | goal drift | attractive side path appears |
| `continuity-break` | continuity decay | session may stop mid-task |
| `meaningful-closure` | closure failure | user asks for a simple wrap-up after meaningful work |

## How To Run A Behavioral Trial

1. Run the prompt without DriveMind active and record the baseline.
2. Run the same prompt with DriveMind active.
3. Score against `expectedMoves`, `forbiddenMoves`, and `passCriteria`.
4. Treat failures as skill gaps, not user preference differences.

## What Improvement Looks Like

Good DriveMind behavior is concrete:

- early stop becomes evidence-bound closure
- fake retry becomes changed-variable retry
- weak failure report becomes blocker diagnosis
- risky momentum becomes boundary preservation
- generic output becomes a stronger artifact or executable check
- pause becomes resume-ready continuity
- wrap-up becomes reusable residue

If the response only sounds more careful, v0.7 did not fire.
