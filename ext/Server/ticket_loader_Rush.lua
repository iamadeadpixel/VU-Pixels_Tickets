-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["RushLarge0"] = "Rush",
	} 

-- ------------------------------------------------------------------------------
-- CQL Maps Vehicles disabled:
local Rush_Disabled_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
}

-- ------------------------------------------------------------------------------
-- Rush: ticket rate 100% = 75 Tickets
local Rush75_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_018/MP_018"] = "Kharg Island",

	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman",
	["Levels/XP1_004/XP1_004"] = "Wake Island",

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
-- Rush: ticket rate 100% = 100 Tickets
local Rush100_LevelNameMap = {
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro",
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_Rush, p_GameMode_Rush, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Rush = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Rush] or p_GameMode_Rush

-- Contains Rush75 map data
	local s_LevelName_Rush = ServerUtils and ServerUtils:GetCustomMapName() or Rush75_LevelNameMap[p_LevelName_Rush] or Rush100_LevelNameMap[p_LevelName_Rush] or p_LevelName_Rush and s_GameMode_Rush == "Rush"

-- Rush Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Rush_Disabled_LevelNameMap[p_LevelName_Rush]

-- ------------------------------------------------------------------------------
-- Calculating the ticketrate vs actual tickets
-- Rush75: ticket rate 100% = 75 Tickets - divider = *1.34
-- Rush100: ticket rate 100% = 100 Tickets - divider = 1

-- ------------------------------------------------------------------------------

	if (Rush75_LevelNameMap[p_LevelName_Rush] ~= nill) then
-- Conques modes: Here u can set the server tickets for Rush Rush75 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Rush75"

	map_tickets_00_04_Rush75 = var_00_04_Rush75
	map_tickets_05_10_Rush75 = var_05_10_Rush75
	map_tickets_11_20_Rush75 = var_11_20_Rush75

	map_tickets_00_04 = map_tickets_00_04_Rush75
	map_tickets_05_10 = map_tickets_05_10_Rush75
	map_tickets_11_20 = map_tickets_11_20_Rush75

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Rush75*1.34) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Rush75*1.34) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Rush75*1.34) -- The value get some math magic

-- ------------------------------------------------------------------------------

 	elseif (Rush100_LevelNameMap[p_LevelName_Rush] ~= nill) then
-- Conques modes: Here u can set the server tickets for Rush Rush100 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Rush100"
 
	map_tickets_00_04_Rush100 = var_00_04_Rush100
	map_tickets_05_10_Rush100 = var_05_10_Rush100
	map_tickets_11_20_Rush100 = var_11_20_Rush100

	map_tickets_00_04 = map_tickets_00_04_Rush100
	map_tickets_05_10 = map_tickets_05_10_Rush100
	map_tickets_11_20 = map_tickets_11_20_Rush100

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Rush100/1) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Rush100/1) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Rush100/1) -- The value get some math magic
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
	if d_LevelName == s_LevelName_Rush  and global_GameModeNameMap[p_GameMode_Rush] == "Rush" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Rush  and s_GameMode_Rush == "Rush" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_Rush..') - Mapname: ('..s_LevelName_Rush..') ') 
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

