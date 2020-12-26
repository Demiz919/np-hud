ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("carfill:checkmoney")
AddEventHandler("carfill:checkmoney", function(costs,loc)
    local src = source
    local target = ESX.GetPlayerFromId(src)

    if not costs then
        costs = 0
    end

    if target.get('money') >= costs then
        target.removeMoney(costs)
        TriggerClientEvent("RefuelCarServerReturn", src)
    else
        TriggerClientEvent('notification', src, 'You need $' .. costs .. ' + tax', 2)
    end
end)

TriggerEvent('disc-inventoryhud:registerItemUse', 'watch', function(source)
	local source = tonumber(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('carHud:compass', source, xPlayer.getInventoryItem('watch').count)
end)