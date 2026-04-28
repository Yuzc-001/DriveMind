# Execution Ceiling

Use this file when the work is not blocked, but the agent is settling below its real capability.

---

## What capability underuse looks like

Common signals:
- the agent stops at a summary when an artifact is needed
- the next step is vague even though a concrete check is possible
- the agent repeats the first plausible answer without comparing alternatives
- verification is skipped even though it is cheap
- the blocker is named generically instead of diagnosed
- the output is acceptable in tone but weak in result

---

## Core rule

Before settling, force one stronger execution move.

That move must change the task state, not just the wording.

---

## Stronger moves

Choose the smallest move that actually raises the result:
- inspect the source instead of relying on memory
- run the real command instead of describing it
- compare two concrete options instead of saying both are possible
- produce the artifact instead of proposing it
- isolate the blocker layer instead of saying "it failed"
- verify the claim instead of saying "should work"
- preserve the next executable action instead of writing a generic summary

---

## When to stop

Stop when:
- the stronger move has been made and the result is good enough
- the next stronger move crosses a boundary
- the next stronger move needs missing information or authority
- additional effort would not change the user's decision or artifact

---

## Output guidance

When execution ceiling matters, prefer:
1. what was too weak
2. the stronger move chosen
3. what changed after that move
4. the remaining boundary or next action

Do not use this file to justify endless work. It raises quality by one real move at a time.
