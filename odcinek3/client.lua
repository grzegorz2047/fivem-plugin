local displayVal = "Tekst tutka"
local colorVal = "green"
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
				displayVal = "Tekst dutka"
				colorVal = "red"
				SendNUIMessage({
					type = "UI",
					display = displayVal,
					color = colorVal
				})
			end
			if IsControlJustReleased(1, 323) then
				displayVal = "Tekst tutka"
				colorVal = "green"
				SendNUIMessage({
					type = "UI",
					display = displayVal,
					color = colorVal
				})
			end
		end
	end
)