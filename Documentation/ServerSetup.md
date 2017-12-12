# Unreal Tournament 2004 Server Setup

This tutorial is an adapted from the following sources:

* [unrealadmin.org's guide](http://wiki.unrealadmin.org/Server_Setup_%28UT2004%29) by user *Bry*
* [Unreal Tournament 2004 on WikiPedia](https://en.wikipedia.org/wiki/Unreal_Tournament_2004)

The purpose of this copy is to backup - not to supplant.

## Introduction

Running a UT2004 Server is just as easy as it is for UT2003. Basically the principle is the same you can use a bat file, a service or the command line to start a server. Alternatively on Linux you can start your server via the command line or `runserver.sh`.

We fully recommend either the batch file or service option.To start of with you will have to request a special server cd-key (unless you are running the server on a computer with the full game already installed). This can be done by visiting [Epic's UT2004 KeyGen Site](http://unreal.epicgames.com/ut2004server/cdkey.php) and then following the instructions supplied in the email.

Warning: You must enter an email capable of receiving a .reg file (if you email provider filters out the whole email you will need to use a different email address).

## Starting from a Batch File (Windows)

Edit your `runserver.bat` file that is stored in your ut2004\system folder and change it from:

```
@echo off
:10
ucc server %1 %2 %3 %4 %5 %6 %7 %8 %9 -log=server.log
copy server.log servercrash.log
goto 10
```

to:

```
@echo off
:10
ucc server ONS-Torlan?game=Onslaught.ONSOnslaughtGame ini=UT2004.ini log=server.log
copy server.log servercrash.log
goto 10
```

This will start a basic Onslaught Server.

To run as different servers change the line:

```
ONS-Torlan?game=Onslaught.ONSOnslaughtGame
```

Here is a list of available gametypes in the retail package. If you installed a mod there might me more gametypes available to you.

* Assault (`UT2K4Assault.ASGameInfo`) - It is an objective-oriented game type in which one team attacks the objectives (usually one at a time in a specific order) while another defends. Often, attackers will be rewarded for completing an objective by being allowed to spawn closer to the next objective. If the attacking team completes the final objective within the allowed time, the teams switch roles and another round on the same map begins. If not, the original attackers lose. If a second round begins and the new attackers complete the final objective in less time than the first attackers, they win; if not, they lose.
* Bombing Run (`XGame.xBombingRun`) - Each level has a ball that starts in the middle of the playing field. Your team scores by getting the ball through the enemy team's hoop. You score 7 points for jumping through the hoop while holding the ball and 3 points for tossing the ball through the hoop. The player holding the ball cannot use weapons but can pass the ball to team mates. The ball is dropped if the player is killed.
* Capture The Flag (`XGame.xCTFGame`) - Your team must score flag captures by taking the enemy flag from the enemy base and returning it to their own flag. If the flag carrier is killed, the flag drops to the ground for anyone to pick up. If your team's flag is taken, it must be returned (by touching it after it is dropped) before your team can score a flag capture.
* DeathMatch (`XGame.xDeathMatch`) - or DM, is a game type, in which the point is to either reach a certain number of frags (or kills) or to the highest number of frags at the time limit for the match.
* Double Domination (`XGame.xDoubleDom`) - Two teams duke it out in a quest for battlefield supremacy. The team with the most frags wins.
* Invasion (`SkaarjPack.Invasion`) - It is a simple survival mode. The players are forced to work together to try and survive endless waves of monsters from Unreal that get increasingly difficult with each wave. Once a player dies they cannot respawn until the round is over. Rounds can either end after a time limit (victory) or when all players are dead (failure).
* Last Man Standing (`BonusPack.xLastManStandingGame`) - Each player starts with a limited number of lives. The last remaining player to still have lives wins the match.
* Mutant (`BonusPack.xMutantGame`) - All players start in a deathmatch setting with all weapons, and the first player to kill becomes the "mutant". This player receives unlimited ammo, camouflage, Berserk (Increases rate of fire and knockback) and super speed for an indefinite amount of time, but he slowly loses health and can't pick up any health items. When the mutant is killed, the mutant powers are passed to the killer.
* Onslaught (`UT2K4Assault.ASGameInfo`) - or ONS is a vehicle-based game mode in which the objective is to capture a series of power nodes connecting your and your opponents’ bases and destroy the power core located within their base. First team to destroy opponents’ power core wins.
* Team DeathMatch (`XGame.xTeamGame`) - Two teams duke it out in a quest for battlefield supremacy. The team with the most frags wins.
* Vehicle CTF (`XGame.xVehicleCTFGame`) - Capture the flag with vehicles.

If you are starting a LAN based server, add `-lanplay` to you command line. This will also increase map download speeds.

```
@echo off
:10
ucc server CTF-Yesterday?game=XGame.xCTFGame ini=UT2004.ini log=server.log -lanplay
copy server.log servercrash.log
goto 10
```

## Starting A Linux UT2004 Server

The principle for running a Linux server is very similar. You use the same start-up line with the addition of `-nohomedir` switch and ucc-bin instead of just ucc

For example to run an ctf server via the linux command line we would have something like:

```
ucc-bin server CTF-BridgeOfFate?game=XGame.xCTFGame ini=ut2004.ini -nohomedir
```

You may also run your server via the `runserver.sh`. Simply open this file in a text editor and use the above command line.

If you wish to start a different type of server then simply use one of the command lines above.

Lastly, if you are starting your server via putty then you may wish to run your server in the background so that it stays running once you exit putty. This is simple to do by adding & to the end of your command line. For example:

```
ucc-bin server CTF-BridgeOfFate?game=XGame.xCTFGame ini=ut2004.ini -nohomedir &
```

## Mutators

We will use the Instagib mutator as an example of how to add mutator support. This is simply done by adding:

```
?mutator=MutatorName
```

All you need to do is change the part that says:

```
ONS-Torlan?game=Onslaught.ONSOnslaughtGame
DM-Rankin?game=XGame.xTeamGame
AS-MotherShip?game=UT2k4Assault.ASGameInfo
CTF-FaceClassic?game=XGame.xCTFGame
BR-Serenity?game=XGame.xBombingRun
DM-Rankin?game=XGame.xDeathMatch
DM-Deck17?game=BonusPack.xMutantGame
DM-Antalus?game=SkaarjPack.Invasion
DM-Morpheus3?game=BonusPack.xLastManStandingGame
```

and add `?mutator=XGame.MutInstaGib`

like:

```
DM-Antalus?game=XGame.XDeathmatch?mutator=XGame.MutInstaGib
CTF-Citadel?game=XGame.xCTFGame?mutator=XGame.MutInstaGib
BR-Anubis?game=XGame.xBombingRun?mutator=XGame.MutInstaGib
DOM-Suntemple?game=xGame.xDoubleDom?mutator=XGame.MutInstaGib
DM-Curse3?game=XGame.xTeamGame?mutator=XGame.MutInstaGib
DM-Deck17?game=BonusPack.xMutantGame?mutator=XGame.MutInstaGib
DM-Antalus?game=SkaarjPack.Invasion?mutator=XGame.MutInstaGib
DM-Morpheus3?game=BonusPack.xLastManStandingGame?mutator=XGame.MutInstaGib
```

If you want to use multiple mutators simply separate them with a comma e.g.:

```
mutator=XGame.MMutInstaGib,UnrealGame.MutLowGrav
```

will add instagib and lowgravity.

### List of Retail Mutators

Installing mutators can make your server non-standard. For custom gametypes (this includes Vehicle CTF, Invasion and InstaGib CTF) the masterserver does not distinguish between standard and non standard servers. If your server became non-standard and you do not run any mutators besides the ones below, chances are you have changed the weapon stay (TDM only), game speed or translocator availability.

| Class name                        | Mutator Description  | Standard? |
| --------------------------------- | -------------------- | --------- |
| BonusPack.MutCrateCombo           | Bonus Combos         |           |
| OnslaughtBP.MutBonusVehicles      | Replaces some vehicles of retail Onslaught maps with the ones in the bonus pack |  |
| Onslaught.MutBigWheels            | BigWheels            |           |
| Onslaught.MutLightweightVehicles  | Lightweight Vehicles |           |
| Onslaught.MutOnslaughtWeapons     | Onslaught Weapons    |           |
| Onslaught.MutWheeledVehicleStunts | Stunt Vehicles       | Y         |
| OnslaughtFull.MutVehicleArena     | Vehicle Arena        |           |
| UTClassic.MutUTClassic            | UT Classic           |           |
| UTClassic.MutUseLightning         | Lightning Guns       | Y         |
| UTClassic.MutUseSniper            | Sniper Rifles        | Y         |
| UTV2004s.utvMutator               | UTV2004S             |           |
| UnrealGame.MutBerserk             | Super Berserk        |           |
| UnrealGame.MutBigHead             | BigHead              | Y         |
| UnrealGame.MutGameSpeed           | Game Speed           |           |
| UnrealGame.MutLowGrav             | LowGrav              |           |
| UnrealGame.MutMovementModifier    | Air Control          |           |
| UTSecure.MutUTSecure              | UT Secure            | Y         |
| XGame.MutFastWeapSwitch           | UT2003 Style         |           |
| XGame.MutInstaGib                 | InstaGib             |           |
| XGame.MutNoAdrenaline             | No Adrenaline        | Y         |
| XGame.MutQuadJump                 | QuadJump             |           |
| XGame.MutRegen                    | Regeneration         |           |
| XGame.MutSlomoDeath               | Slow Motion Corpses  |           |
| XGame.MutSpeciesStats             | Species Statistics   |           |
| XGame.MutUDamageReward            | UDamage Reward       |           |
| XGame.MutVampire                  | Vampire              |           |
| XGame.MutZoomInstagib             | Zoom InstaGib        |           |
| XWeapons.MutArena                 | Arena                |           |
| XWeapons.MutNoSuperWeapon         | No SuperWeapons      | Y         |

## Setting up UT2004 Webadmin System

UT2004 can use one of two admin systems. The first is like Unreal Tournament or like most other games, one admin user and password which allows you access to everything.

This we will call the basic admin system.

UT2004 also has an XAdmin system which allows you to have multiple user accounts and passwords each with different admin levels. For example, one user could have access to kick but not ban while another user could have access to everything but setting a game password.

First, we will setup the generic options needed for both systems

Find in your UT2004.ini file this section:

```
[UWeb.WebServer]
Applications[0]=xWebAdmin.UTServerAdmin
ApplicationPaths[0]=/ServerAdmin
Applications[1]=xWebAdmin.UTImageServer
ApplicationPaths[1]=/images
bEnabled=False
ListenPort=80
```

Change `bEnabled=False` to `True`

You may also wish to change `ListenPort=80` to another value. As This will be the port which you run your webserver on

## Basic Admin System

To enable WebAdmin from the command line (ie. just 1 user name/pass) then add the

```
?AdminName=XXXX?AdminPassword=XX
```

parameter to your command line.

An example command line would now be:

```
ONS-Torlan?game=Onslaught.ONSOnslaughtGame?AdminName=myname?AdminPassword=mypass ini=UT2004.ini log=TypeLogNameHere.log
```

## XAdmin System

To enable the Xadmin system find the section [Engine.GameInfo] and change the value of the AccessControlClass= line to XAdmin.AccessControlIni

Now start your server and you will notice a new file is created in your system folder called xadmin.ini . This is where all your admin user/passwords/levels are stored. We strongly recommend you do not edit this file directly but that you set your admins up via webadmin.

Now browser to your server ip:port e.g. http://123.4.56.78:80 and you will be prompted for a user and password. This is default set to Admin / Admin and it is case sensitive. You will now be able to access the admins and groups menu on the top right of the screen.

We strongly recommend one of the first things you do is to change the default password. Also, note that you will have to login via console with your username in the format:

```
adminlogin user password
```

## Running a Server Behind NAT

You will need to open some ports in order to allow outside clients to connect to your server. This means that you are using some kind of router. How to forward the ports depends on the router Manufacturer. See your documentation for additional information.

The default ports are:
| Port  | Type   | Description                                                        |
| ----- | ------ | ------------------------------------------------------------------ |
| 7777  | UDP/IP | Game Port                                                          |
| 7778  | UDP/IP | Query Port; game port + 1                                          |
| 7787  | UDP/IP | GameSpy Query Port; game port + 10                                 |
| 28902 | TCP/IP | Allows your Server to Connect to the UT2004 Master Server Browser) |
| xxxx  | TCP/IP | Port set via ListenPort that your WebAdmin will run on             |

Also make sure you set the following to True

Find the `[IpDrv.MasterServerUplink]` part in your server's ini file, and modify the following value:

```
ServerBehindNAT=True
```

If you are unable to browse webadmin using the external IP address of your server, but accessing the webadmin from inside your LAN works, then the following may help you:

Find the `[UWeb.WebServer]` in your server's .ini file, and modify the following value (where x.x.x.x is your public internet IP address ):

```
ServerName=x.x.x.x
```

Also, please remember due to the way NAT works, any computer within your local NAT network will have to connect and view your server (via the server browser) via the LAN IP else you will have problem's connecting and get N/A for the server details. Anyone outside your network (Internet) should see your server fine now as long as the ports are opened.
