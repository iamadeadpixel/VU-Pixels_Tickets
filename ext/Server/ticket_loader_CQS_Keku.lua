-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestSmall0"] = "Conquest Small"
	} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 350 Tickets
local Keku_CQS350_LevelNameMap = {
-- Keku's map mod stuff 
	["Levels/COOP_006/COOP_006"] = "Fire from the Sky"
} 

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Keku_CQS, p_GameMode_Keku_CQS, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Keku_CQS = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Keku_CQS] or p_GameMode_Keku_CQS

-- Contains Conquest Small map data
	local s_LevelName_Keku_CQS = ServerUtils and ServerUtils:GetCustomMapName() or Keku_CQS350_LevelNameMap[p_LevelName_Keku_CQS] or p_LevelName_Keku_CQS and s_GameMode_Keku_CQS == "Conquest Small"

-- ------------------------------------------------------------------------------

 	if (Keku_CQS350_LevelNameMap[p_LevelName_Keku_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Keku_CQS350"

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
	end

-- ------------------------------------------------------------------------------
-- What ever it is what this do.
	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Keku_CQS  and s_GameMode_Keku_CQS == "Conquest Small" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	print(''..s_MapData..': - Reading map data: '..s_LevelName_Keku_CQS..' - '..s_GameMode_Keku_CQS..' ')
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
