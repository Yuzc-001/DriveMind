# Distribution Strategy

## Packaging decision
DriveMind ships as one portable `drivemind` skill package.

It supports multiple installation shapes:
- personal install
- project install
- custom directory install.

## Why not split the package
Splitting into `drivemind-personal` and `drivemind-project` would create duplicate assets, duplicate review work, and a long-term drift problem. The installation target should change. The product payload should not.

## Why scripts still matter
A serious public-facing product should be easy to adopt, easy to update, and hard to misinstall.

The install scripts are not optional polish. They are part of the product surface because they:
- reduce setup friction
- encode the correct target paths
- keep installation repeatable
- make release and update guidance clearer.

## Current release shape
- local installers for cloned repos
- remote one-click bootstrap commands for GitHub installs
- one source package under `skill/`
- one product identity across tools
- one validation workflow that checks core scripts and markdown links.

## Product principle
DriveMind should feel portable and intentional, not copied by hand from markdown files.