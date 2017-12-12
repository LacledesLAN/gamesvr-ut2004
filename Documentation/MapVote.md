# Unreal Tournament 2004 MapVote

This tutorial is a formated copy of [unrealadmin.org's guide](http://wiki.unrealadmin.org/MapVote_%28UT2004%29) created by user *Bry*. The purpose of this copy is to backup - not to supplant.

## Introduction

One of the sorely missed features in UT2003 was a working mapvote but, along came BDB and created an excellent third party mapvote system. It was so good infact that Epic asked BDB to make one for UT2004 and thats exactly what he did. Mapvote is a very good choice for servers as it allows people to play the maps they want to play so everyone doesn't leave when a map they dislike comes on. It also allows for better server control as people can initiate kick votes to kick cheaters when an admin is not about. In short mapvote is a very useful feature that a server admin should seriously consider using.

## Enabling MapVote

The best way to enable mapvote is via some very simple ini editing. First off open you UT2004.ini or which ever file you are using as your server.ini specified via ini=name.ini in your commandline.

Now search for the section called [xVoting.xVotingHandler] which should be near the bottom of the file. If after searching one does not exist then simply add it to the bottom of your ini .

You should now have something like:

```
[xVoting.xVotingHandler]
VoteTimeLimit=70
ScoreBoardDelay=5
bAutoOpen=True
MidGameVotePercent=50
bScoreMode=False
bAccumulationMode=False
bEliminationMode=False
MinMapCount=2
MapVoteHistoryType=xVoting.MapVoteHistory_INI
RepeatLimit=4
DefaultGameConfig=0
bDefaultToCurrentGameType=True
bMapVote=False
bKickVote=False
bMatchSetup=False
KickPercent=51
bAnonymousKicking=True
MapListLoaderType=xVoting.DefaultMapListLoader
ServerNumber=1
CurrentGameConfig=0
GameConfig=(GameClass="XGame.xDeathMatch",Prefix=,Acronym=,GameName="new",Mutators=,Options=)
```

To Enable mapvote simply set `bMapvote=False` to `True`

You may also need to add or modify `[xVoting.DefaultMapListLoader]` so that it looks like:

```
[xVoting.DefaultMapListLoader]
bUseMapList=False
MapNamePrefixes=DM,DOM,CTF,BR,AS,ONS,VCTF
```

* bUseMapList - tells mapvote whether you wish all maps in your map folder to be available to be voted on (false) or to only use maps listed in the map list section of the ini (true)
* MapNamePrefixes - states which maps (via their prefix) you can vote for so if you only want ctf then remove everything bar CTF

Although, this will enable mapvote it will not yet be fully working. Infact it should not work at all. Please, see the next section on configuring mapvote.

## MapVote Settings Explained

We now have MapVote basically working. yet it is not configured for use. To do this we must now edit the above settings. Since, this must be done on an individual basis it will be best to explain what each setting means.

| Setting                    | Description |
| -------------------------- | ----------- |
| VoteTimeLimit              | (1 - 500) The number of seconds to allow for voting at the end of the game or after a Mid-Game vote. After this time limit has been reached the votes are counted and the map with the highest score wins. Default is 70 |
| ScoreBoardDelay            | (1 - 500) The number of seconds to delay before automatically opening the voting window after the end of the current game is reached. This time is given to the players so that they can look at the score board. Default is 10. |
| bAutoOpen                  | (True/False) If true then the voting windows will be automatically opened at the end of each game. If False then the normal cycle maplist is used to select the next map. Players can initiate a Mid-Game vote only. They would have to open the voting window by pressing the MapVote HotKey. |
| MidGameVotePercent         | (1 - 100) The percentage of players that are required to vote before a Mid-Game vote is initiated. Set to 100 to virtually disable Mid-Game voting by requiring all of the players to vote. Default is 50. |
| bScoreMode                 | (True/False) Setting this to True will give players move votes based on their score. Example: At the end of a DeathMatch game you have 10 frags and then you vote for DM-Phobos2 then it will place 10 votes for DM-Phobos2. Default is False |
| bAccumulationMode          | (True/False)Setting this to True will cause non-winning and unused votes to carry over to the next game. If the map you voted for wins then you will not carry over votes to the next game. If the Map you voted for does NOT win then the amount of votes you currently have will carry over. Default is False |
| bEliminationMode           | (True/False) Setting this to True will disable voting for previously played maps until there are only N enabled maps left in the map list. N is MinMapCount (see below). This is accomplished by incrementing the RepeatLimit after each game. You can use this mode to force players to play all the maps instead of just the popular ones. Default is False |
| MinMapCount                | (1 to number of maps on the server) This option is only applicable when bEliminationMode is set to True. It represents the minimum number of enabled maps that will trigger an Elimination Mode MapList Reset. Elimination Mode Maplist Reset is when the all of the maps in the maps list are re-enabled for voting. |
| MapVoteHistoryType         | The code class that manages the map history data. Default xVoting.MapVoteHistory_INI. It is recommend that you do not change this. This will allow a ini file to be created to store map vote history |
| RepeatLimit                | (0 -  total number of maps on the server) The number of games to disable voting for a map after it has been played. Make sure the RepeatLimit is less than the total number of maps in the First GameConfig list. Default is 4 |
| DefaultGameConfig          | (0 to the number of GameConfig lines - 1 ) This is an index number that tells MapVote which GameConfig to use when all of the players leave the game. This is only used if bDefaultToCurrentGameType is set to False, otherwise it is ignored. The index starts at 0, so the first GameConfig line in you ini file would be 0, the next would be 1 |
| bDefaultToCurrentGameType  | (True/False) If set to True MapVote will stay on the current GameType (GameConfig) when all players leave the server and it switches to a random map. The random map will be one that has a prefix in the GameConfig.Prefix. Set to False and it will switch to the DefaultGameConfig |
| bMapVote                   | (True/False) If set to True MapVote will be Enabled. If set to false it will Disabled. Default is False. |
| bKickVote                  | (True/False) True = If set to true then players can initiate a vote to kick other players. Default is True. |
| bMatchSetupup              |  (True/False) Enables clan match setup. Default is False |
| KickPercent                | (1 to 100) The percentage of players that are required to place kick votes against one player before that player is kicked from the server. Default is 50. |
| bAnonymousKicking          | (True/False) If set to true then the player who imitated a kick vote will remain anonymous. It is recommended you set this to false. Default is True |
| MapListLoaderType          | This is a pointer to a code file and code class that is to be used to load the maplist with mapnames. Default is xVoting.DefaultMapListLoader (do not change this) |
| ServerNumber               | (1-11) Only change this if youa re running multiple servers from the same system folder. This will tell mapvote to use a different mapvotehistory.ini file. Default is 1 |
| CurrentGameConfig          | (0 - to number of gameconfigs) |
| GameConfig                 | See below |

## GameConfig

Is the line which states `GameConfig=(GameClass="XGame.xDeathMatch",Prefix=,Acronym=,GameName="new",Mutators=,Options=)` and is basically what gametype/map/mutators/options you allow you players to vote for. Lets see what it means:

| Setting   | Description |
| --------- | ----------- |
| GameClass | This is the name of the package and the name the game class separated by a period. Example: `XGame.xCTFGame for CTF` |
| Prefix    | The MapName Prefixes to associate with this gametype. If you want to list more than one separate each with a comma. This tells MapVote which maps to load in the maplist for this gametype. Example: CTF  |
| Acronym   | Short text acronym or abreviation that will be appended to map names in messages to help identify game type for map. Example: Acronym=DM - "JoePlayer voted for DM-MapName(DM)" |
| GameName  | This is the name or title of the game type. For example: "Capture The Flag". Note: You can make this anything you like |
| Mutators  | List of Mutators to load with this game type. If more than one separate each with a comma. Warning: If you choose to use a mutator in one gameconfig but not another you will need to specify 'none' in the gameconfig where you do not want a mutator. This is because mutators are 'sticky' |
| Options   | This is where you can set custom game rules. Example: GoalScore=20?Translocator=True |

Now we know what it is about we can now create are own GameConfig line. Here are a few exmaples

**CTF**

```
GameConfig=(GameClass="XGame.xCTFGame",Prefix="CTF",Acronym="CTF",GameName="CTF",Mutators="",Options="")
```

**DM**

```
GameConfig=(GameClass="XGame.xDeathMatch",Prefix="DM",Acronym="DM",GameName="DM",Mutators="",Options="")
```

**iCTF**

```
GameConfig=(GameClass="XGame.xCTFGame",Prefix="CTF",Acronym="CTF",GameName="CTF InstaGib",Mutators="XGame.MutInstaGib",Options="")
```

Therefore you should now have something like:

```
[xVoting.xVotingHandler]
VoteTimeLimit=70
ScoreBoardDelay=5
bAutoOpen=True
MidGameVotePercent=50
bScoreMode=False
bAccumulationMode=False
bEliminationMode=False
MinMapCount=2
MapVoteHistoryType=xVoting.MapVoteHistory_INI
RepeatLimit=4
DefaultGameConfig=0
bDefaultToCurrentGameType=True
bMapVote=True
bKickVote=True
bMatchSetup=False
KickPercent=51
bAnonymousKicking=True
MapListLoaderType=xVoting.DefaultMapListLoader
ServerNumber=1
CurrentGameConfig=0
GameConfig=(GameClass="XGame.xCTFGame",Prefix="CTF",Acronym="CTF",GameName="Capture The Flag",Mutators=,Options=)
GameConfig=(GameClass="Onslaught.ONSOnslaughtGame",Prefix="ONS",Acronym="ONS",GameName="Onslaught",Mutators=,Options=)
GameConfig=(GameClass="XGame.xDeathMatch",Prefix="DM",Acronym="DM",GameName="DeathMatch",Mutators=,Options=)
GameConfig=(GameClass="XGame.xBombingRun",Prefix="BR",Acronym="BR",GameName="Bombing Run",Mutators=,Options=)
GameConfig=(GameClass="UT2k4Assault.ASGameInfo",Prefix="AS",Acronym="AS",GameName="Assualt",Mutators=,Options=)
GameConfig=(GameClass="XGame.xDoubleDom",Prefix="DOM",Acronym="DOM",GameName="Double Domination",Mutators=,Options=)
GameConfig=(GameClass="XGame.xTeamGame",Prefix="DM",Acronym="DM",GameName="Team DeathMatch",Mutators=,Options=)

[xVoting.DefaultMapListLoader]
bUseMapList=False
MapNamePrefixes=DM,DOM,CTF,BR,AS,ONS,VCTF
```

Which will enable you to vote kick players and vote for any CTF,DM,BR,DD,ONS,TDM and AS
