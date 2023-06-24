-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["ConquestLarge0"] = "Conquest Large"
	} 

-- ------------------------------------------------------------------------------
-- CQL Maps Vehicles disabled: Infantry friendly.
local CQL_Disabled_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 400 Tickets
local CQL400_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 350 Tickets
local CQL350_LevelNameMap = {
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 300 Tickets
local CQL300_LevelNameMap = {
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_018/MP_018"] = "Kharg Island",
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 250 Tickets
local CQL250_LevelNameMap = {
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains"
}

-- ------------------------------------------------------------------------------
-- CQL: ticket rate 100% = 200 Tickets
local CQL200_LevelNameMap = {
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_CQL, p_GameMode_CQL, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_CQL = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_CQL] or p_GameMode_CQL

-- Contains CQL400 map data
	local s_LevelName_CQL = ServerUtils and ServerUtils:GetCustomMapName() or CQL400_LevelNameMap[p_LevelName_CQL] or CQL350_LevelNameMap[p_LevelName_CQL] or CQL300_LevelNameMap[p_LevelName_CQL] or CQL250_LevelNameMap[p_LevelName_CQL] or CQL200_LevelNameMap[p_LevelName_CQL] or p_LevelName_CQL and s_GameMode_CQL == "Conquest Large"

-- CQL Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or CQL_Disabled_LevelNameMap[p_LevelName_CQL]

-- ------------------------------------------------------------------------------

	if (CQL400_LevelNameMap[p_LevelName_CQL] ~= nill) then
-- Conques modes: Here u can set the server tickets for Conquest Large CQL400 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL400"

	map_tickets_00_04_CQL400 = var_00_04_CQL400
	map_tickets_05_10_CQL400 = var_05_10_CQL400
	map_tickets_11_20_CQL400 = var_11_20_CQL400

	map_tickets_00_04 = map_tickets_00_04_CQL400
	map_tickets_05_10 = map_tickets_05_10_CQL400
	map_tickets_11_20 = map_tickets_11_20_CQL400

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQL400/4) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_CQL400/4) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_CQL400/4) -- The value get some math magic

-- ------------------------------------------------------------------------------

 	elseif (CQL350_LevelNameMap[p_LevelName_CQL] ~= nill) then
-- Conques modes: Here u can set the server tickets for Conquest Large CQL350 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL350"
 
	map_tickets_00_04_CQL350 = var_00_04_CQL350
	map_tickets_05_10_CQL350 = var_05_10_CQL350
	map_tickets_11_20_CQL350 = var_11_20_CQL350

	map_tickets_00_04 = map_tickets_00_04_CQL350
	map_tickets_05_10 = map_tickets_05_10_CQL350
	map_tickets_11_20 = map_tickets_11_20_CQL350

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQL350/3.5) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_CQL350/3.5) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_CQL350/3.5) -- The value get some math magic

-- ------------------------------------------------------------------------------

 	elseif (CQL300_LevelNameMap[p_LevelName_CQL] ~= nill) then
-- Conques modes: Here u can set the server tickets for Conquest Large CQL300 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL300"
 
	map_tickets_00_04_CQL300 = var_00_04_CQL300
	map_tickets_05_10_CQL300 = var_05_10_CQL300
	map_tickets_11_20_CQL300 = var_11_20_CQL300

	map_tickets_00_04 = map_tickets_00_04_CQL300
	map_tickets_05_10 = map_tickets_05_10_CQL300
	map_tickets_11_20 = map_tickets_11_20_CQL300

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQL300/3) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_CQL300/3) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_CQL300/3) -- The value get some math magic

-- ------------------------------------------------------------------------------

 	elseif (CQL250_LevelNameMap[p_LevelName_CQL] ~= nill) then
-- Conques modes: Here u can set the server tickets for Conquest Large CQL250 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL250"
 
	map_tickets_00_04_CQL250 = var_00_04_CQL250
	map_tickets_05_10_CQL250 = var_05_10_CQL250
	map_tickets_11_20_CQL250 = var_11_20_CQL250

	map_tickets_00_04 = map_tickets_00_04_CQL250
	map_tickets_05_10 = map_tickets_05_10_CQL250
	map_tickets_11_20 = map_tickets_11_20_CQL250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQL250/2.5) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_CQL250/2.5) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_CQL250/2.5) -- The value get some math magic

-- ------------------------------------------------------------------------------

 	elseif (CQL200_LevelNameMap[p_LevelName_CQL] ~= nill) then
-- Conques modes: Here u can set the server tickets for Conquest Large CQL200 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CQL200"
 
	map_tickets_00_04_CQL200 = var_00_04_CQL200
	map_tickets_05_10_CQL200 = var_05_10_CQL200
	map_tickets_11_20_CQL200 = var_11_20_CQL200

	map_tickets_00_04 = map_tickets_00_04_CQL200
	map_tickets_05_10 = map_tickets_05_10_CQL200
	map_tickets_11_20 = map_tickets_11_20_CQL200

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CQL200/2) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_CQL200/2) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_CQL200/2) -- The value get some math magic
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
	if d_LevelName == s_LevelName_CQL  and global_GameModeNameMap[p_GameMode_CQL] == "Conquest Large" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_CQL  and s_GameMode_CQL == "Conquest Large" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_CQL..') - Mapname: ('..s_LevelName_CQL..') ') 
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

