# Validation checklist — core prototype

## Runtime gate

This checklist must be completed in Godot before PR #1 is merged.

- [ ] Project opens without parse errors.
- [ ] `scenes/main.tscn` starts as the main scene.
- [ ] Player appears inside the arena.
- [ ] Touch/drag moves the player horizontally.
- [ ] Player remains inside the arena limits.
- [ ] Three bots appear and move on their lanes.
- [ ] Hazard traverses the arena vertically.
- [ ] Hazard accelerates between hazard cycles.
- [ ] Hazard collision removes a participant that it touches.
- [ ] Match state detects when one participant remains.
- [ ] Result status reports survival time and final position.
- [ ] Restarting the scene recreates player, bots and hazard.
- [ ] No visible error occurs during a five-minute idle/run test.

## Android gate

- [ ] Export template and Android SDK are configured.
- [ ] Debug APK installs on the reference device.
- [ ] Touch input works on the reference device.
- [ ] No blocking runtime errors are observed.

## Scope gate

Do not add scoring, progression, online multiplayer, cosmetics or additional hazard families until this checklist passes.

## Current limitation

Runtime and Android validation remain pending because the current execution environment does not provide Godot or the Android SDK.
