local displayVal = true

Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(1)
			if (IsControlJustPressed(1, 288)) then
				displayVal = not displayVal
				SendNUIMessage({
				 	type = "ui",
					display = displayVal
				})
			end
		end
	end
)