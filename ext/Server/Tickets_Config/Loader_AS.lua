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
local GameMode_AS = {
	["AirSuperiority0"] = "Air Superiority"
	} 

-- ------------------------------------------------------------------------------

-- Air Superiority: ticket rate 100% = 250 Tickets
local AS250 = {
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
	local s_GameMode_AS = ServerUtils and ServerUtils:GetCustomGameModeName() or GameMode_AS[p_GameMode_AS] or p_GameMode_AS

-- Contains Air Superiority map data
	s_LevelName_AS = ServerUtils and ServerUtils:GetCustomMapName() or AS250[p_LevelName_AS] or p_LevelName_AS

-- ------------------------------------------------------------------------------

	if (AS250[p_LevelName_AS] ~= nill) then
	s_Tickets = tickets_AS
	s_ratio = 2.5
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
	if lm == p_LevelName_AS  and s_GameMode_AS == "Air Superiority" then

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	s_MapData=s_GameMode_AS

-- Data for the chat message when the map has Vehicles enabled (Default)
	m_GameMode = s_GameMode_AS
	m_LevelName = s_LevelName_AS
	m_vehicles_status = "Enabled"

	m_tickets = " - Blimp Tickets: "
	m_vehicles = "Vehicles are:"

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
	print(''..s_MapData..': - level data: Mapname:'..s_LevelName_AS..' - GameMode:'..s_GameMode_AS..' ')
	print(''..s_MapData..': - map tickets: '..MT[1]..' - '..MT[2]..' - '..MT[3]..' - '..MT[4]..' - '..MT[5]..' - '..MT[6]..' - '..MT[7]..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GMC[1]..'% - '..GMC[2]..'% - '..GMC[3]..'% - '..GMC[4]..'% - '..GMC[5]..'% - '..GMC[6]..'% - '..GMC[7]..'% ') 

	print(''..s_MapData..': - Player count: '..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  
end

end
end)
