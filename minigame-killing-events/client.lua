AddEventHandler('baseevents:onPlayerDied', 
	function(killerType, deathCoords)
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "onPlayerDied cl")
	end
)
AddEventHandler('baseevents:onPlayerKilled', 
	function(killerID, deathData)
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "onPlayerKilled cl")
	end
)
AddEventHandler('baseevents:onPlayerWasted', 
	function(killerID, deathData)
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "onPlayerWasted cl")
	end
)
