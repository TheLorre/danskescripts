RegisterNetEvent('carstats');
AddEventHandler('carstats', function()
local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then
		local veh = GetVehiclePedIsIn(ped, false)
		local model = GetEntityModel(veh, false)
		local hash = GetHashKey(model)
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Navn:^7 ".. GetDisplayNameFromVehicleModel(model))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Top Hastighed (KMH):^7 ".. round(GetVehicleMaxSpeed(model) * 3.6,1))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Acceleration:^7 ".. round(GetVehicleModelAcceleration(model),1))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Antal Gear:^7 ".. GetVehicleHighGear(veh))
		TriggerEvent('chatMessage', "", {255, 0, 0}, "^3Antal Sæder:^7 ".. GetVehicleMaxNumberOfPassengers(veh) + 1)
	end
end)

--snippet borrowed from http://lua-users.org/wiki/SimpleRound
function round(num, numDecimalPlaces)
  local mult = 100^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end