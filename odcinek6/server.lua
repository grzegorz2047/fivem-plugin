local pointOnMap = vector3(1703.0, 2507.0, 46.0)
local function ShowCoordinates(playerPed)
    local playerCoords = GetEntityCoords(playerPed)

    print(playerCoords) -- vector3(...)
end

RegisterNetEvent("myCoordinates")
AddEventHandler("myCoordinates", ShowCoordinates)