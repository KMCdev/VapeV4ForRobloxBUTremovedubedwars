-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/World/FastBreak.lua

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
	["games/1.8arena/77790193039862 - game/World/FastBreak"] = function()
		local FastBreak
		local Value
		local old
		
		FastBreak = vape.Categories.World:CreateModule({
			Name = 'FastBreak',
			Function = function(callback)
				if callback then
					old = hookfunction(arena.Client.showMiningProgress, function(progress)
						progress *= Value.Value
						debug.setstack(3, 5, debug.getstack(3, 5) * Value.Value)
						return old(progress)
					end)
				else
					if old then
						hookfunction(arena.Client.showMiningProgress, old)
						old = nil
					end
				end
			end,
			Tooltip = 'Break blocks faster when mining.'
		})
		Value = FastBreak:CreateSlider({
			Name = 'Multiplier',
			Min = 0,
			Max = 3,
			Default = 3,
			Decimal = 10
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/World/FastBreak")
