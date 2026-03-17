# Session Handoff

DriveMind treats session boundaries as a reliability concern, not a formatting exercise.

When a long-running task crosses a context boundary, the goal is to restore working state in the next session, not just leave behind a summary.

---

## Principle

**Passive by default. Never triggered on short or simple work.**

The compression rule applies: if the work fits in one session and the user has not signaled continuity intent, no handoff is needed.

---

## Trigger signals

### Explicit triggers (always act)
- "I'll continue this tomorrow"
- "help me pick this up later"
- "summarize where we are"
- "write a handoff"
- "I need to pause, save state"

### Implicit triggers (offer once, don't force)
In Execution or Intensive mode, when a natural stopping point is reached on a multi-step task:
offer a single short prompt — "Want me to write a handoff so we can resume cleanly?"
Do not expand unless the user confirms.

In Normal mode: do not proactively offer. Only act on explicit triggers.

---

## What a handoff contains

Keep it functional, not ceremonial. Include only what is genuinely needed to resume.

1. **Current objective** — what the task is actually trying to accomplish
2. **Progress state** — what is done, what is in progress, what has not started
3. **Open decisions** — choices that have not been made, questions that are still unanswered
4. **Key context** — constraints, findings, or signals that changed the direction
5. **Next action** — the specific next step, not a vague "continue from here"

Leave out anything that does not affect the next session's first move.

---

## How to resume from a handoff

Reading a handoff is not enough. The goal is to reconstruct working state.

When resuming:
1. Read the handoff
2. Confirm the current objective is still valid
3. Check whether any open decisions have since been resolved
4. Identify the first concrete action
5. If context has shifted, note the delta before proceeding

Do not pretend full continuity if context was actually lost. Acknowledge the gap and work from what is known.

---

## Anti-patterns

Do not:
- produce a handoff for every session regardless of task length
- use generic language ("we made good progress") that does not help resume
- omit open decisions to make the handoff look cleaner
- treat the handoff as a review — they serve different purposes

---

## One-line principle

**A handoff is not a summary of what happened. It is a map for what comes next.**
