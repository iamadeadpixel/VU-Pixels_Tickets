-- ------------------------------------------------------------------------------
-- isue
-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestAssaultSmall0"] = "Assault"
	} 

-- ------------------------------------------------------------------------------
-- Assault Maps Vehicles disabled:
local Assault_Disabled_LevelNameMap = {
}

-- ------------------------------------------------------------------------------
-- Assault: US 300 / RU 250 Tickets
local Assault_300_250_LevelNameMap = {
	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market"
}

-- ------------------------------------------------------------------------------
-- Assault: US 300 / RU 220 Tickets
local Assault_300_220_LevelNameMap = {
	["Levels/XP1_004/XP1_004"] = "Wake Island"
}

-- ------------------------------------------------------------------------------
-- Assault: US 230 / RU 200 Tickets
local Assault_230_200_LevelNameMap = {
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman"
}

-- ------------------------------------------------------------------------------
-- Assault: US 200 / RU 250 Tickets
local Assault_200_250_LevelNameMap = {
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Assault, p_GameMode_Assault, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Assault = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Assault] or p_GameMode_Assault

-- Contains Assault map data
	local s_LevelName_Assault = ServerUtils and ServerUtils:GetCustomMapName() or Assault_300_250_LevelNameMap[p_LevelName_Assault] or Assault_300_220_LevelNameMap[p_LevelName_Assault] or Assault_230_200_LevelNameMap[p_LevelName_Assault] or Assault_200_250_LevelNameMap[p_LevelName_Assault] or p_LevelName_Assault and s_GameMode_Assault == "Assault"

-- Assault Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Assault_Disabled_LevelNameMap[p_LevelName_Assault]

-- ------------------------------------------------------------------------------

	if (Assault_300_250_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault_300_250"

	map_tickets_00_04 = Tickets_00_04_Assault_300_250
	map_tickets_05_12 = Tickets_05_12_Assault_300_250
	map_tickets_13_24 = Tickets_13_24_Assault_300_250
	map_tickets_25_32 = Tickets_25_32_Assault_300_250
	map_tickets_33_48 = Tickets_33_48_Assault_300_250
	map_tickets_49_64 = Tickets_49_64_Assault_300_250
	map_tickets_65_128 = Tickets_65_128_Assault_300_250

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/3)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/3)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/3)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/3)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/3)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/3)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/3)

-- ------------------------------------------------------------------------------

	elseif (Assault_300_220_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault_300_220"

	map__tickets_00_04 = Tickets_00_04_Assault_300_220
	map_tickets_05_12 = Tickets_05_12_Assault_300_220
	map_tickets_13_24 = Tickets_13_24_Assault_300_220
	map_tickets_25_32 = Tickets_25_32_Assault_300_220
	map_tickets_33_48 = Tickets_33_48_Assault_300_220
	map_tickets_49_64 = Tickets_49_64_Assault_300_220
	map_tickets_65_128 = Tickets_65_128_Assault_300_220

	GameModeCounter_00_04 = math.floor(map__tickets_00_04/3)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/3)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/3)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/3)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/3)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/3)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/3)

-- ------------------------------------------------------------------------------
	elseif (Assault_230_200_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault_230_200"

	map_tickets_00_04 = Tickets_00_04_Assault_230_200
	map_tickets_05_12 = Tickets_05_12_Assault_230_200
	map_tickets_13_24 = Tickets_13_24_Assault_230_200
	map_tickets_25_32 = Tickets_25_32_Assault_230_200
	map_tickets_33_48 = Tickets_33_48_Assault_230_200
	map_tickets_49_64 = Tickets_49_64_Assault_230_200
	map_tickets_65_128 = Tickets_65_128_Assault_230_200

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/2.3)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/2.3)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/2.3)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/2.3)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/2.3)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/2.3)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/2.3)

-- ------------------------------------------------------------------------------
	elseif (Assault_200_250_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault_200_250"

	map_tickets_00_04 = Tickets_00_04_Assault_200_250
	map_tickets_05_12 = Tickets_05_12_Assault_200_250
	map_tickets_13_24 = Tickets_13_24_Assault_200_250
	map_tickets_25_32 = Tickets_25_32_Assault_200_250
	map_tickets_33_48 = Tickets_33_48_Assault_200_250
	map_tickets_49_64 = Tickets_49_64_Assault_200_250
	map_tickets_65_128 = Tickets_65_128_Assault_200_250

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
	if d_LevelName == s_LevelName_Assault  and global_GameModeNameMap[p_GameMode_Assault] == "Assault" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Assault  and s_GameMode_Assault == "Assault" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	print(''..s_MapData..': - Reading map data: '..s_LevelName_Assault..' - '..s_GameMode_Assault..' ')
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
