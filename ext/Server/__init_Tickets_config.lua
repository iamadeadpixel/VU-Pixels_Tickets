-- ---------------------------------------

-- Global player count data
player_counter = {
	"0 - 4",
	"5 - 12",
	"13 - 12",
	"25 - 32",
	"33 - 48",
	"49 - 64",
	"64 - 128"
	}


-- ---------------------------------------
-- ---------------------------------------


-- King of the hill ticket count config.
-- Keku game mode

-- based on a 100% gamemodecounter ,the default ticket rate is 200 tickets

-- Tickets set for the following maps:
-- Grand Bazaar , Teheran Highway , Caspian Border
-- Bandar Desert , Gulf of Oman , Aygan Village

tickets_KOTH_200 = {
	"100", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}
 

-- ---------------------------------------
-- ---------------------------------------

-- Heli Superiority ticket count config.
-- Keku game mode

-- based on a 100% gamemodecounter ,the default ticket rate is 200 tickets

-- Tickets set for the following maps:
-- Caspian Border , Operation Firestorm , Damavand Peak , Noshahr Canals
-- Kharg Island , Gulf of Oman Sharqi , Peninsula , Wake Island
-- Alborz Mountains , Bandar Desert , Armored Shield , Death Valley
-- Markaz Monolith , Operation Riverside , Nebandan Flats 
-- Kiasar Railroad , Sabalan Pipeline

tickets_HS_200 = {
	"100", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- TDM and TDM Close Quarters Kill ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 100 kills

-- Tickets set for the following maps:
-- BF3: TDM: Grand Bazaar - Teheran Highway - Caspian Border - Seine Crossing - Operation Firestorm
-- Damavand Peak - Noshahr Canals - Kharg Island - Operation Metro - Strike at Karkand
-- Gulf of Oman - Sharqi Peninsula - Wake Island - Bandar Desert - Alborz Mountains 
-- Armored Shield - Death Valley - Markaz Monolith - Azadi Palace - Epicenter 
-- Talah Market - Operation Riverside - Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- TDM: Keku maps: Aygan Village - Carrier - Rock and a Hard Place
-- ---------------------------------------

-- BF3: TDM CQ: Grand Bazaar - Teheran Highway - Caspian Border - Seine Crossing - Operation Firestorm
-- Damavand Peak - Noshahr Canals - Kharg Island - Operation Metro - Strike at Karkand 
-- Gulf of Oman - Sharqi Peninsula - Wake Island - Scrapmetal - Operation 925
-- Donya Fortress - Ziba Tower - Bandar Desert - Alborz Mountains - Armored Shield
-- Death Valley - Markaz Monolith - Azadi Palace - Epicenter - Talah Market
-- Operation Riverside - Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- TDM CQ: Keku maps: Hit and Run - Kaffarov's Villa - Rock and a Hard Place - Carrier- Aygan Village

	tickets_TDM = {
	"40", -- Ticket ratio for 0 - 4 players
	"80", -- Ticket ratio for 5 - 12 players
	"120", -- Ticket ratio for 13 - 24 players
	"150", -- Ticket ratio for 25 - 32 players
	"200", -- Ticket ratio for 33 - 48 players
	"250", -- Ticket ratio for 49 - 64 players
	"400" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- Squad TDM Kill ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 50 kills

-- Tickets set for the following maps:
-- BF3: Grand Bazaar - Teheran Highway - Caspian Border - Seine Crossing - Operation Firestorm
-- Damavand Peak - Noshahr Canals - Kharg Island - Operation Metro - Strike at Karkand
-- Gulf of Oman - Sharqi Peninsula - Wake Island - Scrapmetal - Operation 925
-- Donya Fortress - Ziba Tower - Bandar Desert - Alborz Mountains - Armored Shield
-- Death Valley - Markaz Monolith - Azadi Palace - Epicenter - Talah Market
-- Operation Riverside - Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- keku maps: Hit and Run - Aygan Village - Carrier - Kaffarov's Villa - Rock and a Hard Place

tickets_TDM_SQ = {
	"15", -- Ticket ratio for 0 - 4 players
	"30", -- Ticket ratio for 5 - 12 players
	"45", -- Ticket ratio for 13 - 24 players
	"60", -- Ticket ratio for 25 - 32 players
	"75", -- Ticket ratio for 33 - 48 players
	"90", -- Ticket ratio for 49 - 64 players
	"150" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Tank Superiority ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 200 tickets

-- Tickets set for the following maps:
-- BF3: Bandar Desert - Alborz Mountains - Armored Shield - Death Valley

tickets_TS = {
	"200", -- Ticket ratio for 0 - 4 players
	"350", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"650", -- Ticket ratio for 25 - 32 players
	"800", -- Ticket ratio for 33 - 48 players
	"950", -- Ticket ratio for 49 - 64 players
	"1200" -- Ticket ratio for 65 - 128 players
	}

-- ---------------------------------------
-- ---------------------------------------


-- Scavenger ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 300 tickets

-- Tickets set for the following maps:
-- BF3: Markaz Monolith - Azadi Palace - Epicenter - Talah Market

tickets_Scavenger = {
	"125", -- Ticket ratio for 0 - 4 players
	"200", -- Ticket ratio for 5 - 12 players
	"300", -- Ticket ratio for 13 - 24 players
	"400", -- Ticket ratio for 25 - 32 players
	"500", -- Ticket ratio for 33 - 48 players
	"600", -- Ticket ratio for 49 - 64 players
	"800" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- CTF flag ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 3 flags

-- Tickets set for the following maps:
-- BF3: Operation Riverside - Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- Keku maps: Grand Bazaar - Teheran Highway - Caspian Border - Seine Crossing - Operation Firestorm
-- Damavand Peak - Noshahr Canals - Kharg Island - Operation Metro - Strike at Karkand
-- Gulf of Oman - Sharqi Peninsula - Wake Island - Scrapmetal - Operation 925
-- Donya Fortress - Ziba Tower - Alborz Mountains - Bandar Desert - Armored Shield
-- Death Valley - Markaz Monolith - Azadi Palace - Epicenter - Talah Market - Hit and Run

tickets_CTF = {
	"2", -- Ticket ratio for 0 - 4 players
	"3", -- Ticket ratio for 5 - 12 players
	"5", -- Ticket ratio for 13 - 24 players
	"5", -- Ticket ratio for 25 - 32 players
	"6", -- Ticket ratio for 33 - 48 players
	"6", -- Ticket ratio for 49 - 64 players
	"8" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Air Superiority ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 250 tickets

-- Tickets set for the following maps:
-- BF3: Operation Riverside - Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- Keku maps: XP2_Skybar

tickets_AS = {
	"150", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Domination ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 150 tickets

-- Tickets set for the following maps:
-- BF3: Scrapmetal - Operation 925 - Donya Fortress - Ziba Tower

-- Keku maps: Grand Bazaar - Teheran Highway - Caspian Border - Seine Crossing - Operation Firestorm
-- Damavand Peak - Noshahr Canals - Kharg Island - Operation Metro - Strike at Karkand
-- Gulf of Oman - Sharqi Peninsula - Wake Island - Alborz Mountains - Bandar Desert
-- Armored Shield - Death Valley - Markaz Monolith - Azadi Palace - Epicenter
-- Talah Market - Operation Riverside - Nebandan Flats - Kiasar Railroad
-- Sabalan Pipeline - Hit and Run - Carrier - Kaffarov's Villa

tickets_Domination = {
	"100", -- Ticket ratio for 0 - 4 players
	"200", -- Ticket ratio for 5 - 12 players
	"300", -- Ticket ratio for 13 - 24 players
	"400", -- Ticket ratio for 25 - 32 players
	"500", -- Ticket ratio for 33 - 48 players
	"600", -- Ticket ratio for 49 - 64 players
	"800" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------

-- Squad Rush ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 20 tickets

-- Tickets set for the following maps:
-- BF3: Grand Bazaar - Teheran Highway - Caspian Border - Seine Crossing - Operation Firestorm
-- Damavand Peak - Noshahr Canals - Kharg Island - Operation Metro - Strike at Karkand
-- Gulf of Oman - Sharqi Peninsula - Wake Island - Bandar Desert - Alborz Mountains 
-- Armored Shield - Death Valley - Markaz Monolith - Azadi Palace - Epicenter
-- Talah Market - Operation Riverside - Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- Keku maps: Scrapmetal - Operation 925 - Donya Fortress - Ziba Tower - Hit and Run
-- Aygan Village - The Eleventh Hour - Carrier - Rock and a Hard Place - Kaffarov's Villa

tickets_Rush_SQ = {
	"20", -- Ticket ratio for 0 - 4 players
	"40", -- Ticket ratio for 5 - 12 players
	"60", -- Ticket ratio for 13 - 24 players
	"80", -- Ticket ratio for 25 - 32 players
	"100", -- Ticket ratio for 33 - 48 players
	"150", -- Ticket ratio for 49 - 64 players
	"200" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Rush ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 75 tickets

-- Tickets set for the following maps:
-- BF3: Grand Bazaar - Teheran Highway - Caspian Border - Seine Crossing - Operation Firestorm
-- Damavand Peak - Noshahr Canals - Kharg Island - Strike at Karkand - Gulf of Oman
-- Wake Island - Bandar Desert - Alborz Mountains - Armored Shield - Death Valley
-- Markaz Monolith - Azadi Palace - Epicenter - Talah Market - Operation Riverside
-- Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- Keku maps: Aygan Village - Rock and a Hard Place

tickets_Rush_75 = {
	"75", -- Ticket ratio for 0 - 4 players
	"150", -- Ticket ratio for 5 - 12 players
	"275", -- Ticket ratio for 13 - 24 players
	"350", -- Ticket ratio for 25 - 32 players
	"525", -- Ticket ratio for 33 - 48 players
	"600", -- Ticket ratio for 49 - 64 players
	"800" -- Ticket ratio for 65 - 128 players
	}

   
-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 100 tickets

-- Tickets set for the following maps:
-- BF3: Operation Metro - Sharqi Peninsula

tickets_Rush_100 = {
	"100", -- Ticket ratio for 0 - 4 players
	"200", -- Ticket ratio for 5 - 12 players
	"300", -- Ticket ratio for 13 - 24 players
	"400", -- Ticket ratio for 25 - 32 players
	"500", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Conquest Large Ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 400 tickets

-- Tickets set for the following maps:
-- BF3: Grand Bazaar - Seine Crossing - Markaz Monolith - Azadi Palace - Epicenter

tickets_CQL400 = {
	"200", -- Ticket ratio for 0 - 4 players
	"350", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 350 tickets

-- Tickets set for the following maps:
-- BF3: Operation Metro - Gulf of Oman

tickets_CQL350 = {
	"200", -- Ticket ratio for 0 - 4 players
	"350", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 300 tickets

-- Tickets set for the following maps:
-- BF3: Teheran Highway - Caspian Border - Operation Firestorm - Damavand Peak
-- Noshahr Canals - Kharg Island - Bandar Desert - Armored Shield
-- Death Valley - Kiasar Railroad - Sabalan Pipeline

 -- Keku maps: SP_Valley

tickets_CQL300 = {
	"150", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"450", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 250 tickets

-- Tickets set for the following maps:
-- BF3: Alborz Mountains

tickets_CQL250 = {
	"200", -- Ticket ratio for 0 - 4 players
	"400", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- Tickets set for the following maps:

-- based on a 100% gamemodecounter ,the default ticket rate is 200 tickets
-- Tickets set for the following maps:
-- BF3: Operation Riverside - Nebandan Flats

tickets_CQL200 = {
	"200", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Conquest Small Ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 350 tickets

-- Tickets set for the following maps:
-- BF3: Operation Metro

tickets_CQS350 = {
	"150", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"650", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 300 tickets

-- Tickets set for the following maps:
-- BF3: Gulf of Oman

tickets_CQS300 = {
	"200", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 250 tickets

-- Tickets set for the following maps:
-- BF3: Grand Bazaar - Teheran Highway - Seine Crossing - Damavand Peak - Noshahr Canals
-- Alborz Mountains - Markaz Monolith - Azadi Palace - Epicenter

tickets_CQS250 = {
	"200", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 200 tickets

-- Tickets set for the following maps:
-- BF3: Operation Firestorm - Kharg Island - Bandar Desert - Armored Shield - Death Valley
-- Operation Riverside - Nebandan Flats - Kiasar Railroad - Sabalan Pipeline

-- Keku maps: COOP_006

tickets_CQS200 = {
	"200", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- based on a 100% gamemodecounter ,the default ticket rate is 150 tickets

-- Tickets set for the following maps:
-- Caspian Border

tickets_CQS150 = {
	"150", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Assault ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 300_250

-- Tickets set for the following maps:
-- BF3: Strike at Karkand - Talah Market

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault_300 = {
	"150", -- Ticket ratio for 0 - 4 players
	"400", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 300_220

-- Tickets set for the following maps:
-- BF3: Wake Island

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault_300_Wake = {
	"150", -- Ticket ratio for 0 - 4 players
	"400", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 230_200

-- Tickets set for the following maps:
-- BF3: Gulf of Oman

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault_230 = {
	"230", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 250_200
-- Tickets set for the following maps:
-- BF3: Sharqi Peninsula

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault_250 = {
	"250", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Assault#2 ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 400_300 tickets

-- Tickets set for the following maps:
-- Wake Island

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault2_400 = {
	"200", -- Ticket ratio for 0 - 4 players
	"400", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"850", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 250_200 tickets

-- Tickets set for the following maps:
-- Strike at Karkand

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault2_250 = {
	"125", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 220_200 tickets

-- Tickets set for the following maps:
-- Sharqi Peninsula

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault2_220 = {
	"110", -- Ticket ratio for 0 - 4 players
	"300", -- Ticket ratio for 5 - 12 players
	"400", -- Ticket ratio for 13 - 24 players
	"500", -- Ticket ratio for 25 - 32 players
	"600", -- Ticket ratio for 33 - 48 players
	"750", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------


-- Assault64 ticket count config.
-- based on a 100% gamemodecounter ,the default ticket rate is 400_350 tickets

-- Tickets set for the following maps:
-- Strike at Karkand - Talah Market

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault64_400_350 = {
	"200", -- Ticket ratio for 0 - 4 players
	"400", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 400_300 tickets

-- Tickets set for the following maps:
-- Wake Island

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault64_400_300 = {
	"200", -- Ticket ratio for 0 - 4 players
	"400", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------

-- based on a 100% gamemodecounter ,the default ticket rate is 350_300 tickets

-- Tickets set for the following maps:
-- Sharqi Peninsula

-- Orange = Atackers / Blue is Defenders - Atackers (orange) needs more tickets
-- Tickets are for Atackers (Orange) - Blue drains orange

tickets_Assault64_350_300 = {
	"175", -- Ticket ratio for 0 - 4 players
	"400", -- Ticket ratio for 5 - 12 players
	"500", -- Ticket ratio for 13 - 24 players
	"600", -- Ticket ratio for 25 - 32 players
	"700", -- Ticket ratio for 33 - 48 players
	"800", -- Ticket ratio for 49 - 64 players
	"1000" -- Ticket ratio for 65 - 128 players
	}


-- ---------------------------------------
-- ---------------------------------------
