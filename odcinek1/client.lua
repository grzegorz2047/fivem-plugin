local function isCapsLockPressed()
    return IsControlJustPressed(1, 137)
end

local function givePlayerWeapon(weaponHash, amount)
    local playerPed = PlayerPedId()
    GiveWeaponToPed(playerPed, weaponHash, amount, false)
end

local function giveWeaponOnPressed()
    local minigun = GetHashKey("WEAPON_MINIGUN")
    while true do
        Citizen.Wait(0)
        if isCapsLockPressed() then
            givePlayerWeapon(minigun, 10)
        end
    end
end

Citizen.CreateThread(giveWeaponOnPressed)