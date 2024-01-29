-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestLarge0"] = "Conquest Large"
	} 

-- ------------------------------------------------------------------------------
-- CQL Maps Vehicles disabled: Infantry friendly.
local CQL_Disabled_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_003/MP_003"] = "Teheran Highway"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 400 Tickets
local CQL400_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 350 Tickets
local CQL350_LevelNameMap = {
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 300 Tickets
local CQL300_LevelNameMap = {
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_018/MP_018"] = "Kharg Island",
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline",

-- This map is a keku modded map
	["Levels/SP_Valley/SP_Valley"] = "Rock and a Hard Place"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 250 Tickets
local CQL250_LevelNameMap = {
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 200 Tickets
local CQL200_LevelNameMap = {
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_CQL, p_GameMode_CQL, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_CQL = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_CQL] or p_GameMode_CQL

-- Contains CQL400 map data
	local s_LevelName_CQL = ServerUtils and ServerUtils:GetCustomMapName() or CQL400_LevelNameMap[p_LevelName_CQL] or CQL350_LevelNameMap[p_LevelName_CQL] or CQL300_LevelNameMap[p_LevelName_CQL] or CQL250_LevelNameMap[p_LevelName_CQL] or CQL200_LevelNameMap[p_LevelName_CQL] or p_LevelName_CQL and s_GameMode_CQL == "Conquest Large"

-- CQL Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or CQL_Disabled_LevelNameMap[p_LevelName_CQL]

-- ------------------------------------------------------------------------------

	if (CQL400_LevelNameMap[p_LevelName_CQL] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL400"

	map_tickets_00_04 = Tickets_00_04_CQL400
	map_tickets_05_12 = Tickets_05_12_CQL400
	map_tickets_13_24 = Tickets_13_24_CQL400
	map_tickets_25_32 = Tickets_25_32_CQL400
	map_tickets_33_48 = Tickets_33_48_CQL400
	map_tickets_49_64 = Tickets_49_64_CQL400
	map_tickets_65_128 = Tickets_65_128_CQL400

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/4)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/4)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/4)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/4)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/4)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/4)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/4)

-- ------------------------------------------------------------------------------

 	elseif (CQL350_LevelNameMap[p_LevelName_CQL] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL350"
 
	map_tickets_00_04 = Tickets_00_04_CQL350
	map_tickets_05_12 = Tickets_05_12_CQL350
	map_tickets_13_24 = Tickets_13_24_CQL350
	map_tickets_25_32 = Tickets_25_32_CQL350
	map_tickets_33_48 = Tickets_33_48_CQL350
	map_tickets_49_64 = Tickets_49_64_CQL350
	map_tickets_65_128 = Tickets_65_128_CQL350

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/3.5)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/3.5)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/3.5)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/3.5)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/3.5)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/3.5)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/3.5)
-- ------------------------------------------------------------------------------

 	elseif (CQL300_LevelNameMap[p_LevelName_CQL] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL300"
 
	map_tickets_00_04 = Tickets_00_04_CQL300
	map_tickets_05_12 = Tickets_05_12_CQL300
	map_tickets_13_24 = Tickets_13_24_CQL300
	map_tickets_25_32 = Tickets_25_32_CQL300
	map_tickets_33_48 = Tickets_33_48_CQL300
	map_tickets_49_64 = Tickets_49_64_CQL300
	map_tickets_65_128 = Tickets_65_128_CQL300

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/3)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/3)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/3)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/3)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/3)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/3)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/3)
-- ------------------------------------------------------------------------------

 	elseif (CQL250_LevelNameMap[p_LevelName_CQL] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL250"
 

	map_tickets_00_04 = Tickets_00_04_CQL250
	map_tickets_05_12 = Tickets_05_12_CQL250
	map_tickets_13_24 = Tickets_13_24_CQL250
	map_tickets_25_32 = Tickets_25_32_CQL250
	map_tickets_33_48 = Tickets_33_48_CQL250
	map_tickets_49_64 = Tickets_49_64_CQL250
	map_tickets_65_128 = Tickets_65_128_CQL250

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/2.5)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/2.5)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/2.5)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/2.5)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/2.5)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/2.5)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/2.5)
-- ------------------------------------------------------------------------------

 	elseif (CQL200_LevelNameMap[p_LevelName_CQL] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL200"
 
	map_tickets_00_04 = Tickets_00_04_CQL200
	map_tickets_05_12 = Tickets_05_12_CQL200
	map_tickets_13_24 = Tickets_13_24_CQL200
	map_tickets_25_32 = Tickets_25_32_CQL200
	map_tickets_33_48 = Tickets_33_48_CQL200
	map_tickets_49_64 = Tickets_49_64_CQL200
	map_tickets_65_128 = Tickets_65_128_CQL200

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/2)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/2)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/2)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/2)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/2)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/2)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/2)
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
	if d_LevelName == s_LevelName_CQL  and global_GameModeNameMap[p_GameMode_CQL] == "Conquest Large" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_CQL  and s_GameMode_CQL == "Conquest Large" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	print(''..s_MapData..': - Reading map data: '..s_LevelName_CQL..' - '..s_GameMode_CQL..' ')
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
