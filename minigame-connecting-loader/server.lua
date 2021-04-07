AddEventHandler('gameEventTriggered', function (name, args)
  print('game event ' .. name .. ' (' .. json.encode(args) .. ')')
end)

local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()

    -- mandatory wait!
    Wait(0)

    deferrals.update(string.format("Hello %s. Your Steam ID is being checked.", name))

    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

    -- mandatory wait!
    Wait(0)

    if not steamIdentifier then
        deferrals.done("You are not connected to Steam.")
    else
        deferrals.done()
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)

AddEventHandler("playerSpawned", function(spawn)
    TriggerServerEvent("ldr:spawnplayer")	
end)