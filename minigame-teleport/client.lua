RegisterNetEvent("minigame:teleportEvent")

AddEventHandler('minigame:teleportEvent', 
	function(args)
		local playerPed = PlayerPedId() -- get the local player ped
		
		--SetPedCoordsKeepVehicle(playerPed, 1972, 2573, 3)
		local ped = PlayerPedId()
		local currentPos = GetEntityCoords(ped)
		print(currentPos)
		
		SetEntityCoords(ped, 1703.0, 2543.0, 45.0, false, false, false, true)
		
		currentPos = GetEntityCoords(ped)
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "Przeteleportowano do " .. currentPos)
	end
)
