-- ------------------------------------------------------------------------------
-- 4 maps Assault64
-- XP1_001     Strike at Karkand	- Assault64: US 400 / RU 350 Tickets
-- XP4_Rubble  Talah Market		- Assault64: US 400 / RU 350 Tickets

-- XP1_004     Wake Island		- Assault64: US 400 / RU 300 Tickets

-- XP1_003     Sharqi Peninsula		- Assault64: US 300 / RU 350 Tickets

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestAssaultLarge0"] = "Assault64"
	} 

-- ------------------------------------------------------------------------------
-- Assault64 Maps Vehicles disabled:
local Assault64_Disabled_LevelNameMap = {
}

-- ------------------------------------------------------------------------------
-- Assault64: US 400 / RU 350 Tickets
local Assault64_400_350_LevelNameMap = {
	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market"
}

-- ------------------------------------------------------------------------------
-- Assault64: US 400 / RU 300 Tickets
local Assault64_400_300_LevelNameMap = {
	["Levels/XP1_004/XP1_004"] = "Wake Island"
}

-- ------------------------------------------------------------------------------
-- Assault64: US 300 / RU 350 Tickets
local Assault64_300_350_LevelNameMap = {
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Assault64, p_GameMode_Assault64, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Assault64 = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Assault64] or p_GameMode_Assault64

-- Contains Assault64 map data
	local s_LevelName_Assault64 = ServerUtils and ServerUtils:GetCustomMapName() or Assault64_400_350_LevelNameMap[p_LevelName_Assault64] or Assault64_400_300_LevelNameMap[p_LevelName_Assault64] or Assault64_300_350_LevelNameMap[p_LevelName_Assault64] or p_LevelName_Assault64 and s_GameMode_Assault64 == "Assault64"

-- Assault64 Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Assault64_Disabled_LevelNameMap[p_LevelName_Assault64]

-- ------------------------------------------------------------------------------
-- 4 maps Assault64
-- XP1_001     Strike at Karkand	- Assault64: US 400 / RU 350 Tickets
-- XP4_Rubble  Talah Market		- Assault64: US 400 / RU 350 Tickets
-- XP1_004     Wake Island		- Assault64: US 400 / RU 300 Tickets
-- XP1_003     Sharqi Peninsula		- Assault64: US 300 / RU 350 Tickets

-- Assault75: ticket rate 100% = 75 Tickets - divider = *1.34
-- Assault100: ticket rate 100% = 100 Tickets - divider = 1

-- ------------------------------------------------------------------------------

	if (Assault64_400_350_LevelNameMap[p_LevelName_Assault64] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault64_400_350 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault64_400_350"

	map_tickets_00_04_Assault64_400_350 = var_00_04_Assault64_400_350
	map_tickets_05_10_Assault64_400_350 = var_05_10_Assault64_400_350
	map_tickets_11_20_Assault64_400_350 = var_11_20_Assault64_400_350

	map_tickets_00_04 = map_tickets_00_04_Assault64_400_350
	map_tickets_05_10 = map_tickets_05_10_Assault64_400_350
	map_tickets_11_20 = map_tickets_11_20_Assault64_400_350

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault64_400_350/4) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault64_400_350/4) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault64_400_350/4) -- The value get some math magic

-- ------------------------------------------------------------------------------

	elseif (Assault64_400_300_LevelNameMap[p_LevelName_Assault64] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault64_400_300 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault64_400_300"

	map_tickets_00_04_Assault64_400_300 = var_00_04_Assault64_400_300
	map_tickets_05_10_Assault64_400_300 = var_05_10_Assault64_400_300
	map_tickets_11_20_Assault64_400_300 = var_11_20_Assault64_400_300

	map_tickets_00_04 = map_tickets_00_04_Assault64_400_300
	map_tickets_05_10 = map_tickets_05_10_Assault64_400_300
	map_tickets_11_20 = map_tickets_11_20_Assault64_400_300

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault64_400_300/4) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault64_400_300/4) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault64_400_300/4) -- The value get some math magic

-- ------------------------------------------------------------------------------
	elseif (Assault64_300_350_LevelNameMap[p_LevelName_Assault64] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault64_300_350 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault64_300_350"

	map_tickets_00_04_Assault64_300_350 = var_00_04_Assault64_300_350
	map_tickets_05_10_Assault64_300_350 = var_05_10_Assault64_300_350
	map_tickets_11_20_Assault64_300_350 = var_11_20_Assault64_300_350

	map_tickets_00_04 = map_tickets_00_04_Assault64_300_350
	map_tickets_05_10 = map_tickets_05_10_Assault64_300_350
	map_tickets_11_20 = map_tickets_11_20_Assault64_300_350

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault64_300_350/3) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault64_300_350/3) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault64_300_350/3) -- The value get some math magic
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
	if d_LevelName == s_LevelName_Assault64 and global_GameModeNameMap[p_GameMode_Assault64] == "Assault64" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Assault64 and s_GameMode_Assault64 == "Assault64" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_Assault64..') - Mapname: ('..s_LevelName_Assault64..') ') 
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

