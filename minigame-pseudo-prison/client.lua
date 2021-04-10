local pointOnMap = vector3(1689.0, 2510.0, 45.0)
local maxDistance = 35

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)
            local playerPed = PlayerPedId()
            
            local playerCoords = GetEntityCoords(playerPed)
            
            local currentDistance = GetDistanceBetweenCoords(playerCoords, pointOnMap, false)
            if currentDistance > maxDistance then
                SetPlayerWantedLevel(PlayerId(), 1, false)
				SetPlayerWantedLevelNow(PlayerId(), false)
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
-- https://github.com/mkafrin/PolyZone/wiki/Zones
local circleZone = CircleZone:Create(vector3(pointOnMap.x, pointOnMap.y, pointOnMap.z), maxDistance, {
    name="circle_zone",
    debugPoly=true,
})