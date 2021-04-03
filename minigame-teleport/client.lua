RegisterNetEvent("minigame:teleportEvent")

AddEventHandler('minigame:teleportEvent', 
	function(args)
		local playerPed = PlayerPedId() -- get the local player ped
		SetPedCoordsKeepVehicle(playerPed, 2395.096, 3049.616, 60.053)
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "Przeteleportowano!")
	end
)
