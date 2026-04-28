# DriveMind Evals

DriveMind v0.7 is not judged by whether its language sounds disciplined.
It is judged by whether the next action becomes harder to fake.

This directory contains the pressure suite used to evaluate the skill's behavioral contract.

## Suite

- `drivemind-v0.7-pressure-cases.json` defines prompts, failure modes, expected moves, forbidden moves, and pass criteria.
- `scripts/validate-evals.ps1` checks that the suite covers the v0.7 failure model and references only real skill files.

## How to use

1. Run the validation script.
2. Give each prompt to an agent without DriveMind loaded and record the baseline.
3. Repeat with DriveMind loaded.
4. Mark a case as passing only if the response makes at least one expected move and avoids every forbidden move.

The expected improvement is not more ceremony.
The expected improvement is a better next action, stricter boundary behavior, clearer diagnosis, or reusable residue.
