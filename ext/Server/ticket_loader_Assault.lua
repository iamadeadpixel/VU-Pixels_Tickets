-- ------------------------------------------------------------------------------

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
local Assault300_250_LevelNameMap = {
	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market"
}

-- ------------------------------------------------------------------------------
-- Assault: US 300 / RU 220 Tickets
local Assault300_220_LevelNameMap = {
	["Levels/XP1_004/XP1_004"] = "Wake Island"
}

-- ------------------------------------------------------------------------------
-- Assault: US 230 / RU 200 Tickets
local Assault230_200_LevelNameMap = {
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman"
}

-- ------------------------------------------------------------------------------
-- Assault: US 200 / RU 250 Tickets
local Assault200_250_LevelNameMap = {
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Assault, p_GameMode_Assault, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Assault = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Assault] or p_GameMode_Assault

-- Contains Assault map data
	local s_LevelName_Assault = ServerUtils and ServerUtils:GetCustomMapName() or Assault300_250_LevelNameMap[p_LevelName_Assault] or Assault300_220_LevelNameMap[p_LevelName_Assault]	or Assault230_200_LevelNameMap[p_LevelName_Assault] or Assault200_250_LevelNameMap[p_LevelName_Assault]	or p_LevelName_Assault and s_GameMode_Assault == "Assault"

-- Assault Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Assault_Disabled_LevelNameMap[p_LevelName_Assault]

-- ------------------------------------------------------------------------------

	if (Assault300_250_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault300_250"

	map_tickets_00_04_Assault300_250 = var_00_04_Assault300_250
	map_tickets_05_12_Assault300_250 = var_05_12_Assault300_250
	map_tickets_13_24_Assault300_250 = var_13_24_Assault300_250
	map_tickets_25_32_Assault300_250 = var_25_32_Assault300_250
	map_tickets_33_48_Assault300_250 = var_33_48_Assault300_250
	map_tickets_49_64_Assault300_250 = var_49_64_Assault300_250
	map_tickets_65_128_Assault300_250 = var_65_128_Assault300_250

	map_tickets_00_04 = map_tickets_00_04_Assault300_250
	map_tickets_05_12 = map_tickets_05_12_Assault300_250
	map_tickets_13_24 = map_tickets_13_24_Assault300_250
	map_tickets_25_32 = map_tickets_25_32_Assault300_250
	map_tickets_33_48 = map_tickets_33_48_Assault300_250
	map_tickets_49_64 = map_tickets_49_64_Assault300_250
	map_tickets_65_128 = map_tickets_65_128_Assault300_250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault300_250/3)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_Assault300_250/3)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_Assault300_250/3)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_Assault300_250/3)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_Assault300_250/3)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_Assault300_250/3)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_Assault300_250/3)

-- ------------------------------------------------------------------------------

	elseif (Assault300_220_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault300_220"

	map_tickets_00_04_Assault300_220 = var_00_04_Assault300_220
	map_tickets_05_12_Assault300_220 = var_05_12_Assault300_220
	map_tickets_13_24_Assault300_220 = var_13_24_Assault300_220
	map_tickets_25_32_Assault300_220 = var_25_32_Assault300_220
	map_tickets_33_48_Assault300_220 = var_33_48_Assault300_220
	map_tickets_49_64_Assault300_220 = var_49_64_Assault300_220
	map_tickets_65_128_Assault300_220 = var_65_128_Assault300_220

	map_tickets_00_04 = map_tickets_00_04_Assault300_220
	map_tickets_05_12 = map_tickets_05_12_Assault300_220
	map_tickets_13_24 = map_tickets_13_24_Assault300_220
	map_tickets_25_32 = map_tickets_25_32_Assault300_220
	map_tickets_33_48 = map_tickets_33_48_Assault300_220
	map_tickets_49_64 = map_tickets_49_64_Assault300_220
	map_tickets_65_128 = map_tickets_65_128_Assault300_220

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault300_220/3)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_Assault300_220/3)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_Assault300_220/3)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_Assault300_220/3)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_Assault300_220/3)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_Assault300_220/3)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_Assault300_220/3)

-- ------------------------------------------------------------------------------
	elseif (Assault230_200_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault230_200"

	map_tickets_00_04_Assault230_200 = var_00_04_Assault230_200
	map_tickets_05_12_Assault230_200 = var_05_12_Assault230_200
	map_tickets_13_24_Assault230_200 = var_13_24_Assault230_200
	map_tickets_25_32_Assault230_200 = var_25_32_Assault230_200
	map_tickets_33_48_Assault230_200 = var_33_48_Assault230_200
	map_tickets_49_64_Assault230_200 = var_49_64_Assault230_200
	map_tickets_65_128_Assault230_200 = var_65_128_Assault230_200

	map_tickets_00_04 = map_tickets_00_04_Assault230_200
	map_tickets_05_12 = map_tickets_05_12_Assault230_200
	map_tickets_13_24 = map_tickets_13_24_Assault230_200
	map_tickets_25_32 = map_tickets_25_32_Assault230_200
	map_tickets_33_48 = map_tickets_33_48_Assault230_200
	map_tickets_49_64 = map_tickets_49_64_Assault230_200
	map_tickets_65_128 = map_tickets_65_128_Assault230_200

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault230_200/2.3)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_Assault230_200/2.3)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_Assault230_200/2.3)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_Assault230_200/2.3)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_Assault230_200/2.3)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_Assault230_200/2.3)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_Assault230_200/2.3)

-- ------------------------------------------------------------------------------
	elseif (Assault200_250_LevelNameMap[p_LevelName_Assault] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault200_250"

	map_tickets_00_04_Assault200_250 = var_00_04_Assault200_250
	map_tickets_05_12_Assault200_250 = var_05_12_Assault200_250
	map_tickets_13_24_Assault200_250 = var_13_24_Assault200_250
	map_tickets_25_32_Assault200_250 = var_25_32_Assault200_250
	map_tickets_33_48_Assault200_250 = var_33_48_Assault200_250
	map_tickets_49_64_Assault200_250 = var_49_64_Assault200_250
	map_tickets_65_128_Assault200_250 = var_65_128_Assault200_250

	map_tickets_00_04 = map_tickets_00_04_Assault200_250
	map_tickets_05_12 = map_tickets_05_12_Assault200_250
	map_tickets_13_24 = map_tickets_13_24_Assault200_250
	map_tickets_25_32 = map_tickets_25_32_Assault200_250
	map_tickets_33_48 = map_tickets_33_48_Assault200_250
	map_tickets_49_64 = map_tickets_49_64_Assault200_250
	map_tickets_65_128 = map_tickets_65_128_Assault200_250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault200_250/2)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_Assault200_250/2)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_Assault200_250/2)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_Assault200_250/2)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_Assault200_250/2)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_Assault200_250/2)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_Assault200_250/2)
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

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_Assault..') - Mapname: ('..s_LevelName_Assault..') ') 
	print(''..s_MapData..': - Setting map tickets: '..map_tickets_00_04..' - '..map_tickets_05_12..' - '..map_tickets_13_24..' - '..map_tickets_25_32..' - '..map_tickets_33_48..' - '..map_tickets_49_64..' - '..map_tickets_65_128..' ') 
	print(''..s_MapData..': - GameMode Counter data '..s_ticket_gmc_00_04..'% - '..s_ticket_gmc_05_12..'% - '..s_ticket_gmc_13_24..'% - '..s_ticket_gmc_25_32..'% - '..s_ticket_gmc_33_48..'% - '..s_ticket_gmc_49_64..'% - '..s_ticket_gmc_65_128..'% ') 
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ') 
	print(''..s_MapData..': - Setting server tickets and GameMode Counter') 

-- ------------------------------------------------------------------------------

	local players = PlayerManager:GetPlayerCount()
	if players <= 4 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_00_04) }) 
	RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_00_04..' - GameMode Counter '..s_ticket_gmc_00_04..'%')
	print(''..s_MapData..': - All presets loaded')  
       
	elseif players >= 5 and players <= 12 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_05_12) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_05_12..' - GameMode Counter '..s_ticket_gmc_05_12..'%')
	print(''..s_MapData..': - All presets loaded')  
      
	elseif players >= 13 and players <= 24 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_13_24) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_13_24..' - GameMode Counter '..s_ticket_gmc_13_24..'%')
	print(''..s_MapData..': - All presets loaded')  
--
	elseif players >= 25 and players <= 32 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_25_32) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_25_32..' - GameMode Counter '..s_ticket_gmc_25_32..'%')
	print(''..s_MapData..': - All presets loaded')  

	elseif players >= 33 and players <= 48 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_33_48) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_33_48..' - GameMode Counter '..s_ticket_gmc_33_48..'%')
	print(''..s_MapData..': - All presets loaded')  

	elseif players >= 49 and players <= 64 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_49_64) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_49_64..' - GameMode Counter '..s_ticket_gmc_49_64..'%')
	print(''..s_MapData..': - All presets loaded')  

	elseif players >= 65 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_65_128) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_65_128..' - GameMode Counter '..s_ticket_gmc_65_128..'%')
	print(''..s_MapData..': - All presets loaded')  




end
end
end)
