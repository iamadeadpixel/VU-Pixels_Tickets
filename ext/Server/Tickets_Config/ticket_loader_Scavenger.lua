-- ------------------------------------------------------------------------------

local global_GameModeNameMap = {
	["Scavenger0"] = "Scavenger"
}  

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
	s_vehicles = "false"
	s_vehicles_status = "Disabled"

	map_tickets_00_04 = (tickets_Scavenger[1])
	map_tickets_05_12 = (tickets_Scavenger[2])
	map_tickets_13_24 = (tickets_Scavenger[3])
	map_tickets_25_32 = (tickets_Scavenger[4])
	map_tickets_33_48 = (tickets_Scavenger[5])
	map_tickets_49_64 = (tickets_Scavenger[6])
	map_tickets_65_128 = (tickets_Scavenger[7])

	GMC_00_04 = math.floor(map_tickets_00_04/3)
	GMC_05_12 = math.floor(map_tickets_05_12/3)
	GMC_13_24 = math.floor(map_tickets_13_24/3)
	GMC_25_32 = math.floor(map_tickets_25_32/3)
	GMC_33_48 = math.floor(map_tickets_33_48/3)
	GMC_49_64 = math.floor(map_tickets_49_64/3)
	GMC_65_128 = math.floor(map_tickets_65_128/3) 

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

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
-- We need to cheat here xD	
	s_MapData=s_GameMode
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName..' - GameMode:'..s_GameMode..' ')
	print(''..s_MapData..': - map tickets: '..map_tickets_00_04..' - '..map_tickets_05_12..' - '..map_tickets_13_24..' - '..map_tickets_25_32..' - '..map_tickets_33_48..' - '..map_tickets_49_64..' - '..map_tickets_65_128..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC_00_04..'% - '..GMC_05_12..'% - '..GMC_13_24..'% - '..GMC_25_32..'% - '..GMC_33_48..'% - '..GMC_49_64..'% - '..GMC_65_128..'% ') 

-- ------------------------------------------------------------------------------

	local players = PlayerManager:GetPlayerCount()
	if players <= 4 then
	ticket_gmc = GMC_00_04
	map_tickets = map_tickets_00_04
	player_count = (player_counter[1])
	goto rcon
      
	elseif players >= 5 and players <= 12 then
	ticket_gmc = GMC_05_12
	map_tickets = map_tickets_05_12
	player_count = (player_counter[2])
	goto rcon
      
	elseif players >= 13 and players <= 24 then
	ticket_gmc = GMC_13_24
	map_tickets = map_tickets_13_24
	player_count = (player_counter[3])
	goto rcon

	elseif players >= 25 and players <= 32 then
	ticket_gmc = GMC_25_32
	map_tickets = map_tickets_25_32
	player_count = (player_counter[4])
	goto rcon

	elseif players >= 33 and players <= 48 then
	ticket_gmc = GMC_33_48
	map_tickets = map_tickets_33_48
	player_count = (player_counter[5])
	goto rcon

	elseif players >= 49 and players <= 64 then
	ticket_gmc = GMC_49_64
	map_tickets = map_tickets_49_64
	player_count = (player_counter[6])
	goto rcon

	elseif players >= 65 and players <= 128 then
	ticket_gmc = GMC_65_128
	map_tickets = map_tickets_65_128
	player_count = (player_counter[7])
	goto rcon
end

::rcon:: 
	RCON:SendCommand('vars.gameModeCounter', { tostring(ticket_gmc) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) }) 

	print(''..s_MapData..': - Player count:'..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  

end
end)
