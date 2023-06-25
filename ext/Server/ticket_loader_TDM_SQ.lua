-- ------------------------------------------------------------------------------

local global_GameModeNameMap = {
	["SquadDeathMatch0"] = "Squad Deathmatch"
}  

-- ------------------------------------------------------------------------------
-- Squad Deathmatch: ticket rate 100% = 50 kills
local TDM_SQ_LevelNameMap = {
-- Keku's map mod stuff
	["Levels/COOP_002/COOP_002"] = "Hit and Run",
	["Levels/COOP_006/COOP_006"] = "Fire from the Sky",
	["Levels/SP_Jet/SP_Jet"] = "Going Hunting",
	["Levels/SP_Valley/SP_Valley"] = "Rock and a Hard Place",
	["Levels/SP_Villa/SP_Villa"] = "Kaffarov's Villa",

-- Stock
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_018/MP_018"] = "Kharg Island",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro",

	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman",
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula",
	["Levels/XP1_004/XP1_004"] = "Wake Island",

	["Levels/XP2_Factory/XP2_Factory"] = "Scrapmetal",
	["Levels/XP2_Office/XP2_Office"] = "Operation 925",
	["Levels/XP2_Palace/XP2_Palace"] = "Donya Fortress",
	["Levels/XP2_Skybar/XP2_Skybar"] = "Ziba Tower",

	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",

	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market",

	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_TDM_SQ, p_GameMode_TDM_SQ, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_TDM_SQ = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_TDM_SQ] or p_GameMode_TDM_SQ

-- Contains TDM map data
	s_LevelName_TDM_SQ = ServerUtils and ServerUtils:GetCustomMapName() or TDM_SQ_LevelNameMap[p_LevelName_TDM_SQ] or p_LevelName_TDM_SQ and s_GameMode_TDM_SQ == "Squad Deathmatch"

-- TDM_SQ Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or TDM_SQ_LevelNameMap[p_LevelName_TDM_SQ]

-- ------------------------------------------------------------------------------

	if (TDM_SQ_LevelNameMap[p_LevelName_TDM_SQ] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="TDM_SQ"

	map_tickets_00_04_TDM_SQ = var_00_04_TDM_SQ
	map_tickets_05_12_TDM_SQ = var_05_12_TDM_SQ
	map_tickets_13_24_TDM_SQ = var_13_24_TDM_SQ
	map_tickets_25_32_TDM_SQ = var_25_32_TDM_SQ
	map_tickets_33_48_TDM_SQ = var_33_48_TDM_SQ
	map_tickets_49_64_TDM_SQ = var_49_64_TDM_SQ
	map_tickets_65_128_TDM_SQ = var_65_128_TDM_SQ

	map_tickets_00_04 = map_tickets_00_04_TDM_SQ
	map_tickets_05_12 = map_tickets_05_12_TDM_SQ
	map_tickets_13_24 = map_tickets_13_24_TDM_SQ
	map_tickets_25_32 = map_tickets_25_32_TDM_SQ
	map_tickets_33_48 = map_tickets_33_48_TDM_SQ
	map_tickets_49_64 = map_tickets_49_64_TDM_SQ
	map_tickets_65_128 = map_tickets_65_128_TDM_SQ

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_TDM_SQ*2)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_TDM_SQ*2)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_TDM_SQ*2)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_TDM_SQ*2)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_TDM_SQ*2)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_TDM_SQ*2)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_TDM_SQ*2) 

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
	if d_LevelName == s_LevelName_TDM_SQ and global_GameModeNameMap[p_GameMode_TDM_SQ] == "Squad Deathmatch" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------
	
	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_TDM_SQ  and s_GameMode_TDM_SQ == "Squad Deathmatch" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_TDM_SQ..') - Mapname: ('..s_LevelName_TDM_SQ..') ') 
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
