local pointOnMap = vector3(1703.0, 2507.0, 46.0)

 
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            exports.libCommons:drawMarker(pointOnMap, 28, 2.0)
        end
    end
)
 