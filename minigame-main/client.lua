-- The event handler function follows after registering the event first.
RegisterNetEvent("minigame:spawnEvent")
debugMode = true

Citizen.CreateThread(function()
	local playerPed = PlayerPedId() -- get the local player ped
		-- printDebug("x: " .. pos.x ..", y: " .. pos.y ..", z: " .. pos.z)
	
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		--IsPedArmed(ped, 7)
		--if not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) then
			DrawAdvancedText(0.28, 0.96, 0.015, 0.0038, 0.328, "x: " .. math.floor(globalPos.x) ..", y: " .. math.floor(globalPos.y) ..", z: " .. math.floor(globalPos.z), 0, 208, 104, 255, 4, 0)
			-- printDebug("Wyprintowano!")
		--end
	end
end)
	
function printDebug(text)
	if not debugMode then
		return false
	end
	TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, text)
end
 

AddEventHandler('minigame:spawnEvent', 
	function(args)
		local playerPed = PlayerPedId() -- get the local player ped
		local pos = GetEntityCoords(playerPed) -- get the position of the local player ped

		--printDebug("x: " .. pos.x ..", y: " .. pos.y ..", z: " .. pos.z)
		-- Code here will be executed once the event is triggered.
		local playerIdx = args[1]
		local spawnType = args[2]
		local model = args[3] -- https://gta.fandom.com/wiki/Vehicle_ID_List
		--TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, " wywolano spawnEvent u clienta!")
		if(spawnType == "case") then
			spawnCase(playerIdx)
			return false
		end
		spawnCar(playerIdx, model)
	end
)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

function spawnCase(source)
	Citizen.CreateThread(function()
		
		local nbObjetsCrees = 0
		local playerPed = PlayerPedId() -- get the local player ped
		local pos = GetEntityCoords(playerPed) -- get the position of the local player ped

		while nbObjetsCrees < 1 do
			printDebug("case x: " .. pos.x ..", y: " .. pos.y ..", z: " .. pos.z)
			local coke1 = CreateObject(GetHashKey("prop_drug_package"), pos.x, pos.y, pos.z, true, true, true) -- list https://gist.github.com/leonardosnt/53faac01a38fc94505e9
			PlaceObjectOnGroundProperly(coke1)
			nbObjetsCrees = nbObjetsCrees + 1
			printDebug("Wsadzono pake")
		end
	end)
	
end

function spawnCar(source, model)
    -- account for the argument not being passed
    local vehicleName = model or 'adder'

    -- check if the vehicle actually exists
    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Nie da sie zespawnowac ' .. vehicleName .. '. moze inny się ^*uda?' }
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

	--TriggerEvent('chat:addMessage', {
	--	args = { 'cords ' .. pos  }
	--})
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
		args = { 'Stworzyles pojazd ^*' .. vehicleName .. '!' }
	})
end
 
CreateThread(function()
	local weapon = GetHashKey("WEAPON_CARBINERIFLE") --https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/?__cf_chl_jschl_tk__=7d3aa800b8170f218f85197801ee154a2213f8fd-1617305598-0-AbESM-oWg0Kli-1G5LJparaHhq7NWnHZlcMx785bcns8c9bdB5UqQVKBiS3d6NwrKcP22YPHfGUFcsNV_CP4ap_RPmLbT-JxyQY8UflEC24iI0fPS7vrB_aeWloCqChPSnT0VAHLrT_Ql0i6UCxYw055dwHD_ATZAV6hFknzLSTFa8amsJKvcgjoqps5Rg73CtGJnfFqAVpP3BypCfhidpKMjgQS5-5pTFFYjk-Kz19Xez7hiGh5GVmw4VmVzYHHgFdAU-jfkoIfDEHorhDH8Z3HcSWkW7lWY2ycyumqFSzalL16Tonc2fS76QHoJu9GKdCW_zI9RQtcJCuSIraGDuT95GT1GAigt14kaBkUOvmJeehNqMdcpSjkFDtzN48GFw1E_nm6NeC9v4bteyVBCLg75UvBpiotTk7sYCLYJWQihK33LuOThRnuraOXProc-87OxbXEM18903LIJ6o9JsYANwys33pImuZw25DZ_MjbXkAZPTuRMzdU7SwtQffgxA
	
	
    while true do
		local playerPed = PlayerPedId() -- pedId zmienia się po śmierci, dlatego musi być w pętli! (chyba, że będzie aktualizowany przy respawnie)
		globalPos = GetEntityCoords(playerPed) -- get the position of the local player ped
		GiveWeaponToPed(playerPed, weapon, 1, false) -- darmowe ammmo co sekunde
        Wait(1000)
	end
end)

