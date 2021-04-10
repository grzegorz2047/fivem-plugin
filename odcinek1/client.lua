-- minigun = GetHashKey("WEAPON_MINIGUN")
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
           -- if IsControlJustPressed(1, 137) then
           --     local playerPed = PlayerPedId()
           --     GiveWeaponToPed(playerPed, minigun, 10, false)
          --  end
        end
    end
)