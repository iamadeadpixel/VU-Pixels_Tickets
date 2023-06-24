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
-- Conques modes: Here u can set the server tickets for Assault300_250 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault300_250"

	map_tickets_00_04_Assault300_250 = var_00_04_Assault300_250
	map_tickets_05_10_Assault300_250 = var_05_10_Assault300_250
	map_tickets_11_20_Assault300_250 = var_11_20_Assault300_250

	map_tickets_00_04 = map_tickets_00_04_Assault300_250
	map_tickets_05_10 = map_tickets_05_10_Assault300_250
	map_tickets_11_20 = map_tickets_11_20_Assault300_250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault300_250/3) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault300_250/3) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault300_250/3) -- The value get some math magic

-- ------------------------------------------------------------------------------

	elseif (Assault300_220_LevelNameMap[p_LevelName_Assault] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault300_220 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault300_220"

	map_tickets_00_04_Assault300_220 = var_00_04_Assault300_220
	map_tickets_05_10_Assault300_220 = var_05_10_Assault300_220
	map_tickets_11_20_Assault300_220 = var_11_20_Assault300_220

	map_tickets_00_04 = map_tickets_00_04_Assault300_220
	map_tickets_05_10 = map_tickets_05_10_Assault300_220
	map_tickets_11_20 = map_tickets_11_20_Assault300_220

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault300_220/3) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault300_220/3) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault300_220/3) -- The value get some math magic

-- ------------------------------------------------------------------------------
	elseif (Assault230_200_LevelNameMap[p_LevelName_Assault] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault230_200 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault230_200"

	map_tickets_00_04_Assault230_200 = var_00_04_Assault230_200
	map_tickets_05_10_Assault230_200 = var_05_10_Assault230_200
	map_tickets_11_20_Assault230_200 = var_11_20_Assault230_200

	map_tickets_00_04 = map_tickets_00_04_Assault230_200
	map_tickets_05_10 = map_tickets_05_10_Assault230_200
	map_tickets_11_20 = map_tickets_11_20_Assault230_200

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault230_200/2.3) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault230_200/2.3) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault230_200/2.3) -- The value get some math magic

-- ------------------------------------------------------------------------------
	elseif (Assault200_250_LevelNameMap[p_LevelName_Assault] ~= nill) then
-- Conques modes: Here u can set the server tickets for Assault200_250 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Assault200_250"

	map_tickets_00_04_Assault200_250 = var_00_04_Assault200_250
	map_tickets_05_10_Assault200_250 = var_05_10_Assault200_250
	map_tickets_11_20_Assault200_250 = var_11_20_Assault200_250

	map_tickets_00_04 = map_tickets_00_04_Assault200_250
	map_tickets_05_10 = map_tickets_05_10_Assault200_250
	map_tickets_11_20 = map_tickets_11_20_Assault200_250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Assault200_250/2) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Assault200_250/2) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Assault200_250/2) -- The value get some math magic
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

