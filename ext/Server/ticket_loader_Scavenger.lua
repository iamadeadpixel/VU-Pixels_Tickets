-- ------------------------------------------------------------------------------
-- does NOT support vehicles !
local global_GameModeNameMap = {
	["Scavenger0"] = "Scavenger"
}  

-- ------------------------------------------------------------------------------

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
-- Calculating the ticketrate vs actual tickets
--  SCAV300: ticket rate 100% = 300 Tickets - divider = 3

-- ------------------------------------------------------------------------------

	if (SCAV300_LevelNameMap[p_LevelName_SCAV] ~= nill) then
-- Conques modes: Here u can set the server tickets for Scavenger SCAV300 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="SCAV300"

	map_tickets_00_04_SCAV300 = var_00_04_SCAV300
	map_tickets_05_10_SCAV300 = var_05_10_SCAV300
	map_tickets_11_20_SCAV300 = var_11_20_SCAV300

	map_tickets_00_04 = map_tickets_00_04_SCAV300
	map_tickets_05_10 = map_tickets_05_10_SCAV300
	map_tickets_11_20 = map_tickets_11_20_SCAV300

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_SCAV300/3) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_SCAV300/3) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_SCAV300/3) -- The value get some math magic

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

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_SCAV..') - Mapname: ('..s_LevelName_SCAV..') ') 
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

