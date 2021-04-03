
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            local playerPed = PlayerPedId()
            if (GetDistanceBetweenCoords(GetEntityCoords(playerPed), vector3(2395.096, 3049.616, 60.053), false) > maxDistance) then
                TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "PRZEKROCZENIE!")
            end
        end
    end
)