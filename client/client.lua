-- client.lua

local configFile = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
if configFile then
    local configChunk, errorMessage = load(configFile, 'config', 't')
    if configChunk then
        configChunk()
    else
        print("Error loading config.lua: " .. errorMessage)
    end
else
    print("Couldn't find config.lua")
end

if Config and Config.DisableIdleCamera then
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(100)
            DisableIdleCamera(true)
        end
    end)
end

if Config and Config.DisableVehiclePassengerIdleCamera then
    Citizen.CreateThread(function()
        while true do 
            Citizen.Wait(100)
            DisableVehiclePassengerIdleCamera(true)
        end
    end)
end