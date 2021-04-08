local pointOnMap = vector3(-1972.0, 2573.0, 4.0)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)
            local playerPed = PlayerPedId()
            
            local playerCoords = GetEntityCoords(playerPed)
            local maxDistance = 25
            local currentDistance = GetDistanceBetweenCoords(playerCoords, pointOnMap, false)
            if currentDistance > maxDistance then
                ApplyDamageToPed(playerPed, 1, false)
            end
            --TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "dystans: " .. currentDistance)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            --https://docs.fivem.net/docs/game-references/markers/
            DrawMarker(0, pointOnMap.x, pointOnMap.y, pointOnMap.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.75, 0.75, 0.75, 204, 204, 0, 100, false, true, 2, false, false, false, false)
             
        end
    end
)
local boxZone = BoxZone:Create(vector3(pointOnMap.x, pointOnMap.y, pointOnMap.z), 3.0, 5.0, {
    name="box_zone",
    offset={0.0, 0.0, 0.0},
    scale={1.0, 1.0, 1.0},
    debugPoly=true,
})