ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end) 

ESX.RegisterUsableItem("spade", function(source) ---Change to your liking
	TriggerClientEvent("esx_dig:kaiva", source)
end)

--Quick instructions
-- Defaultitem = Change to whatever item people would get everytime they dug up. (mud or gravel or whatever it's called)
-- Extraitem = Change to whatever you think people should get if lucky


RegisterServerEvent('esx_dig:reward')
AddEventHandler('esx_dig:reward', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  local lootti = math.random(1,1024)  --## Change values to increase/decrease chances * 
  local rmaara = math.random(1,2)  ---## Change values to increase/decrease random amounts * 
	
	if lootti >= 1 and lootti <= 350 then  ----##Copypaste to add more items with different chances *
		xPlayer.addInventoryItem('Extraitem', 1) 
		xPlayer.addInventoryItem('Defaultitem', rmaara) 
		TriggerClientEvent('esx:showNotification', xPlayer.source, ('You dug and found: ~y~Extraitem'))
	elseif lootti >= 351 and lootti <=352 then
		xPlayer.addInventoryItem('Extraitem', 1)
		xPlayer.addInventoryItem('Defaultitem', rmaara)
		TriggerClientEvent('esx:showNotification', xPlayer.source, ('You dug and found: ~r~Extraitem'))
	elseif lootti >= 401 and lootti <=402 then
		xPlayer.addInventoryItem('Extraitem', 1)
		xPlayer.addInventoryItem('Defaultitem', rmaara)
		TriggerClientEvent('esx:showNotification', xPlayer.source, ('You dug and found: ~r~Extraitem'))
	else
		xPlayer.addInventoryItem('Defaultitem', rmaara)
		TriggerClientEvent('esx:showNotification', xPlayer.source, ('You dug and found:  ~o~Defaultitem'))
	end
end)

--###############################################--
------------------KULLANHUUHDONTA | PANNING---------------------
--###############################################--

ESX.RegisterUsableItem('vaskooli', function(source) --Change item to your liking  ( Vaskooli = bowl ) 
	local xPlayer = ESX.GetPlayerFromId(source) 
	
	if xPlayer.getInventoryItem('Defaultitem').count >= 1 then ---Defaultitem such as "mud" or "gravel" or whatever it's called.
		TriggerClientEvent('huuhdo:start', source)
	else
		TriggerClientEvent('esx:showNotification', xPlayer.source, ('You need ~o~Defaultitem~w~ to start panning'))
	end
end)

RegisterServerEvent('huuhdo:reward')
AddEventHandler('huuhdo:reward', function(count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source) 
	local tsekki = xPlayer.getInventoryItem('Defaultitem')
	local lootti = math.random(1,512) -- *
	local maara = math.random(1,4) -- *
	local maara2 = math.random(2,4) -- adjust should you want to buff more better droptable 
	
	if tsekki.count >= 6 then --Better droptable if washing 6x -defaultitem
		xPlayer.removeInventoryItem('Defaultitem', 6)
		
		if lootti >= 1 and lootti <= 160 then
			xPlayer.addInventoryItem('Extraitem', maara2)
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~y~Extraitem'))
		elseif lootti >= 161 and lootti <=162 then
			xPlayer.addInventoryItem('Extraitem', 1)
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~y~Extraitem'))
		elseif lootti >= 240 and lootti <= 241 then
			xPlayer.addInventoryItem('Extraitem', 1)
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~y~ Extraitem'))
		elseif lootti >= 280 and lootti <= 340 then
			xPlayer.addMoney(math.random(240,500))
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~g~ Coins'))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You dropped your bowl, you idiot sandwich... ~n~ You got ~r~nothing...'))
		end
		
	elseif tsekki.count >= 0 then  ---Worse droptable when washing <6 "Defaultitem"
		tsekki2 = math.random(1, tsekki.count)
		xPlayer.removeInventoryItem('Defaultitem', tsekki2)
		
		if lootti >= 1 and lootti <= 160 then
			xPlayer.addInventoryItem('Extraitem', maara)
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~y~Extraitem'))
		elseif lootti >= 161 and lootti <=162 then
			xPlayer.addInventoryItem('Extraitem', 1)
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~y~Extraitem'))
		elseif lootti >= 240 and lootti <= 241 then
			xPlayer.addInventoryItem('Extraitem', 1)
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~y~ Extraitem'))
		elseif lootti >= 280 and lootti <= 340 then
			xPlayer.addMoney(math.random(69,160))
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('Succesfully panned, you got: ~g~ Coins'))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, ('You dropped your bowl, you idiot sandwich... ~n~ You got ~r~nothing...'))
		end
	end
end)
