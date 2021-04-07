RegisterServerEvent('baseevents:onPlayerDied')
RegisterServerEvent('baseevents:onPlayerKilled')
RegisterServerEvent('baseevents:onPlayerWasted')


AddEventHandler('baseevents:onPlayerDied', function(player, data)
		print( "onPlayerDied srv" .. data)
	end
)
AddEventHandler('baseevents:onPlayerKilled', function(player, data)
     
    print( 'You was killed by ' .. data .. '.')
end)
AddEventHandler('baseevents:onPlayerWasted', 
	function(player, data)
		print( "onPlayerWasted srv" .. data)
	end
)
