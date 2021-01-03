ESX = nil
local blip_location = vector3(1580.9, 6592.204, 13.84828)
local blip = nil
local area_blip = nil
local area_size = 100.0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	blip = AddBlipForCoord(blip_location)
    SetBlipSprite(blip, 273)
	SetBlipColour(blip, 0)
	SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Digsite') -- set blip's "name"
    EndTextCommandSetBlipName(blip)
    area_blip = AddBlipForRadius(blip_location, area_size)
    SetBlipSprite(area_blip, 10)
end)

local kaiva

RegisterNetEvent("esx_dig:kaiva")
AddEventHandler("esx_dig:kaiva", function()
    local pos = GetEntityCoords(PlayerPedId())
    local dist = #(pos - blip_location)
	local pelaaja = PlayerPedId()

	if dist < area_size then
		if not IsPedInAnyVehicle(PlayerPedId()) then
			plsdonthurt()
			TaskStartScenarioInPlace(pelaaja, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
			Citizen.Wait(10000)
			if IsPedUsingScenario(pelaaja, "WORLD_HUMAN_GARDENER_PLANT") then
			TriggerServerEvent("esx_dig:reward")
			ClearPedTasksImmediately(pelaaja)
			else
			ESX.ShowNotification('~r~Cheater, Cheater', true, true, 70)
			ClearPedTasksImmediately(pelaaja)
			end
		else
			ESX.ShowNotification('You can not dig ~r~in vehicle', true, true, 70)
		end
		else
			ESX.ShowNotification('You can not dig ~r~outside of the Digsite', true, true, 70)
	end
end, false)

function plsdonthurt()
	local pelaaja = PlayerPedId()

	if disable_actions == true then
		DisableAllControlActions(0)
	end

	DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
	DisablePlayerFiring(pelaaja,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
    DisableControlAction(0, 106, true) -- Disable in-game mouse controls
    DisableControlAction(0, 140, true)
	DisableControlAction(0, 141, true)
	DisableControlAction(0, 142, true)
	DisableControlAction(0, 77, true)
	DisableControlAction(0, 26, true)
	DisableControlAction(0, 36, true)	
	DisableControlAction(0, 45, true)
	DisableControlAction(0, 83, true)
	EnableControlAction(0, 249, true)

	if IsDisabledControlJustPressed(2, 37) then 
		SetCurrentPedWeapon(pelaaja,GetHashKey("WEAPON_UNARMED"),true) 
	end

	if IsDisabledControlJustPressed(0, 106) then
		SetCurrentPedWeapon(pelaaja,GetHashKey("WEAPON_UNARMED"),true)
	end
end

--###############################################--
------------------KULLANHUUHDONTA | PANNING---------------------
--###############################################--

local ishuuhdo

RegisterNetEvent('huuhdo:start')
AddEventHandler('huuhdo:start', function(source)
local _source = source
local ped = GetPlayerPed(-1)

Citizen.CreateThread(function()
	local ped = GetPlayerPed(-1)
	local playerPed = PlayerPedId()

	ClearPedTasks(ped)
	ClearPedSecondaryTask(playerPed)
	DisablePlayerFiring(playerPed, false)
	SetPedCanPlayGestureAnims(playerPed, true)
	FreezeEntityPosition(playerPed, false)
	
	while not ishuuhdo do
		Citizen.Wait(0)
		EnableControlAction(0, 24, true) -- Attack
		EnableControlAction(0, 257, true) -- Attack 2
		EnableControlAction(0, 25, true) -- Aim
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
		EnableControlAction(0, 142, true) -- Disable melee
		EnableControlAction(0, 143, true) -- Disable melee
		EnableControlAction(0, 75, true)  -- Disable exit vehicle
		EnableControlAction(0, 75, true) -- Disable exit vehicle		
	end
	while ishuuhdo do
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
		DisableControlAction(0, 142, true) -- Disable melee
		DisableControlAction(0, 143, true) -- Disable melee
		DisableControlAction(0, 75, true)  -- Disable exit vehicle
		DisableControlAction(27, 75, true) -- Disable exit vehicle
	end
end)
	if not IsPedInAnyVehicle(ped) then
		if not IsPedSwimming(ped) then
			if IsEntityInWater(ped) then
				ESX.ShowNotification('~w~Started ~g~panning...')
				ESX.UI.Menu.CloseAll()
				ishuuhdo = true
			else
				ESX.ShowNotification('~w~Find water to start ~g~panning...')
			end
			else
				ESX.ShowNotification('~w~You can not ~r~Swim ~w~when ~g~panning...~w~')
			end
			else
				ESX.ShowNotification('You can not ~r~pan ~w~in vehicle')
			end
		while ishuuhdo do
			local proppi = CreateObject(GetHashKey("bkr_prop_coke_metalbowl_02"), 0, 0, 0, true, true, true)
			ClearPedTasks(ped)
			local coords = GetEntityCoords(ped)
			TaskStartScenarioInPlace(ped, "WORLD_HUMAN_BUM_WASH", 0, false)
			AttachEntityToEntity(proppi, ped, GetPedBoneIndex(ped, 60309), 0.129, 0.14, 0.13, 270.0, 180.0, 300.0, true, true, false, true, 1, true)
			Citizen.Wait(10000)
			if IsPedUsingScenario(ped, "WORLD_HUMAN_BUM_WASH") then
			ishuuhdo = false
			DeleteEntity(proppi)
			ClearPedTasksImmediately(ped)
			TriggerServerEvent('huuhdo:reward')
			else
			ESX.ShowNotification('~r~Cheater, Cheater.')
			ishuuhdo = false
			DeleteEntity(proppi)
			ClearPedTasksImmediately(ped)
			end
		end
end)
