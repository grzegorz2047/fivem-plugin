-- https://forum.cfx.re/t/how-to-json-with-fivem/237542 

exports('saveJson', function(filePath, data)
	local loadFile = LoadResourceFile(GetCurrentResourceName(), filePath)
	SaveResourceFile(GetCurrentResourceName(), filePath, json.encode(data), -1)
	print("Zapisano!")
end)

exports('loadJson', function(filePath)
	local loadFile = LoadResourceFile(GetCurrentResourceName(), filePath) -- you only have to do this once in your code, i just put it in since it wont get confusing.
	local extract = {}
	return json.decode(loadFile)
end)




