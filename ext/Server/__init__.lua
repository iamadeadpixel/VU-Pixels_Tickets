-- Checks if there is a newer version on server startup
require('UpdateCheck')

-- This is the config where u need to set the tickets for each gamemode.
require('__init_Tickets_config') -- Edit this if you want your own settings
require('LoadingLevelPrint')

require('Tickets_Config/ticket_loader_CQL') -- Cooked
require('Tickets_Config/ticket_loader_CQS') -- Cooked
require('Tickets_Config/ticket_loader_AS') -- Cooked
require('Tickets_Config/ticket_loader_TS') -- Cooked
require('Tickets_Config/ticket_loader_Domination') -- Cooked
require('Tickets_Config/ticket_loader_Scavenger') -- Cooked
require('Tickets_Config/ticket_loader_Assault') -- Cooked
require('Tickets_Config/ticket_loader_Assault2') -- Cooked
require('Tickets_Config/ticket_loader_Assault64') -- Cooked
require('Tickets_Config/ticket_loader_CTF') -- Cooked
require('Tickets_Config/ticket_loader_TDM') -- Contains data for TDM / TDM CQ / TDM SQ
require('Tickets_Config/ticket_loader_Rush') -- Cooked
require('Tickets_Config/ticket_loader_SQ_Rush') -- Cooked
require('Tickets_Config/ticket_loader_GunMaster') -- Contains Vanilla and Keku map data

-- New Gamemode for Keku maps
require('Tickets_Config/ticket_loader_HS_Keku') -- Cooked
require('Tickets_Config/ticket_loader_KOTH_Keku') -- Cooked

