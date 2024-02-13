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
local global_GameModeNameMap = {
	["TeamDeathMatch0"] = "TDM",
	["SquadDeathMatch0"] = "Squad Deathmatch",
	["TeamDeathMatchC0"] = "Team DeathMatch Close Quarters"
}

-- ------------------------------------------------------------------------------
-- TDM ticket rate 100% = 100 kills
local TDM100_LevelNameMap = {
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
	local s_GameMode_TDM = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_TDM] or p_GameMode_TDM

-- Contains ALL TDM map data
	s_LevelName_TDM = ServerUtils and ServerUtils:GetCustomMapName() or TDM100_LevelNameMap[p_LevelName_TDM] or p_LevelName_TDM -- and s_GameMode_TDM == "TDM" or s_GameMode_TDM == "Team DeathMatch Close Quarters"
	
-- ------------------------------------------------------------------------------

	if (TDM100_LevelNameMap[p_LevelName_TDM] ~= nill) then
	if s_GameMode_TDM == "TDM" or s_GameMode_TDM == "Team DeathMatch Close Quarters" then

	s_vehicles = "false"
	s_vehicles_status = "disabled"

	map_tickets_00_04 = (tickets_TDM[1])
	map_tickets_05_12 = (tickets_TDM[2])
	map_tickets_13_24 = (tickets_TDM[3])
	map_tickets_25_32 = (tickets_TDM[4])
	map_tickets_33_48 = (tickets_TDM[5])
	map_tickets_49_64 = (tickets_TDM[6])
	map_tickets_65_128 = (tickets_TDM[7])

	GMC_00_04 = math.floor(map_tickets_00_04/1)
	GMC_05_12 = math.floor(map_tickets_05_12/1)
	GMC_13_24 = math.floor(map_tickets_13_24/1)
	GMC_25_32 = math.floor(map_tickets_25_32/1)
	GMC_33_48 = math.floor(map_tickets_33_48/1)
	GMC_49_64 = math.floor(map_tickets_49_64/1)
	GMC_65_128 = math.floor(map_tickets_65_128/1) 

	elseif s_GameMode_TDM == "Squad Deathmatch" then

	s_vehicles = "false"
	s_vehicles_status = "Disabled"

	map_tickets_00_04 = (tickets_TDM_SQ[1])
	map_tickets_05_12 = (tickets_TDM_SQ[2])
	map_tickets_13_24 = (tickets_TDM_SQ[3])
	map_tickets_25_32 = (tickets_TDM_SQ[4])
	map_tickets_33_48 = (tickets_TDM_SQ[5])
	map_tickets_49_64 = (tickets_TDM_SQ[6])
	map_tickets_65_128 = (tickets_TDM_SQ[7])

	GMC_00_04 = math.floor(map_tickets_00_04/1)
	GMC_05_12 = math.floor(map_tickets_05_12/1)
	GMC_13_24 = math.floor(map_tickets_13_24/1)
	GMC_25_32 = math.floor(map_tickets_25_32/1)
	GMC_33_48 = math.floor(map_tickets_33_48/1)
	GMC_49_64 = math.floor(map_tickets_49_64/1)
	GMC_65_128 = math.floor(map_tickets_65_128/1) 
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_TDM  and s_GameMode_TDM == "TDM" or s_GameMode_TDM == "Team DeathMatch Close Quarters" or s_GameMode_TDM == "Squad Deathmatch" then

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
end
end)

