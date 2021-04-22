local pointOnMap = vector3(1703.0, 2507.0, 46.0)
local areaSize = 2.0
local markerType = 28 -- 28 sphere
local function isClose(targetPoint, distanceBetween)
	local playerPed = PlayerPedId()
	local sourcePlayerCoords = GetEntityCoords(playerPed)
	local currentDistance = GetDistanceBetweenCoords(sourcePlayerCoords, targetPoint, false)
	return currentDistance < distanceBetween
end
milis = 1
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            exports.libCommons:drawMarker(pointOnMap, 28, areaSize)
			if showInfo then
				exports.libCommons:nativeMessage("Wciśnij ~INPUT_CELLPHONE_CAMERA_EXPRESSION~ aby wykonać akcję!")
			end
			if IsControlJustPressed(1, 111) then
				pointOnMap = vector3(pointOnMap.x, pointOnMap.y, pointOnMap.z + 1.0)
				exports.libCommons:sendMessage(pointOnMap.z)
			end
			if IsControlJustPressed(1, 110) then
				pointOnMap = vector3(pointOnMap.x, pointOnMap.y, pointOnMap.z - 1.0)
			end
			if milis % 10 == 0 then
				
				if isClose(pointOnMap, areaSize) then
					showInfo = true
				else
					showInfo = false
				end
				milis = 1
			end
			milis = milis + 1
        end
    end
)
 