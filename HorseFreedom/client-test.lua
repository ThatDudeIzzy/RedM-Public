--[[Haven't tested this, but it should work to have horse speed syncing
able to be toggled by the command "horsesync". Would be better to add
a notification to let the player know is syncing is on or off]]

local player = PlayerPedId()
local stoppy = true

RegisterNetEvent('izzysync:stop', function(horsestop)
    stoppy = horsestop
end)

RegisterCommand("horsesync", function(source, args, rawCommand)
    Config.sync = not Config.sync
end, false)

CreateThread(function()
    while true do
        player = PlayerPedId()
        if stoppy == true and Config.sync == false then 
            SetPedConfigFlag(player, 319, false)
            SetPedConfigFlag(player, 366, true)
        elseif stoppy == true and Config.sync == true then
            SetPedConfigFlag(player, 319, true)
            SetPedConfigFlag(player, 366, false)
        end
        Wait(100)
    end
end)