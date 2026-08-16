-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/VehicleSpeed.lua

local __modules = {}
local __cache = {}

local function __require(id)
	if __cache[id] ~= nil then
		return __cache[id]
	end
	local loader = __modules[id]
	if not loader then
		error("module not found: " .. tostring(id), 2)
	end
	local result = loader()
	__cache[id] = result
	return result
end

__modules = {
	["games/prison life/155615604 - main/Blatant/VehicleSpeed"] = function()
		local VehicleSpeed
		local Speed
		local old
		local seats = {}
		
		VehicleSpeed = vape.Categories.Blatant:CreateModule({
			Name = 'VehicleSpeed',
			Function = function(callback)
				if callback then
					repeat
						local seat = entitylib.isAlive and entitylib.character.Humanoid.SeatPart
						if seat then
							if seat ~= old then
								if seat:IsDescendantOf(workspace.CarContainer) then
									seats = seat.Parent.Parent:QueryDescendants('VehicleSeat')
								end
		
								old = seat
							end
		
							for _, v in seats do
								v.MaxSpeed = Speed.Value
								v.Torque = 4
							end
						end
		
						task.wait()
					until not VehicleSpeed.Enabled
				else
					table.clear(seats)
				end
			end,
			Tooltip = 'Increase vehicle speed'
		})
		Speed = VehicleSpeed:CreateSlider({
			Name = 'Speed',
			Min = 80,
			Max = 200,
			Default = 140
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/VehicleSpeed")
