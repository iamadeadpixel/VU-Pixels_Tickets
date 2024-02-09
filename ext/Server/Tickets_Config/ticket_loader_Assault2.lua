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


	map_tickets_00_04 = (tickets_Assault2_400[1])
	map_tickets_05_12 = (tickets_Assault2_400[2])
	map_tickets_13_24 = (tickets_Assault2_400[3])
	map_tickets_25_32 = (tickets_Assault2_400[4])
	map_tickets_33_48 = (tickets_Assault2_400[5])
	map_tickets_49_64 = (tickets_Assault2_400[6])
	map_tickets_65_128 = (tickets_Assault2_400[7])

	GMC_00_04 = math.floor(map_tickets_00_04/4)
	GMC_05_12 = math.floor(map_tickets_05_12/4)
	GMC_13_24 = math.floor(map_tickets_13_24/4)
	GMC_25_32 = math.floor(map_tickets_25_32/4)
	GMC_33_48 = math.floor(map_tickets_33_48/4)
	GMC_49_64 = math.floor(map_tickets_49_64/4)
	GMC_65_128 = math.floor(map_tickets_65_128/4)

-- ------------------------------------------------------------------------------

	elseif (Assault2_250_200_LevelNameMap[p_LevelName_Assault2] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"


	map_tickets_00_04 = (tickets_Assault2_250[1])
	map_tickets_05_12 = (tickets_Assault2_250[2])
	map_tickets_13_24 = (tickets_Assault2_250[3])
	map_tickets_25_32 = (tickets_Assault2_250[4])
	map_tickets_33_48 = (tickets_Assault2_250[5])
	map_tickets_49_64 = (tickets_Assault2_250[6])
	map_tickets_65_128 = (tickets_Assault2_250[7])

	GMC_00_04 = math.floor(map_tickets_00_04/2.5)
	GMC_05_12 = math.floor(map_tickets_05_12/2.5)
	GMC_13_24 = math.floor(map_tickets_13_24/2.5)
	GMC_25_32 = math.floor(map_tickets_25_32/2.5)
	GMC_33_48 = math.floor(map_tickets_33_48/2.5)
	GMC_49_64 = math.floor(map_tickets_49_64/2.5)
	GMC_65_128 = math.floor(map_tickets_65_128/2.5)

-- ------------------------------------------------------------------------------
	elseif (Assault2_200_220_LevelNameMap[p_LevelName_Assault2] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"


	map_tickets_00_04 = (tickets_Assault2_220[1])
	map_tickets_05_12 = (tickets_Assault2_220[2])
	map_tickets_13_24 = (tickets_Assault2_220[3])
	map_tickets_25_32 = (tickets_Assault2_220[4])
	map_tickets_33_48 = (tickets_Assault2_220[5])
	map_tickets_49_64 = (tickets_Assault2_220[6])
	map_tickets_65_128 = (tickets_Assault2_220[7])
	
	GMC_00_04 = math.floor(map_tickets_00_04/2.2)
	GMC_05_12 = math.floor(map_tickets_05_12/2.2)
	GMC_13_24 = math.floor(map_tickets_13_24/2.2)
	GMC_25_32 = math.floor(map_tickets_25_32/2.2)
	GMC_33_48 = math.floor(map_tickets_33_48/2.2)
	GMC_49_64 = math.floor(map_tickets_49_64/2.2)
	GMC_65_128 = math.floor(map_tickets_65_128/2.2)
	end

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

