local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('fivemscript:getData', function(source, cb, playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM ' .. Config.Database.TableName .. ' WHERE player_id = @player_id', {
            ['@player_id'] = playerId
        }, function(result)
            if result[1] then
                cb(result[1].data)
            else
                cb(nil)
            end
        end)
    else
        cb(nil)
    end
end)

RegisterNetEvent('fivemscript:serverEvent')
AddEventHandler('fivemscript:serverEvent', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer then
        TriggerClientEvent('fivemscript:clientEvent', _source, data)
    end
end)