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
local GameMode_KOTH = {
	["KingOfTheHill0"] = "King of the hill"
	} 

-- ------------------------------------------------------------------------------

-- King of the hill: ticket rate 100% = 200 Tickets
local Keku_KOTH200 = {
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
	local s_GameMode_Keku_KOTH = ServerUtils and ServerUtils:GetCustomGameModeName() or GameMode_KOTH[p_GameMode_Keku_KOTH] or p_GameMode_Keku_KOTH

-- Contains King of the hill map data
	s_LevelName_Keku_KOTH = ServerUtils and ServerUtils:GetCustomMapName() or Keku_KOTH200[p_LevelName_Keku_KOTH] or p_LevelName_Keku_KOTH

-- ------------------------------------------------------------------------------

	if (Keku_KOTH200[p_LevelName_Keku_KOTH] ~= nill) then
	s_Tickets = tickets_TS
	s_ratio = 2
	goto set_tickets
	end

	::set_tickets:: 
	s_vehicles = "true"
	s_vehicles_status = "Enabled"

	MT[1] = (s_Tickets[1])
	MT[2] = (s_Tickets[2])
	MT[3] = (s_Tickets[3])
	MT[4] = (s_Tickets[4])
	MT[5] = (s_Tickets[5])
	MT[6] = (s_Tickets[6])
	MT[7] = (s_Tickets[7])

	GMC[1] = math.floor(MT[1]/s_ratio)
	GMC[2] = math.floor(MT[2]/s_ratio)
	GMC[3] = math.floor(MT[3]/s_ratio)
	GMC[4] = math.floor(MT[4]/s_ratio)
	GMC[5] = math.floor(MT[5]/s_ratio)
	GMC[6] = math.floor(MT[6]/s_ratio)
	GMC[7] = math.floor(MT[7]/s_ratio)

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Keku_KOTH  and s_GameMode_Keku_KOTH == "King of the hill" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	s_MapData=s_GameMode_Keku_KOTH

-- Data for the chat message when the map has Vehicles enabled (Default)
	m_GameMode = s_GameMode_Keku_KOTH
	m_LevelName = s_LevelName_Keku_KOTH

	m_tickets = " - Flag Tickets: "
	m_vehicles = ""
	m_vehicles_status = ""

-- ------------------------------------------------------------------------------

	 local players = PlayerManager:GetPlayerCount()
	if players <= 4 then
	ticket_gmc = GMC[1]
	map_tickets = MT[1]
	player_count = (PC[1])
	goto rcon
      
	elseif players >= 5 and players <= 12 then
	ticket_gmc = GMC[2]
	map_tickets = MT[2]
	player_count = (PC[2])
	goto rcon
      
	elseif players >= 13 and players <= 24 then
	ticket_gmc = GMC[3]
	map_tickets = MT[3]
	player_count = (PC[3])
	goto rcon

	elseif players >= 25 and players <= 32 then
	ticket_gmc = GMC[4]
	map_tickets = MT[4]
	player_count = (PC[4])
	goto rcon

	elseif players >= 33 and players <= 48 then
	ticket_gmc = GMC[5]
	map_tickets = MT[5]
	player_count = (PC[5])
	goto rcon

	elseif players >= 49 and players <= 64 then
	ticket_gmc = GMC[6]
	map_tickets = MT[6]
	player_count = (PC[6])
	goto rcon

	elseif players >= 65 and players <= 128 then
	ticket_gmc = GMC[7]
	map_tickets = MT[7]
	player_count = (PC[7])
	goto rcon
end

::rcon:: 
	RCON:SendCommand('vars.gameModeCounter', { tostring(ticket_gmc) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) }) 

	if Config.consolespam then 
    print("****************** Console spammer ****************"); 
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName_Keku_KOTH..' - GameMode:'..s_GameMode_Keku_KOTH..' ')
	print(''..s_MapData..': - map tickets: '..MT[1]..' - '..MT[2]..' - '..MT[3]..' - '..MT[4]..' - '..MT[5]..' - '..MT[6]..' - '..MT[7]..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC[1]..'% - '..GMC[2]..'% - '..GMC[3]..'% - '..GMC[4]..'% - '..GMC[5]..'% - '..GMC[6]..'% - '..GMC[7]..'% ') 
	print(''..s_MapData..': - Player count: '..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - All presets loaded')  
end

end
end)
