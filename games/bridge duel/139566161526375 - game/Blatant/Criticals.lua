-- Bundled by luau-bundler
-- Entry: games/bridge duel/139566161526375 - game/Blatant/Criticals.lua

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
	["games/bridge duel/139566161526375 - game/Blatant/Criticals"] = function()
		local old
		
		vape.Categories.Blatant:CreateModule({
			Name = 'Criticals',
			Function = function(callback)
				if callback then
					old = hookfunction(bd.Blink.item_action.attack_entity.fire, function(...)
						local data = ...
						if type(data) == 'table' then
							rawset(data, 'is_crit', true)
						end
		
						return old(...)
					end)
				else
					hookfunction(bd.Blink.item_action.attack_entity.fire, old)
					old = nil
				end
			end,
			Tooltip = 'Always hit criticals'
		})
	end,
}

return __require("games/bridge duel/139566161526375 - game/Blatant/Criticals")
