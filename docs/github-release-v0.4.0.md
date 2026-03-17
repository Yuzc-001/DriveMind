# DriveMind v0.4.0 Release Notes

## Summary

DriveMind v0.4.0 adds a context intelligence layer on top of the v0.3 decision foundation.

v0.3 made agents more accurate about what kind of task they were doing and when to hold a boundary. v0.4 makes agents more honest about what they know, more capable of crossing session boundaries without losing state, and easier to install for everyone.

Three things changed in this release: how agents signal uncertainty, how long-running work survives a session boundary, and how the installer gets out of the user's way.

## What changed

### Confidence signaling

Before v0.4, DriveMind had no structured guidance for distinguishing "I confirmed this" from "I inferred this" from "I'm guessing." That gap let agents hide uncertainty behind optimistic language and maintain false momentum on shaky ground.

v0.4 adds a confidence signaling reference with three levels:
- **evidence-based**: confirmed through testing, direct observation, or multiple independent signals
- **inference**: a reasonable conclusion from available evidence, not directly verified
- **hypothesis**: a working assumption with limited evidence, should be tested before acting on

Each level comes with signal phrases, when to use it, and a preferred output pattern: give a direction and a verification path, not just a hedge. The anti-patterns section covers the most common failure modes — optimistic vagueness, false confidence, and excessive hedging that blocks progress.

Confidence signaling connects directly to the existing decision gates: acting on a hypothesis that crosses a boundary gate is an escalation trigger, not a judgment call.

### Session handoff

Long-running agent work has always been a core DriveMind use case. But until v0.4, there was no explicit guidance for what to do when that work crosses a context boundary. The diary and distill templates handled task-level lessons. Session handoff handles the layer above: what is the working state right now, and how does the next session pick it up cleanly.

The protocol is passive by default. It does not produce output on short tasks, simple questions, or anything that fits cleanly in one session. It activates on explicit user signals ("I'll continue this tomorrow", "write a handoff", "save state") and offers a single quiet prompt in Execution or Intensive mode when a natural stopping point is reached on a multi-step task.

A handoff contains five things: current objective, progress state, open decisions, key context, and next action. Anything that does not affect the next session's first move is left out. The companion guidance on resuming from a handoff is equally important — reading the handoff is not enough. The agent should reconstruct working state, confirm the objective is still valid, and check whether open decisions have since been resolved before proceeding.

### Language consistency

In v0.3, three skill references were written in Chinese and three in English. That inconsistency created friction for international users and made the skill harder to read as a coherent system. All references are now in English.

### Zero-config installer

Previously, users had to know whether they were installing for Codex or Claude Code, pick the right flag, and run the right command for their platform. Most users either didn't know the difference or didn't care — they just wanted DriveMind to work.

The installer now auto-detects installed AI tools by checking for `~/.claude` and `~/.codex`, and installs to every target it finds. If nothing is detected, it defaults to `claude-personal`. Windows users get a clean `irm | iex` one-liner. No flags. No choices. No documentation required to get started.

The manual install options are still there for users who need them, folded into a collapsible block.

## What did not change

DriveMind's core character — calm, evidence-driven, boundary-aware, human-in-the-loop — did not change. The compression rule from v0.3 still applies to all new references: session handoff does not appear on simple tasks, confidence levels are not annotated on every statement, and the framework should remain invisible when the answer is short.

## Validation basis

This release was validated through:
- 5 scenario walkthroughs across session handoff, confidence signaling, pressure-gate interaction, compression behavior, and session resumption
- regression review confirming the compression rule holds for new reference material
- manual review of all translated references for meaning fidelity and tone consistency

## Outcome

DriveMind v0.4.0 closes the main gaps that remained after v0.3: agents can now say what they actually know, survive context boundaries without losing state, and install in one command. The product remains a calm reliability layer — it just works across more of the real conditions agents encounter in practice.
