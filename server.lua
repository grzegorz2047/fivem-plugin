function isPlayer(source)
	return source > 0
end

RegisterCommand("spawn", function(source --[[ this is the player ID (on the server): a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered ]])
    if not isPlayer(source) then
		print("komenda tylko dla gracza!")
		return false
	end
	if #args < 2 then
		print("zla liczba argumentow")
		return false
	end
 
	TriggerClientEvent("minigame:spawnEvent", source, {source, args[1], args[2]})
end, false) -- this true bool means that the user cannot execute the command unless they have the 'command.commandName' ACL object allowed to one of their identifiers.
 

RegisterCommand("tep", function(source --[[ this is the player ID (on the server): a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered ]])
    if not isPlayer(source) then
		print("komenda tylko dla gracza!")
		return false
	end
	 
	TriggerClientEvent("minigame:teleportEvent", source, {"1"})
end, false)
 



