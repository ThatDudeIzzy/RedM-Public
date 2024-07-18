local player = PlayerPedId()
local stoppy = true

RegisterNetEvent('izzysync:stop', function(horsestop) -- Ignore this for now, its to be used later with later versions.
    stoppy = horsestop
end)

CreateThread(function() -- This loop is done this way to add a future item check.
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