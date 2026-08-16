-- Bundled by luau-bundler
-- Entry: games/bridge duel/139566161526375 - game/Blatant/InvMove.lua

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
	["games/bridge duel/139566161526375 - game/Blatant/InvMove"] = function()
		local old
		
		vape.Categories.Blatant:CreateModule({
			Name = 'InvMove',
			Function = function(callback)
				if callback then
					old = hookfunction(bd.MovementController.AddSpeedOverride, function(...)
						if select(2, ...) == 'MenuOpen' then
							return
						end
		
						return old(...)
					end)
		
					bd.MovementController:RemoveSpeedOverride('MenuOpen')
				else
					if old then
						hookfunction(bd.MovementController.AddSpeedOverride, old)
						old = nil
					end
				end
			end,
			Tooltip = 'Allows you to have continuous movement in menus'
		})
	end,
}

return __require("games/bridge duel/139566161526375 - game/Blatant/InvMove")
