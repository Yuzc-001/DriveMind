# DriveMind v0.2.0 Release Notes

## Summary
DriveMind v0.2.0 is the first validated iteration shaped by live task testing rather than static prompt design alone.

This release improves the skill in three important ways:
- stronger implicit triggering for calm persistence instructions
- clearer execution mode naming and reporting behavior
- more natural review output while preserving a stable six-part retrospective structure

## What changed

### Skill behavior
- broadened trigger coverage for natural phrases such as "keep pushing", "be steady", and "if risk is unclear ask me"
- renamed the strongest mode from `Focused` to `Intensive`
- strengthened non-trivial output expectations so the skill expands beyond one-line acknowledgements

### Review quality
- changed review guidance from rigid template enforcement to structured-but-adaptive retrospectives
- kept the six core review parts stable:
  - outcome
  - what happened
  - what changed the result
  - escalation boundary
  - reusable lesson
  - next-time rule
- added `review-style-guide.md` to improve naturalness without losing consistency

## Validation basis
This version was validated through:
- explicit trigger tests
- implicit trigger tests
- escalation and safety-boundary tests
- review / lesson tests
- three real task scenarios: boundary judgment, troubleshooting, and post-task review

## Outcome
DriveMind v0.2.0 is the first version that feels not only structured, but genuinely usable in real work.
