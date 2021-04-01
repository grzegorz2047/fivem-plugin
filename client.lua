-- The event handler function follows after registering the event first.
RegisterNetEvent("minigame:spawnEvent")
debugMode = true

function printDebug(text)
	if not debugMode then
		return false
	end
	TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, text)
end
 
AddEventHandler('minigame:spawnEvent', 
	function(args)
		-- Code here will be executed once the event is triggered.
		local playerIdx = args[1]
		local spawnType = args[2]
		local model = args[3] -- https://gta.fandom.com/wiki/Vehicle_ID_List
		TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, " wywolano spawnEvent u clienta!")
		spawnCar(playerIdx, model)
	end
)
function spawnCar(source, model)
    -- account for the argument not being passed
    local vehicleName = model or 'adder'

    -- check if the vehicle actually exists
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'It might have been a good thing that you tried to spawn a ' .. vehicleName .. '. Who even wants their spawning to actually ^*succeed?' }
        })

        return
    end

    -- load the model
    RequestModel(vehicleName)

    -- wait for the model to load
    while not HasModelLoaded(vehicleName) do
        Wait(500) -- often you'll also see Citizen.Wait
    end

    -- get the player's position
    local playerPed = PlayerPedId() -- get the local player ped
    local pos = GetEntityCoords(playerPed) -- get the position of the local player ped

	TriggerEvent('chat:addMessage', {
		args = { 'cords ' .. pos  }
	})
    -- create the vehicle
    local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

    -- set the player ped into the vehicle's driver seat
    SetPedIntoVehicle(playerPed, vehicle, -1)

    -- give the vehicle back to the game (this'll make the game decide when to despawn the vehicle)
    SetEntityAsNoLongerNeeded(vehicle)

    -- release the model
    SetModelAsNoLongerNeeded(vehicleName)

    -- tell the player
    TriggerEvent('chat:addMessage', {
		args = { 'Woohoo! Enjoy your new ^*' .. vehicleName .. '!' }
	})
end
 
CreateThread(function()
	local playerPed = PlayerPedId() -- get the local player ped
    while true do
		
		local pos = GetEntityCoords(playerPed) -- get the position of the local player ped
		printDebug("x: " .. pos.x ..", y: " .. pos.y ..", z: " .. pos.z)
		local weapon = GetHashKey("WEAPON_CARBINERIFLE") --https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/?__cf_chl_jschl_tk__=7d3aa800b8170f218f85197801ee154a2213f8fd-1617305598-0-AbESM-oWg0Kli-1G5LJparaHhq7NWnHZlcMx785bcns8c9bdB5UqQVKBiS3d6NwrKcP22YPHfGUFcsNV_CP4ap_RPmLbT-JxyQY8UflEC24iI0fPS7vrB_aeWloCqChPSnT0VAHLrT_Ql0i6UCxYw055dwHD_ATZAV6hFknzLSTFa8amsJKvcgjoqps5Rg73CtGJnfFqAVpP3BypCfhidpKMjgQS5-5pTFFYjk-Kz19Xez7hiGh5GVmw4VmVzYHHgFdAU-jfkoIfDEHorhDH8Z3HcSWkW7lWY2ycyumqFSzalL16Tonc2fS76QHoJu9GKdCW_zI9RQtcJCuSIraGDuT95GT1GAigt14kaBkUOvmJeehNqMdcpSjkFDtzN48GFw1E_nm6NeC9v4bteyVBCLg75UvBpiotTk7sYCLYJWQihK33LuOThRnuraOXProc-87OxbXEM18903LIJ6o9JsYANwys33pImuZw25DZ_MjbXkAZPTuRMzdU7SwtQffgxA
		GiveWeaponToPed(playerPed, weapon, 1, false)
        Wait(3000)
    end
end)


