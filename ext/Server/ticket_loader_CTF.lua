-- ------------------------------------------------------------------------------

local global_GameModeNameMap = {
	["CaptureTheFlag0"] = "CTF"
}  

-- ------------------------------------------------------------------------------
-- CTF Maps Vehicles disabled:
local CTF_Disabled_LevelNameMap = {
}

-- ------------------------------------------------------------------------------
-- CTF 3 Flags = 100%
local CTF_LevelNameMap = {
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_CTF, p_GameMode_CTF, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_CTF = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_CTF] or p_GameMode_CTF

-- Contains CTF map data
	s_LevelName_CTF = ServerUtils and ServerUtils:GetCustomMapName() or CTF_LevelNameMap[p_LevelName_CTF] or p_LevelName_CTF and s_GameMode_CTF == "CTF"

-- CTF Maps Vehicles disabled
	local d_LevelName = ServerUtils and ServerUtils:GetCustomMapName() or CTF_Disabled_LevelNameMap[p_LevelName_CTF]
-- ------------------------------------------------------------------------------

-- Calculating the ticketrate vs actual tickets
-- CTF: CTF ticket rate 100% = 3 flags - divider = 1

-- ------------------------------------------------------------------------------

	if (CTF_LevelNameMap[p_LevelName_CTF] ~= nill) then
-- CTF modes: Here u can set the server tickets for CTF maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="CTF"

	map_tickets_00_04_CTF = var_00_04_CTF
	map_tickets_05_10_CTF = var_05_10_CTF
	map_tickets_11_20_CTF = var_11_20_CTF

	map_tickets_00_04 = map_tickets_00_04_CTF
	map_tickets_05_10 = map_tickets_05_10_CTF
	map_tickets_11_20 = map_tickets_11_20_CTF

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_CTF*34) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_CTF*34) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_CTF*34) -- The value get some math magic

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
	if d_LevelName == s_LevelName_CTF and global_GameModeNameMap[p_GameMode_CTF] == "CTF" then
		s_vehicles = "false"
	s_vehicles_status = "Disabled"
end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_CTF  and s_GameMode_CTF == "CTF" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_CTF..') - Mapname: ('..s_LevelName_CTF..') ') 
	print(''..s_MapData..': - Setting CTF Flag tickets: '..map_tickets_00_04..' - '..map_tickets_05_10..' - '..map_tickets_11_20..'') 
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
