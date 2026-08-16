-- Bundled by luau-bundler
-- Entry: games/bridge duel/139566161526375 - game/Combat/Reach.lua

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
	["games/bridge duel/139566161526375 - game/Combat/Reach"] = function()
		--[[local old
		
		vape.Categories.Combat:CreateModule({
			Name = 'Reach',
			Function = function(callback)
				if callback then
					--old = rawget(bd.CombatConstants, 'REACH_IN_STUDS')
					--rawset(bd.CombatConstants, 'REACH_IN_STUDS', 18)
					--rawset(bd.Entity.LocalEntity, 'Reach', 18)
				else
					--rawset(bd.CombatConstants, 'REACH_IN_STUDS', old)
					--rawset(bd.Entity.LocalEntity, 'Reach', old)
					--old = nil
				end
			end,
			Tooltip = 'Extends attack reach'
		})]]
	end,
}

return __require("games/bridge duel/139566161526375 - game/Combat/Reach")
