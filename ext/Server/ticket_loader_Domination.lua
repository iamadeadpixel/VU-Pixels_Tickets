-- ------------------------------------------------------------------------------
-- does NOT support vehicles !
local global_GameModeNameMap = {
	["Domination0"] = "Domination",
}  

-- ------------------------------------------------------------------------------

-- Domination: ticket rate 100% = 150 tickets
local DOM150_LevelNameMap = {
	["Levels/XP2_Factory/XP2_Factory"] = "Scrapmetal",
	["Levels/XP2_Office/XP2_Office"] = "Operation 925",
	["Levels/XP2_Palace/XP2_Palace"] = "Donya Fortress",
	["Levels/XP2_Skybar/XP2_Skybar"] = "Ziba Tower",
} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_DOM, p_GameMode_DOM, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_DOM = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_DOM] or p_GameMode_DOM

-- Contains Domination map data
	s_LevelName_DOM = ServerUtils and ServerUtils:GetCustomMapName() or DOM150_LevelNameMap[p_LevelName_DOM] or p_LevelName_DOM and s_GameMode_DOM == "Domination"

-- ------------------------------------------------------------------------------
-- Calculating the ticketrate vs actual tickets
--  DOM150: ticket rate 100% = 150 Tickets - divider = 1.5

-- ------------------------------------------------------------------------------

	if (DOM150_LevelNameMap[p_LevelName_DOM] ~= nill) then
-- Conques modes: Here u can set the server tickets for Domination DOM150 maps
	s_vehicles = "false"
	s_vehicles_status = "Disabled"
	s_MapData="DOM150"

	map_tickets_00_04_DOM150 = var_00_04_DOM150
	map_tickets_05_10_DOM150 = var_05_10_DOM150
	map_tickets_11_20_DOM150 = var_11_20_DOM150

	map_tickets_00_04 = map_tickets_00_04_DOM150
	map_tickets_05_10 = map_tickets_05_10_DOM150
	map_tickets_11_20 = map_tickets_11_20_DOM150

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_DOM150/1.5) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_DOM150/1.5) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_DOM150/1.5) -- The value get some math magic

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
	if lm == p_LevelName_DOM  and s_GameMode_DOM == "Domination" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_DOM..') - Mapname: ('..s_LevelName_DOM..') ') 
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

