
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            if (GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > maxDistance) then
                TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "PRZEKROCZENIE!")
            end
        end
    end
)