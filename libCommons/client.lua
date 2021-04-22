exports('nativeMessage', function(lineOne, lineTwo, lineThree, duration)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(lineOne)
    AddTextComponentSubstringPlayerName(lineTwo or "")
    AddTextComponentSubstringPlayerName(lineThree or "")

    -- shape (always 0), loop (bool), makeSound (bool), duration (5000 max 5 sec)
    EndTextCommandDisplayHelp(0, false, true, duration or 5000)
end)

exports('notify', function(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end)

exports('drawMarker', function(pointOnMap, markerType, markerSize) 
	DrawMarker(markerType, pointOnMap.x, pointOnMap.y, pointOnMap.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, markerSize, markerSize, markerSize, 204, 204, 0, 100, false, true, 2, false, false, false, false)
end)