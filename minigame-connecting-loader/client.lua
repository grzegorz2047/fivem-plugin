AddEventHandler("playerSpawned", function(spawn)
    TriggerServerEvent("ldr:spawnplayer")	
	TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "Elo!")
end)