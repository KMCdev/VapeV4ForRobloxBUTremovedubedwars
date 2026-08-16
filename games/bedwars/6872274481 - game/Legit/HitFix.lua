-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/HitFix.lua

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
	["games/bedwars/6872274481 - game/Legit/HitFix"] = function()
		vape.Legit:CreateModule({
			Name = 'HitFix',
			Function = function(callback)
				debug.setconstant(bedwars.SwordController.swingSwordAtMouse, 23, callback and 'raycast' or 'Raycast')
				debug.setupvalue(bedwars.SwordController.swingSwordAtMouse, 4, callback and bedwars.QueryUtil or workspace)
			end,
			Tooltip = 'Changes the raycast function to the correct one'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/HitFix")
