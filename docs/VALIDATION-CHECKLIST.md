# Validation checklist — core prototype

This checklist is the release gate for the core MVP. A check is only marked complete after the behavior is observed in the target runtime.

## Runtime gate

This checklist must be completed in Godot before the core gameplay PR is merged.

- [ ] Project opens without parse errors.
- [ ] `scenes/main.tscn` starts as the main scene.
- [ ] Exactly 50 participants are created at match start (1 player + 49 bots).
- [ ] Player appears inside the arena.
- [ ] Touch/drag moves the player horizontally with correct viewport mapping.
- [ ] Player remains inside the arena limits.
- [ ] Bots occupy the configured lanes and move deterministically.
- [ ] Hazard traverses the arena vertically.
- [ ] Hazard accelerates between hazard cycles.
- [ ] Hazard collision removes a participant that it touches.
- [ ] Participant counter decreases after eliminations.
- [ ] Match state detects when one participant remains.
- [ ] Result status reports survival time and final position.
- [ ] Restarting the scene recreates player, bots and hazard.
- [ ] No visible error occurs during a five-minute idle/run test.

## Scale gate

- [ ] 50 participants remain responsive on the reference Android device.
- [ ] No obvious frame-time spike occurs during normal hazard movement.
- [ ] No participant spawning occurs outside the arena bounds.
- [ ] Bot movement remains stable when several participants are eliminated.

## Android gate

- [ ] Export template and Android SDK are configured.
- [ ] Debug APK installs on the reference device.
- [ ] Touch input works on the reference device.
- [ ] No blocking runtime errors are observed.

## Visual gate

- [ ] Arena reads clearly on a phone-sized display.
- [ ] Player is immediately distinguishable from bots.
- [ ] Hazard is immediately distinguishable from arena geometry.
- [ ] HUD remains legible during active gameplay.
- [ ] Result screen is readable and the replay action is obvious.

## Scope gate

Do not add scoring progression, online multiplayer, cosmetics or additional hazard families until the runtime, scale and Android gates pass.

## Automated validation status

GitHub Actions currently validates project structure plus Godot 4.7.2 headless script parsing, project/scene loading and a short runtime smoke test. The latest observed CI execution completed successfully for both validation jobs.

These automated checks do **not** mark the runtime gate complete. They establish automated coverage only; the behavior below still requires target-runtime observation.

## Current validation status

- **Automated CI:** VALIDATED — structural validation, GDScript parsing, project/scene loading and runtime smoke test pass.
- **Target Android runtime:** PENDING VALIDATION.
- **Touch mapping:** PENDING VALIDATION on device.
- **Visual presentation:** PENDING VALIDATION on phone-sized display.
- **50-participant responsiveness:** PENDING VALIDATION on reference Android device.
- **Five-minute stability:** PENDING VALIDATION on target runtime.

Device validation remains required for touch mapping, visual presentation, 50-participant responsiveness, Android behavior and the five-minute stability test.
