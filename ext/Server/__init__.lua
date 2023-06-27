-- Checks if there is a newer version on server startup
require('UpdateCheck')

-- This the config where u need to set the tickets for each gamemode.
require('ticket_loader_Config')

-- At this point, only 1 can be active, needto fix that bug, fixing keku stuff
-- Ticket count per game mode
require('__init_vanilla_loader')
-- Use with care, there still some bugs what cant find yet..
--require('__init_keku_loader')


