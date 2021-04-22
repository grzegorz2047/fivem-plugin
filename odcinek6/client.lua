local pointOnMap = vector3(1703.0, 2507.0, 46.0)
local areaSize = 2.0
local function isClose()
	

end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            exports.libCommons:drawMarker(pointOnMap, 28, areaSize)
			local playerPed = PlayerPedId()
             --warto przeniesc logike na serwer
			local playerCoords = GetEntityCoords(playerPed)
				
			local currentDistance = GetDistanceBetweenCoords(playerCoords, pointOnMap, false)
			if currentDistance < areaSize then
				exports.libCommons:nativeMessage("test up", "text", "Wciśnij ~INPUT_CELLPHONE_CAMERA_EXPRESSION~ aby wykonać akcję!")
			end
        end
    end
)
 