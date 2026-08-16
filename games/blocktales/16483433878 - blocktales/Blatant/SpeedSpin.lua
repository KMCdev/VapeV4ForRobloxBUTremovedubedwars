-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Blatant/SpeedSpin.lua

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
	["games/blocktales/16483433878 - blocktales/Blatant/SpeedSpin"] = function()
		local SpeedSpin
		local Value
		local old
		
		SpeedSpin = vape.Categories.Blatant:CreateModule({
			Name = 'SpeedSpin',
			Function = function(callback)
				if callback then
					old = hookfunction(bt.Shucky.HasBadge, function(...)
						local self, badge = ...
						if badge == 'Speed Spin' then
							return Value.Value
						end
		
						return old(...)
					end)
				else
					if old then
						hookfunction(bt.Shucky.HasBadge, old)
						old = nil
					end
				end
			end,
			Tooltip = 'Spoof the amount of speed spin cards you possess.'
		})
		Value = SpeedSpin:CreateSlider({
			Name = 'Card Amount',
			Min = 0,
			Max = 10,
			Default = 4
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Blatant/SpeedSpin")
