local pointOnMap = vector3(1703.0, 2507.0, 46.0)
local areaSize = 2.0
local markerType = 28 -- 28 sphere
local weapon = GetHashKey("WEAPON_MINISMG")
local isInArea = false
local function isClose(targetPoint, distanceBetween)
	local playerPed = PlayerPedId()
	local sourcePlayerCoords = GetEntityCoords(playerPed)
	local currentDistance = GetDistanceBetweenCoords(sourcePlayerCoords, targetPoint, false)
	return currentDistance <= distanceBetween
end
milis = 1
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            exports.libCommons:drawMarker(pointOnMap, markerType, areaSize)
			if isInArea then
				exports.libCommons:nativeMessage("Wciśnij ~INPUT_CELLPHONE_CAMERA_EXPRESSION~ aby otrzymać 10 naboi do SMG!")
				if IsControlJustPressed(1, 323) then
					exports.libCommons:givePlayerWeapon(weapon, 10)
				end
			end
			if IsControlJustPressed(1, 111) then
				pointOnMap = vector3(pointOnMap.x, pointOnMap.y - 1.0, pointOnMap.z)
				exports.libCommons:sendMessage(pointOnMap.z)
			end
			if IsControlJustPressed(1, 112) then
				pointOnMap = vector3(pointOnMap.x, pointOnMap.y + 1.0, pointOnMap.z)
			end		
			if IsControlJustPressed(1, 108) then
				pointOnMap = vector3(pointOnMap.x + 1.0, pointOnMap.y, pointOnMap.z)
			end
			if IsControlJustPressed(1, 109) then
				pointOnMap = vector3(pointOnMap.x - 1.0, pointOnMap.y, pointOnMap.z )
			end		
			if milis % 10 == 0 then
				if isClose(pointOnMap, areaSize) then
					isInArea = true
				else
					isInArea = false
				end
				milis = 1
			end
			milis = milis + 1
        end
    end
)
 