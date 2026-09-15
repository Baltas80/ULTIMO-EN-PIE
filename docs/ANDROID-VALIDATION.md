# Android validation procedure — core MVP

This procedure is the manual release gate for the Android runtime. It complements `docs/VALIDATION-CHECKLIST.md` and must not be marked complete from headless CI alone.

## Reference configuration

- Orientation: portrait.
- Project viewport: 720×1280.
- Window override used during development: 360×640.
- Renderer: Godot Compatibility / mobile Compatibility.
- Target: Android debug build on a physical reference device.

## 1. Install and launch

1. Build/export a debug APK from the current development branch.
2. Install it on the reference Android device.
3. Launch the game from a clean start.
4. Confirm the main arena appears without a blocking error.

Record:

- Device model:
- Android version:
- APK version/commit:
- Installation result: PASS / FAIL
- Launch result: PASS / FAIL

## 2. Touch mapping

1. Start a new match.
2. Touch near the left side of the arena and drag horizontally.
3. Repeat near the right side.
4. Repeat with short and long drags.
5. Confirm the player follows the intended horizontal target without visible offset caused by the phone's display scaling.
6. Confirm the player cannot leave the configured horizontal arena limits.

Expected result: touch/drag controls remain responsive and map correctly to the 720×1280 game viewport.

Record: PASS / FAIL + observed issue.

## 3. Core gameplay

At match start verify exactly 50 participants are present: 1 player + 49 bots.

Observe:

- player starts inside the arena;
- bots remain in their configured lanes;
- hazard traverses vertically;
- hazard accelerates between cycles;
- collisions eliminate participants;
- participant count decreases;
- elimination feedback is visible but short;
- when the player is eliminated, the result screen appears;
- when the player survives to the end, the result screen reports first place;
- replay reloads a fresh match.

Record: PASS / FAIL for each item.

## 4. Scale and performance

Run a normal match with all 50 participants visible.

Check for:

- obvious frame-time spikes;
- stutter during hazard movement;
- unstable bot movement after eliminations;
- objects appearing outside arena bounds;
- increasing slowdown over time;
- overheating or abnormal battery drain during a five-minute run.

Do not claim a numeric FPS target unless it has been measured with a profiler or on-device counter.

Record measured data when available:

- average FPS:
- lowest observed FPS:
- notable frame-time spike:
- five-minute stability: PASS / FAIL

## 5. Visual gate

On the physical phone confirm:

- arena geometry is readable;
- player is immediately distinguishable from bots;
- hazard is visually distinct;
- HUD remains legible;
- elimination feedback does not obscure gameplay;
- result panel fits the display;
- replay button is clearly actionable;
- no clipping or unexpected stretching is visible.

Record: PASS / FAIL + screenshots if an issue is found.

## 6. Release evidence

A device validation should only be marked **VALIDATED** when the following evidence exists:

- exact commit SHA tested;
- device model and Android version;
- APK build/install result;
- touch result;
- core gameplay result;
- 50-participant responsiveness result;
- five-minute stability result;
- visual result;
- blocking issues, if any.

Headless GitHub Actions validates parsing, project/scene loading and automated runtime smoke coverage. It does **not** replace this physical-device gate.

## Current status

**PENDING — physical Android device validation required.**
