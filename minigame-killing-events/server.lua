RegisterServerEvent('baseevents:onPlayerDied')
RegisterServerEvent('baseevents:onPlayerKilled')
RegisterServerEvent('baseevents:onPlayerWasted')


AddEventHandler('baseevents:onPlayerDied', function(player, data)
		print(  data)
	end
)
AddEventHandler('baseevents:onPlayerKilled', function(player, data)
     
    print(  data  )
end)
AddEventHandler('baseevents:onPlayerWasted', 
	function(player, data)
		print(   data)
	end
)
