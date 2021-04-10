local displayVal = true

Citizen.CreateThread(
	function()
		SendNUIMessage({
			type = "tipply",
			display = true
		})
	end
)