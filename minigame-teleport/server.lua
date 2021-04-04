-- https://forum.cfx.re/t/how-to-json-with-fivem/237542 
function isPlayer(source)
	return source > 0
end

RegisterCommand("tep", function(source --[[ this is the player ID (on the server): a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered ]])
    if not isPlayer(source) then
		print("komenda tylko dla gracza!")
		return false
	end
	 
	TriggerClientEvent("minigame:teleportEvent", source, args)
end, false)
 



