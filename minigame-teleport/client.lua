RegisterNetEvent("minigame:teleportEvent")

AddEventHandler('minigame:teleportEvent', 
	function(args)
		local playerPed = PlayerPedId() -- get the local player ped
		
		SetPedCoordsKeepVehicle(playerPed, 1972, 2573, 2)
		 
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "Przeteleportowano!")
	end
)
