-- Bundled by luau-bundler
-- Entry: games/universal - base/Render/Health.lua

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
	["games/universal - base/Render/Health"] = function()
		local Health
		
		Health = vape.Categories.Render:CreateModule({
			Name = 'Health',
			Function = function(callback)
				if callback then
					local label = Instance.new('TextLabel')
					label.Size = UDim2.fromOffset(100, 20)
					label.Position = UDim2.new(0.5, 6, 0.5, 30)
					label.AnchorPoint = Vector2.new(0.5, 0)
					label.BackgroundTransparency = 1
					label.Text = '100 ❤️'
					label.TextSize = 18
					label.Font = Enum.Font.Arial
					label.Parent = vape.gui
					Health:Clean(label)
					
					repeat
						label.Text = entitylib.isAlive and math.round(entitylib.character.Humanoid.Health)..' ❤️' or ''
						label.TextColor3 = entitylib.isAlive and Color3.fromHSV((entitylib.character.Humanoid.Health / entitylib.character.Humanoid.MaxHealth) / 2.8, 0.86, 1) or Color3.new()
						task.wait()
					until not Health.Enabled
				end
			end,
			Tooltip = 'Displays your health in the center of your screen.'
		})
	end,
}

return __require("games/universal - base/Render/Health")
