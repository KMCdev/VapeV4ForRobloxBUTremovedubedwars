-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/ReachDisplay.lua

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
	["games/bedwars/6872274481 - game/Legit/ReachDisplay"] = function()
		local ReachDisplay
		local label
		
		ReachDisplay = vape.Legit:CreateModule({
			Name = 'Reach Display',
			Function = function(callback)
				if callback then
					repeat
						label.Text = (store.attackReachUpdate > tick() and store.attackReach or '0.00')..' studs'
						task.wait(0.4)
					until not ReachDisplay.Enabled
				end
			end,
			Size = UDim2.fromOffset(100, 41)
		})
		ReachDisplay:CreateFont({
			Name = 'Font',
			Blacklist = 'Gotham',
			Function = function(val)
				label.FontFace = val
			end
		})
		ReachDisplay:CreateColorSlider({
			Name = 'Color',
			DefaultValue = 0,
			DefaultOpacity = 0.5,
			Function = function(hue, sat, val, opacity)
				label.BackgroundColor3 = Color3.fromHSV(hue, sat, val)
				label.BackgroundTransparency = 1 - opacity
			end
		})
		label = Instance.new('TextLabel')
		label.Size = UDim2.fromScale(1, 1)
		label.BackgroundTransparency = 0.5
		label.TextSize = 15
		label.Font = Enum.Font.Gotham
		label.Text = '0.00 studs'
		label.TextColor3 = Color3.new(1, 1, 1)
		label.BackgroundColor3 = Color3.new()
		label.Parent = ReachDisplay.Children
		local corner = Instance.new('UICorner')
		corner.CornerRadius = UDim.new(0, 4)
		corner.Parent = label
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/ReachDisplay")
