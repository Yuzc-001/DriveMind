---
name: drivemind
description: >
  Use when meaningful agent work risks degrading or settling below the model's real capability:
  long tasks, pressure, goal drift, boundary drift, fake retries, weak blocker diagnosis,
  shallow outputs, continuity breaks, or work that should leave reusable residue. Do not use for
  simple one-shot tasks where direct execution is enough.
---

# DriveMind

DriveMind is a bounded execution skill.

It improves hard agent work by protecting three things:

1. **Execution integrity** — keep the work aligned, bounded, and recoverable.
2. **Execution ceiling** — force one stronger concrete move when the current result is too shallow.
3. **Experience compounding** — leave residue that makes the next run stronger.

If DriveMind only adds ceremony, stop using it.

## Activate When

- the task is long-running, high-value, blocked, or likely to cross session boundaries
- the user asks to keep pushing, stay steady, not stop too early, or force a better path
- the work risks goal drift, boundary drift, continuity decay, stuck degeneration, capability underuse, or closure failure
- the next action may involve risk, authority, deletion, publication, credentials, external messages, or irreversible impact
- the task should leave behind a review, lesson, next-time rule, handoff, memory, or SOP residue

## Do Not Activate When

- the answer is simple and direct
- no continuity, boundary, stuckness, or compounding risk exists
- the skill would produce process without changing the next action

## Main Path

### 1. Detect The Failure Mode

Choose the primary risk:

- goal drift
- boundary drift
- continuity decay
- stuck degeneration
- capability underuse
- closure failure

If none applies, continue normally without DriveMind.

### 2. Stabilize The Thread

State the minimum useful version of:

- current objective
- what matters most
- blocker, uncertainty, or boundary
- next action

Keep this short. Stabilization is not a status performance.

### 3. Protect The Boundary

If authority, risk, irreversible impact, or external representation is in play, stop and check the boundary before acting.

Read `references/boundary-preservation.md`.

### 4. Recover From Stuckness

If the work is blocked, diagnose before pushing harder.

Read `references/stuck-recovery.md`.

### 5. Raise The Execution Ceiling

If the work is moving but weak, force one stronger concrete move:

- inspect instead of guessing
- test instead of assuming
- compare instead of accepting the first path
- isolate the blocker instead of naming it vaguely
- produce the artifact instead of proposing it
- preserve the next executable action instead of writing a generic summary

Read `references/execution-ceiling.md`.

### 6. Preserve Continuity

If the work may pause or resume later, preserve objective, state, blocker, boundary, and next executable action.

Read `references/continuity-preservation.md`.

### 7. Close With Residue

If the work was meaningful, leave the smallest residue that will improve the next run.

Read `references/closure-compounding.md` and `references/residue-selection.md`.

## Output Pattern

When DriveMind is active, prefer:

1. objective or judgment
2. what is degrading or too weak
3. stronger next action
4. boundary or escalation point if any
5. residue when useful

Use natural prose. Do not expose the framework unless it helps the user decide or continue.

## Reference Spine

| File | Use when |
|---|---|
| `references/drift-prevention.md` | objective or thread coherence is weakening |
| `references/boundary-preservation.md` | authority, risk, or irreversible action is in play |
| `references/stuck-recovery.md` | blocked work risks fake motion |
| `references/execution-ceiling.md` | the result is below the model's reachable capability |
| `references/continuity-preservation.md` | work may pause, hand off, or resume later |
| `references/closure-compounding.md` | the task should leave a useful ending |
| `references/residue-selection.md` | choose the right residue form |
| `references/mode-guide.md` | choose normal, execution, or intensive mode |
