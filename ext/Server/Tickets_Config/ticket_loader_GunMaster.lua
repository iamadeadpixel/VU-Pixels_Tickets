-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo == "Running" or screenInfo == "Blocking on shader creation" then
		local syncedBFSettings = ResourceManager:GetSettings("SyncedBFSettings")
		if syncedBFSettings ~= nil then
			syncedBFSettings = SyncedBFSettings(syncedBFSettings)
			syncedBFSettings.teamSwitchingAllowed = false
		end
	end
end)

-- ------------------------------------------------------------------------------
-- Global shared Gun Master GameMode data
local global_GameModeNameMap = {
	["GunMaster0"] = "Gun Master",
	} 

local GunMaster_LevelNameMap = {
	["Levels/XP2_Factory/XP2_Factory"] = "Scrapmetal",
	["Levels/XP2_Office/XP2_Office"] = "Operation 925",
	["Levels/XP2_Palace/XP2_Palace"] = "Donya Fortress",
	["Levels/XP2_Skybar/XP2_Skybar"] = "Ziba Tower",

	["Levels/XP4_FD/XP4_FD"] = "Markaz Monolith",
	["Levels/XP4_Parl/XP4_Parl"] = "Azadi Palace",
	["Levels/XP4_Quake/XP4_Quake"] = "Epicenter",
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market",

-- Keku Gunmaster data
	["Levels/MP_001/MP_001"] = "Grand Bazaar",
	["Levels/MP_003/MP_003"] = "Teheran Highway",
	["Levels/MP_007/MP_007"] = "Caspian Border",
	["Levels/MP_011/MP_011"] = "Seine Crossing",
	["Levels/MP_012/MP_012"] = "Operation Firestorm",
	["Levels/MP_013/MP_013"] = "Damavand Peak",
	["Levels/MP_017/MP_017"] = "Noshahr Canals",
	["Levels/MP_018/MP_018"] = "Kharg Island",
	["Levels/MP_Subway/MP_Subway"] = "Operation Metro",

	["Levels/XP1_001/XP1_001"] = "Strike at Karkand",
	["Levels/XP1_002/XP1_002"] = "Gulf of Oman",
	["Levels/XP1_003/XP1_003"] = "Sharqi Peninsula",
	["Levels/XP1_004/XP1_004"] = "Wake Island",

	["Levels/XP3_Desert/XP3_Desert"] = "Bandar Desert",
	["Levels/XP3_Alborz/XP3_Alborz"] = "Alborz Mountains",
	["Levels/XP3_Shield/XP3_Shield"] = "Armored Shield",
	["Levels/XP3_Valley/XP3_Valley"] = "Death Valley",

	["Levels/XP5_001/XP5_001"] = "Operation Riverside",
	["Levels/XP5_002/XP5_002"] = "Nebandan Flats",
	["Levels/XP5_003/XP5_003"] = "Kiasar Railroad",
	["Levels/XP5_004/XP5_004"] = "Sabalan Pipeline",

	["Levels/COOP_002/COOP_002"] = "Hit and Run",
	["Levels/COOP_006/COOP_006"] = "Aygan Village",

	["Levels/SP_Jet/SP_Jet"] = "Carrier",
	["Levels/SP_Villa/SP_Villa"] = "Kaffarov's Villa"

} 
-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_GunMaster, p_GameMode_GunMaster, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_GunMaster = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_GunMaster] or p_GameMode_GunMaster

-- Contains GunMaster map data
	s_LevelName_GunMaster = ServerUtils and ServerUtils:GetCustomMapName() or GunMaster_LevelNameMap[p_LevelName_GunMaster] or p_LevelName_GunMaster and s_GameMode_GunMaster == "Gun Master"

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_GunMaster and s_GameMode_GunMaster == "Gun Master" then
	s_MapData="Gun Master"

	if Config.consolespam then 
	print(''..s_MapData..': - Shared GunMaster data')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_GunMaster..') - Mapname: ('..s_LevelName_GunMaster..') ') 
	print(''..s_MapData..': - This Gamemode has its own settings') 

-- ------------------------------------------------------------------------------
end

end
end)

