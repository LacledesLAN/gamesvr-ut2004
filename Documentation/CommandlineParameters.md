# Unreal Tournament 2004 Commandline Parameters

This tutorial is a formated copy of [unrealadmin.org's guide](http://wiki.unrealadmin.org/Commandline_Parameters_(UT2004)) created by user Evolution. The purpose of this copy is to backup - not to supplant.

## Introduction

This tutorial describes the different types of command-line parameters, and contains a comprehensive listing of all valid commandline parameters that are applicable to servers.

Command line parameters must be all on one line, and must follow a fairly rigid format, which is (blue highlighted items are game options, while green options are engine options):

```
ucc server MapName?Game=GameTypeClass?Parameter1=Value1?Parameter2=Value1,Value2?Parameter3=Value1 ini=server.ini userini=user.ini log=server.log
```

For example, a valid command line start parameter might look like this:

```
ucc server DM-Antalus.ut2?Game=XGame.XDeathMatch?bAutoNumBots=True ini=server1.ini log=server1.log
```

## Notes

* Integer - any whole number (1, 24, 2, etc. but NOT 1.5, 1/4, 0.8, etc.)
* Byte - just like an integer, except can only be between 0 - 255
* Float - Floating point number (1.1, 4.3, 0.4)
* Boolean - On/Off flag. Many variations are recognized by UT, so that you can enter 1, On, True, Yes, etc. for a "True" response, and 0, Off, False, No, etc. for a "False" response.
* String - any word or number; will be parsed as text (apple, blue, * MyPassword, etc.)
* ClassName - actual classname (xGame.xCTFGame)

## Engine Options

Engine options are those which are used by the engine itself (generally speaking). Each engine parameter should be serarated by a space, and prefixed with a dash. For those options which require values, value should be indicated using the = sign followed by the value. See the following commandline for an example:

Example: `ucc server DM-Antalus ini=server.ini userini=serveruser.ini log=server.log`

| Parameter      | Values    | Description                                                                                                                                                                                                                                                                                                                                                               |
| -------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ini            | String    | Specifies the filename for the ini file to use for this server. (ini=server.ini)                                                                                                                                                                                                                                                                                          |
| userini        | String    | Specifies the filename for the user ini file to use for the server userini=serveruser.ini)                                                                                                                                                                                                                                                                                |
| log            | String    | Specifies the filename to use for the server's log. log=server.log)                                                                                                                                                                                                                                                                                                       |
| lanplay        | N/A       | Starts the server in "LAN" mode. Several optimizations are enabled while the server is running in LAN mode, such as higher netspeed, higher tickrate, and more active replication rules. lanplay)                                                                                                                                                                         |
| makenames      | N/A       | By default, transient objects in the game (that is, objects that are created at runtime, vs. objects that have been placed in maps) are not given unique names. This serves to signifigantly reduce the server's memory usage, but can make debugging very difficult. Use this parameter to force the engine to give all transient objects unique names. ( makenames)     |
| primarynet     | N/A       | By default, servers will accept connections from any installed network adapter. Normally, this is desired behavior, as this allows players to connect to a server from the internet as well as from a LAN, for example. Specifying this option on the commandline disables this feature, and the server will only listen for connection on its primary network interface. |
| nocheat        | N/A       | Disables cheat protection. Only useful for mod authors that are developing client-server mods and need to bypass the protection against conformed packages.                                                                                                                                                                                                               |
| server         | N/A       | Used to start a server using the UT2004.exe. Starting a server using UT2004.exe in combination with the -server switch enables the interactive server console that appears after starting a server from within the GUI.                                                                                                                                                   |
| multihome      | IpAddress | Used for servers which have multiple external IP addresses.                                                                                                                                                                                                                                                                                                               |
| port           | Integer   | Specifies the listen port for this server. ( port=7555)                                                                                                                                                                                                                                                                                                                   |
| nohomedir      | N/A       | Linux Only                                                                                                                                                                                                                                                                                                                                                                |
| PktLoss        | Integer   | Simulates packet loss. Used for debugging purposes.                                                                                                                                                                                                                                                                                                                       |
| PktOrder       | Integer   | Simulates packet received out of order. Used for debugging purposes.                                                                                                                                                                                                                                                                                                      |
| PktDup         | Integer   | Simulates sending/receiving duplicate packets. Used for debugging purposes.                                                                                                                                                                                                                                                                                               |
|  PktLag        | Integer   | Simulates packet lag. Used for debugging purposes.                                                                                                                                                                                                                                                                                                                        |
| PktLagVariance | Integer   | Simulates variable packet lag. Used for debugging purposes.                                                                                                                                                                                                                                                                                                               |

## Game Options

Game options are those which are used by the various script classes running on the server (generally speaking). Each game option parameter should be prefixed with a ?, and there are no spaces between multiple game options. The first game option should be appended to the mapname, with each additional game option appended to the last one. In cases where there are multiple values for a game option, each value should be delimited by a comma.

Example: `ucc server CTF-Magma?Game=XGame.XCTFGame?Mutator=XGame.MutInstaGib,XGame.MutVampire?TimeLimit=10`


| Parameter                  | Values                | Description |
| -------------------------- | --------------------- | ----------- |
| AccessControl              | Class name            | 	Used to specify AccessControl class. Accepts same parameters as AccessControlClass= line in [Engine.GameInfo] section of server.ini. By default, valid values are `Engine.AccessControl` and `xAdmin.AccessControlIni` |
| AllowThrowing              | Boolean               | Enables/disables weapon throwing.  |
| AllowBehindView            | Boolean               | Allow players to use behindview (third person) mode.  |
| AdminName                  | String                | Only used in single administrator system. While this parameter is not actually used when logging in as admin, a bug in the code requires that this parameter not be empty, or you will be unable to login as admin.  |
| AdminPassword              | String                | Specifies admin password for console and webadmin login. Only used in single administrator system. |
| AutoAdjust                 | Boolean               | Automatically adjusts bots skill rating based on player skill level.  |
| bAutoNumBots               | Boolean               | Number of bots will automatically change based on the recommended number of players for each map. Should not be used in conjunction with NumBots or GameStats parameters.s  |
| bPlayerMustBeReady         | Boolean               | Enables a semi-tournament mode, in that all players must "click-in" before the game can begin, but otherwise is no different than regular play.  |
| bBalanceTeams              | Boolean               | Bots will automatically switch teams to keep the teams balanced in team games.  |
| BlueTeam                   | Class Name            | Specifies the class name of the roster to use for the blue team. Standard value for this would be `XGame.TeamBlueConfigured` |
| BlueTeamAI (Do not modify) | Class Name            | 	Specifies the class that will control the AI (Team Logic) for the Blue team. Mod authors would use this to write custom AI for new gametypes. Don't add this one unless instructed to do so by the readme for a mutator or something.  |
| BlueTeamSymbol             | Texture Name          | Texture parameter that specifies the symbol that will be associated with the blue team (shows up on the flags, for example). This FAQ contains the valid values for this parameter.  |
| Demorec                    | String                | Starts a server-side demo recording. `?Demorec=nameofdemo` |
| Difficulty                 | Integer (1 - 7)       | Specifies the skill rating of the bots. |
| DMTeam                     | Class Name            | See the description for BlueTeam. This parameter should be used for deathmatch gametypes. Standard value for this parameter is `XGame.DMRosterConfigured`. |
| FF                         | Float ( 0.0 - 1.0)    | 	Damage scaling for friendly fire (fire from teammates). 0.25 would be 25%, etc. |
| FriendlyFire               | Float (0.0 - 1.0)     | Alternate param name for FF. Does the exact same thing. If both are specified at the URL, FriendlyFire will override FF. |
| Game                       | Class Name            | Game Type Classname. |
| GamePassword               | String                | Password clients will be required to enter in order to play on this server.  |
| GameRules                  | Class Name            | Specifies custom GameRules class. GameRules are a new "type" of mutator added in UT2K3. Generally, you will not need to specify the GameRules parameter at the command line, as most mods which utilize GameRules will spawn the GameRules class themselves. |
| GameSpeed                  | Float                 | Sets the speed of the game. Normal = 1.0. 1.25 would 125% speed. This value is only valid in conjuction with the GameSpeed mutator (UnrealGame.MutGameSpeed) |
| GameStats                  | Boolean               | 	Enables/disables StatsLogging. MinPlayers & bAutoNumBots should not be used in conjunction with this parameter. |
| GoalScore                  | Integer               | Score required to win the match. |
| Listen                     | N/A                   | Starts a listen server. Only applicable when starting a server via UT2004.exe. |
| MaxLives                   | Integer               | Specify number of deaths a player is allowed before they are "out". (think LMS) |
| MaxPlayers                 | Integer               | Maximum number of players allowed on this server. |
| MaxSpectators              | Integer               | Maximum number of spectators that will be allowed to connect (does not affect the player count for MaxPlayers). |
| MinPlayers                 | Integer               | 	Bots will join the game unless at least this many players are connected. Should not be used in conjuction with GameStats or bAutoNumBots. |
| Mutator                    | ClassName[,ClassName] | Adds a mutator to the game. Multiple mutators should be separated by commas. |
| NumBots                    | Integer               | Number of bots that will initially join the game, up to MinPlayers. Cannot be used in conjuction with GameStats. |
| QuickStart                 | Boolean               | Enabled allows bots to start the match without requiring a human player to be connected. |
| RedTeam                    | Class Name            | See description for BlueTeam. Standard value for this option is `XGame.TeamRedConfigured`.  |
| RedTeamAI (Do not modify)  | Class Name            | See description for BlueTeamAI |
| RedTeamSymbol              | Texture Name          | See description for BlueTeamSymbol |
| Translocator               | Boolean               | Enables translocator. This paramater may be ignored if certain gametypes or mutators don't allow the translocator to be used. |
| TimeLimit                  | Integer               | Time limit at which the match will end. If scores are tied when the time limit expires, game goes into overtime. Rules of overtime will vary from gametype to gametype |
| Tournament                 | Boolean               | Enables tournament mode. |
| VotingHandler              | Class Name            | Specify the voting handler class to use for MapVote, KickVote & MatchSetup |
| VsBots                     | Boolean               | All players are added to the same team. Bots make up the other team. |
| WeaponStay                 | Boolean               | Specifies whether weapons "pickups" remain after being picked up by players. |

## LastManStanding Specific Parameters

| Parameter       | Values  | Description |
| --------------- | ------- | ----------- |
| AllowAdrenaline | Boolean | Enables/disables adrenaline |
| AllowPickups    | Boolean | Enables/disables pickups (additional ammo) |
| CamperAlarm     | Boolean | Enables checking for campers in LMS games. |
| HealthForKill   | Boolean | Players recieve additional health every time when they frag other players. |
| SuperWeaps      | Boolean | Enables super weapons (Ion & Redeemer). |

## Mutant Specific Parameters

| Parameter    | Values  | Description |
| ------------ | ------- | ----------- |
| BottomFeeder | Boolean | Enables bottom feeder feature in Mutant games. Player that is the mutant receives additional points for fragging the bottom feeder. |

## Onslaught Specific Parameters

| Parameter            | Values  | Description |
| -------------------- | ------- | ----------- |
| bRandSetupAfterReset | Boolean | Use random link setup after round resets. Overrides value for ONSOnslaughtGame.bRandSetupAfterReset in server's ini file. Only applicable if GoalScore is set to greater than 1. |
| LinkSetup            | String  | Specifies the link setup to be used for the match. Specify `?LinkSetup=Random` to choose a random link setup. |

## Assault Specific Parameters

| Parameter          | Values  | Description |
| ------------------ | ------- | ----------- |
| RoundTimeLimit     | Int     | Time limit for each round |
| PracticeTimeLimit  | Int     | Amount of time for the practice round. Practice round is a short, non-scored round that takes place prior to the real match. Primarily used to give all players using slower machines a chance to load the map before the real match begins. |
| RoundLimit         | Int     | Number of rounds in the assault match |
| FirstAttackingTeam | Byte    | Specifies the team number (0 for red, 1 for blue) that should attack first |
| ResetTimeDelay     | Int     | Number of seconds between rounds |
| ReinforcementsFreq | Int     | Maximum number of seconds between respawns (respawn counter) |
