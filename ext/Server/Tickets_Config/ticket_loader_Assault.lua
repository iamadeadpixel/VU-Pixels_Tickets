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
-- Assault: RU 250 / US 200 Tickets
local Assault_250_200_LevelNameMap = {
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Assault, p_GameMode_Assault, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Assault = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Assault] or p_GameMode_Assault

-- Contains Assault map data
	local s_LevelName_Assault = ServerUtils and ServerUtils:GetCustomMapName() or Assault_300_250_LevelNameMap[p_LevelName_Assault] or Assault_300_220_LevelNameMap[p_LevelName_Assault] or Assault_230_200_LevelNameMap[p_LevelName_Assault] or Assault_250_200_LevelNameMap[p_LevelName_Assault] or p_LevelName_Assault and s_GameMode_Assault == "Assault"

-- Assault Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Assault_Disabled_LevelNameMap[p_LevelName_Assault]

-- ------------------------------------------------------------------------------

	if (Assault_300_250_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_Assault_300[1])
	map_tickets_05_12 = (tickets_Assault_300[2])
	map_tickets_13_24 = (tickets_Assault_300[3])
	map_tickets_25_32 = (tickets_Assault_300[4])
	map_tickets_33_48 = (tickets_Assault_300[5])
	map_tickets_49_64 = (tickets_Assault_300[6])
	map_tickets_65_128 = (tickets_Assault_300[7])

	GMC_00_04 = math.floor(map_tickets_00_04/3)
	GMC_05_12 = math.floor(map_tickets_05_12/3)
	GMC_13_24 = math.floor(map_tickets_13_24/3)
	GMC_25_32 = math.floor(map_tickets_25_32/3)
	GMC_33_48 = math.floor(map_tickets_33_48/3)
	GMC_49_64 = math.floor(map_tickets_49_64/3)
	GMC_65_128 = math.floor(map_tickets_65_128/3)

-- ------------------------------------------------------------------------------

	elseif (Assault_300_220_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_Assault_300_Wake[1])
	map_tickets_05_12 = (tickets_Assault_300_Wake[2])
	map_tickets_13_24 = (tickets_Assault_300_Wake[3])
	map_tickets_25_32 = (tickets_Assault_300_Wake[4])
	map_tickets_33_48 = (tickets_Assault_300_Wake[5])
	map_tickets_49_64 = (tickets_Assault_300_Wake[6])
	map_tickets_65_128 = (tickets_Assault_300_Wake[7])

	GMC_00_04 = math.floor(map_tickets_00_04/3)
	GMC_05_12 = math.floor(map_tickets_05_12/3)
	GMC_13_24 = math.floor(map_tickets_13_24/3)
	GMC_25_32 = math.floor(map_tickets_25_32/3)
	GMC_33_48 = math.floor(map_tickets_33_48/3)
	GMC_49_64 = math.floor(map_tickets_49_64/3)
	GMC_65_128 = math.floor(map_tickets_65_128/3)

-- ------------------------------------------------------------------------------
	elseif (Assault_230_200_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_Assault_230[1])
	map_tickets_05_12 = (tickets_Assault_230[2])
	map_tickets_13_24 = (tickets_Assault_230[3])
	map_tickets_25_32 = (tickets_Assault_230[4])
	map_tickets_33_48 = (tickets_Assault_230[5])
	map_tickets_49_64 = (tickets_Assault_230[6])
	map_tickets_65_128 = (tickets_Assault_230[7])

	GMC_00_04 = math.floor(map_tickets_00_04/2.3)
	GMC_05_12 = math.floor(map_tickets_05_12/2.3)
	GMC_13_24 = math.floor(map_tickets_13_24/2.3)
	GMC_25_32 = math.floor(map_tickets_25_32/2.3)
	GMC_33_48 = math.floor(map_tickets_33_48/2.3)
	GMC_49_64 = math.floor(map_tickets_49_64/2.3)
	GMC_65_128 = math.floor(map_tickets_65_128/2.3)

-- ------------------------------------------------------------------------------
	elseif (Assault_250_200_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	map_tickets_00_04 = (tickets_Assault_250[1])
	map_tickets_05_12 = (tickets_Assault_250[2])
	map_tickets_13_24 = (tickets_Assault_250[3])
	map_tickets_25_32 = (tickets_Assault_250[4])
	map_tickets_33_48 = (tickets_Assault_250[5])
	map_tickets_49_64 = (tickets_Assault_250[6])
	map_tickets_65_128 = (tickets_Assault_250[7])

	GMC_00_04 = math.floor(map_tickets_00_04/2.5)
	GMC_05_12 = math.floor(map_tickets_05_12/2.5)
	GMC_13_24 = math.floor(map_tickets_13_24/2.5)
	GMC_25_32 = math.floor(map_tickets_25_32/2.5)
	GMC_33_48 = math.floor(map_tickets_33_48/2.5)
	GMC_49_64 = math.floor(map_tickets_49_64/2.5)
	GMC_65_128 = math.floor(map_tickets_65_128/2.5)
	end

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
	
-- We need to cheat here xD	
	s_MapData=s_GameMode
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName..' - GameMode:'..s_GameMode..' ')
	print(''..s_MapData..': - map tickets: '..map_tickets_00_04..' - '..map_tickets_05_12..' - '..map_tickets_13_24..' - '..map_tickets_25_32..' - '..map_tickets_33_48..' - '..map_tickets_49_64..' - '..map_tickets_65_128..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC_00_04..'% - '..GMC_05_12..'% - '..GMC_13_24..'% - '..GMC_25_32..'% - '..GMC_33_48..'% - '..GMC_49_64..'% - '..GMC_65_128..'% ') 

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

	print(''..s_MapData..': - Player count:'..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  

end
end)

