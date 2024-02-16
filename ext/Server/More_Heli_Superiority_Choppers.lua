	if Config.morechoppers then  
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

-- Global GameMode data
local GameMode_HS = {
	["HeliSuperiority0"] = "Heli Superiority"
	} 

-- ------------------------------------------------------------------------------

Events:Subscribe('Level:LoadResources', function(p_LevelName_Keku_HS, p_GameMode_Keku_HS, p_IsDedicatedServer)
-- Contains ALL GameModemap data
	local s_GameMode_Keku_HS = ServerUtils and ServerUtils:GetCustomGameModeName() or GameMode_HS[p_GameMode_Keku_HS] or p_GameMode_Keku_HS

-- ------------------------------------------------------------------------------

	local lm = SharedUtils:GetLevelName() 
	if lm == p_LevelName_Keku_HS  and s_GameMode_Keku_HS == "Heli Superiority" then

    print("****************** Console spammer: Unlimited Heli's active ****************"); 

Events:Subscribe('Partition:Loaded', function(partition)
	if partition == nil then
		return
	end

	local instances = partition.instances
	for _, instance in pairs(instances) do
		if instance ~= nil then
			-- Remove depthtree preventing craters on roads and other areas.
			if instance:Is("VehicleSpawnReferenceObjectData") then
				instance = VehicleSpawnReferenceObjectData(instance)
				instance:MakeWritable()
				instance.applyDamageToAbandonedVehicles = true
				instance.maxCount = -1
				instance.maxCountSimultaneously = 15
				instance.totalCountSimultaneouslyOfType = 15
				instance.autoSpawn = true
				instance.spawnDelay = 5
				instance.initialSpawnDelay = 2

				instance.respawnRange = 15.0
				instance.timeUntilAbandoned = 5.0
				instance.timeUntilAbandonedIsDestroyed = 5.0
				instance.keepAliveRadius = 10.0
				instance.vehicleIsNearDistance = 15.0


			end
		end
	end
end)


end
end)
end
