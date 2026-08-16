-- Bundled by luau-bundler
-- Entry: games/bridge duel/139566161526375 - game/Blatant/NoFall.lua

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
	["games/bridge duel/139566161526375 - game/Blatant/NoFall"] = function()
		local old
		
		vape.Categories.Blatant:CreateModule({
			Name = 'NoFall',
			Function = function(callback)
				if callback then 
					old = hookfunction(bd.Blink.player_state.take_fall_damage.fire, function() end)
				else
					hookfunction(bd.Blink.player_state.take_fall_damage.fire, old)
					old = nil
				end
			end,
			Tooltip = 'Prevents taking fall damage.'
		})
	end,
}

return __require("games/bridge duel/139566161526375 - game/Blatant/NoFall")
