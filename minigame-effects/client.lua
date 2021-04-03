Citizen.CreateThread(
	function()
		local duration = 1000 * 10
		while true do
			Citizen.Wait(1)
			if (IsControlJustPressed(1, 289)) then -- F2 https://docs.fivem.net/docs/game-references/controls/
				AnimpostfxPlay("DrugsMichaelAliensFight", duration, false) --
			end
		end
	end
)