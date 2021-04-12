local displayVal = "Tekst tutka"
local colorVal = "green"
Citizen.CreateThread(
	function()
		SendNUIMessage({
			type = "UI",
			display = displayVal,
			color = colorVal
		})
	end
	
)
Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(0)
			local ped = PlayerPedId()
 			if IsControlJustPressed(1, 323) then
				displayVal = "Tekst dutka"
				colorVal = "red"
			end

			if IsControlJustReleased(1, 323) then
				displayVal = "Tekst tutka"
				colorVal = "green"
			end
		end
	end
)