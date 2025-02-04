print("Client script loaded successfully!")  -- Debugging message

-- Tracks the player's duty status
local isOnDuty = false  
local currentJob = nil  -- Tracks whether they are LEO or Fire/EMS

-- Function to show GTA V notifications
function ShowNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(message)
    DrawNotification(false, true)
end

-- LEO Duty Command
RegisterCommand("leoduty", function()
    if isOnDuty then
        ShowNotification("~r~You must go OFF duty before switching roles. Use /offduty first.")
        print("Player attempted to go on LEO duty while still on duty.")
        return
    end

    print("LEO Duty command triggered!")

    -- Set the player as on duty
    isOnDuty = true
    currentJob = "LEO"

    -- Notify the player with GTA V Notification
    ShowNotification("~b~You are now on LEO duty.")

    -- Execute duty commands
    ExecuteCommand("onduty leo ERRPXYZ")
    ExecuteCommand("dutyblip on") -- Turn ON duty blip
    ExecuteCommand("toggleshift")
end, false)

-- Fire/EMS Duty Command
RegisterCommand("fireduty", function()
    if isOnDuty then
        ShowNotification("~r~You must go OFF duty before switching roles. Use /offduty first.")
        print("Player attempted to go on Fire/EMS duty while still on duty.")
        return
    end

    print("Fire/EMS Duty command triggered!")

    -- Set the player as on duty
    isOnDuty = true
    currentJob = "Fire"

    -- Notify the player with GTA V Notification
    ShowNotification("~o~You are now on Fire/EMS duty.")

    -- Execute duty commands
    ExecuteCommand("onduty fire ERRPXYZ")
    ExecuteCommand("dutyblip on") -- Turn ON duty blip
    ExecuteCommand("toggleshift")
end, false)

-- Off Duty Command
RegisterCommand("offduty", function()
    if not isOnDuty then
        ShowNotification("~r~You are already off duty.")
        print("Player attempted to go off duty while already off.")
        return
    end

    print("Off duty command triggered!")

    -- Notify the player
    ShowNotification("~w~You are now OFF duty.")

    -- Execute off-duty commands
    ExecuteCommand("dutyblip off") -- Turn OFF duty blip
    ExecuteCommand("toggleshift")

    -- Only execute the correct off-duty command based on the last job
    if currentJob == "LEO" then
        ExecuteCommand("onduty leo ERRPXYZ")
    elseif currentJob == "Fire" then
        ExecuteCommand("onduty fire ERRPXYZ")
    end

    -- Reset duty status
    isOnDuty = false
    currentJob = nil
end, false)
