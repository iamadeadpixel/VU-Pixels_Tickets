-- ------------------------------------------------------------------------------
-- does NOT support vehicles !
local global_GameModeNameMap = {
	["SquadRush0"] = "Squad Rush"
}  

-- ------------------------------------------------------------------------------
-- Squad Rush Maps Vehicles disabled:
local Rush_SQ_Disabled_LevelNameMap = {
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro"
}

-- ------------------------------------------------------------------------------
-- Squad Rush: ticket rate 100% = 20 Kills 
local Rush_SQ_LevelNameMap = {
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

Events:Subscribe('Level:LoadResources', function(p_LevelName_Rush_SQ, p_GameMode_Rush_SQ, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Rush_SQ = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Rush_SQ] or p_GameMode_Rush_SQ

-- Contains Rush_SQ map data
	local s_LevelName_Rush_SQ = ServerUtils and ServerUtils:GetCustomMapName() or Rush_SQ_LevelNameMap[p_LevelName_Rush_SQ] or p_LevelName_Rush_SQ and s_GameMode_Rush_SQ == "Squad Rush"

-- Rush_SQ Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or Rush_SQ_Disabled_LevelNameMap[p_LevelName_Rush_SQ]

-- ------------------------------------------------------------------------------
-- Calculating the ticketrate vs actual tickets
-- Squad Rush: ticket rate 100% = 20 Kills - divider = *5

-- ------------------------------------------------------------------------------

	if (Rush_SQ_LevelNameMap[p_LevelName_Rush_SQ] ~= nill) then
-- Conques modes: Here u can set the server tickets for Rush_SQ maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="Rush_SQ"

	map_tickets_00_04_Rush_SQ = var_00_04_Rush_SQ
	map_tickets_05_10_Rush_SQ = var_05_10_Rush_SQ
	map_tickets_11_20_Rush_SQ = var_11_20_Rush_SQ

	map_tickets_00_04 = map_tickets_00_04_Rush_SQ
	map_tickets_05_10 = map_tickets_05_10_Rush_SQ
	map_tickets_11_20 = map_tickets_11_20_Rush_SQ

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_Rush_SQ*5) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_Rush_SQ*5) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_Rush_SQ*5) -- The value get some math magic

end
-- ------------------------------------------------------------------------------

-- Experimental: Setting vehicles on or off on specific map, any other map should be enabled
	if d_LevelName == s_LevelName_Rush_SQ  and global_GameModeNameMap[p_GameMode_Rush_SQ] == "Squad Rush" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
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
	if lm == p_LevelName_Rush_SQ  and s_GameMode_Rush_SQ == "Squad Rush" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_Rush_SQ..') - Mapname: ('..s_LevelName_Rush_SQ..') ') 
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

