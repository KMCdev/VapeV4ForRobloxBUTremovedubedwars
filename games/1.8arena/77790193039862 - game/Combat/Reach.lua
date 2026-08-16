-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/Combat/Reach.lua

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
	["games/1.8arena/77790193039862 - game/Combat/Reach"] = function()
		local Reach
		local Value
		local old
		
		Reach = vape.Categories.Combat:CreateModule({
			Name = 'Reach',
			Function = function(callback)
				if callback then
		            old = debug.getupvalue(oldhit or arena.Client.startHit, 4)
		            debug.setupvalue(oldhit or arena.Client.startHit, 4, old + Value.Value)
				else
		            if old then
		                debug.setupvalue(oldhit or arena.Client.startHit, 4, old)
		                old = nil
		            end
				end
			end,
			Tooltip = 'Extends attack reach'
		})
		Value = Reach:CreateSlider({
			Name = 'Range',
			Min = 0,
			Max = 6,
		    Default = 6,
			Decimal = 10,
		    Function = function(val)
				if Reach.Enabled then
					debug.setupvalue(oldhit or arena.Client.startHit, 4, old + val)
				end
			end,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/Combat/Reach")
