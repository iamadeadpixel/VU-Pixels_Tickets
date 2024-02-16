# Based on a ticket mod from IllustrisJack
## VU-Pixels_Tickets

# V4.0.0 - 16-02-2024
- Complete rewrite of the mod, it had some nasty isues with disabled vehicles stuff
- code clean up.
- combined all TDM modes in a single file
- Combined Rush and squad rush in a single file
- Added a modded "infinate vehicle mod", that only kicks in on Keku's Heli Superiority.
-
- Fix on some map ticket loaders
- Added the option to turn off the console spam messages also, see config.lua for that
- option to turn off the chatmessages, Console spam and the check for updates, use a true/false statement in the config.lua
- Added chatmessages that spams gamemode,levelname and ticket count (on spawn onetime only)
- Rebuild for the latest Keku all game mode and map mod

- This version has 7 playercount check.
-  0 to 4 players
-  5 to 12 players
-  13 to 24 players
-  25 to 32 players
-  33 to 48 players
-  49 to 64 players
-  65 to 128 players

- Edit Tickets_config.lua if you want your own ticket ratio settings
- the following loaders have the option to enable or disable vehicles
- to make it more "infantry frienly"
- On some maps there are on default no vehicles, or limited only !
- Squad Rush on server default has NO vehicles
- Loader_CQL.lua
- Loader_CQS.lua
- Loader_CTF.lua
- Loader_Rush.lua

- Loader_TDM.lua on default has vehicles disabled, INC Squad deathmatch

# Disclaimer
- 1: Do not run any mod or procon plugin that also can change tickers/flags
- 2: Do not manualy adjust the ticket/flag ratio, this mod wil overwrite it anyways.
- 3: Break it, mod it, tweak it.
- 4: Yes the code terrible, but i was already a pro spaghetti coder before you even was born
