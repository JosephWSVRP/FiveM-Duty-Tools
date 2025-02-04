RegisterCommand("onduty", function(source, args)
    local dutyType = args[1] or 'none'
    local unitId = args[2] or 'Unknown'
    print(("Player %s is now on duty as %s (ID: %s)"):format(source, dutyType, unitId))
    -- Add logic for handling the duty status, e.g., assigning roles, updating player state, etc.
end, false)

RegisterCommand("dutyblip", function()
    -- Add logic to manage the duty blip on the map
    print("Duty blip triggered!")
end, false)

RegisterCommand("toggleshift", function()
    -- Add logic to toggle shift mode, e.g., change player status
    print("Shift mode toggled!")
end, false)
