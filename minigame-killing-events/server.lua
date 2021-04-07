AddEventHandler('baseevents:onPlayerDied', 
	function(player, data)
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "onPlayerDied cl")
	end
)
AddEventHandler('baseevents:onPlayerKilled', function(player, data)
    local killer = GetPlayerByServerId(data.killer)
    TriggerEvent('chatMessage', '', { 0, 0, 0 }, 'You was killed by ' .. killer.name .. '.')
end)
AddEventHandler('baseevents:onPlayerWasted', 
	function(player, data)
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "onPlayerWasted cl")
	end
)
