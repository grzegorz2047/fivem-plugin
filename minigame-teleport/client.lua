RegisterNetEvent("minigame:teleportEvent")

AddEventHandler('minigame:teleportEvent', 
	function(args)
		local playerPed = PlayerPedId() -- get the local player ped
		
		SetPedCoordsKeepVehicle(playerPed, 2405, 3110, 49)
		 
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "Przeteleportowano!")
	end
)
