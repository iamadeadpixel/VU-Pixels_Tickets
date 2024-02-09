-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" then
		local syncedBFSettings = ResourceManager:GetSettings("SyncedBFSettings")
		if syncedBFSettings ~= nil then
			syncedBFSettings = SyncedBFSettings(syncedBFSettings)
			syncedBFSettings.teamSwitchingAllowed = false
		end
	end
end)

-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["KingOfTheHill0"] = "King of the hill"
	} 

-- ------------------------------------------------------------------------------

-- King of the hill: ticket rate 100% = 200 Tickets
local Keku_KOTH200_LevelNameMap = {
-- Keku's map mod stuff 
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman",
	["Levels/COOP_006/COOP_006"] = "Aygan Village"
}

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_Keku_KOTH, p_GameMode_Keku_KOTH, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Keku_KOTH = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_Keku_KOTH] or p_GameMode_Keku_KOTH

-- Contains King of the hill map data
	s_LevelName_Keku_KOTH = ServerUtils and ServerUtils:GetCustomMapName() or Keku_KOTH200_LevelNameMap[p_LevelName_Keku_KOTH] or p_LevelName_Keku_KOTH and s_GameMode_Keku_KOTH == "King of the hill"

-- ------------------------------------------------------------------------------

	if (Keku_KOTH200_LevelNameMap[p_LevelName_Keku_KOTH] ~= nill) then
	s_vehicles = "true"
	s_vehicles_status = "Enabled"


	map_tickets_00_04 = (tickets_KOTH_200[1])
	map_tickets_05_12 = (tickets_KOTH_200[2])
	map_tickets_13_24 = (tickets_KOTH_200[3])
	map_tickets_25_32 = (tickets_KOTH_200[4])
	map_tickets_33_48 = (tickets_KOTH_200[5])
	map_tickets_49_64 = (tickets_KOTH_200[6])
	map_tickets_65_128 = (tickets_KOTH_200[7])

	GMC_00_04 = math.floor(map_tickets_00_04/2)
	GMC_05_12 = math.floor(map_tickets_05_12/2)
	GMC_13_24 = math.floor(map_tickets_13_24/2)
	GMC_25_32 = math.floor(map_tickets_25_32/2)
	GMC_33_48 = math.floor(map_tickets_33_48/2)
	GMC_49_64 = math.floor(map_tickets_49_64/2)
	GMC_65_128 = math.floor(map_tickets_65_128/2)

end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Keku_KOTH  and s_GameMode_Keku_KOTH == "King of the hill" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
-- We need to cheat here xD	
	s_MapData=s_GameMode

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

	if Config.consolespam then 
    print("****************** Console spammer ****************"); 
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName..' - GameMode:'..s_GameMode..' ')
	print(''..s_MapData..': - map tickets: '..map_tickets_00_04..' - '..map_tickets_05_12..' - '..map_tickets_13_24..' - '..map_tickets_25_32..' - '..map_tickets_33_48..' - '..map_tickets_49_64..' - '..map_tickets_65_128..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC_00_04..'% - '..GMC_05_12..'% - '..GMC_13_24..'% - '..GMC_25_32..'% - '..GMC_33_48..'% - '..GMC_49_64..'% - '..GMC_65_128..'% ') 

	print(''..s_MapData..': - Player count:'..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  
end

end
end)

