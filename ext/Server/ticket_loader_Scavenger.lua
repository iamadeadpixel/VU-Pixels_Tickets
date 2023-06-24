-- ------------------------------------------------------------------------------
-- does NOT support vehicles !
local global_GameModeNameMap = {
	["Scavenger0"] = "Scavenger"
}  

-- ------------------------------------------------------------------------------

-- Scavenger: ticket rate 100% = 300 tickets
local SCAV300_LevelNameMap = {
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market"
} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_SCAV, p_GameMode_SCAV, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_SCAV = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_SCAV] or p_GameMode_SCAV

-- Contains Scavenger map data
	s_LevelName_SCAV = ServerUtils and ServerUtils:GetCustomMapName() or SCAV300_LevelNameMap[p_LevelName_SCAV] or p_LevelName_SCAV and s_GameMode_SCAV == "Scavenger"

-- ------------------------------------------------------------------------------

	if (SCAV300_LevelNameMap[p_LevelName_SCAV] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="SCAV300"

	map_tickets_00_04_SCAV300 = var_00_04_SCAV300
	map_tickets_05_12_SCAV300 = var_05_12_SCAV300
	map_tickets_13_24_SCAV300 = var_13_24_SCAV300
	map_tickets_25_32_SCAV300 = var_25_32_SCAV300
	map_tickets_33_48_SCAV300 = var_33_48_SCAV300
	map_tickets_49_64_SCAV300 = var_49_64_SCAV300
	map_tickets_65_128_SCAV300 = var_65_128_SCAV300

	map_tickets_00_04 = map_tickets_00_04_SCAV300
	map_tickets_05_12 = map_tickets_05_12_SCAV300
	map_tickets_13_24 = map_tickets_13_24_SCAV300
	map_tickets_25_32 = map_tickets_25_32_SCAV300
	map_tickets_33_48 = map_tickets_33_48_SCAV300
	map_tickets_49_64 = map_tickets_49_64_SCAV300
	map_tickets_65_128 = map_tickets_65_128_SCAV300

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_SCAV300/3)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_SCAV300/3)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_SCAV300/3)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_SCAV300/3)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_SCAV300/3)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_SCAV300/3)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_SCAV300/3) 

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
	if lm == p_LevelName_SCAV  and s_GameMode_SCAV == "Scavenger" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_SCAV..') - Mapname: ('..s_LevelName_SCAV..') ') 
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
