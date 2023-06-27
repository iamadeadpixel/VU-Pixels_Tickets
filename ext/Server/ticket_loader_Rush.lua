-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["RushLarge0"] = "Rush",
	} 

-- ------------------------------------------------------------------------------
-- CQL Maps Vehicles disabled:
local Rush_Disabled_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
}

-- ------------------------------------------------------------------------------
-- Rush: ticket rate 100% = 75 Tickets
local Rush75_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_018/MP_018"] = "Kharg Island",

	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman",
	["Levels/XP1_004/XP1_004"] = "Wake Island",

	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",

	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market",

	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
}

-- ------------------------------------------------------------------------------
-- Rush: ticket rate 100% = 100 Tickets
local Rush100_LevelNameMap = {
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro",
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Rush, p_GameMode_Rush, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Rush = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Rush] or p_GameMode_Rush

-- Contains Rush75 map data
	local s_LevelName_Rush = ServerUtils and ServerUtils:GetCustomMapName() or Rush75_LevelNameMap[p_LevelName_Rush] or Rush100_LevelNameMap[p_LevelName_Rush] or p_LevelName_Rush and s_GameMode_Rush == "Rush"

-- Rush Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Rush_Disabled_LevelNameMap[p_LevelName_Rush]

-- ------------------------------------------------------------------------------

	if (Rush75_LevelNameMap[p_LevelName_Rush] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Rush75"

	map_tickets_00_04 = Tickets_00_04_Rush75
	map_tickets_05_12 = Tickets_05_12_Rush75
	map_tickets_13_24 = Tickets_13_24_Rush75
	map_tickets_25_32 = Tickets_25_32_Rush75
	map_tickets_33_48 = Tickets_33_48_Rush75
	map_tickets_49_64 = Tickets_49_64_Rush75
	map_tickets_65_128 = Tickets_65_128_Rush75

	GameModeCounter_00_04 = math.floor(map_tickets_00_04*1.34)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12*1.34)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24*1.34)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32*1.34)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48*1.34)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64*1.34)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128*1.34)

-- ------------------------------------------------------------------------------

 	elseif (Rush100_LevelNameMap[p_LevelName_Rush] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Rush100"
 
	map_tickets_00_04 = Tickets_00_04_Rush100
	map_tickets_05_12 = Tickets_05_12_Rush100
	map_tickets_13_24 = Tickets_13_24_Rush100
	map_tickets_25_32 = Tickets_25_32_Rush100
	map_tickets_33_48 = Tickets_33_48_Rush100
	map_tickets_49_64 = Tickets_49_64_Rush100
	map_tickets_65_128 = Tickets_65_128_Rush100

	GameModeCounter_00_04 = math.floor(map_tickets_00_04*1)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12*1)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24*1)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32*1)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48*1)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64*1)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128*1)
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
	if d_LevelName == s_LevelName_Rush  and global_GameModeNameMap[p_GameMode_Rush] == "Rush" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Rush  and s_GameMode_Rush == "Rush" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	print(''..s_MapData..': - Reading map data: '..s_LevelName_Rush..' - '..s_GameMode_Rush..' ')
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
