Citizen.CreateThread(function()
    while true do
        for _, playerId in ipairs(GetPlayers()) do
            local name = GetPlayerName(playerId)
            print(('Player %s with id %i is in the server'):format(name, playerId))
            -- ('%s'):format('text') is same as string.format('%s', 'text)
          end
          
      Citizen.Wait(1000)
    end
  end)
local function ShowCoordinates()
    local player = source
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)

    print(playerCoords) -- vector3(...)
end
 