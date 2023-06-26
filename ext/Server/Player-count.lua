-- ------------------------------------------------------------------------------

	local s_MaxPlayersRCON = RCON:SendCommand('vars.maxPlayers')
	local s_MaxPlayers = tonumber(s_MaxPlayersRCON[2])
	
	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Setting map tickets: '..map_tickets_00_04..' - '..map_tickets_05_12..' - '..map_tickets_13_24..' - '..map_tickets_25_32..' - '..map_tickets_33_48..' - '..map_tickets_49_64..' - '..map_tickets_65_128..' ') 
	print(''..s_MapData..': - GameMode Counter data '..GameModeCounter_00_04..'% - '..GameModeCounter_05_12..'% - '..GameModeCounter_13_24..'% - '..GameModeCounter_25_32..'% - '..GameModeCounter_33_48..'% - '..GameModeCounter_49_64..'% - '..GameModeCounter_65_128..'% ') 
	print(''..s_MapData..': - Setting server tickets and GameMode Counter ') 

-- ------------------------------------------------------------------------------

	local players = PlayerManager:GetPlayerCount()
	if players <= 4 then
	ticket_gmc = GameModeCounter_00_04
	map_tickets = map_tickets_00_04
	player_count = player_count_00_04
	goto rcon
      
	elseif players >= 5 and players <= 12 then
	ticket_gmc = GameModeCounter_05_12
	map_tickets = map_tickets_05_12
	player_count = player_count_05_12
	goto rcon
      
	elseif players >= 13 and players <= 24 then
	ticket_gmc = GameModeCounter_13_24
	map_tickets = map_tickets_13_24
	player_count = player_count_13_24
	goto rcon

	elseif players >= 25 and players <= 32 then
	ticket_gmc = GameModeCounter_25_32
	map_tickets = map_tickets_25_32
	player_count = player_count_25_32
	goto rcon

	elseif players >= 33 and players <= 48 then
	ticket_gmc = GameModeCounter_33_48
	map_tickets = map_tickets_33_48
	player_count = player_count_33_48
	goto rcon


	elseif players >= 49 and players <= 64 then
	ticket_gmc = GameModeCounter_49_64
	map_tickets = map_tickets_49_64
	player_count = player_count_49_64
	goto rcon

	elseif players >= 65 and players <= 128 then
	ticket_gmc = GameModeCounter_65_128
	map_tickets = map_tickets_65_128
	player_count = player_count_65_128
	goto rcon
end

::rcon:: 
	RCON:SendCommand('vars.gameModeCounter', { tostring(ticket_gmc) }) 
        RCON:SendCommand('vars.vehicleSpawnAllowed', { tostring(s_vehicles) }) 
	print(''..s_MapData..': - Player count:'..player_count..' players - Max players:'..s_MaxPlayers..' - Current: '..players..' - tickets set to '..map_tickets..' - GameMode Counter '..ticket_gmc..'%')
	print(''..s_MapData..': - Vehicles are '..s_vehicles_status..' ')  
	print(''..s_MapData..': - All presets loaded')  

end
end)
