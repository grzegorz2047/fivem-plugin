Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(1)
			if (IsControlJustPressed(1, 188)) then -- up https://docs.fivem.net/docs/game-references/controls/
				exports.libCommons:nativeMessage("test up", "text", "Wciśnij ~INPUT_FRONTEND_DOWN~ aby zobaczyć coś nad minimapą!")
            end
            if (IsControlJustPressed(1, 187)) then -- down https://docs.fivem.net/docs/game-references/controls/
				exports.libCommons:notify("test down")
			end
		end
	end
)