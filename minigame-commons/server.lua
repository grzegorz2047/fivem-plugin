-- https://forum.cfx.re/t/how-to-json-with-fivem/237542 
function isPlayer(source)
	return source > 0
end

RegisterCommand("json", function(source --[[ this is the player ID (on the server): a number ]], args --[[ this is a table of the arguments provided ]], rawCommand --[[ this is what the user entered ]])
    if not isPlayer(source) then
		print("komenda tylko dla gracza!")
		return false
	end
	if #args < 1 then
		print("Zla liczba argumentow!")
		return false
	end
	if(args[1] == "save") then
		local loadFile = LoadResourceFile(GetCurrentResourceName(), "./data.json")
		local information = {name = "grzegorz2047", x = 1000, y = 1000, z = 1000}

		SaveResourceFile(GetCurrentResourceName(), "data.json", json.encode(information), -1)
		print("Zapisano!")
	end
	if(args[1] == "read") then
		local loadFile = LoadResourceFile(GetCurrentResourceName(), "./data.json") -- you only have to do this once in your code, i just put it in since it wont get confusing.
		local extract = {}
		extract = json.decode(loadFile)
		print(extract["name"])
	end
end, false)
 



