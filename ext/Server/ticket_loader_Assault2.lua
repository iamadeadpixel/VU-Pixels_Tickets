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
-- 3 maps Assault2
-- XP1_004     Wake Island		- Assault: US 400 / RU 300 Tickets
-- XP1_001     Strike at Karkand	- Assault: US 250 / RU 300 Tickets ? US 250 - RU 200
-- XP1_003     Sharqi Peninsula		- Assault: US 200 / RU 220 Tickets

-- Assault75: ticket rate 100% = 75 Tickets - divider = *1.34
-- Assault100: ticket rate 100% = 100 Tickets - divider = 1

-- ------------------------------------------------------------------------------

	if (Assault2_400_300_LevelNameMap[p_LevelName_Assault2] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault2_400_300 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault2_400_300"

	map_tickets_00_04_Assault2_400_300 = var_00_04_Assault2_400_300
	map_tickets_05_10_Assault2_400_300 = var_05_10_Assault2_400_300
	map_tickets_11_20_Assault2_400_300 = var_11_20_Assault2_400_300

	map_tickets_00_04 = map_tickets_00_04_Assault2_400_300
	map_tickets_05_10 = map_tickets_05_10_Assault2_400_300
	map_tickets_11_20 = map_tickets_11_20_Assault2_400_300

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault2_400_300/4) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault2_400_300/4) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault2_400_300/4) -- The value get some math magic

-- ------------------------------------------------------------------------------

	elseif (Assault2_250_200_LevelNameMap[p_LevelName_Assault2] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault2_250_200 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault2_250_200"

	map_tickets_00_04_Assault2_250_200 = var_00_04_Assault2_250_200
	map_tickets_05_10_Assault2_250_200 = var_05_10_Assault2_250_200
	map_tickets_11_20_Assault2_250_200 = var_11_20_Assault2_250_200

	map_tickets_00_04 = map_tickets_00_04_Assault2_250_200
	map_tickets_05_10 = map_tickets_05_10_Assault2_250_200
	map_tickets_11_20 = map_tickets_11_20_Assault2_250_200

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault2_250_200/2.5) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault2_250_200/2.5) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault2_250_200/2.5) -- The value get some math magic

-- ------------------------------------------------------------------------------
	elseif (Assault2_200_220_LevelNameMap[p_LevelName_Assault2] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault2_200_220 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault2_200_220"

	map_tickets_00_04_Assault2_200_220 = var_00_04_Assault2_200_220
	map_tickets_05_10_Assault2_200_220 = var_05_10_Assault2_200_220
	map_tickets_11_20_Assault2_200_220 = var_11_20_Assault2_200_220

	map_tickets_00_04 = map_tickets_00_04_Assault2_200_220
	map_tickets_05_10 = map_tickets_05_10_Assault2_200_220
	map_tickets_11_20 = map_tickets_11_20_Assault2_200_220

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault2_200_220/2) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault2_200_220/2) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault2_200_220/2) -- The value get some math magic
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

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_Assault2..') - Mapname: ('..s_LevelName_Assault2..') ') 
	print(''..s_MapData..': - Setting map tickets: '..map_tickets_00_04..' - '..map_tickets_05_10..' - '..map_tickets_11_20..'') 
	print(''..s_MapData..': - GameMode Counter data '..s_ticket_gmc_00_04..'% - '..s_ticket_gmc_05_10..'% - '..s_ticket_gmc_11_20..'%') 
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ') 
	print(''..s_MapData..': - Setting server tickets and GameMode Counter') 

-- ------------------------------------------------------------------------------

    local players = PlayerManager:GetPlayerCount()
    if players <= 4 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_00_04) }) 
	RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_00_04..' - GameMode Counter '..s_ticket_gmc_00_04..'%')
	print(''..s_MapData..': - All presets loaded')  
       
    elseif players >= 5 and players <= 10 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_05_10) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_05_10..' - GameMode Counter '..s_ticket_gmc_05_10..'%')
	print(''..s_MapData..': - All presets loaded')  
      
    elseif players >= 11 and players <= 20 then

	RCON:SendCommand('vars.gameModeCounter', { tostring(s_ticket_gmc_11_20) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) })
	print(''..s_MapData..': - tickets set to '..map_tickets_11_20..' - GameMode Counter '..s_ticket_gmc_11_20..'%')
	print(''..s_MapData..': - All presets loaded')  
	end

end
end)

