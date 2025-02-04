local playerBlip = nil

RegisterCommand("dutyblip", function(source, args, rawCommand)
    if args[1] == "on" then
        TriggerEvent("createDutyBlip")  -- Enable blip
    elseif args[1] == "off" then
        TriggerEvent("removeDutyBlip")  -- Disable blip
    else
        ShowGtaNotification("~r~Usage: ~w~/dutyblip [on/off]")
    end
end, false)

RegisterNetEvent('createDutyBlip')
AddEventHandler('createDutyBlip', function()
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    local playerName = GetPlayerName(playerId)  -- Get the player's name

    if playerBlip then
        RemoveBlip(playerBlip)
    end

    playerBlip = AddBlipForEntity(playerPed)
    SetBlipSprite(playerBlip, 3)  -- Set the blip icon (change if needed)
    SetBlipColour(playerBlip, 0)  -- Set the blip color (green)
    SetBlipScale(playerBlip, 0.55)  -- Adjust the size
    SetBlipAsShortRange(playerBlip, false)  -- Make the blip visible to all players with blips

    local blipLabel = "Emergency Services | " .. playerName
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipLabel)
    EndTextCommandSetBlipName(playerBlip)

    -- Update the blip's position when the player moves
    Citizen.CreateThread(function()
        while playerBlip do
            Citizen.Wait(500)
            local newCoords = GetEntityCoords(playerPed)
            SetBlipCoords(playerBlip, newCoords.x, newCoords.y, newCoords.z)
        end
    end)

    ShowGtaNotification("~g~Duty blip activated.")
end)

RegisterNetEvent('removeDutyBlip')
AddEventHandler('removeDutyBlip', function()
    if playerBlip then
        RemoveBlip(playerBlip)
        playerBlip = nil
        ShowGtaNotification("~r~Duty blip deactivated.")
    else
        ShowGtaNotification("~o~You do not have an active duty blip.")
    end
end)

-- Function to show native GTA V notifications
function ShowGtaNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(message)
    DrawNotification(false, true)
end
