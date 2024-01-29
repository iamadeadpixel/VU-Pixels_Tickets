-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestAssaultSmall1"] = "Assault #2",
	} 

-- ------------------------------------------------------------------------------
-- Assault2 Maps Vehicles disabled:
local Assault2_Disabled_LevelNameMap = {
}

-- ------------------------------------------------------------------------------
-- Assault2: US 400 / RU 300 Tickets
local Assault2_400_300_LevelNameMap = {
	["Levels/XP1_004/XP1_004"] = "Wake Island"
}

-- ------------------------------------------------------------------------------
-- Assault2: US 400 / RU 350 Tickets
local Assault2_250_200_LevelNameMap = {
	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
}

-- ------------------------------------------------------------------------------
-- Assault2: US 300 / RU 350 Tickets
local Assault2_200_220_LevelNameMap = {
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Assault2, p_GameMode_Assault2, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Assault2 = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Assault2] or p_GameMode_Assault2

-- Contains Assault2 map data
	local s_LevelName_Assault2 = ServerUtils and ServerUtils:GetCustomMapName() or Assault2_250_200_LevelNameMap[p_LevelName_Assault2] or Assault2_400_300_LevelNameMap[p_LevelName_Assault2] or Assault2_200_220_LevelNameMap[p_LevelName_Assault2] or p_LevelName_Assault2 and s_GameMode_Assault2 == "Assault #2"

-- Assault2 Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Assault2_Disabled_LevelNameMap[p_LevelName_Assault2]

-- ------------------------------------------------------------------------------

	if (Assault2_400_300_LevelNameMap[p_LevelName_Assault2] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault2_400_300"

	map_tickets_00_04 = Tickets_00_04_Assault2_400_300
	map_tickets_05_12 = Tickets_05_12_Assault2_400_300
	map_tickets_13_24 = Tickets_13_24_Assault2_400_300
	map_tickets_25_32 = Tickets_25_32_Assault2_400_300
	map_tickets_33_48 = Tickets_33_48_Assault2_400_300
	map_tickets_49_64 = Tickets_49_64_Assault2_400_300
	map_tickets_65_128 = Tickets_65_128_Assault2_400_300

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/4)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/4)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/4)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/4)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/4)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/4)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/4)

-- ------------------------------------------------------------------------------

	elseif (Assault2_250_200_LevelNameMap[p_LevelName_Assault2] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault2_250_200"

	map_tickets_00_04 = Tickets_00_04_Assault2_250_200
	map_tickets_05_12 = Tickets_05_12_Assault2_250_200
	map_tickets_13_24 = Tickets_13_24_Assault2_250_200
	map_tickets_25_32 = Tickets_25_32_Assault2_250_200
	map_tickets_33_48 = Tickets_33_48_Assault2_250_200
	map_tickets_49_64 = Tickets_49_64_Assault2_250_200
	map_tickets_65_128 = Tickets_65_128_Assault2_250_200

	GameModeCounter_00_04 = math.floor(map_tickets_00_04/2.5)
	GameModeCounter_05_12 = math.floor(map_tickets_05_12/2.5)
	GameModeCounter_13_24 = math.floor(map_tickets_13_24/2.5)
	GameModeCounter_25_32 = math.floor(map_tickets_25_32/2.5)
	GameModeCounter_33_48 = math.floor(map_tickets_33_48/2.5)
	GameModeCounter_49_64 = math.floor(map_tickets_49_64/2.5)
	GameModeCounter_65_128 = math.floor(map_tickets_65_128/2.5)

-- ------------------------------------------------------------------------------
	elseif (Assault2_200_220_LevelNameMap[p_LevelName_Assault2] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault2_200_220"


	map_tickets_00_04 = Tickets_00_04_Assault2_200_220
	map_tickets_05_12 = Tickets_05_12_Assault2_200_220
	map_tickets_13_24 = Tickets_13_24_Assault2_200_220
	map_tickets_25_32 = Tickets_25_32_Assault2_200_220
	map_tickets_33_48 = Tickets_33_48_Assault2_200_220
	map_tickets_49_64 = Tickets_49_64_Assault2_200_220
	map_tickets_65_128 = Tickets_65_128_Assault2_200_220
	
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
	if d_LevelName == s_LevelName_Assault2 and global_GameModeNameMap[p_GameMode_Assault2] == "Assault #2" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Assault2 and s_GameMode_Assault2 == "Assault #2" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	print(''..s_MapData..': - Reading map data: '..s_LevelName_Assault2..' - '..s_GameMode_Assault2..' ')
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
