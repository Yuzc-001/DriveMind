# DriveMind Logo Assets

## Current system
DriveMind keeps one minimal logo source set in the repository:
- `drivemind-mark.svg`: square primary mark
- `drivemind-lockup.svg`: horizontal lockup
- `drivemind-v0.7-lockup.png`: image2.0-generated v0.7 release lockup
- `drivemind-logo-philosophy.md`: design philosophy and visual rules.

PNG files are not kept in the repo by default, except release-specific visual assets such as the v0.7 lockup.

## Design direction
The v0.7 direction is **Signal Gate**:
- architectural gate for boundary integrity
- signal column for evidence entering the task
- forward vector for authorized execution
- strong ink and teal palette for infrastructure-grade seriousness

## Usage
- GitHub avatar: start from `drivemind-mark.svg`
- README and release hero: use `drivemind-v0.7-lockup.png`
- docs surfaces that need SVG: use `drivemind-lockup.svg`
- social cards and release art: use `assets/social/drivemind-v0.7-preview.png`

## Generating local raster exports
Use [scripts/render-logo.ps1](../../scripts/render-logo.ps1) when PNG outputs are needed locally.

## Rules
- do not reintroduce the old gradient-app framing as the primary identity
- do not introduce brains, robots, mascots, lightning, or generic AI network elements
- do not create multiple competing primary logos
- keep the v0.7 Signal Gate direction unless a new version explicitly replaces it.
