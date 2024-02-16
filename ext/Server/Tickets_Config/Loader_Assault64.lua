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
local GameMode_Assault64 = {
	["ConquestAssaultLarge0"] = "Assault64"
	} 

-- ------------------------------------------------------------------------------

-- Assault64 Maps Vehicles disabled: Make it more Infantry friendly.
-- If you dont want vehicles active on these maps, remove the -- in front,and restart the server.
-- Make sure that the last entry has NO , on the end !

local Assault64_Disabled = {
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market"

}

-- ------------------------------------------------------------------------------

-- Assault64: US 400 / RU 350 Tickets
local Assault64_400_350 = {
	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market"
}

-- ------------------------------------------------------------------------------

-- Assault64: US 400 / RU 300 Tickets
local Assault64_400_300 = {
	["Levels/XP1_004/XP1_004"] = "Wake Island"
}

-- ------------------------------------------------------------------------------

-- Assault64: US 300 / RU 350 Tickets
local Assault64_350_300 = {
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula"
}

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_Assault64, p_GameMode_Assault64, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Assault64 = ServerUtils and ServerUtils:GetCustomGameModeName() or GameMode_Assault64[p_GameMode_Assault64] or p_GameMode_Assault64

-- Contains Assault64 map data
	local s_LevelName_Assault64 = ServerUtils and ServerUtils:GetCustomMapName() or Assault64_400_350[p_LevelName_Assault64] or Assault64_400_300[p_LevelName_Assault64] or Assault64_350_300[p_LevelName_Assault64] or p_LevelName_Assault64

-- Assault64 Maps Vehicles disabled
	local d_LevelName_Assault64 = ServerUtils and ServerUtils:GetCustomMapName() or Assault64_Disabled[p_LevelName_Assault64]

-- ------------------------------------------------------------------------------

	if (Assault64_400_350[p_LevelName_Assault64] ~= nill) then
	s_Tickets = tickets_Assault64_400_350
	s_ratio = 4
	goto set_tickets

	elseif (Assault64_400_300[p_LevelName_Assault64] ~= nill) then
	s_Tickets = tickets_Assault64_400_300
	s_ratio = 4
	goto set_tickets

	elseif (Assault64_350_300[p_LevelName_Assault64] ~= nill) then
	s_Tickets = tickets_Assault64_350_300
	s_ratio = 3.5
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
	if lm == p_LevelName_Assault64  and s_GameMode_Assault64 == "Assault64" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	s_MapData=s_GameMode_Assault64

-- Data for the chat message when the map has Vehicles enabled (Default)
	m_GameMode = s_GameMode_Assault64
	m_LevelName = s_LevelName_Assault64
	m_vehicles_status = "Enabled"

	m_tickets = " - Flag Tickets: "
	m_vehicles = "Vehicles are:"

-- ------------------------------------------------------------------------------

-- If a map is in the Assault64_Disabled table, This turns off the vehicle flag.
	if d_LevelName_Assault64 == s_LevelName_Assault64  and GameMode_Assault64[p_GameMode_Assault64] == "Assault64" then
	s_vehicles = "false"
	s_vehicles_status = "Disabled"
	m_vehicles_status = "Disabled"
end

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
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName_Assault64..' - GameMode:'..s_GameMode_Assault64..' ')
	print(''..s_MapData..': - map tickets: '..MT[1]..' - '..MT[2]..' - '..MT[3]..' - '..MT[4]..' - '..MT[5]..' - '..MT[6]..' - '..MT[7]..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC[1]..'% - '..GMC[2]..'% - '..GMC[3]..'% - '..GMC[4]..'% - '..GMC[5]..'% - '..GMC[6]..'% - '..GMC[7]..'% ') 

	print(''..s_MapData..': - Player count: '..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  
end

end
end)
