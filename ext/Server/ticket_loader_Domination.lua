-- ------------------------------------------------------------------------------
-- does NOT support vehicles !
local global_GameModeNameMap = {
	["Domination0"] = "Domination",
}  

-- ------------------------------------------------------------------------------

-- Domination: ticket rate 100% = 150 tickets
local DOM150_LevelNameMap = {
	["Levels/XP2_Factory/XP2_Factory"] = "Scrapmetal",
	["Levels/XP2_Office/XP2_Office"] = "Operation 925",
	["Levels/XP2_Palace/XP2_Palace"] = "Donya Fortress",
	["Levels/XP2_Skybar/XP2_Skybar"] = "Ziba Tower",
} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_DOM, p_GameMode_DOM, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_DOM = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_DOM] or p_GameMode_DOM

-- Contains Domination map data
	s_LevelName_DOM = ServerUtils and ServerUtils:GetCustomMapName() or DOM150_LevelNameMap[p_LevelName_DOM] or p_LevelName_DOM and s_GameMode_DOM == "Domination"

-- ------------------------------------------------------------------------------

	if (DOM150_LevelNameMap[p_LevelName_DOM] ~= nill) then
	s_vehicles = "false"
	s_vehicles_status = "Disabled"
	s_MapData="DOM150"

	map_tickets_00_04_DOM150 = var_00_04_DOM150
	map_tickets_05_12_DOM150 = var_05_12_DOM150
	map_tickets_13_24_DOM150 = var_13_24_DOM150
	map_tickets_25_32_DOM150 = var_25_32_DOM150
	map_tickets_33_48_DOM150 = var_33_48_DOM150
	map_tickets_49_64_DOM150 = var_49_64_DOM150
	map_tickets_65_128_DOM150 = var_65_128_DOM150

	map_tickets_00_04 = map_tickets_00_04_DOM150
	map_tickets_05_12 = map_tickets_05_12_DOM150
	map_tickets_13_24 = map_tickets_13_24_DOM150
	map_tickets_25_32 = map_tickets_25_32_DOM150
	map_tickets_33_48 = map_tickets_33_48_DOM150
	map_tickets_49_64 = map_tickets_49_64_DOM150
	map_tickets_65_128 = map_tickets_65_128_DOM150

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_DOM150/1.5)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_DOM150/1.5)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_DOM150/1.5)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_DOM150/1.5)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_DOM150/1.5)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_DOM150/1.5)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_DOM150/1.5)

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
	if lm == p_LevelName_DOM  and s_GameMode_DOM == "Domination" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_DOM..') - Mapname: ('..s_LevelName_DOM..') ') 
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
