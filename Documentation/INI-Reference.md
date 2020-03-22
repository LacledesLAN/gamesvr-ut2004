# Unreal Tournament 2004 INI File Reference

## Adapted from the following source(s)

* [Unreal Admin Page - Overview of UT2004 Server Config](http://www.unrealadmin.org/server_ini_reference/ut2004) ([mirror](https://archive.is/wip/sYWPB))
* [Unreal Admin Wiki - MapVote (UT2004)](https://wiki.unrealadmin.org/MapVote_(UT2004))

## The INI File

```ini
[URL]
Protocol=UT2004
ProtocolDescription=Unreal Protocol
Name=Player
Map=Index.ut2
LocalMap=NvidiaLogo.ut2
NetBrowseMap=Entry.ut2
Host=
Portal=
MapExt=ut2
EXEName=UT2004.exe
SaveExt=uvx
Port=7777 ;The port the server will listen for connections on
Class=Engine.Pawn
Character=Gorge

[FirstRun]
FirstRun=3186

[Core.System]
PurgeCacheDays=30
SavePath=../Save
CachePath=../Cache
CacheExt=.uxx ;client-side only
CacheRecordPath=../System/*.ucl ;The relative path to use for *.ucl files, which contain all gameinfo, mutator, weapon, etc. information. The game uses these files to determine which mutators, gametypes, etc. should appear in interface lists, such as webadmin or GUI.
MusicPath=../Music
SpeechPath=../Speech
Suppress=DevLoad
Suppress=DevSave
Suppress=DevNetTraffic
Suppress=DevGarbage
Suppress=DevKill
Suppress=DevReplace
Suppress=DevCompile
Suppress=DevBind
Suppress=DevBsp
Suppress=DevNet
Suppress=DevKarma
Suppress=RecordCache
Suppress=MapVoteDebug
Suppress=Init
Suppress=MapVote
Suppress=VoiceChat
Suppress=ChatManager
Suppress=Timer ;These lines control which types of log messages are written. Each name corresponds to the prefixes of each line in the server's log.
Paths=../System/*.u
Paths=../Maps/*.ut2
Paths=../Textures/*.utx
Paths=../Sounds/*.uax
Paths=../Music/*.umx
Paths=../StaticMeshes/*.usx
Paths=../Animations/*.ukx
Paths=../Saves/*.uvx ;These lines tell the server which directories different files are located in. By adding directories using the same syntax, you can have multiple map, texture, sound, etc. directories.

[Engine.Engine]
RenderDevice=D3DDrv.D3DRenderDevice
;RenderDevice=Engine.NullRenderDevice
;RenderDevice=OpenGLDrv.OpenGLRenderDevice
AudioDevice=ALAudio.ALAudioSubsystem
NetworkDevice=IpDrv.TcpNetDriver
DemoRecordingDevice=Engine.DemoRecDriver
Console=XInterface.ExtendedConsole
GUIController=GUI2K4.UT2K4GUIController
Language=int
Product=UT2004
GameEngine=Engine.GameEngine
EditorEngine=Editor.EditorEngine
DefaultGame=XGame.XDeathmatch
DefaultServerGame=XGame.XDeathmatch
ViewportManager=WinDrv.WindowsClient
Render=Render.Render
Input=Engine.Input
Canvas=Engine.Canvas

[Engine.GameEngine]
CacheSizeMegs=32
UseSound=True
MainMenuClass=GUI2K4.UT2K4MainMenu
ConnectingMenuClass=GUI2K4.UT2K4ServerLoading
DisconnectMenuClass=GUI2K4.UT2K4DisconnectOptionPage
LoadingClass=GUI2K4.UT2K4SP_LadderLoading
DetectedVideoMemory=0
UseStaticMeshBatching=True ;(Client-side only)
VoIPAllowVAD=False ;Determines whether this server allows voice activation for voice chat communication
ServerActors=IpDrv.MasterServerUplink
ServerActors=UWeb.WebServer ;ServerActors will be spawned at the beginning of each game.
ServerPackages=Core
ServerPackages=Engine
ServerPackages=Fire
ServerPackages=Editor
ServerPackages=IpDrv
ServerPackages=UWeb
ServerPackages=GamePlay
ServerPackages=UnrealGame
ServerPackages=XEffects
ServerPackages=XPickups
ServerPackages=XGame
ServerPackages=XWeapons
ServerPackages=XInterface
ServerPackages=Vehicles
ServerPackages=TeamSymbols_UT2003 ;ServerPackages are packages which any clients that connect are required to have on their system. If the client does not have one of these packages, the client will attempt to download it from the server. If a download is unsuccessful, the client will be unable to connect to the server.
ServerReadsStdin=False ;Only used for Linux servers. Specifies whether the server accepts input from stdin (console)

[IpDrv.TcpNetDriver]
AllowDownloads=True ;True allows clients to download files directly from server if redirect is not available.
ConnectionTimeout=180.000000 ;Number of seconds server will wait for response from client attempting to connect before closing the connection
InitialConnectTimeout=200.000000 ;Number of seconds server wait for response from clients during the game before closing their connection
KeepAliveTime=0.200000 ;Seconds of inactivity before server will send a "keep-alive" packet to clients, to maintain an open connection
MaxClientRate=15000 ;Maximum rate the server will transmit data to clients if server is in LAN mode (applies to downloads as well)
MaxInternetClientRate=10000 ;Maximum rate the server will transmit data to clients (applies to downloads as well).
SpawnPrioritySeconds=1.000000 ;Number of seconds before a player is respawned after being fragged
ServerTravelPause=4.000000 ;Number of seconds to wait between sending the "mapchange" notification to clients, and actually changing the map
NetServerMaxTickRate=20
LanServerMaxTickRate=35
AllowPlayerPortUnreach=False ;False causes server to cease sending packets to clients upon receiving an ICMP "Port Unreachable" message from that client (normally means the client has disconnected from the server).
LogPortUnreach=False ;Determines whether ICMP "Port Unreachable" events should be logged.
LogMaxConnPerIPPerMin=False ;Determines whether repeated connection attempts from an IP should be logged if more than MaxConnPerIPPerMinute has been exceeded for this IP. Generally, you should leave this set to false, as your server might experience lag under an attempted DDoS from all the logging.
MaxConnPerIPPerMinute=5 ;Maximum number of connections to accept from a single IP address in one minute. Part of the DDoS protection.
DisableKSecFix=True ;Set to false to disable the security fixes added in 2199 (if your server is experiencing lag you feel is related to these security fixes)
MaxDownloadSize=0 ;Limit (in bytes) of the file size that the server will be allowed to send to clients (ignored if AllowDownloads=False). This setting only applies to files downloaded from the server itself, i.e. it has no effect on files coming from a redirect.
RelevantTimeout=5.000000 ;Timeout (in seconds) for non-relevant actor replication. In most cases, you should never need to modify this value.
DownloadManagers=IpDrv.HTTPDownload
DownloadManagers=Engine.ChannelDownload ;Redirection Tutorial

[IpDrv.HTTPDownload]
RedirectToURL= ;URL of redirect server
ProxyServerHost=
ProxyServerPort=3128 ;If your redirect server is behind a proxy, you'll need to put the proxy's public IP address here
UseCompression=True ;If "True", clients attempting to download files from the redirect server will add ".uz2" extension to the requested package, as well as perform decompression upon downloading.

[IpDrv.MasterServerLink]
LANPort=11777 ;(Client-side) Specifies the port clients should use to broadcast LAN server queries
LANServerPort=10777 ;Specifies the query port for LAN servers
MasterServerList=(Address="ut2004master1.epicgames.com",Port=28902)
MasterServerList=(Address="ut2004master2.epicgames.com",Port=28902) ;List of valid master servers

[IpDrv.MasterServerUplink]
DoUplink=True ;Specifies whether the server should connect to the master server. If set to false, the server will not appear in the Internet server browser
UplinkToGamespy=True ;Specifies whether the server should send heartbeat information to gamespy
SendStats=True ;Enable stats processing on this server
ServerBehindNAT=False ;If server is running behind a firewall that performs network address translation, this value must be set to True or your server will appear in the Internet server browser with a ping of N/A.
DoLANBroadcast=False ;In 3186, this setting has no effect. Servers running in LAN mode will always broadcast to the LAN

[IpDrv.UdpGamespyUplink]
UpdateMinutes=1 ;How often to send updates to gamespy's master server. The property name is misleading, however, as the value is multiplied by 60 - a value of 1 means that a heartbeat will be sent to the gamespy master server every 60 minutes.
MasterServerPort=27900 ;Gamespy master server port. No need to modify this value
ServerRegion=0 ;Used by Gamespy servers to group servers according to region

[IpServer.UdpServerQuery]
GameName=ut2 ;Do not modify - query protocols use this to filter servers by game (UT, UT2, DE, Q)

[IpDrv.UdpGamespyQuery]
MinNetVer=0
OldQueryPortNumber=7787
bDebugPortSwaps=True
bRestartServerOnPortSwap=True ;Generally, you should leave this value set to false. Setting this to true will cause the server to crash if a "portswap" is detected. Portswapping can will cause your server to not appear in the internet server browser, and if your server seems to be experiencing portswaps often, it's usually easier to use some sort of batch file to automatically restart the server after when this happens.

[UTV2004c.utvReplication]
UtvPackage=UTV2004c
ViewMode=0
ChatString=
wantBehindView=False

[Engine.GameInfo]
bChangeLevels=True ;Obsolete in UT2004. Servers always performs mapchanges now.
bEnableStatLogging=True ;Enables stat collection and processing on your server
bAllowBehindView=False ;Controls whether players are allowed to use behindview during the match
bAdminCanPause=True ;True allows admins to pause network games (Set to false to prevent game from being paused by bringing up the menu as a logged in admin)
bWeaponShouldViewShake=True ;When enabled, some weapons cause view shaking while firing
GoreLevel=2 ;Amount of gore displayed in the game
GameDifficulty=1.000000 ;Difficulty of single player game
GameSpeed=1.000000 ;Percentage of "normal speed" that game will be played. 1.0 represents 100% (This setting is ignored in UT2004 - gamespeed is now controlled by a mutator)
MaxSpectators=2 ;Maximum number of spectator connections allowed
MaxPlayers=32 ;Maximum number of players allowed in the game
AccessControlClass=Engine.AccessControl ;Name of class which will handle all admin authentication
MaplistHandlerType= ;Maplist manager classname. Usually only set in child classes.
GameStatsClass=IpDrv.MasterServerGameStats ;Class name of server stats manager
SecurityClass=UnrealGame.UnrealSecurity ;Class name of server security manager
VotingHandlerType=xVoting.xVotingHandler ;Class name of mapvote/kickvote manager
ServerSkillLevel=0 ;Sets the skill level for the server. This value is used by the "Quick-Join" feature to find appropriate servers for the user's level of play. Valid ranges are from 0 - 2, where 0 stands for "Beginner". Unless your server is a standard server (i.e. no changes to default settings), it cannot be considered a beginner server.
MaxIdleTime=0.000000 ;Controls how long a player that is sending no input remains on the server before they are kicked for being idle. Set to 0 to disable.
bWeaponStay=false ;Controls whether weapons that were part of the map will "disappear" when picked up by a player
bAllowWeaponThrowing=True ;Controls whether players are allowed to drop weapons
ResetTimeDelay=0 ;Number of seconds between the round resets (only used for gametypes which have more than one round, such as Assault or Onslaught).
AutoAim=1.000000 ;Amount of assistance in aiming (single-player only)
MaxLives=0 ;Maximum number of lives players are given
TimeLimit=0 ;Time limit for this game
GoalScore=0 ;Game will end when this score is achieved

[UnrealGame.UnrealMPGameInfo] ;Values set here will override the values for identical settings in GameInfo
bPreloadAllSkins= ;Forces clients to preload all .upl files and skins
MinPlayers=0 ;Bots join the game until this number of players is reached
bTeamScoreRounds=False ;Not currently used in the anywhere
EndTimeDelay=4.000000 ;Maximum amount of time after the game has been won before all gameplay stops (sort of)
BotMode=5 ;This setting is only used in the GUI, and has no effect on dedicated servers.
BotRatio=1.000000 ;Determines the ratio of bots to humans. Only used if you also pass ?VsBots=True on the command line.
bAllowPrivateChat=True ;Determines whether each player will have a private voice chatroom.

[UnrealGame.DeathMatch] ;Values set here will override the values for identical settings in GameInfo and UnrealMPGameInfo
MinNetPlayers=1 ;How many players must join before the game will start
RestartWait=30 ;Amount of time to wait at the 'end of game' screen before the server begins the map switch
bTournament=False ;If enabled, game will not start until number of connected players if equal to the maximum number of players
bColoredDMSkins=False ;Use team colored skins in deathmatch gametypes.
bPlayersMustBeReady=False ;Players must "click in" for match to begin
bWaitForNetPlayers=True ;Wait until more than MinNetPlayers have joined before beginning match.
bAllowPlayerLights=False ;Determines whether players have a team colored glow at great distances. Aids in visibility and determining which team a player is on when they are far away. Only used in team games or in deathmatch games if bColoredDMSkins is enabled.
bForceDefaultCharacter=False ;True forces all players models to the default character model (Gorge)
NetWait=5 ;Time to wait for players in net games
bForceRespawn=False ;Enabled automatically respawns players when they are fragged. Otherwise, players do not respawn until they press Fire.
bAdjustSkill=False ;Controls whether bots will adjust their skill to match the player
bAllowTaunts=True ;Taunt animations are allowed during the game
bAllowTrans=True ;Allow translocator in the game
SpawnProtectionTime=2.000000 ;Number of seconds players are invulnerable after respawning
LateEntryLives=1 ;How many lives can be lost by any player before new players are no longer allowed to join (LMS)
LoginMenuClass=GUI2K4.UT2K4PlayerLoginMenu ;This will be the menu players see when they first login, as well as during the game, when the press escape
NamePrefixes[0]=Mr_
NamePrefixes[1]=
NamePrefixes[2]=The_Real_
NamePrefixes[3]=Evil_
NamePrefixes[4]=
NamePrefixes[5]=Owns_
NamePrefixes[6]=
NamePrefixes[7]=Evil_
NamePrefixes[8]=
NamePrefixes[9]=
NameSuffixes[0]=
NameSuffixes[1]=_is_lame
NameSuffixes[2]=
NameSuffixes[3]=
NameSuffixes[4]=_sucks
NameSuffixes[5]=
NameSuffixes[6]=_OwnsYou
NameSuffixes[7]=
NameSuffixes[8]=_jr
NameSuffixes[9]=s_clone ;These values are used to prevent bots from having the same name. Whenever a bot is added to the game and it has the same name as another bot, the game will add one of the prefixes, suffixes, or both, to ensure that all bots have different names.

[UnrealGame.TeamGame] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, and DeathMatch
bBalanceTeams=True ;Bots will be placed on the team with the least number of players upon joining the game.
bPlayersBalanceTeams=True ;Players joining the game will be placed on teams according to team size, ignoring the players configured team.
FriendlyFireScale=0 ;Amount of damage inflicted when shot by teammates (1.0 represents 100%)
bAllowNonTeamChat=False ;Sets whether members of opposing teams are allowed to join each other's private voice chatrooms

[XGame.xDeathMatch] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, and DeathMatch

[XGame.xTeamGame] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, and TeamGame

[XGame.xCTFGame] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, and TeamGame

[XGame.xDoubleDom] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, and TeamGame
TimeToScore=10 ;Number of seconds that both points must be held by one team before a point is awarded
TimeDisabled=10 ;Number of seconds after a point is awarded that control points cannot be captured

[XGame.xBombingRun] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, and TeamGame
bBallDrainsTransloc=True ;Players must wait a few seconds after throwing the ball before they are able to translocate.

[BonusPack.xLastManStandingGame] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, and xDeathMatch
CampThreshold=600.000000 ;Area (in UU) that a player must move to not be considered camping.
ReCamperWarnInterval=10 ;How often a camper receives the warning message.
bHealthForKill=False ;Players receive health for fragging other players
bAllowSuperweapons=False ;Super Weapons allowed
bCamperAlarm=True ;Enables camper protection
bAllowPickups=False ;Pickups allowed
bAllowAdrenaline=False ;Whether adrenaline is allowed in the match
bFullAmmo=True ;Players start the match with full ammo in all weapons.

[BonusPack.xMutantGame] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, and xDeathMatch
bEnableBottomFeeder=True ;The lowest-scoring player is considered the bottom-feeder, and is allowed to shoot other players.

[SkaarjPack.Invasion] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, TeamGame, and xTeamGame
WaveConfigMenu=GUI2K4.UT2K4InvasionWaveConfig ;Menu used in the GUI for invasion wave configuration
FallbackMonster=Class'SkaarjPack.EliteKrall' ;This is the monster class the game will spawn if it cannot spawn one of the more advanced monsters (how this would occur, I don't really know)
InitialWave=0 ;Index of wave game should start on when new map is loaded
FinalWave=16 ;Essentially, the number of waves in the game.
; Waves[0] - Waves[15] There are 16 waves possible in the Invasion gametype. Each waves' settings are determined by the Waves[x] parameter in the SkaarjPack.Invasion section of the ini. The following is a more detailed explanation of those settings
Waves[0]=(WaveMask=20491,WaveMaxMonsters=16,WaveDuration=90,WaveDifficulty=0.000000)
Waves[1]=(WaveMask=60,WaveMaxMonsters=12,WaveDuration=90,WaveDifficulty=0.000000)
Waves[2]=(WaveMask=105,WaveMaxMonsters=12,WaveDuration=90,WaveDifficulty=0.000000)
Waves[3]=(WaveMask=186,WaveMaxMonsters=12,WaveDuration=90,WaveDifficulty=0.500000)
Waves[4]=(WaveMask=225,WaveMaxMonsters=12,WaveDuration=90,WaveDifficulty=0.500000)
Waves[5]=(WaveMask=966,WaveMaxMonsters=12,WaveDuration=90,WaveDifficulty=0.500000)
Waves[6]=(WaveMask=4771,WaveMaxMonsters=12,WaveDuration=120,WaveDifficulty=1.000000)
Waves[7]=(WaveMask=917,WaveMaxMonsters=12,WaveDuration=120,WaveDifficulty=1.000000)
Waves[8]=(WaveMask=1689,WaveMaxMonsters=12,WaveDuration=120,WaveDifficulty=1.000000)
Waves[9]=(WaveMask=18260,WaveMaxMonsters=12,WaveDuration=120,WaveDifficulty=1.000000)
Waves[10]=(WaveMask=14340,WaveMaxMonsters=12,WaveDuration=180,WaveDifficulty=1.500000)
Waves[11]=(WaveMask=4021,WaveMaxMonsters=12,WaveDuration=180,WaveDifficulty=1.500000)
Waves[12]=(WaveMask=3729,WaveMaxMonsters=12,WaveDuration=180,WaveDifficulty=1.500000)
Waves[13]=(WaveMask=3972,WaveMaxMonsters=12,WaveDuration=180,WaveDifficulty=2.000000)
Waves[14]=(WaveMask=3712,WaveMaxMonsters=12,WaveDuration=180,WaveDifficulty=2.000000)
Waves[15]=(WaveMask=2048,WaveMaxMonsters=8,WaveDuration=255,WaveDifficulty=2.000000)
; WaveMask: This parameter is used for random number generation, and really shouldn't be modified.
; WaveMaxMonsters: The maximum number of monsters spawned during a wave is determined as follows. Let's assume that WaveMaxMonsters is set at 16. If more than 4 players are connected, then the value of WaveMaxMonsters is multiplied by 2, or the number of players divided by 4, whichever is lower. This means that if 4 players were connected, for instance, then the actual max number of monsters for this wave would be (16 * (4 / 4)) or 16 * 1, which is 16. If 12 player are connected, the the max number of monsters in this wave would be (16 * 2), since 2 is less than (16 / 4). The actual maximum number of monsters that could be spawned during this wave would then be 32. You can use this formula to tweak exactly monsters you'd like players to be up against based on how many connections you allow on your server
; WaveDuration: Number of seconds the wave will last. If the maximum number of monsters for this wave have not been exterminated by the time this duration expires, all of the remaining monsters will be spawned immediately. Once this happens, any monsters that cannot be seen by any player are killed off, leaving players to finish up what's left.
; WaveDifficulty: Determines the difficulty (effectively which monsters are spawned) during this wave. Very similar to the bots' difficulty setting.

[UT2k4Assault.ASGameInfo] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, TeamGame, and xTeamGame
RoundLimit=1 ;Number of rounds in the match
RoundTimeLimit=10 ;Time limit for each round
PracticeTimeLimit=60 ;Practice round is played at the beginning of every game, and is generally used to give all players a chance to load the map
ReinforcementsFreq=7 ;Maximum number of seconds between respawns.

[Onslaught.ONSOnslaughtGame] ;Values set here will override the values for identical settings in GameInfo, UnrealMPGameInfo, DeathMatch, TeamGame, and xTeamGame
OvertimeCoreDrainPerSec=20 ;The amount of health taken from each core every second during overtime
bRandSetupAfterReset=False ;Randomly select a new link setup after a round has been won

[UnrealGame.DMMutator]
bMegaSpeed=False ;Obsolete (does nothing). These settings have been moved to a mutator.
AirControl=0.350000 ;Obsolete (does nothing). These settings have been moved to a mutator.
bBrightSkins=True ;Enables brightskins

[BonusPack.MutCrateCombo]
bAllowCamouflage=True ;Camouflage combo enabled
bAllowPint=True ;Pint-size combo enabled

[XWeapons.ZoomSuperShockBeamFire]
bAllowMultiHit=True ;Sets whether the instagib beam will stop when it hits players

[XWeapons.MutArena]
ArenaWeaponClassName=XWeapons.RocketLauncher ;Only weapon in the game is the weapon specified by ArenaWeaponClassName. See this FAQ for a list of valid values for this setting.

[UnrealGame.MutGameSpeed]
NewGameSpeed=1.000000 ;Modifies the gamespeed (this is now the only way to modify the gamespeed).
[UnrealGame.MutMovementModifier]
bMegaSpeed=False ;All pawns move 1.5 times faster than other objects in the game
AirControl=0.350000 ;Amount of control players have while in the air (1.0 represents 100%)

[UTClassic.MutUTClassic]
bCanDoubleJump=True ;Enables/disables double-jumping.
bCanWallDodge=True ;Enables/disables wall dodging.
bCanDodgeDoubleJump=True ;Enables/disables double-dodge jumps.
bModifyWeaponDamage=True ;Makes weapon damage closer to UT1 values.
bClassicTranslocator=True ;Translocation behaves like the UT1 translocator.

[Onslaught.MutWheeledVehicleStunts]
MaxForce=200000.000000 ;Maximum force that can be applied to stunts
MaxSpin=80.000000 ;Maximum spin that can be achieved by vehicles
JumpChargeTime=1.000000 ;Number of seconds jump must be held to fully "charge" a vehicle jump.

[Onslaught.MutLightweightVehicles]
VehicleMomentumMult=3.000000 ;Damage received by vehicles is multiplied by this amount.
[Onslaught.MutOnslaughtWeapons]
bConfigUseOnslaughtWeapon0=False
bConfigUseOnslaughtWeapon1=True
bConfigUseOnslaughtWeapon2=True ;Enables/disables replacement of the corresponding weapon with an onslaught equivalent.
ReplacedWeaponClassNames0=XWeapons.RocketLauncher
ReplacedWeaponClassNames1=XWeapons.BioRifle
ReplacedWeaponClassNames2=XWeapons.FlakCannon
;Weapon classes to replace with onslaught weapons. See this FAQ for a list of valid values to use here.

[OnslaughtFull.MutVehicleArena]
ArenaVehicleClassName=Onslaught.ONSRV ;Only weapon in the game is the vehicle specified by the ArenaVehicleClassName setting. See this FAQ for a list of valid values for this setting.

[XGame.MutInstagib]
bAllowTranslocator=True ;Enables / disables translocator in instagib matches
bAllowBoost=False ;Determines whether friendly fire transfers momentum (team boosting).

[XGame.MutZoomInstagib]
bAllowTranslocator=True
bAllowBoost=False ;Overrides value for identical setting in MutInstaGib

[Engine.AccessControl]
AdminPassword= ;Admin password (single administrator system only)
GamePassword= ;If a value is specified, clients must provide a password to connect to the game. (Server will also accept any valid admin password)
LoginDelaySeconds=0.00000 ;How many seconds must pass after an unsuccessful login attempt before the admin may attempt to login again.
bBanByID=True ;Bans will be enforced using a hash of the client's CD key and the server's CD key. Enable this to prevent banned players with dynamic IP addresses from bypassing the ban
IPPolicies=ACCEPT;*
BannedIDs=
PrivClasses=XAdmin.xKickPrivs
PrivClasses=XAdmin.xGamePrivs
PrivClasses=XAdmin.xUserGroupPrivs
PrivClasses=XAdmin.xExtraPrivs
 ;PrivClasses are loaded by the server when using the advanced administration system. They contain information about which privileges are available for admins & groups.

[UWeb.WebServer]
ServerName= ;This should really be called ServerAddress. This is the value that the webserver will use to convert relative URLs into absolute URLs. If this value is left blank, the webserver will attempt to fill it with the IP address of the server. Generally, this should be left blank, unless you are running the server behind NAT or using a multihome server.
Applications[0]=xWebAdmin.UTServerAdmin
ApplicationPaths[0]=/ServerAdmin
Applications[1]=xWebAdmin.UTImageServer
ApplicationPaths[1]=/images ;The value of each Applications line is the name of the class responsible for handling connections to the path specified in the corresponding ApplicationPaths entry (Connections to //server.ip/ServerAdmin are handled by Applications[0], since that is the value for ApplicationPaths[0])
DefaultApplication=0 ;Specifies the application that will handle connections which provide no subpath (http://server.ip/ )
bEnabled=True ;Enables the UT webserver
ListenPort=80 ;This is the port that the webserver will listen for connections on
MaxConnections=30 ;Maximum number of open connections allowed to the webserver at the same time. If you find that you are getting lots of missing images or pages, try increasing this value.
ExpirationSeconds=86400 ;Much of the webadmin content is cached client-side to speed up processing of each request. This setting determines how long (in seconds) browsers should use the cached content before it is considered "stale".

[UWeb.WebConnection]
MaxValueLength=512 ;Maximum length of variable value passed in a URL. There should never be any need to change these values
MaxLineLength=4096 ;Maximum length of a single line passed in the URL. There should never be any need to change these values

[XWebAdmin.UTServerAdmin]
ActiveSkin= ;Currently active webadmin skin
AdminRealm=UT Remote Admin Server ;AdminRealm is used by some browsers to track cached username/passwords.
QueryHandlerClasses= ;Each of these classes handles a specific type of webadmin query. Default values correspond to the Current, Default & Admin areas of webadmin.

[Engine.GameReplicationInfo]
ServerName= ;This is what will appear in the server browser as the name of your server
ShortName= ;Currently not used for anything
ServerRegion=0 ;Used to indicate which area of the world the server was located in for the GameSpy Query protocol, but seems to be unused now
AdminName= ;Specifies the value that will appear in the Server Browser and the MOTD as the name of the admin of this server
AdminEmail= ;Email address that will appear in the server browser and MOTD as the admin's email address
MessageOfTheDay= ;The Message Of The Day appears for a few seconds when clients connect to your server

[xVoting.xVotingHandler]
VoteTimeLimit=70 ;(1 - 500) The number of seconds to allow for voting at the end of the game or after a Mid-Game vote. After this time limit has been reached the votes are counted and the map with the highest score wins.
Default is 70
ScoreBoardDelay=5 ;(1 - 500) The number of seconds to delay before automatically opening the voting window after the end of the current game is reached. This time is given to the players so that they can look at the score board. Default is 10.
bAutoOpen=True ;(True/False) If true then the voting windows will be automatically opened at the end of each game. If False then the normal cycle maplist is used to select the next map. Players can initiate a Mid-Game vote only. They would have to open the voting window by pressing the MapVote HotKey.
MidGameVotePercent=50 ;(1 - 100) The percentage of players that are required to vote before a Mid-Game vote is initiated. Set to 100 to virtually disable Mid-Game voting by requiring all of the players to vote. Default is 50.
bScoreMode=False ;(True/False) Setting this to True will give players move votes based on their score. Example: At the end of a DeathMatch game you have 10 frags and then you vote for DM-Phobos2 then it will place 10 votes for DM-Phobos2. Default is False
bAccumulationMode=False ;(True/False)Setting this to True will cause non-winning and unused votes to carry over to the next game. If the map you voted for wins then you will not carry over votes to the next game. If the Map you voted for does NOT win then the amount of votes you currently have will carry over. Default is False
bEliminationMode=False ;(True/False) Setting this to True will disable voting for previously played maps until there are only N enabled maps left in the map list. N is MinMapCount (see below). This is accomplished by incrementing the RepeatLimit after each game. You can use this mode to force players to play all the maps instead of just the popular ones. Default is False
MinMapCount=2 ;(1 to number of maps on the server) This option is only applicable when bEliminationMode is set to True. It represents the minimum number of enabled maps that will trigger an Elimination Mode MapList Reset. Elimination Mode Maplist Reset is when the all of the maps in the maps list are re-enabled for voting.
MapVoteHistoryType=xVoting.MapVoteHistory_INI ;The code class that manages the map history data. Default xVoting.MapVoteHistory_INI. It is recommend that you do not change this. This will allow a ini file to be created to store map vote history
RepeatLimit=4 ;(0 -  total number of maps on the server) The number of games to disable voting for a map after it has been played. Make sure the RepeatLimit is less than the total number of maps in the First GameConfig list. Default is 4
DefaultGameConfig=0 ;(0 to the number of GameConfig lines - 1 ) This is an index number that tells MapVote which GameConfig to use when all of the players leave the game. This is only used if bDefaultToCurrentGameType is set to False, otherwise it is ignored. The index starts at 0, so the first GameConfig line in you ini file would be 0, the next would be 1
bDefaultToCurrentGameType=True ;(True/False) If set to True MapVote will stay on the current GameType (GameConfig) when all players leave the server and it switches to a random map. The random map will be one that has a prefix in the GameConfig.Prefix. Set to False and it will switch to the DefaultGameConfig
bMapVote=False ;(True/False) If set to True MapVote will be Enabled. If set to false it will Disabled. Default is False.
bKickVote=False ;(True/False) True = If set to true then players can initiate a vote to kick other players. Default is True.
bMatchSetup=False ;(True/False) Enables clan match setup. Default is False
KickPercent=51 ;(1 to 100) The percentage of players that are required to place kick votes against one player before that player is kicked from the server. Default is 50.
bAnonymousKicking=True ;(True/False) If set to true then the player who imitated a kick vote will remain anonymous. It is recommended you set this to false. Default is True
MapListLoaderType=xVoting.DefaultMapListLoader ;This is a pointer to a code file and code class that is to be used to load the maplist with map names. Default is xVoting.DefaultMapListLoader (do not change this)
ServerNumber=1 ;(1-11) Only change this if you are running multiple servers from the same system folder. This will tell mapvote to use a different mapvotehistory.ini file. Default is 1
CurrentGameConfig=0 ;(0 - to number of gameconfigs)
AccInfo=(Name=,VoteCount=0)
GameConfig=(GameClass=,Prefix=,Acronym=,GameName=,Mutators=,Options=) ; what gametype/map/mutators/options you allow you players to vote for

; GameClass: This is the name of the package and the name the game class separated by a period. Example: XGame.xCTFGame for CTF
; Prefix: The MapName Prefixes to associate with this gametype. If you want to list more than one separate each with a comma. This tells MapVote which maps to load in the maplist for this gametype. Example: CTF
; Acronym: Short text acronym or abbreviation that will be appended to map names in messages to help identify game type for map. Example: Acronym=DM - "JoePlayer voted for DM-MapName(DM)"
; GameName: This is the name or title of the game type. For example: "Capture The Flag". Note: You can make this anything you like
; Mutators: List of Mutators to load with this game type. If more than one separate each with a comma. Warning: If you choose to use a mutator in one GameConfig but not another you will need to specify 'none' in the GameConfig where you do not want a mutator. This is because mutators are 'sticky'
; Options: This is where you can set custom game rules. Example: GoalScore=20?Translocator=True


[Engine.BroadcastHandler]
bMuteSpectators=False ;Enabling this prevents specs from chatting during the game
bPartitionSpectators=False ;Enable to prevent spectator's messages from being seen by players

[Engine.VoiceChatReplicationInfo]
bEnableVoiceChat=True ;Enables / disables voice chat on the server
bAllowLocalBroadcast=True ;Enables / disables the "Local" chatroom.
MaxChatters=0 ;Maximum players allowed in a single chatroom. 0 for unlimited.
LocalBroadcastRange=1000.000000 ;The maximum distance (in Unreal Units) at which a broadcast sent to the "Local" chatroom can be heard.
DefaultBroadcastRadius=20.000000 ;The distance (in Unreal Units) at which broadcasts sent to the "Local" channel begin to attenuate (fade). Set this value higher than LocalBroadcastRange to disable attenuation.
VoIPInternetCodecs=CODEC_48NB ;Voice chat codecs allowed in internet games. 48 is a lower quality codec that takes less bandwidth, while 96 is a higher quality codec but requires more bandwidth. 96 should only be allowed on LAN, unless your server has LAN-like bandwidth.
VoIPLANCodecs=CODEC_48NB
VoIPLANCodecs=CODEC_96WB ;Voice chat codecs allowed in LAN games.

[Engine.GameStats]
bLocalLog=False ;Enables / disables local stats logging.
LogFileName=Stats_%P_%Y_%M_%D_%H_%I_%S

;Determines how the filename for each stats log will be generated. Valid values and their meanings are as follows:
;%P Server Port     %H Current Hour
;%N Server Name     %I Current Minute
;%Y Current Year    %W Day of the Week
;%M Current Month   %S Current Second
;%D Current Date

[UnrealGame.CustomBotConfig]
ConfigArray=( See below for parameters )
CharacterName="Gorge"
PlayerName="The_Reaper"
FavoriteWeapon="xWeapons.RocketLauncher"
Aggressiveness=0.400000
Accuracy=0.000000
CombatStyle=0.400000
StrafingAbility=0.765789
Tactics=0.000000
ReactionTime=0.000000
bJumpy=True

[XGame.TeamRedConfigured]
Characters=
Characters=
Characters= ;Characters that should be on the red team (only used in single player).

[XGame.TeamBlueConfigured]
Characters=
Characters=
Characters= ;Characters that should be on the blue team (only used in single player).

[XGame.DMRosterConfigured]
Characters=
Characters=
Characters= ;Characters that should be in DeathMatch games (only used in single player).

[XInterface.MapListDeathMatch]
MapNum=0 ;Index of last played map for this maplist
Maps=DM-Antalus ;These sections determine the map rotation for your server

[XInterface.MapListTeamDeathMatch]
MapNum=0 ;Index of last played map for this maplist
Maps=DM-Antalus ;These sections determine the map rotation for your server

[XInterface.MapListCaptureTheFlag]
MapNum=0 ;Index of last played map for this maplist
Maps=CTF-Chrome ;These sections determine the map rotation for your server

[XInterface.MapListDoubleDomination]
MapNum=0 ;Index of last played map for this maplist
Maps=DOM-SunTemple ;These sections determine the map rotation for your server

[XInterface.MapListBombingRun]
MapNum=0 ;Index of last played map for this maplist
Maps=BR-Anubis ;These sections determine the map rotation for your server

[BonusPack.MapListMutant]
MapNum=0 ;Index of last played map for this maplist
Maps=DM-Antalus ;These sections determine the map rotation for your server

[SkaarjPack.MapListInvasion]
MapNum=0 ;Index of last played map for this maplist
Maps=DM-Antalus ;These sections determine the map rotation for your server

[BonusPack.MapListLastManStanding]
MapNum=0 ;Index of last played map for this maplist
Maps=DM-Antalus ;These sections determine the map rotation for your server

[Onslaught.ONSMapListOnslaught]
MapNum=0 ;Index of last played map for this maplist
Maps=ONS-Torlan ;These sections determine the map rotation for your server

[UT2K4Assault.ASMapList]
MapNum=0 ;Index of last played map for this maplist
Maps=AS-Convoy ;These sections determine the map rotation for your server

Custom Bot Configuration

Each additional custom bot parameter must follow a fairly rigid syntax, which is given in the following line. For each custom bot that you'd like to customize, you'll need to have a seperate ConfigArray line in the server's ini file under the UnrealGame.CustomBotConfig section.

[UnrealGame.CustomBotConfig]
 ;The following text should be on a single line
ConfigArray=(CharacterName="Gorge",PlayerName="The_Reaper",FavoriteWeapon="xWeapons.RocketLauncher",
Aggresiveness=0.400000,Accuracy=0.000000,CombatStyle=0.400000,StrafingAbility=0.765789,Tactics=0.000000,
ReactionTime=0.000000,bJumpy=True)

;An explanation of the inner values is as follows:

[UnrealGame.CustomBotConfig]
CharacterName="Gorge" ;Name of character. Must match a character name in the .upl file.
PlayerName="The_Reaper" ;Enter whatever you like here. This will be the bot's name.
FavoriteWeapon="xWeapons.RocketLauncher" ;Class name of the bot's preferred weapon. I will create a list of valid classnames for this parameter as time allows.
```
