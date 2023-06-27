-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestSmall0"] = "Conquest Small"
	} 

-- ------------------------------------------------------------------------------

-- CQS Maps Vehicles disabled:
local CQS_Disabled_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
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
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
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
	s_MapData="CQS350"

	map_tickets_00_04 = Tickets_00_04_CQS350
	map_tickets_05_12 = Tickets_05_12_CQS350
	map_tickets_13_24 = Tickets_13_24_CQS350
	map_tickets_25_32 = Tickets_25_32_CQS350
	map_tickets_33_48 = Tickets_33_48_CQS350
	map_tickets_49_64 = Tickets_49_64_CQS350
	map_tickets_65_128 = Tickets_65_128_CQS350

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/3.5)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/3.5)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/3.5)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/3.5)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/3.5)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/3.5)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/3.5)

-- ------------------------------------------------------------------------------

 	elseif (CQS300_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS300"
 
	map_tickets_00_04 = Tickets_00_04_CQS300
	map_tickets_05_12 = Tickets_05_12_CQS300
	map_tickets_13_24 = Tickets_13_24_CQS300
	map_tickets_25_32 = Tickets_25_32_CQS300
	map_tickets_33_48 = Tickets_33_48_CQS300
	map_tickets_49_64 = Tickets_49_64_CQS300
	map_tickets_65_128 = Tickets_65_128_CQS300

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/3)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/3)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/3)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/3)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/3)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/3)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/3)

-- ------------------------------------------------------------------------------

 	elseif (CQS250_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS250"
 
	map_tickets_00_04 = Tickets_00_04_CQS250
	map_tickets_05_12 = Tickets_05_12_CQS250
	map_tickets_13_24 = Tickets_13_24_CQS250
	map_tickets_25_32 = Tickets_25_32_CQS250
	map_tickets_33_48 = Tickets_33_48_CQS250
	map_tickets_49_64 = Tickets_49_64_CQS250
	map_tickets_65_128 = Tickets_65_128_CQS250

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/2.5)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/2.5)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/2.5)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/2.5)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/2.5)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/2.5)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/2.5)

-- ------------------------------------------------------------------------------

 	elseif (CQS200_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS200"
 
	map_tickets_00_04 = Tickets_00_04_CQS200
	map_tickets_05_12 = Tickets_05_12_CQS200
	map_tickets_13_24 = Tickets_13_24_CQS200
	map_tickets_25_32 = Tickets_25_32_CQS200
	map_tickets_33_48 = Tickets_33_48_CQS200
	map_tickets_49_64 = Tickets_49_64_CQS200
	map_tickets_65_128 = Tickets_65_128_CQS200

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/2)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/2)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/2)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/2)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/2)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/2)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/2)

-- ------------------------------------------------------------------------------

 	elseif (CQS150_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS150"
 
	map_tickets_00_04 = Tickets_00_04_CQS150
	map_tickets_05_12 = Tickets_05_12_CQS150
	map_tickets_13_24 = Tickets_13_24_CQS150
	map_tickets_25_32 = Tickets_25_32_CQS150
	map_tickets_33_48 = Tickets_33_48_CQS150
	map_tickets_49_64 = Tickets_49_64_CQS150
	map_tickets_65_128 = Tickets_65_128_CQS150

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/1.5)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/1.5)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/1.5)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/1.5)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/1.5)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/1.5)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/1.5)
	end

-- ------------------------------------------------------------------------------
-- What ever it is what this do.
	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

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
	
	print(''..s_MapData..': - Reading map data: '..s_LevelName_CQS..' - '..s_GameMode_CQS..' ')
	print(''..s_MapData..': - Reading map tickets: '..map_tickets_00_04..' - '..map_tickets_05_12..' - '..map_tickets_13_24..' - '..map_tickets_25_32..' - '..map_tickets_33_48..' - '..map_tickets_49_64..' - '..map_tickets_65_128..' ') 
	print(''..s_MapData..': - Reading GameMode Counter data '..GameModeCounter_00_04..'% - '..GameModeCounter_05_12..'% - '..GameModeCounter_13_24..'% - '..GameModeCounter_25_32..'% - '..GameModeCounter_33_48..'% - '..GameModeCounter_49_64..'% - '..GameModeCounter_65_128..'% ') 
	print(''..s_MapData..': - Setting server tickets and GameMode Counter ') 

-- ------------------------------------------------------------------------------

	local players = PlayerManager:GetPlayerCount()
	if players <= 4 then
	ticket_gmc = GameModeCounter_00_04
	map_tickets = map_tickets_00_04
	player_count = player_count_00_04
	goto rcon
      
	elseif players >= 5 and players <= 12 then
	ticket_gmc = GameModeCounter_05_12
	map_tickets = map_tickets_05_12
	player_count = player_count_05_12
	goto rcon
      
	elseif players >= 13 and players <= 24 then
	ticket_gmc = GameModeCounter_13_24
	map_tickets = map_tickets_13_24
	player_count = player_count_13_24
	goto rcon

	elseif players >= 25 and players <= 32 then
	ticket_gmc = GameModeCounter_25_32
	map_tickets = map_tickets_25_32
	player_count = player_count_25_32
	goto rcon

	elseif players >= 33 and players <= 48 then
	ticket_gmc = GameModeCounter_33_48
	map_tickets = map_tickets_33_48
	player_count = player_count_33_48
	goto rcon


	elseif players >= 49 and players <= 64 then
	ticket_gmc = GameModeCounter_49_64
	map_tickets = map_tickets_49_64
	player_count = player_count_49_64
	goto rcon

	elseif players >= 65 and players <= 128 then
	ticket_gmc = GameModeCounter_65_128
	map_tickets = map_tickets_65_128
	player_count = player_count_65_128
	goto rcon
end

::rcon:: 
	RCON:SendCommand('vars.gameModeCounter', { tostring(ticket_gmc) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) }) 
	print(''..s_MapData..': - Player count:'..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  

end
end)
