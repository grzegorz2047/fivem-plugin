Citizen.CreateThread(
    function()
        Citizen.Wait(0)
        local minigun = GetHashKey("WEAPON_MINIGUN")
        while true do
            if IsControlJustPressed(1, 137) then
                local playerPed = PlayerPedId()
                GiveWeaponToPed(playerPed, minigun, 10, false)
            end
        end
    end
)