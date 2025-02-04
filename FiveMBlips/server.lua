local blips = {}

RegisterCommand("dutyblip", function(source, args, rawCommand)
    local playerId = source

    -- Check if the player already has a blip
    if blips[playerId] then
        -- Remove the blip
        TriggerClientEvent('removeDutyBlip', playerId)
        blips[playerId] = nil
        TriggerClientEvent('chat:addMessage', playerId, { args = { "System", "Your duty blip has been successfully removed." } })
    else
        -- Create a new blip for the player
        TriggerClientEvent('createDutyBlip', playerId)
        blips[playerId] = true
        TriggerClientEvent('chat:addMessage', playerId, { args = { "System", "Your duty blip has been successfully added." } })
    end
end)

-- To sync blips across all clients when they are added
RegisterServerEvent('dutyblipAdded')
AddEventHandler('dutyblipAdded', function(playerId)
    TriggerClientEvent('updateDutyBlips', -1, playerId, true)  -- Send to all clients
end)

-- To sync blips when they are removed
RegisterServerEvent('dutyblipRemoved')
AddEventHandler('dutyblipRemoved', function(playerId)
    TriggerClientEvent('updateDutyBlips', -1, playerId, false)  -- Send to all clients
end)
