-- Checks if there is a newer version on server startup
require('UpdateCheck')

-- This is the config where u need to set the tickets for each gamemode.
require('__init_Tickets_config') -- Edit this if you want your own settings

require('Tickets_Config/ticket_loader_CQL')
require('Tickets_Config/ticket_loader_CQS')
require('Tickets_Config/ticket_loader_AS')
require('Tickets_Config/ticket_loader_TS')
require('Tickets_Config/ticket_loader_Domination')
require('Tickets_Config/ticket_loader_Scavenger')
require('Tickets_Config/ticket_loader_Assault')
require('Tickets_Config/ticket_loader_Assault64')
require('Tickets_Config/ticket_loader_Assault2')
require('Tickets_Config/ticket_loader_CTF')
require('Tickets_Config/ticket_loader_TDM')
require('Tickets_Config/ticket_loader_TDM_CQ')
require('Tickets_Config/ticket_loader_TDM_SQ')
require('Tickets_Config/ticket_loader_Rush')
require('Tickets_Config/ticket_loader_SQ_Rush')
require('Tickets_Config/ticket_loader_GunMaster') -- Contains Vanilla and Keku map data

-- New Gamemode for Keku maps
require('Tickets_Config/ticket_loader_HS_Keku')
require('Tickets_Config/ticket_loader_KOTH_Keku')
