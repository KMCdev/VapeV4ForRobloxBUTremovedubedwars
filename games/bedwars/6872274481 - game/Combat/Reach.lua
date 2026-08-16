-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Combat/Reach.lua

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
	["games/bedwars/6872274481 - game/Combat/Reach"] = function()
		local Value
		
		Reach = vape.Categories.Combat:CreateModule({
			Name = 'Reach',
			Function = function(callback)
				bedwars.CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = callback and Value.Value + 2 or 14.4
			end,
			Tooltip = 'Extends attack reach'
		})
		Value = Reach:CreateSlider({
			Name = 'Range',
			Min = 0,
			Max = 18,
			Default = 18,
			Function = function(val)
				if Reach.Enabled then
					bedwars.CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = val + 2
				end
			end,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Combat/Reach")
