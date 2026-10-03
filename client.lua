local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('fivemscript:clientEvent')
AddEventHandler('fivemscript:clientEvent', function(data)
    ESX.ShowNotification('Received data: ' .. data)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then -- E key
            TriggerServerEvent('fivemscript:serverEvent', 'example_data')
        end
    end
end)