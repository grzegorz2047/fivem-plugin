local displayVal = "Tekst tutka"
local colorVal = "black"
SendNUIMessage({
	type = "UI",
	display = displayVal,
	color = colorVal
})
Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(0)
 			if IsControlJustPressed(1, 323) then
				local playerName = GetPlayerName(GetPlayerPed(-1))
				displayVal = playerName
				colorVal = "blue"
				SendNUIMessage({
					type = "speedometr",
					display = displayVal,
					color = colorVal
				})
			end
			if IsControlJustReleased(1, 323) then
				displayVal = "Tekst tutka"
				colorVal = "black"
				SendNUIMessage({
					type = "speedometr",
					display = displayVal,
					color = colorVal
				})
			end
		end
	end
)