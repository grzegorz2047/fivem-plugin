local function ShowCoordinates(source)
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)

    print(playerCoords) -- vector3(...)
end
Citizen.CreateThread(function()
    while true do
        local players = GetNumPlayerIndices()
        for i = 0, players - 1 do
            local id = GetPlayerFromIndex(i)
            local ped = GetPlayerPed(id)
            local coords = GetEntityCoords(ped)

            print(id, ped, coords)
        end
      Citizen.Wait(1000)
    end
  end)

 