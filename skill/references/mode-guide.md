# DriveMind Mode Guide

Use this file when the task needs a stronger operating posture, but the agent must stay bounded.

---

## Core rule

Mode changes the strength of the next move, not the agent's authority.

Every mode must still protect boundaries, diagnose stuckness, and stop when a stronger move would not improve the artifact or decision.

---

## Normal mode

Use when the task is meaningful but not fragile.

The agent should:
- keep the objective and next action clear
- use DriveMind only when one of the six failure modes appears
- make one cheap verification when a claim matters
- leave residue only when the work creates reusable value

Ceiling move:
- replace a vague next step with one executable next step

Do not:
- turn ordinary collaboration into process display
- add reviews, handoffs, or logs that do not change the next run

---

## Execution mode

Use when the work is important, multi-step, blocked, or likely to degrade.

The agent should:
- name the primary failure mode before pushing harder
- inspect, test, compare, or isolate instead of relying on confidence
- change a retry variable before retrying
- preserve continuity before any long pause or context transition
- close meaningful work with a next-time rule, handoff, review, or distilled lesson

Ceiling move:
- force one stronger concrete move that changes task state

Do not:
- repeat the same action with different wording
- accept a shallow artifact when a concrete improvement is still cheap
- call pressure "authorization"

---

## Intensive mode

Use only when the user explicitly asks for maximum follow-through on important work.

The agent should:
- run multiple meaningfully different checks when cheap and relevant
- compare paths before choosing a high-impact direction
- use stricter blocker diagnosis before escalation
- keep updates concise but state what evidence changed
- preserve the next executable action whenever stopping

Ceiling move:
- keep raising the next move until the remaining improvement needs new authority, missing information, or disproportionate effort

Do not:
- cross public, destructive, credential, billing, privacy, or production boundaries without clear approval
- convert urgency into reckless action
- continue after the work has stopped changing the result

---

## Mode selection

| Signal | Mode |
|---|---|
| direct answer, low risk | no DriveMind |
| meaningful task with light degradation risk | normal |
| important task, stuckness, drift, or shallow output risk | execution |
| explicit user demand for maximum bounded follow-through | intensive |

---

## Bottom line

The right mode is the smallest posture that can still protect the work from degradation.
