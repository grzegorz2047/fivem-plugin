local pointOnMap = vector3(1711.0, 2564.0, 45.0)
local maxDistance = 110
local playerData = {}

local function ShowCoordinates(source)
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)

    print(playerCoords) -- vector3(...)
end

local function hasPassedMinutes(playerTime, minutes)
    return ((os.time() - playerTime)/1000/60) >= minutes
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
    print("disctance " .. currentDistance)
    return currentDistance > maxDistance     
end


Citizen.CreateThread(function()
    while true do
        local players = GetNumPlayerIndices()
        for i = 0, players - 1 do
            local id = GetPlayerFromIndex(i)
            local ped = GetPlayerPed(id)
            ShowCoordinates(ped)
            if isOutsideOfPrison(ped) then
                if playerData[ped] == nil then
                    playerData[ped] = os.time()
                end
                if hasPassedMinutes(playerData[ped], 5) then
                    playerData[ped] = os.time()
                    print("Minelo 5 minut dla " .. ped)
                end
            else
                playerData[ped] = nil 
            end
        end
      Citizen.Wait(1000)
    end
  end)

 