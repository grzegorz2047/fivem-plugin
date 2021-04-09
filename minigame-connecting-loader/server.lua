AddEventHandler('gameEventTriggered', function (name, args)
  print('game event ' .. name .. ' (' .. json.encode(args) .. ')')
end)

local function OnPlayerConnecting(plname, setKickReason, deferrals)
	local fileName = 'logins/' .. plname .. '.json'
	local logins = exports.minigameCommons:loadJson(fileName)
	if logins == nil then
		logins = {}
	end
    local player = source
--     local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)
	logins = {name = plname, lastLogin = os.date("%c", os.time()), ids = identifiers}
	exports.minigameCommons:saveJson(fileName, logins)
--     deferrals.defer()

--     -- mandatory wait!
--     Wait(0)

--     deferrals.update(string.format("Hello %s. Your Steam ID is being checked.", name))

--     for _, v in pairs(identifiers) do
--         print(v)
--         if string.find(v, "steam") then
--             steamIdentifier = v
--             break
--         end
--     end

--     -- mandatory wait!
--     Wait(0)

--     if not steamIdentifier then
--         deferrals.done("You are not connected to Steam.")
--     else
--         deferrals.done()
--     end
 end

AddEventHandler("playerConnecting", OnPlayerConnecting)

AddEventHandler("playerSpawned", function(spawn)
    TriggerServerEvent("ldr:spawnplayer")	
end)