# Unreal Tournament 2004 Console Commands

## Player \ Bot Commands

* `ADDBOTS [number]` - Adds the specified number of bots
* `BEHINDVIEW 0` - Changes to first person view
* `BEHINDVIEW 1` - Changes to third person view
* `DISCONNECT` - Disconnect from current server
* `EXIT` - Quits the game
* `KILLBOTS` - Gets rid of all bots
* `OPEN [IP address]` - Connect to a specific server IP
* `OPEN [mapname]` - Opens specified map
* `PLAYERSONLY` - Freezes \ pauses the bots
* `QUIT` - Quits the game
* `RECONNECT` - Reconnect to the current server
* `SAY` [text] - Displays your message in global chat
* `SETNAME` [playername] - Changes your player name
* `SUICIDE` - Kills yourself
* `SWITCHLEVEL` [mapname] - Switches to the specified level
* `SWITCHTEAM` - Switch your player's team
* `TEAMSAY` [text] - Displays your message in team chat

## Statistics

* `MEMSTAT` - Displays Windows memory usage
* `STAT ALL` - Shows all stats
* `STAT AUDIO` - Shows audio stats
* `STAT FPS` - Displays your frames per second
* `STAT GAME` - Displays game stats
* `STAT HARDWARE` - Shows hardware stats
* `STAT NET` - Shows network game play stats
* `STAT NONE` - Turns off all stats
* `STAT RENDER` - Displays rendering statistics

## Demo Commands

* `DEMOPLAY [demoname]` - Plays the specified demo
* `DEMOREC [demoname]` - Records a demo using the demoname you type
* `STOPDEMO` - Stop recording a demo

## Admin Commands

* `ADMIN SWITCHLEVEL [mapname?game=gametype?mutator=mutator]` - Changes the current level to the specified level, game type and mutators
* `ADMIN [command]` - Performs the specified command
* `ADMINLOGIN [password]` - Logs the admininstrator onto the server using the specified password
* `ADMINLOGOUT` - Logs the administrator off the server.
* `ADMIN SET UWeb.Webserver bEnabled True` - Enables the remote admin webserver (after level change)
* `ADMIN SET UWeb.Webserver bEnabled False` - Disables the remote admin webserver (after level change)
* `KICK [playername]` - Kicks the specified player from the server
* `KICKBAN [playername]` - Kicks and bans the specified player from the server using their IP address. To unban the player, edit the server.ini or use the web admin interface

## Other Commands

* `BRIGHTNESS [number]` - Changes the brightness level to the specified number
* `CDTRACK [number]` - Plays the specified CD track number
* `CONFIGHASH` - Displays configuration info
* `CONTRAST [number]` - Changes the contrast level to the specified number
* `DEBUG CRASH` - Test crashes the game with an error
* `DEBUG EATMEM` - Tests memory allocation until full
* `DEBUG GPF` - Test crashes the game with a general protection fault error
* `DEBUG RECURSE` - Test crashes the game by infinite recursion
* `DUMPCACHE` - Displays the memory gcache contents
* `EXEC [filename]` - Executes a file in the UT2003 /system/ directory by default
* `FLUSH` - Flushes all caches and relights
* `FOV [number]` - Changes the field of view to the specified number
* `FIXEDVISIBILITY` - For use when testing your own level. Fixes the engine's visibility from your current point of view. You can then walk around and see exactly what is being drawn, check that antiportals are working etc. Enter it again to turn it off.
* `GAMMA [number]` - Changes the gamma level to the specified number
* `GETCOLORDEPTHS` - Displays the maximum color depth supported by your hardware
* `GETCURRENTCOLORDEPTHS` - Displays your current color depth
* `GETCURRENTRES` - Displays your current resolution
* `GETCURRENTTICKRATE` - Displays your current tick rate
* `GETMAXTICKRATE` - Displays the maximum allowed tick rate
* `MUSICORDER [number]` - Change to a certain track in the song (0=ambient, 1=action, 2=suspense)
* `NETSPEED [number]` - Sets the net speed, default is 10000
* `OBJ CLASSES` - Displays a list of object classes
* `OBJ GARBAGE` - Collects and purges objects no longer in use
* `OBJ HASH` - Displays object hashing statistics
* `OBJ LINKERS` - Displays a list of active linkers
* `PAUSESOUNDS` - Pauses all sounds
* `PREFERENCES` - Opens advanced settings
* `RELAUNCH` - Relaunches the engine
* `RENDEREMULATE [gf1/gf2]` - Lets you see how your level will look on different cards (ex. if some of your shaders are too complicated and don't have fallbacks).
* `REPORT` - Copies a report of the current game to clipboard
* `SET [class variable value]` - Sets a specified class and specified variable with the specified value
* `SETSENSITIVITY [number]` - Sets the mouse sensitivity to the specified number
* `SETRES [WxHxD]` - Sets your screen resolution to the specified width, height, and color depth
* `SLOMO 1` - Sets the speed of the game back to normal real time speed
* `SLOMO 2` - Sets speed to double. Increase number to go faster
* `SLOMO .5` - Sets speed to half. Decrease number to go slower
* `SOCKETS` - Displays a list of sockets in use
* `TOGGLEFULLSCREEN` - Toggles fullscreen mode
* `TYPE [text]` - Displays the specified text on the console
* `UNPAUSESOUNDS` - Un-pauses all sounds

## Cheat Codes

* `ALLAMMO` - Gives full ammo for all weapons
* `ALLWEAPONS` - Gives you all weapons
* `FLY` - You can fly around
* `GHOST` - Noclip through walls
* `GOD` - God Mode
* `LOADED` - Gives all weapons, ammo, and 100 adrenaline
* `TELEPORT` - Teleport to a random spot in the map
* `WALK` - You stop flying

### Summon Codes

Codes (class names) usable with the summon class console cheat. In other words, type "summon " and then one of the class names listed below to summon it.

#### Weapon pickups

* xweapons.assaultriflepickup : Assault Rifle
* xweapons.shieldgunpickup : Shield Gun
* xweapons.bioriflepickup : Bio-Rifle
* onslaught.onsminelayerpickup : Mine Layer
* xweapons.shockriflepickup : Shock Rifle
* xweapons.supershockriflepickup : Instagib Shock Rifle
* xweapons.zoomsupershockriflepickup : Zoom Instagib Shock Rifle
* xweapons.linkgunpickup : Link Gun
* xweapons.minigunpickup : Minigun
* xweapons.flakcannonpickup : Flak Cannon
* onslaught.onsgrenadepickup : Grenade Launcher
* xweapons.rocketlauncherpickup : Rocket Launcher
* onslaught.onsavrilpickup : AVRiL
* xweapons.sniperriflepickup : Lightning Gun
* UTClassic.classicsniperriflepickup : Sniper Rifle
* xweapons.redeemerpickup : Redeemer
* xweapons.painterpickup : Ion Painter
* onslaughtfull.onspainterpickup : Target Painter
* xweapons.transpickup : Translocator

#### Ammo pickups

* xweapons.assaultammopickup - Assault Rifle ammo
* xweapons.bioammopickup - Bio-Rifle ammo
* onslaught.onsmineammopickup - Mine Layer ammo
* xweapons.shockammopickup - Shock Rifle ammo
* xweapons.linkammopickup - Link Gun ammo
* xweapons.minigunammopickup - Minigun ammo
* xweapons.flakammopickup - Flak Cannon ammo
* onslaught.onsgrenadeammopickup - Grenade Launcher ammo
* xweapons.rocketammopickup - Rocket Launcher ammo
* onslaught.onsavrilammopickup - AVRiL ammo
* xweapons.sniperammopickup - Lightning Gun ammo
* UTClassic.classicsniperammopickup - Sniper Rifle ammo

#### Onslaught Vehicles

* onslaught.onshoverbike - Manta
* onslaught.onsrv - Scorpion
* onslaught.onsattackcraft - Raptor
* onslaught.onsprv - Hellbender
* onslaught.onshovertank - Goliath
* onslaughtfull.onshovertank_ionplasma - Ion Plasma Tank
* onslaughtfull.onsmobileassaultstation - Leviathan
* onslaughtfull.onsgenericsd - TC-1200 (Toilet Car)
* onslaughtfull.onsbomber - Intermittently-functional (and very hard to * control) Phoenix (Dragonfly?) bomber plane.

#### ECE Bonus Pack Vehicles

* onslaughtbp.onsdualattackcraft - Cicada
* onslaughtbp.onsshocktank - Paladin
* onslaughtbp.onsartillery - SPMA

Note: all vehicles summoned will spawn on top of you, locked. If you are not in god or ghost mode, you will be crushed. The "locked" issue is a bit complicated; there are several ways to deal with it.

    set vehicle bteamlocked false will unlock every currently-existing vehicle on the map.
    set name bteamlocked false will unlock every vehicle of class name. For example, to unlock a Cicada you've just summoned (as well as every other Cicada on the map), enter set onsdualattackcraft bteamlocked false.

#### Other

* xweapons.nameprojectile - where name is usually the class name as listed above, summons the projectile that particular weapon shoots. To summon a Redeemer projectile, for example, enter summon xweapons.redeemerprojectile. Note that this counts as a suicide (-1) for whoever it kills, not a kill (+1) for you, and summoned projectiles cannot damage PowerCores or PowerNodes.

#### Effects

xeffects.name - will spawn some effects in game. Note that these are purely visual; explosions will not do damage.

* ioncannondeatheffect
* landmineexplosion
* newexplosiona
* newexplosionb
* newexplosionc
* newioneffect
* newlinktrail
* newminigunmflash
* newredeemertrail
* newtransderesblue
* newtransderesred
* newtranseffect
* newtranseffectblue
* playerspawneffect
* redeemerexplosion
* redeemertrail
* shockball
* shockcombo
* spiral
* weaponfadeeffect
* shockcombospheredark
* shockcombovortex

They're mostly self explanatory. There are perhaps a few I missed. (I didn't have time to go through and test all the ONS ones) But if you look through the Unreal Ed actor listings, you can find a bunch more to try.

#### Monsters

skaarjpack.name - Will summon a monster of your choosing in front of you. Be careful, they'll attack you or anyone around you.

* monster - A generic Jakob character. Doesn't have a weapon, and * follows you around wherever you go.
* behemoth - Large, tough but slow monster armed with dual rapid-fire * rocket launchers. (Giant)
* brute - Large, tough but slow monster armed with dual rapid-fire * rocket launchers, but other colors than the 'behemoth'. (Giant)
* gasbag - A small flying monster that launches fireballs from above.
* krall - Monster armed with a staff, which fires lasers. Will melee at * close range. (a.k.a. Izangi)
* elitekrall - A slightly better krall. (a.k.a. Izangi)
* manta - Small flying bird-like creature that attempts to melee atack * your head. (Ray)
* razorfly - Attacks in the same way as a manta, but this fly-like * creature is pretty slow. (Dragonfly)
* skaarjpupae - Small bug that attempts to jump up and melee attack. * (Spider)
* skaarj - Fast-moving, agile and tough monster capable of both energy * emissions and melee claw attacks.
* fireskaarj - like skaarj but different weapon and appearance
* iceskaarj - like skaarj, but different appearance and weapon
* warlord - Extremely tough and agile monster with dual homing missile * launchers. Can also fly.
