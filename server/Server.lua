ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

local OtherTriggers = "egjwigjwgewgwegEGWGEwegewgwegGWEG"..math.random(22525253225352352355235235235525,99999999999922525253225352352355235235235525).."Ewsigjs392wefdsdf"..math.random(22525253225352352355235235235525,99999999999922525253225352352355235235235525) -- place random shit plz

SecretTrigger = OtherTriggers

ESX.RegisterUsableItem('shovel', function(source)
	TriggerClientEvent("esx_AR-StoneWash:kaiva", source, SecretTrigger)
end)

ESX.RegisterUsableItem('pan', function(source)
	local xPlayer = ESX.GetPlayerFromId(source) 
	if xPlayer.getInventoryItem('stonemixture').count >= 1 then
		xPlayer.removeInventoryItem('stonemixture', 1)
		TriggerClientEvent('esx_AR-StoneWash:washstart', source, SecretTrigger)
	else
		TriggerClientEvent('esx:showNotification', source, ('You need ~o~stonemixture~w~ to start pan!'))
	end
end)

RegisterServerEvent(SecretTrigger..':esx_AR-StoneWash:reward')
AddEventHandler(SecretTrigger..':esx_AR-StoneWash:reward', function()
 local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer ~= nil then
   xPlayer.addInventoryItem('stonemixture', 1)
  end
end)

RegisterServerEvent(SecretTrigger..'esx_AR-StoneWash:washreward')
AddEventHandler(SecretTrigger..'esx_AR-StoneWash:washreward', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local Chance = math.random(1, 2000)

  if xPlayer.getInventoryItem('pan').count >= 1 then --"Modder check" Just in case
		if Chance >= 1000 and Chance <= 1400 then
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You found: ~r~Opal!'))
			xPlayer.addInventoryItem('opal', 1)

		elseif Chance >= 1401 and Chance <= 1800 then
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You found: ~r~Quartz!'))
			xPlayer.addInventoryItem('quartz', 1)

		elseif Chance >= 1801 and Chance <= 1970 then
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You found: ~r~Ropaz!'))
			xPlayer.addInventoryItem('topaz', 1)

		elseif Chance >= 1971 and Chance <= 1996 then
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You found: ~r~Ruby!'))
			xPlayer.addInventoryItem('ruby', 1)

		elseif Chance >= 1997 and Chance <= 1998 then
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You found: ~r~Nugget!'))
			xPlayer.addInventoryItem('nugget', 1)

		elseif Chance >= 1999 and Chance <= 2000 then
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You found: ~r~Diamond!'))
			xPlayer.addInventoryItem('washdiamond', 1)

		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You found: ~r~nothind!'))
		end
	end
end)






