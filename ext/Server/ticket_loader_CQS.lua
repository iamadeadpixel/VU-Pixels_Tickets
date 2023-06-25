-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestSmall0"] = "Conquest Small"
	} 

-- ------------------------------------------------------------------------------

-- CQS Maps Vehicles disabled:
local CQS_Disabled_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
}

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 350 Tickets
local CQS350_LevelNameMap = {
-- Keku's map mod stuff 
	["Levels/COOP_006/COOP_006"] = "Fire from the Sky",

-- Stock  
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 300 Tickets
local CQS300_LevelNameMap = {
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 250 Tickets
local CQS250_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 200 Tickets
local CQS200_LevelNameMap = {
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_018/MP_018"] = "Kharg Island",
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
} 

-- ------------------------------------------------------------------------------

-- CQS: ticket rate 100% = 150 Tickets
local CQS150_LevelNameMap = {
	["Levels/MP_007/MP_007"] = "Caspian Border"
} 

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_CQS, p_GameMode_CQS, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_CQS = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_CQS] or p_GameMode_CQS

-- Contains Conquest Small map data
	local s_LevelName_CQS = ServerUtils and ServerUtils:GetCustomMapName() or CQS150_LevelNameMap[p_LevelName_CQS] or CQS200_LevelNameMap[p_LevelName_CQS] or CQS250_LevelNameMap[p_LevelName_CQS] or CQS300_LevelNameMap[p_LevelName_CQS] or CQS350_LevelNameMap[p_LevelName_CQS] or p_LevelName_CQS and s_GameMode_CQS == "Conquest Small"

-- CQS Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or CQS_Disabled_LevelNameMap[p_LevelName_CQS]

-- ------------------------------------------------------------------------------

 	if (CQS350_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS350"

	map_tickets_00_04_CQS350 = var_00_04_CQS350
	map_tickets_05_12_CQS350 = var_05_12_CQS350
	map_tickets_13_24_CQS350 = var_13_24_CQS350
	map_tickets_25_32_CQS350 = var_25_32_CQS350
	map_tickets_33_48_CQS350 = var_33_48_CQS350
	map_tickets_49_64_CQS350 = var_49_64_CQS350
	map_tickets_65_128_CQS350 = var_65_128_CQS350

	map_tickets_00_04 = map_tickets_00_04_CQS350
	map_tickets_05_12 = map_tickets_05_12_CQS350
	map_tickets_13_24 = map_tickets_13_24_CQS350
	map_tickets_25_32 = map_tickets_25_32_CQS350
	map_tickets_33_48 = map_tickets_33_48_CQS350
	map_tickets_49_64 = map_tickets_49_64_CQS350
	map_tickets_65_128 = map_tickets_65_128_CQS350

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQS350/3.5)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_CQS350/3.5)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_CQS350/3.5)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_CQS350/3.5)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_CQS350/3.5)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_CQS350/3.5)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_CQS350/3.5)

-- ------------------------------------------------------------------------------

 	elseif (CQS300_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS300"
 
	map_tickets_00_04_CQS300 = var_00_04_CQS300
	map_tickets_05_12_CQS300 = var_05_12_CQS300
	map_tickets_13_24_CQS300 = var_13_24_CQS300
	map_tickets_25_32_CQS300 = var_25_32_CQS300
	map_tickets_33_48_CQS300 = var_33_48_CQS300
	map_tickets_49_64_CQS300 = var_49_64_CQS300
	map_tickets_65_128_CQS300 = var_65_128_CQS300

	map_tickets_00_04 = map_tickets_00_04_CQS300
	map_tickets_05_12 = map_tickets_05_12_CQS300
	map_tickets_13_24 = map_tickets_13_24_CQS300
	map_tickets_25_32 = map_tickets_25_32_CQS300
	map_tickets_33_48 = map_tickets_33_48_CQS300
	map_tickets_49_64 = map_tickets_49_64_CQS300
	map_tickets_65_128 = map_tickets_65_128_CQS300

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQS300/3)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_CQS300/3)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_CQS300/3)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_CQS300/3)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_CQS300/3)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_CQS300/3)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_CQS300/3)

-- ------------------------------------------------------------------------------

 	elseif (CQS250_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS250"
 
	map_tickets_00_04_CQS250 = var_00_04_CQS250
	map_tickets_05_12_CQS250 = var_05_12_CQS250
	map_tickets_13_24_CQS250 = var_13_24_CQS250
	map_tickets_25_32_CQS250 = var_25_32_CQS250
	map_tickets_33_48_CQS250 = var_33_48_CQS250
	map_tickets_49_64_CQS250 = var_49_64_CQS250
	map_tickets_65_128_CQS250 = var_65_128_CQS250

	map_tickets_00_04 = map_tickets_00_04_CQS250
	map_tickets_05_12 = map_tickets_05_12_CQS250
	map_tickets_13_24 = map_tickets_13_24_CQS250
	map_tickets_25_32 = map_tickets_25_32_CQS250
	map_tickets_33_48 = map_tickets_33_48_CQS250
	map_tickets_49_64 = map_tickets_49_64_CQS250
	map_tickets_65_128 = map_tickets_65_128_CQS250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQS250/2.5)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_CQS250/2.5)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_CQS250/2.5)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_CQS250/2.5)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_CQS250/2.5)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_CQS250/2.5)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_CQS250/2.5)

-- ------------------------------------------------------------------------------

 	elseif (CQS200_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS200"
 
	map_tickets_00_04_CQS200 = var_00_04_CQS200
	map_tickets_05_12_CQS200 = var_05_12_CQS200
	map_tickets_13_24_CQS200 = var_13_24_CQS200
	map_tickets_25_32_CQS200 = var_25_32_CQS200
	map_tickets_33_48_CQS200 = var_33_48_CQS200
	map_tickets_49_64_CQS200 = var_49_64_CQS200
	map_tickets_65_128_CQS200 = var_65_128_CQS200

	map_tickets_00_04 = map_tickets_00_04_CQS200
	map_tickets_05_12 = map_tickets_05_12_CQS200
	map_tickets_13_24 = map_tickets_13_24_CQS200
	map_tickets_25_32 = map_tickets_25_32_CQS200
	map_tickets_33_48 = map_tickets_33_48_CQS200
	map_tickets_49_64 = map_tickets_49_64_CQS200
	map_tickets_65_128 = map_tickets_65_128_CQS200

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQS200/2)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_CQS200/2)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_CQS200/2)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_CQS200/2)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_CQS200/2)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_CQS200/2)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_CQS200/2)

-- ------------------------------------------------------------------------------

 	elseif (CQS150_LevelNameMap[p_LevelName_CQS] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQS150"
 
	map_tickets_00_04_CQS150 = var_00_04_CQS150
	map_tickets_05_12_CQS150 = var_05_12_CQS150
	map_tickets_13_24_CQS150 = var_13_24_CQS150
	map_tickets_25_32_CQS150 = var_25_32_CQS150
	map_tickets_33_48_CQS150 = var_33_48_CQS150
	map_tickets_49_64_CQS150 = var_49_64_CQS150
	map_tickets_65_128_CQS150 = var_65_128_CQS150

	map_tickets_00_04 = map_tickets_00_04_CQS150
	map_tickets_05_12 = map_tickets_05_12_CQS150
	map_tickets_13_24 = map_tickets_13_24_CQS150
	map_tickets_25_32 = map_tickets_25_32_CQS150
	map_tickets_33_48 = map_tickets_33_48_CQS150
	map_tickets_49_64 = map_tickets_49_64_CQS150
	map_tickets_65_128 = map_tickets_65_128_CQS150

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQS150/1.5)
	s_ticket_gmc_05_12 = math.floor(map_tickets_05_12_CQS150/1.5)
	s_ticket_gmc_13_24 = math.floor(map_tickets_13_24_CQS150/1.5)
	s_ticket_gmc_25_32 = math.floor(map_tickets_25_32_CQS150/1.5)
	s_ticket_gmc_33_48 = math.floor(map_tickets_33_48_CQS150/1.5)
	s_ticket_gmc_49_64 = math.floor(map_tickets_49_64_CQS150/1.5)
	s_ticket_gmc_65_128 = math.floor(map_tickets_65_128_CQS150/1.5)
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
	if d_LevelName == s_LevelName_CQS  and global_GameModeNameMap[p_GameMode_CQS] == "Conquest Small" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_CQS  and s_GameMode_CQS == "Conquest Small" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_CQS..') - Mapname: ('..s_LevelName_CQS..') ') 
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
