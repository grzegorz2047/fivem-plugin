local pointOnMap = vector3(1711.0, 2564.0, 45.0)
local maxDistance = 110
local timer = 0
local wantedCooldownMinutes = 60 * 5
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)
            local playerPed = PlayerPedId()
            if IsPedModel(playerPed, "s_m_y_prisoner_01") or IsPedModel(playerPed, "s_m_y_prismuscl_01") then --warto przeniesc logike na serwer
				local playerCoords = GetEntityCoords(playerPed)
				
				local currentDistance = GetDistanceBetweenCoords(playerCoords, pointOnMap, false)
				if currentDistance > maxDistance then
					if timer % wantedCooldownMinutes then
						SetPlayerWantedLevel(PlayerId(), 1, false)
						SetPlayerWantedLevelNow(PlayerId(), false)
						timer = 0
						TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "Jesteś poszukiwany!")
					end
					timer = timer + 1
				end
			end
            --TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "dystans: " .. currentDistance)
        end
    end
)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		SetRelationshipBetweenGroups(0, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey("PLAYER"))
		SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("AMBIENT_GANG_BALLAS"))
	end
end)
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