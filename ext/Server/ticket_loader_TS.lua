-- ------------------------------------------------------------------------------

local global_GameModeNameMap = {
	["TankSuperiority0"] = "Tank Superiority"
}  

-- Tank Superiority: ticket rate 100% = 200 Tickets
local TS200_LevelNameMap = {
	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley"
} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_TS, p_GameMode_TS, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_TS = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_TS] or p_GameMode_TS

-- Contains Tank Superiority map data
	s_LevelName_TS = ServerUtils and ServerUtils:GetCustomMapName() or TS200_LevelNameMap[p_LevelName_TS] or p_LevelName_TS and s_GameMode_TS == "Tank Superiority"

-- ------------------------------------------------------------------------------
-- Calculating the ticketrate vs actual tickets
--  TS200: ticket rate 100% = 200 Tickets - divider = 2

-- ------------------------------------------------------------------------------

	if (TS200_LevelNameMap[p_LevelName_TS] ~= nill) then
-- Conques modes: Here u can set the server tickets for Tank Superiority TS200 maps
	s_vehicles = "true"
	s_vehicles_status = "Enabled"
	s_MapData="TS200"

	map_tickets_00_04_TS200 = var_00_04_TS200
	map_tickets_05_10_TS200 = var_05_10_TS200
	map_tickets_11_20_TS200 = var_11_20_TS200

	map_tickets_00_04 = map_tickets_00_04_TS200
	map_tickets_05_10 = map_tickets_05_10_TS200
	map_tickets_11_20 = map_tickets_11_20_TS200

	s_ticket_gmc_00_04 = math.floor(map_tickets_00_04_TS200/2) -- The value get some math magic
	s_ticket_gmc_05_10 = math.floor(map_tickets_05_10_TS200/2) -- The value get some math magic
	s_ticket_gmc_11_20 = math.floor(map_tickets_11_20_TS200/2) -- The value get some math magic

end

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
--	print('LM Status: '..lm..' - '..p_LevelName_TS..' ') 

-- ------------------------------------------------------------------------------

-- What ever it is what this do.
	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

-- ------------------------------------------------------------------------------

	if lm == p_LevelName_TS  and s_GameMode_TS == "Tank Superiority" then

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_TS..') - Mapname: ('..s_LevelName_TS..') ') 
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

