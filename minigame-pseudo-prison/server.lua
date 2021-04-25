local function ShowCoordinates(source)
    local ped = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(ped)

    print(playerCoords) -- vector3(...)
end
Citizen.CreateThread(function()
    while true do
        for _, playerId in ipairs(GetPlayers()) do
            local name = GetPlayerName(playerId)
            print(('Player %s with id %i is in the server'):format(name, playerId))
            ShowCoordinates(playerId)
          end
          
      Citizen.Wait(1000)
    end
  end)

 