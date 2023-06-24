-- Checks if there is a newer version on server startup
--UpdateCheck.lua

-- This the config where u need to set the tickets for each gamemode.
require('ticket_loader_Config')

-- Ticket count per game mode
require('ticket_loader_CQL')
require('ticket_loader_CQS')
require('ticket_loader_AS')
require('ticket_loader_Scavenger')
require('ticket_loader_TS')
require('ticket_loader_TDM')
require('ticket_loader_TDM_CQ')
require('ticket_loader_TDM_SQ')
require('ticket_loader_Rush')
require('ticket_loader_SQ_Rush')
require('ticket_loader_CTF')
require('ticket_loader_Domination')
require('ticket_loader_Assault')
require('ticket_loader_Assault64')
require('ticket_loader_Assault2')

-- No need to edit this, GunMaster has its own fixed setup.
require('ticket_loader_GunMaster')

