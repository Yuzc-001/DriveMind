# DriveMind Logo Assets

## Current system
DriveMind keeps one minimal logo source set in the repository:
- `drivemind-mark.svg`: square primary mark
- `drivemind-lockup.svg`: horizontal lockup
- `drivemind-logo-philosophy.md`: design philosophy and visual rules.

PNG files are not kept in the repo by default. If a platform needs raster assets, generate them locally from the current source files.

## Design direction
The current mark is intentionally product-like rather than illustrative:
- rounded-square container for safety and product coherence
- a bold `D` monogram for identity and recognition
- layered bars to suggest memory, review, and operational strata
- a mint-to-blue gradient to balance energy and trust.

## Usage
- GitHub avatar: start from `drivemind-mark.svg`
- README and docs hero: use `drivemind-lockup.svg`
- social cards and release art: start from the SVG files and keep clear space around the mark.

## Generating local raster exports
Use [scripts/render-logo.ps1](../../scripts/render-logo.ps1) when PNG outputs are needed locally.

## Rules
- do not change the gradient palette without updating the philosophy doc
- do not introduce extra icons, arrows, or mascot elements into the primary mark
- do not create multiple competing primary logos
- prefer the existing mark and lockup unless a new official variant is documented.