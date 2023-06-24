-- ------------------------------------------------------------------------------

-- Global GameMode data
local global_GameModeNameMap = {
	["AirSuperiority0"] = "Air Superiority"
	} 

-- ------------------------------------------------------------------------------

-- Air Superiority: ticket rate 100% = 250 Tickets
local AS250_LevelNameMap = {
	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline"
}

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_AS, p_GameMode_AS, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_AS = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_AS] or p_GameMode_AS

-- Contains Air Superiority map data
	s_LevelName_AS = ServerUtils and ServerUtils:GetCustomMapName() or AS250_LevelNameMap[p_LevelName_AS] or p_LevelName_AS and s_GameMode_AS == "Air Superiority"

-- ------------------------------------------------------------------------------
-- Calculating the ticketrate vs actual tickets
--  AS250: ticket rate 100% = 250 Tickets - divider = 2.5

-- ------------------------------------------------------------------------------

	if (AS250_LevelNameMap[p_LevelName_AS] ~= nill) then
-- Conques modes: Here u can set the server tickets for Air Superiority AS250 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="AS250"

	map_tickets_00_04_AS250 = var_00_04_AS250
	map_tickets_05_10_AS250 = var_05_10_AS250
	map_tickets_11_20_AS250 = var_11_20_AS250

	map_tickets_00_04 = map_tickets_00_04_AS250
	map_tickets_05_10 = map_tickets_05_10_AS250
	map_tickets_11_20 = map_tickets_11_20_AS250

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_AS250/2.5) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_AS250/2.5) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_AS250/2.5) -- The value get some math magic

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

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_AS..') - Mapname: ('..s_LevelName_AS..') ') 
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

