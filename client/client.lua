---@diagnostic disable: undefined-global

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId() 
        local playerCoords = GetEntityCoords(playerPed) 

        for _, marker in pairs(Config) do
            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, marker.x, marker.y, marker.z)

            if distance <= 20.0 then
                DrawMarker3D(marker.type, marker.x, marker.y, marker.z, marker.sizeX, marker.sizeY, marker.color[1], marker.color[2], marker.color[3], marker.bobUpAndDown)
            end
        end
    end
end)

-- Function to draw markers
function DrawMarker3D(type, x, y, z, sizeX, sizeY, r, g, b, bobUpAndDown)
    DrawMarker(type, x, y, z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, sizeX, sizeY, 0.5, r, g, b, 100, bobUpAndDown, true, 2, false, nil, nil, false)
end