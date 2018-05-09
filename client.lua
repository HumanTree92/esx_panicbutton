ESX                           = nil
local PlayerData              = {}
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 57) and PlayerData.job ~= nil and PlayerData.job.name == 'police' then -- Set to the "F10" Key
            local ped = PlayerPedId()
            local x,y,z = table.unpack(GetEntityCoords(ped, false))
            local streetName, crossing = GetStreetNameAtCoord(x, y, z)
            streetName = GetStreetNameFromHashKey(streetName)
            local message = ""
            if crossing ~= nil then
                crossing = GetStreetNameFromHashKey(crossing)
                message = "^4" .. GetPlayerName(PlayerId()) .. "^1 has called a 10-13 near ^3" .. streetName .. " ^1and ^3" .. crossing .. " ^1all units break and roll code 3."
            else
                message = "^4" .. GetPlayerName(PlayerId()) .. "^1 has called a 10-13 near ^3" .. streetName .. " ^1all units break and roll code 3."
            end
            TriggerServerEvent('sendChatMessage', message)
        end
    end
end)
