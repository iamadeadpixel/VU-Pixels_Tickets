local announcedPlayers = {}

Events:Subscribe('Player:Respawn', function(player, recipientMask, message,info,yell)
	if spawnmessagecounter == nil then spawnmessagecounter=1 end
	-- Return if the player has been announced already
	if announcedPlayers[player.name] then
	return
	end



	if s_MapData == "Team DeathMatch" or s_MapData == "Team DeathMatch Close Quarters" or s_MapData == "Squad Deathmatch" or s_MapData == "Rush" or s_MapData == "Squad Rush" then
			m_tickets = " - Kills to make: "

		elseif s_MapData ==  "Capture the flag" then
			m_tickets = " - Flags to capture: "

		elseif s_MapData == "Conquest Large" or s_MapData == "Conquest Small" or s_MapData == "Assault" or s_MapData == "Assault64" or s_MapData ==  "Assault #2" or s_MapData == "Domination" or s_MapData ==  "Tank Superiority" or s_MapData ==  "Scavenger" or s_MapData ==  "Air Superiority" or s_MapData ==  "King of the hill" or s_MapData ==  "Heli Superiority" then
			m_tickets = " - Flag Tickets: "

		elseif s_MapData ==  "Gun Master" then
			m_tickets = ""
			map_tickets = ""
		end

		local players = PlayerManager:GetPlayerCount()
	ChatManager:SendMessage(("Gamemode::" ..s_GameMode  ), player ) 
	ChatManager:SendMessage(("MapName::" ..s_LevelName  ), player ) 
	ChatManager:SendMessage(('Players on server: '..players..'  '..m_tickets..'  '..map_tickets..'') , player )

	    -- Add the player Id to the announcedPlayerIds table
    announcedPlayers[player.name] = true

--	end
end)

Events:Subscribe('Level:Destroy', function()
announcedPlayers = {}
end) 
