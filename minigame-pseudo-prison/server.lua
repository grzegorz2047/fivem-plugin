local pointOnMap = vector3(1711.0, 2564.0, 45.0)
local maxDistance = 110
local playerData = {}

 
local function hasPassedMinutes(playerTime, minutes)
    seconds = (os.time() - playerTime)
    passedMinutes = seconds/60
    return passedMinutes >= minutes
end

local function DistanceBetweenCoords (coordsA, coordsB, useZ)
    -- language faster equivalent:
    local firstVec = vector3(coordsA.x, coordsA.y, coordsA.z)
    local secondVec = vector3(coordsB.x, coordsB.y, coordsB.z)
    if useZ then
        return #(firstVec - secondVec)
    else 
        return #(firstVec.xy - secondVec.xy)
    end
end

local function isOutsideOfPrison(ped)
    local playerCoords = GetEntityCoords(ped)
    local currentDistance = DistanceBetweenCoords(playerCoords, pointOnMap, false)
    return currentDistance > maxDistance     
end

AddEventHandler('playerDropped', 
    function (reason)
        print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. ')')
        local ped = GetPlayerPed(source)
        playerData[ped] = nil 

        print("Usunieto gracza z obserwowanych " .. ped)
    end
)

Citizen.CreateThread(function()
    while true do
        local players = GetNumPlayerIndices()
        for i = 0, players - 1 do
            local id = GetPlayerFromIndex(i)
            local ped = GetPlayerPed(id)
            if isOutsideOfPrison(ped) then
                if playerData[ped] == nil then
                    playerData[ped] = os.time()
                    print("Dodano gracza do obserwowanych " .. ped)
                end
                if hasPassedMinutes(playerData[ped], 2) then
                    playerData[ped] = os.time()
                    print("Minelo 2 minuty dla " .. ped)
                    exports.money.addMoney(id, "cash", 1000)
                end
            else
                if playerData[ped] not nil then
                    playerData[ped] = nil 
                    print("Usunieto gracza z obserwowanych bo wrocil" .. ped)
                end
            end
        end
      Citizen.Wait(1000)
    end
  end)

 