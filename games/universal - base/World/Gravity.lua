-- Bundled by luau-bundler
-- Entry: games/universal - base/World/Gravity.lua

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
	["games/universal - base/World/Gravity"] = function()
		local Gravity
		local Mode
		local Value
		local changed, old = false
		
		Gravity = vape.Categories.World:CreateModule({
			Name = 'Gravity',
			Function = function(callback)
				if callback then
					if Mode.Value == 'Workspace' then
						old = workspace.Gravity
						workspace.Gravity = Value.Value
						Gravity:Clean(workspace:GetPropertyChangedSignal('Gravity'):Connect(function()
							if changed then return end
							changed = true
							old = workspace.Gravity
							workspace.Gravity = Value.Value
							changed = false
						end))
					else
						Gravity:Clean(runService.PreSimulation:Connect(function(dt)
							if entitylib.isAlive and entitylib.character.Humanoid.FloorMaterial == Enum.Material.Air then
								local root = entitylib.character.RootPart
								if Mode.Value == 'Impulse' then
									root:ApplyImpulse(Vector3.new(0, dt * (workspace.Gravity - Value.Value), 0) * root.AssemblyMass)
								else
									root.AssemblyLinearVelocity += Vector3.new(0, dt * (workspace.Gravity - Value.Value), 0)
								end
							end
						end))
					end
				else
					if old then
						workspace.Gravity = old
						old = nil
					end
				end
			end,
			Tooltip = 'Changes the rate you fall'
		})
		Mode = Gravity:CreateDropdown({
			Name = 'Mode',
			List = {'Workspace', 'Velocity', 'Impulse'},
			Tooltip = 'Workspace - Adjusts the gravity for the entire game\nVelocity - Adjusts the local players gravity\nImpulse - Same as velocity while using forces instead'
		})
		Value = Gravity:CreateSlider({
			Name = 'Gravity',
			Min = 0,
			Max = 192,
			Function = function(val)
				if Gravity.Enabled and Mode.Value == 'Workspace' then
					changed = true
					workspace.Gravity = val
					changed = false
				end
			end,
			Default = 192
		})
	end,
}

return __require("games/universal - base/World/Gravity")
