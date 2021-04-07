AddEventHandler('baseevents:onPlayerDied', function(player, data)
		print( "onPlayerDied srv")
	end
)
AddEventHandler('baseevents:onPlayerKilled', function(player, data)
    local killer = GetPlayerByServerId(data.killer)
    print( 'You was killed by ' .. killer.name .. '.')
end)
AddEventHandler('baseevents:onPlayerWasted', 
	function(player, data)
		print( "onPlayerWasted srv")
	end
)
