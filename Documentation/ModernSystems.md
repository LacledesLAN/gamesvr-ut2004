# Running Unreal Tournament 2004 on Modern Systems

## References Used

* [Unreal Tournament 2004 - PC Gaming Wiki](https://www.pcgamingwiki.com/wiki/Unreal_Tournament_2004)
* [Wide Screen Gaming Forum](https://www.wsgf.org/dr/unreal-tournament-2004)

## Disable "Reduce mouse lag"

> The game comes with an option to "reduce mouse lag" checked by default, however this option actually functions like a waitstate for the GPU and was put in place to help with input lag in the sub-30 FPS range, which was not uncommon for systems of the time of the game's release. On modern systems this option often cuts FPS in half without any benefits, so it is recommended to disable it. This may also solve some reported Windows 10-specific issues.

Open `ut2004.ini` in `<gameDir>\system`; find each instance of `ReduceMouseLag=True` (there should be four) and change to `ReduceMouseLag=False`.

## Widescreen

### Resolution

You may find that you can select your resolution and adjust the FOV to your preference (up to 100) via the in game menu. If your desired resolution is not available, or if you want an FOV above 100 (recommended for 16:9 displays), keep reading. Otherwise, you can skip this section.

Open `ut2004.ini` in `<gameDir>\system`; find these lines:

```ini
FullscreenViewportX=xxxx
FullscreenViewportY=xxx
```

Change them to set your resolution.

### FOV

Open `user.ini` in `<gameDir>\system`; find these lines:

```ini
DesiredFOV=90.000000
DefaultFOV=90.000000
```

Change the values to set your FOV to your preference. I recommend 100 for 16:10 displays, and 105 for 16:9 displays.

### HUD Scaling

You can get the HUD to scale just horizontally ... scaling the X component without changing the Y component.

Open `ut2004.ini` in `<gameDir>\system`; find the heading `[WinDrv.WindowsClient]` and then the line:

```ini
ScaleHUDX=0.000000
```

## Ultra/Super-Wide (21:9/32:9) Specific Solution & Issues

Eyefinity / Surround Specific Solution & Issues

Open `ut2004.ini` in `<gameDir>\system`; find these lines:

```ini
FullscreenViewportX=5760
FullscreenViewportY=1080
```

and edit them to fit your desired resolution.

To adjust your hud for tripple wide resolutions edit

```ini
ScaleHUDX=0.330000
```

0.0 is default value
0.33 works best for tripple wide setups.

And finally to adjust your fov... Bring down the console by pressing '~' and type in 'enablecheats'. Change your fov by entering 'fov xxx' where xxx stands for desired value.
fov=90 is default for 4:3 setups.

100 - 16:10
105 - 16:9
150 - 13:3
