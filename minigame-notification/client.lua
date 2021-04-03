Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(1)
			if (IsControlJustPressed(1, 188)) then -- up https://docs.fivem.net/docs/game-references/controls/
				message("test up", "text", "Wciśnij ~INPUT_FRONTEND_DOWN~ aby zobaczyć coś nad minimapą!")
            end
            if (IsControlJustPressed(1, 187)) then -- down https://docs.fivem.net/docs/game-references/controls/
				notify("test down")
			end
		end
	end
)