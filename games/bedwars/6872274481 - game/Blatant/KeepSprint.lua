-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Blatant/KeepSprint.lua

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
	["games/bedwars/6872274481 - game/Blatant/KeepSprint"] = function()
		vape.Categories.Blatant:CreateModule({
			Name = 'KeepSprint',
			Function = function(callback)
				debug.setconstant(bedwars.SprintController.startSprinting, 5, callback and 'blockSprinting' or 'blockSprint')
				bedwars.SprintController:stopSprinting()
			end,
			Tooltip = 'Lets you sprint with a speed potion.'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Blatant/KeepSprint")
