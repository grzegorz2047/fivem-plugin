-- https://forum.cfx.re/t/how-to-json-with-fivem/237542 
function isPlayer(source)
	return source > 0
end

RegisterCommand("spawn", 
    function(source, args, rawCommand)
        if not isPlayer(source) then
            print("komenda tylko dla gracza!")
            return false
        end
        
        TriggerClientEvent("tut:spawnEvent", source, args)
    end, false
)
 



