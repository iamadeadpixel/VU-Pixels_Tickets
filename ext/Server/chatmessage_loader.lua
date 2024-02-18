	if Config.chatmessages then 
local announcedPlayers = {}

Events:Subscribe('Player:Respawn', function(player, recipientMask, message,info,yell)
	if announcedPlayers[player.name] then 	-- Return if the player has been announced already
	return
	end

	--

		local players = PlayerManager:GetPlayerCount()
	ChatManager:SendMessage(("Gamemode:" ..m_GameMode ), player ) 
	ChatManager:SendMessage(("MapName:" ..m_LevelName ), player ) 
	ChatManager:SendMessage(('Players on server: '..players..'  '..m_tickets..'  '..map_tickets..'') , player )
	ChatManager:SendMessage(('' ..m_vehicles..'  '..m_vehicles_status..'' ) , player )

	announcedPlayers[player.name] = true -- Add the player Id to the announcedPlayerIds table

end)

--

	Events:Subscribe('Player:Left', function(player)
		announcedPlayers[player.name] = false -- Removing the player Id from the announcedPlayerIds table
	end) 

--

	Events:Subscribe('Server:RoundReset', function()
	print("**** Restarting round ****"); 
end)

--

	Events:Subscribe('Level:Destroy', function()
	announcedPlayers = {}
end) 

end

