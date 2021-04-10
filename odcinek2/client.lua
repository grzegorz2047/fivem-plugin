RegisterNetEvent("tut:spawnEvent")

local function sendMessage(text)
    TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, text)
end

local function teleport(playerPed, x,y, z)
    SetEntityCoords(playerPed, x, y, z, false, false, false, true)
end
local function teleportWithVehicle(playerPed, x,y, z)
    SetPedCoordsKeepVehicle(playerPed, x, y, z)
end


AddEventHandler('tut:spawnEvent', 
	function(args)
		local playerPed = PlayerPedId()
        --SetPedCoordsKeepVehicle(playerPed, x, y, z)
		local x = -2573.0
        local y = 2313.0
        local z = 33.0
        teleport(playerPed, x, y, z)
		sendMessage("Przeteleportowano na spawn!")
	end
)
