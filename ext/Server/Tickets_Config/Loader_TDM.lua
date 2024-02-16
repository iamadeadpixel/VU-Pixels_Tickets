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

-- does NOT support vehicles !
local GameMode_TDM = {
	["TeamDeathMatch0"] = "Team DeathMatch",
	["SquadDeathMatch0"] = "Squad Deathmatch",
	["TeamDeathMatchC0"] = "Team DeathMatch Close Quarters"
}

-- ------------------------------------------------------------------------------

-- TDM ticket rate 100% = 100 kills
local TDM100 = {
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
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",
	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market",
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline",

-- These are keku modded maps
	["Levels/COOP_002/COOP_002"] = "Hit and Run",
	["Levels/COOP_006/COOP_006"] = "Aygan Village",
	["Levels/COOP_010/COOP_010"] = "The Eleventh Hour",
	["Levels/SP_Jet/SP_Jet"] = "Carrier",
	["Levels/SP_Valley/SP_Valley"] = "Rock and a Hard Place",
	["Levels/SP_Villa/SP_Villa"] = "Kaffarov's Villa"
} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_TDM, p_GameMode_TDM, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_TDM = ServerUtils and ServerUtils:GetCustomGameModeName() or GameMode_TDM[p_GameMode_TDM] or p_GameMode_TDM

-- Contains ALL TDM map data
	s_LevelName_TDM = ServerUtils and ServerUtils:GetCustomMapName() or TDM100[p_LevelName_TDM] or p_LevelName_TDM
	
-- ------------------------------------------------------------------------------

	if (TDM100[p_LevelName_TDM] ~= nill) then
	if s_GameMode_TDM == "Team DeathMatch" or s_GameMode_TDM == "Team DeathMatch Close Quarters" then
	s_Tickets = tickets_TDM
	s_ratio = 1
	goto set_tickets

	elseif s_GameMode_TDM == "Squad Deathmatch" then
	s_Tickets = tickets_TDM_SQ
	s_ratio = 1
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
	if lm == p_LevelName_TDM  and s_GameMode_TDM == "Team DeathMatch" or s_GameMode_TDM == "Team DeathMatch Close Quarters" or s_GameMode_TDM == "Squad Deathmatch" then 
	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	s_MapData=s_GameMode_TDM

-- Data for the chat message
	m_GameMode = s_GameMode_TDM
	m_LevelName = s_LevelName_TDM
	m_tickets = " - Kills to make: "
	m_vehicles_status = ""
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
    print("**** Console spammer: Mapdata ****"); 
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName_TDM..' - GameMode:'..s_GameMode_TDM..' ')
	print(''..s_MapData..': - map tickets: '..MT[1]..' - '..MT[2]..' - '..MT[3]..' - '..MT[4]..' - '..MT[5]..' - '..MT[6]..' - '..MT[7]..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC[1]..'% - '..GMC[2]..'% - '..GMC[3]..'% - '..GMC[4]..'% - '..GMC[5]..'% - '..GMC[6]..'% - '..GMC[7]..'% ') 

	print(''..s_MapData..': - Player count: '..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - All presets loaded')  
end

end
end
end)
