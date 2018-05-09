ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('sendChatMessage')
AddEventHandler('sendChatMessage', function(message)
    TriggerClientEvent('chatMessage', -1, '', {255,255,255}, message)
end)