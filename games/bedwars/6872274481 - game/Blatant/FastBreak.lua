-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Blatant/FastBreak.lua

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
	["games/bedwars/6872274481 - game/Blatant/FastBreak"] = function()
		local FastBreak
		local Time
		
		FastBreak = vape.Categories.Blatant:CreateModule({
			Name = 'FastBreak',
			Function = function(callback)
				if callback then
					repeat
						bedwars.BlockBreakController.blockBreaker:setCooldown(Time.Value)
						task.wait(0.1)
					until not FastBreak.Enabled
				else
					bedwars.BlockBreakController.blockBreaker:setCooldown(0.3)
				end
			end,
			Tooltip = 'Decreases block hit cooldown'
		})
		Time = FastBreak:CreateSlider({
			Name = 'Break speed',
			Min = 0,
			Max = 0.3,
			Default = 0.25,
			Decimal = 100,
			Suffix = 'seconds'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Blatant/FastBreak")
