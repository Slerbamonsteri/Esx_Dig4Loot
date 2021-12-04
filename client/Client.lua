local blip_location = Config.Location
local area_size = Config.AreaSize

local blip = nil
local area_blip = nil

local ishuuhdo = false
local kaivamista = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end
end)


RegisterNetEvent("esx_AR-StoneWash:kaiva")
AddEventHandler("esx_AR-StoneWash:kaiva", function(TRIGGERITs)
local pelaaja = PlayerPedId()
local pos = GetEntityCoords(pelaaja)
local dist = #(pos - blip_location)
if dist < area_size then
	if not IsPedInAnyVehicle(pelaaja) then
		if not kaivamista then
		kaivamista = true
		ishuuhdo = true
		ESX.UI.Menu.CloseAll()
		TaskStartScenarioInPlace(pelaaja, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
		Citizen.Wait(10000)
		if IsPedUsingScenario(pelaaja, "WORLD_HUMAN_GARDENER_PLANT") then
		TriggerServerEvent(TRIGGERITs..":esx_AR-StoneWash:reward", pelaaja)
		ishuuhdo = false
		kaivamista = false
		ClearPedTasksImmediately(pelaaja)
		else
			exports['mythic_notify']:DoHudText('error', 'Dont try to cheat!!')
		ClearPedTasksImmediately(pelaaja)
		ExecuteCommand("/report "..GetCurrentResourceName()..": I cheated in stonewash with emoteabuse!!")
		kaivamista = false
		end
	else
		exports['mythic_notify']:DoHudText('error', 'You cant cheat!!')
	end
	else
		exports['mythic_notify']:DoHudText('error', 'You cant be in car!!')
	end
	else
		exports['mythic_notify']:DoHudText('error', 'You need to be in area!!')

end
end)

RegisterNetEvent('esx_AR-StoneWash:wash:start')
AddEventHandler('esx_AR-StoneWash:wash:start', function(TRIGGERITs)
	Citizen.CreateThread(function()
		local ped = PlayerPedId()
		local playerPed = PlayerPedId()
		ClearPedTasks(ped)
		ClearPedSecondaryTask(playerPed)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		if not IsPedInAnyVehicle(ped) then
			if not IsPedSwimming(ped) then
				if IsEntityInWater(ped) then
					exports['mythic_notify']:DoHudText('error', 'Starting washing!!')
					ishuuhdo = true
					ishuuhdoa = true
					ESX.UI.Menu.CloseAll()
				else
					exports['mythic_notify']:DoHudText('error', 'You need to be in water!!')
				end
				else
					exports['mythic_notify']:DoHudText('error', 'You cant swim!!')
				end
				else
					exports['mythic_notify']:DoHudText('error', 'You cant be in car!!')
				end
			while ishuuhdoa do
				local proppi = CreateObject(GetHashKey("bkr_prop_coke_metalbowl_02"), 0, 0, 0, true, true, true)
				ClearPedTasks(ped)
				TaskStartScenarioInPlace(ped, "WORLD_HUMAN_BUM_WASH", 0, false)
				AttachEntityToEntity(proppi, ped, GetPedBoneIndex(ped, 60309), 0.129, 0.14, 0.13, 270.0, 180.0, 300.0, true, true, false, true, 1, true)
				Citizen.Wait(10000)
				if IsPedUsingScenario(ped, "WORLD_HUMAN_BUM_WASH") then
				ishuuhdo = false
				ishuuhdoa = false
				DeleteEntity(proppi)
				ClearPedTasksImmediately(ped)
				TriggerServerEvent(TRIGGERITs..'esx_AR-StoneWash:washreward', ped)
				else
					exports['mythic_notify']:DoHudText('error', 'Dont try to cheat!!')
					ExecuteCommand("/report "..GetCurrentResourceName()..": I cheated in stonewash with emoteabuse!!")
				ishuuhdo = false
				ishuuhdoa = false
				DeleteEntity(proppi)
				ClearPedTasksImmediately(ped)
				end
			end
		end)
	end)

Citizen.CreateThread(function()
	Blips()
	while true do
	if ishuuhdo then
		Citizen.Wait(0)
		DisableControlAction(0, 24, true) -- Attack
		DisableControlAction(0, 257, true) -- Attack 2
		DisableControlAction(0, 25, true) -- Aim
		DisableControlAction(0, 263, true) -- Melee Attack 1
		DisableControlAction(0, 32, true) -- W
		DisableControlAction(0, 34, true) -- A
		DisableControlAction(0, 31, true) -- S (fault in Keys table!)
		DisableControlAction(0, 30, true) -- D (fault in Keys table!)
		DisableControlAction(0, 18, true) -- Enter
		DisableControlAction(0, 45, true) -- Reload			
		DisableControlAction(0, 52, true) -- Cover
		DisableControlAction(0, 289, true) -- f2
		DisableControlAction(0, 37, true) -- Select Weapon

		DisableControlAction(0, 288, true) -- Disable phone
		DisableControlAction(0, 289, true) -- Inventory
		DisableControlAction(0, 170, true) -- Animations
		DisableControlAction(0, 167, true) -- Job			
		DisableControlAction(0, 26, false) -- Disable looking behind
		DisableControlAction(0, 186, true) -- Disable clearing animation

		DisableControlAction(0, 59, true) -- Disable steering in vehicle

		DisableControlAction(2, 36, true) -- Disable going stealth

		DisableControlAction(0, 47, true)  -- Disable weapon
		DisableControlAction(0, 264, true) -- Disable melee
		DisableControlAction(0, 257, true) -- Disable melee
		DisableControlAction(0, 140, true) -- Disable melee
		DisableControlAction(0, 141, true) -- Disable melee
		DisableControlAction(0, 73, true) 
		DisableControlAction(0, 142, true) -- Disable melee
		DisableControlAction(0, 143, true) -- Disable melee
		DisableControlAction(0, 75, true)  -- Disable exit vehicle
		DisableControlAction(27, 75, true) -- Disable exit vehicle
	else
		Citizen.Wait(250)
		EnableControlAction(0, 24, true) -- Attack
		EnableControlAction(0, 257, true) -- Attack 2
		EnableControlAction(0, 25, true) -- Aim
		EnableControlAction(0, 289, true) -- f2
		EnableControlAction(0, 263, true) -- Melee Attack 1
		EnableControlAction(0, 32, true) -- W
		EnableControlAction(0, 34, true) -- A
		EnableControlAction(0, 31, true) -- S (fault in Keys table!)
		EnableControlAction(0, 30, true) -- D (fault in Keys table!)
		EnableControlAction(0, 18, true) -- Enter
		EnableControlAction(0, 45, true) -- Reload
		EnableControlAction(0, 52, true) -- Cover
		EnableControlAction(0, 37, true) -- Select Weapon

		EnableControlAction(0, 288, true) -- Disable phone
		EnableControlAction(0, 289, true) -- Inventory
		EnableControlAction(0, 170, true) -- Animations
		EnableControlAction(0, 167, true) -- Job

		EnableControlAction(0, 26, true) -- Disable looking behind
		EnableControlAction(0, 186, true) -- Disable clearing animation

		EnableControlAction(0, 59, true) -- Disable steering in vehicle

		EnableControlAction(2, 36, true) -- Disable going stealth

		EnableControlAction(0, 47, true)  -- Disable weapon
		EnableControlAction(0, 264, true) -- Disable melee
		EnableControlAction(0, 257, true) -- Disable melee
		EnableControlAction(0, 140, true) -- Disable melee
		EnableControlAction(0, 141, true) -- Disable melee
		EnableControlAction(0, 73, true)  --  Disable x
		EnableControlAction(0, 142, true) -- Disable melee
		EnableControlAction(0, 143, true) -- Disable melee
		EnableControlAction(0, 75, true)  -- Disable exit vehicle
		EnableControlAction(0, 75, true) -- Disable exit vehicle		
	end
	end
end)

function Blips()
	blip = AddBlipForCoord(blip_location)
    SetBlipSprite(blip, 617)
	SetBlipColour(blip, 49)
	SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(Config.DigSiteName)
    EndTextCommandSetBlipName(blip)
    area_blip = AddBlipForRadius(blip_location, area_size)
    SetBlipSprite(area_blip, 10)
end
