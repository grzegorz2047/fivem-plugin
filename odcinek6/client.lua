local pointOnMap = vector3(1703.0, 2507.0, 45.0)
local function drawMarker(pointOnMap, markerType, size) 
	DrawMarker(markerType, pointOnMap.x, pointOnMap.y, pointOnMap.z, 0.0, 0.0, 0.0, size, size, size, 0.75, 1.75, 0.75, 204, 204, 0, 100, false, true, 2, false, false, false, false)
end 
 
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            drawMarker(pointOnMap, 28, 4)
        end
    end
)
 