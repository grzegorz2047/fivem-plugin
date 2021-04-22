local pointOnMap = vector3(1703.0, 2507.0, 46.0)
local areaSize = 2.0
local function isClose()
local showInfo = false

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
			local playerPed = PlayerPedId()
             --warto przeniesc logike na serwer
			local playerCoords = GetEntityCoords(playerPed)
			if milis % 100 == 0 then
				local currentDistance = GetDistanceBetweenCoords(playerCoords, pointOnMap, false)
				if currentDistance < areaSize then
					showInfo = true
				end
				else
					showInfo = false
				end
				milis = 1
			end
			milis = milis +1
        end
    end
)
 