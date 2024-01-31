-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["AirSuperiority0"] = "Air Superiority"
	} 

-- Air Superiority: ticket rate 100% = 250 Tickets
local AS250_LevelNameMap = {
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline",

-- This map is a keku modded map
	["Levels/XP2_Skybar/XP2_Skybar"] = "Ziba Tower"
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

	map_tickets_00_04 = (tickets_AS[1])
	map_tickets_05_12 = (tickets_AS[2])
	map_tickets_13_24 = (tickets_AS[3])
	map_tickets_25_32 = (tickets_AS[4])
	map_tickets_33_48 = (tickets_AS[5])
	map_tickets_49_64 = (tickets_AS[6])
	map_tickets_65_128 = (tickets_AS[7])

	GMC_00_04 = math.floor(map_tickets_00_04/2.5)
	GMC_05_12 = math.floor(map_tickets_05_12/2.5)
	GMC_13_24 = math.floor(map_tickets_13_24/2.5)
	GMC_25_32 = math.floor(map_tickets_25_32/2.5)
	GMC_33_48 = math.floor(map_tickets_33_48/2.5)
	GMC_49_64 = math.floor(map_tickets_49_64/2.5)
	GMC_65_128 = math.floor(map_tickets_65_128/2.5)

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
