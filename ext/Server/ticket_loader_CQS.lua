-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" then
		local syncedBFSettings = ResourceManager:GetSettings("SyncedBFSettings")
		if syncedBFSettings ~= nil then
			syncedBFSettings = SyncedBFSettings(syncedBFSettings)
			syncedBFSettings.teamSwitchingAllowed = false
		end
	end
end)

-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestSmall0"] = "Conquest Small"
	} 

-- ------------------------------------------------------------------------------

-- CQS Maps Vehicles disabled:
local CQS_Disabled_LevelNameMap = {
}

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 350 Tickets
local CQS350_LevelNameMap = { 
["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 300 Tickets
local CQS300_LevelNameMap = {
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 250 Tickets
local CQS250_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 200 Tickets
local CQS200_LevelNameMap = {
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_018/MP_018"] = "Kharg Island",
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline",

-- This map is a keku modded map
	["Levels/COOP_006/COOP_006"] = "Aygan Village"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 150 Tickets
local CQS150_LevelNameMap = {
	["Levels/MP_007/MP_007"] = "Caspian Border"
} 

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_CQS, p_GameMode_CQS, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_CQS = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_CQS] or p_GameMode_CQS

-- Contains Conquest Small map data
	local s_LevelName_CQS = ServerUtils and ServerUtils:GetCustomMapName() or CQS150_LevelNameMap[p_LevelName_CQS] or CQS200_LevelNameMap[p_LevelName_CQS] or CQS250_LevelNameMap[p_LevelName_CQS] or CQS300_LevelNameMap[p_LevelName_CQS] or CQS350_LevelNameMap[p_LevelName_CQS] or p_LevelName_CQS and s_GameMode_CQS == "Conquest Small"

-- CQS Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or CQS_Disabled_LevelNameMap[p_LevelName_CQS]

-- ------------------------------------------------------------------------------

 	if (CQS350_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_CQS350[1])
	map_tickets_05_12 = (tickets_CQS350[2])
	map_tickets_13_24 = (tickets_CQS350[3])
	map_tickets_25_32 = (tickets_CQS350[4])
	map_tickets_33_48 = (tickets_CQS350[5])
	map_tickets_49_64 = (tickets_CQS350[6])
	map_tickets_65_128 = (tickets_CQS350[7])

	GMC_00_04 = math.floor(map_tickets_00_04/3.5)
	GMC_05_12 = math.floor(map_tickets_05_12/3.5)
	GMC_13_24 = math.floor(map_tickets_13_24/3.5)
	GMC_25_32 = math.floor(map_tickets_25_32/3.5)
	GMC_33_48 = math.floor(map_tickets_33_48/3.5)
	GMC_49_64 = math.floor(map_tickets_49_64/3.5)
	GMC_65_128 = math.floor(map_tickets_65_128/3.5)

-- ------------------------------------------------------------------------------

 	elseif (CQS300_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_CQS300[1])
	map_tickets_05_12 = (tickets_CQS300[2])
	map_tickets_13_24 = (tickets_CQS300[3])
	map_tickets_25_32 = (tickets_CQS300[4])
	map_tickets_33_48 = (tickets_CQS300[5])
	map_tickets_49_64 = (tickets_CQS300[6])
	map_tickets_65_128 = (tickets_CQS300[7])

	GMC_00_04 = math.floor(map_tickets_00_04/3)
	GMC_05_12 = math.floor(map_tickets_05_12/3)
	GMC_13_24 = math.floor(map_tickets_13_24/3)
	GMC_25_32 = math.floor(map_tickets_25_32/3)
	GMC_33_48 = math.floor(map_tickets_33_48/3)
	GMC_49_64 = math.floor(map_tickets_49_64/3)
	GMC_65_128 = math.floor(map_tickets_65_128/3)

-- ------------------------------------------------------------------------------

 	elseif (CQS250_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_CQS250[1])
	map_tickets_05_12 = (tickets_CQS250[2])
	map_tickets_13_24 = (tickets_CQS250[3])
	map_tickets_25_32 = (tickets_CQS250[4])
	map_tickets_33_48 = (tickets_CQS250[5])
	map_tickets_49_64 = (tickets_CQS250[6])
	map_tickets_65_128 = (tickets_CQS250[7])

	GMC_00_04 = math.floor(map_tickets_00_04/2.5)
	GMC_05_12 = math.floor(map_tickets_05_12/2.5)
	GMC_13_24 = math.floor(map_tickets_13_24/2.5)
	GMC_25_32 = math.floor(map_tickets_25_32/2.5)
	GMC_33_48 = math.floor(map_tickets_33_48/2.5)
	GMC_49_64 = math.floor(map_tickets_49_64/2.5)
	GMC_65_128 = math.floor(map_tickets_65_128/2.5)

-- ------------------------------------------------------------------------------

 	elseif (CQS200_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_CQS200[1])
	map_tickets_05_12 = (tickets_CQS200[2])
	map_tickets_13_24 = (tickets_CQS200[3])
	map_tickets_25_32 = (tickets_CQS200[4])
	map_tickets_33_48 = (tickets_CQS200[5])
	map_tickets_49_64 = (tickets_CQS200[6])
	map_tickets_65_128 = (tickets_CQS200[7])

	GMC_00_04 = math.floor(map_tickets_00_04/2)
	GMC_05_12 = math.floor(map_tickets_05_12/2)
	GMC_13_24 = math.floor(map_tickets_13_24/2)
	GMC_25_32 = math.floor(map_tickets_25_32/2)
	GMC_33_48 = math.floor(map_tickets_33_48/2)
	GMC_49_64 = math.floor(map_tickets_49_64/2)
	GMC_65_128 = math.floor(map_tickets_65_128/2)

-- ------------------------------------------------------------------------------

 	elseif (CQS150_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_CQS150[1])
	map_tickets_05_12 = (tickets_CQS150[2])
	map_tickets_13_24 = (tickets_CQS150[3])
	map_tickets_25_32 = (tickets_CQS150[4])
	map_tickets_33_48 = (tickets_CQS150[5])
	map_tickets_49_64 = (tickets_CQS150[6])
	map_tickets_65_128 = (tickets_CQS150[7])

	GMC_00_04 = math.floor(map_tickets_00_04/1.5)
	GMC_05_12 = math.floor(map_tickets_05_12/1.5)
	GMC_13_24 = math.floor(map_tickets_13_24/1.5)
	GMC_25_32 = math.floor(map_tickets_25_32/1.5)
	GMC_33_48 = math.floor(map_tickets_33_48/1.5)
	GMC_49_64 = math.floor(map_tickets_49_64/1.5)
	GMC_65_128 = math.floor(map_tickets_65_128/1.5)
	end

-- ------------------------------------------------------------------------------

-- Experimental: Setting vehicles on or off on specific map, any other map should be enabled
	if d_LevelName == s_LevelName_CQS  and global_GameModeNameMap[p_GameMode_CQS] == "Conquest Small" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_CQS  and s_GameMode_CQS == "Conquest Small" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
-- We need to cheat here xD	
	s_MapData=s_GameMode

-- ------------------------------------------------------------------------------

	 local players = PlayerManager:GetPlayerCount()
	if players <= 4 then
	ticket_gmc = GMC_00_04
	map_tickets = map_tickets_00_04
	player_count = (player_counter[1])
	goto rcon
      
	elseif players >= 5 and players <= 12 then
	ticket_gmc = GMC_05_12
	map_tickets = map_tickets_05_12
	player_count = (player_counter[2])
	goto rcon
      
	elseif players >= 13 and players <= 24 then
	ticket_gmc = GMC_13_24
	map_tickets = map_tickets_13_24
	player_count = (player_counter[3])
	goto rcon

	elseif players >= 25 and players <= 32 then
	ticket_gmc = GMC_25_32
	map_tickets = map_tickets_25_32
	player_count = (player_counter[4])
	goto rcon

	elseif players >= 33 and players <= 48 then
	ticket_gmc = GMC_33_48
	map_tickets = map_tickets_33_48
	player_count = (player_counter[5])
	goto rcon

	elseif players >= 49 and players <= 64 then
	ticket_gmc = GMC_49_64
	map_tickets = map_tickets_49_64
	player_count = (player_counter[6])
	goto rcon

	elseif players >= 65 and players <= 128 then
	ticket_gmc = GMC_65_128
	map_tickets = map_tickets_65_128
	player_count = (player_counter[7])
	goto rcon
end

::rcon:: 
	RCON:SendCommand('vars.gameModeCounter', { tostring(ticket_gmc) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) }) 

	if Config.consolespam then 
    print("****************** Console spammer ****************"); 
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName..' - GameMode:'..s_GameMode..' ')
	print(''..s_MapData..': - map tickets: '..map_tickets_00_04..' - '..map_tickets_05_12..' - '..map_tickets_13_24..' - '..map_tickets_25_32..' - '..map_tickets_33_48..' - '..map_tickets_49_64..' - '..map_tickets_65_128..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC_00_04..'% - '..GMC_05_12..'% - '..GMC_13_24..'% - '..GMC_25_32..'% - '..GMC_33_48..'% - '..GMC_49_64..'% - '..GMC_65_128..'% ') 

	print(''..s_MapData..': - Player count:'..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  
end

end
end)


