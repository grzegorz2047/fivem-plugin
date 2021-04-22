local pointOnMap = vector3(1703.0, 2507.0, 45.0)
local function (pointOnMap, markerType) 
	DrawMarker(markerType, pointOnMap.x, pointOnMap.y, pointOnMap.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.75, 0.75, 0.75, 204, 204, 0, 100, false, true, 2, false, false, false, false)
end 
 
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            drawMarker(pointOnMap, 43)
        end
    end
)
 