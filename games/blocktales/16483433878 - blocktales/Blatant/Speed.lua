-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Blatant/Speed.lua

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
	["games/blocktales/16483433878 - blocktales/Blatant/Speed"] = function()
		local Speed
		local Value
		
		Speed = vape.Categories.Blatant:CreateModule({
			Name = 'Speed',
			Function = function(callback)
				if callback then
					Speed:Clean(runService.PreSimulation:Connect(function(dt)
						if entitylib.isAlive and not Fly.Enabled and not LongJump.Enabled then
							local root = entitylib.character.RootPart
							local state = entitylib.character.Humanoid:GetState()
							if state == Enum.HumanoidStateType.Climbing or bt.Variables.transitioning then return end
		
							local movevec = entitylib.character.Humanoid.MoveDirection * Value.Value
							root.AssemblyLinearVelocity = Vector3.new(movevec.X, root.AssemblyLinearVelocity.Y, movevec.Z)
						end
					end))
				end
			end,
			ExtraText = function()
				return 'Velocity'
			end,
			Tooltip = 'Increases your movement with various methods.'
		})
		Value = Speed:CreateSlider({
			Name = 'Speed',
			Min = 1,
			Max = 150,
			Default = 50,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Blatant/Speed")
