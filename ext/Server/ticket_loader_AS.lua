-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["AirSuperiority0"] = "Air Superiority"
	} 

-- ------------------------------------------------------------------------------

-- Air Superiority: ticket rate 100% = 250 Tickets
local AS250_LevelNameMap = {
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
}

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_AS, p_GameMode_AS, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_AS = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_AS] or p_GameMode_AS

-- Contains Air Superiority map data
	s_LevelName_AS = ServerUtils and ServerUtils:GetCustomMapName() or AS250_LevelNameMap[p_LevelName_AS] or p_LevelName_AS and s_GameMode_AS == "Air Superiority"

-- ------------------------------------------------------------------------------

	if (AS250_LevelNameMap[p_LevelName_AS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="AS250"

	map_tickets_00_04_AS250 = var_00_04_AS250
	map_tickets_05_12_AS250 = var_05_12_AS250
	map_tickets_13_24_AS250 = var_13_24_AS250
	map_tickets_25_32_AS250 = var_25_32_AS250
	map_tickets_33_48_AS250 = var_33_48_AS250
	map_tickets_49_64_AS250 = var_49_64_AS250
	map_tickets_65_128_AS250 = var_65_128_AS250

	map_tickets_00_04 = map_tickets_00_04_AS250
	map_tickets_05_12 = map_tickets_05_12_AS250
	map_tickets_13_24 = map_tickets_13_24_AS250
	map_tickets_25_32 = map_tickets_25_32_AS250
	map_tickets_33_48 = map_tickets_33_48_AS250
	map_tickets_49_64 = map_tickets_49_64_AS250
	map_tickets_65_128 = map_tickets_65_128_AS250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_AS250/2.5)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_AS250/2.5)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_AS250/2.5)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_AS250/2.5)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_AS250/2.5)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_AS250/2.5)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_AS250/2.5)

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
	if lm == p_LevelName_AS  and s_GameMode_AS == "Air Superiority" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_AS..') - Mapname: ('..s_LevelName_AS..') ') 
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
