require('config') -- Turn on or off Chatmessage spammer, Console spammer and the updatecheck
require('chatmessage_loader') -- Spams one time only on player spawn the gamemode,levelname and ticket count
require('UpdateCheck') -- Checks if there is a newer version on server startup
require('More_Heli_Superiority_Choppers')

require('Tickets_config') -- Edit this file if you want your own ticket settings
	require('Tickets_Config/Loader_CQL')
	require('Tickets_Config/Loader_CQS')
	require('Tickets_Config/Loader_AS')
	require('Tickets_Config/Loader_TS')
	require('Tickets_Config/Loader_GunMaster')
	require('Tickets_Config/Loader_Assault')
	require('Tickets_Config/Loader_Assault2')
	require('Tickets_Config/Loader_Assault64')
	require('Tickets_Config/Loader_CTF')
	require('Tickets_Config/Loader_Domination')
	require('Tickets_Config/Loader_Scavenger')
	require('Tickets_Config/Loader_TDM') -- Contains data for TDM / TDM CQ / TDM SQ
	require('Tickets_Config/Loader_Rush') -- Contains Rush and Squad Rush data

-- New Gamemode for Keku maps
	require('Tickets_Config/Loader_HS_Keku')
	require('Tickets_Config/Loader_KOTH_Keku')

