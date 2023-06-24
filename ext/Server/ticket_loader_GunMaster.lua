-- ------------------------------------------------------------------------------
-- Global GameMode data
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
	["Levels/XP4_Rubble/XP4_Rubble"] = "Talah Market"
} 
-- ------------------------------------------------------------------------------
Events:Subscribe('Level:LoadResources', function(p_LevelName_GunMaster, p_GameMode_GunMaster, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_GunMaster = ServerUtils and ServerUtils:GetCustomGameModeName() or global_GameModeNameMap[p_GameMode_GunMaster] or p_GameMode_GunMaster

-- Contains GunMaster map data
	s_LevelName_GunMaster = ServerUtils and ServerUtils:GetCustomMapName() or GunMaster_LevelNameMap[p_LevelName_GunMaster] or p_LevelName_GunMaster and s_GameMode_GunMaster == "Gun Master"

-- ------------------------------------------------------------------------------
-- What ever it is what this do.
	Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo ~= "Registering entity resources" then
	return
	end
end)

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_GunMaster and s_GameMode_GunMaster == "Gun Master" then
	s_MapData="Gun Master"

	print(''..s_MapData..': - Setting Rcondata')
	print(''..s_MapData..': - Gamemode: ('..s_GameMode_GunMaster..') - Mapname: ('..s_LevelName_GunMaster..') ') 
	print(''..s_MapData..': - This Gamemode has its own settings') 

-- ------------------------------------------------------------------------------

end
end)

