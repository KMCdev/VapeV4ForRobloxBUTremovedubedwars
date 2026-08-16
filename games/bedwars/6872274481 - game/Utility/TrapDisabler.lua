-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Utility/TrapDisabler.lua

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
	["games/bedwars/6872274481 - game/Utility/TrapDisabler"] = function()
		TrapDisabler = vape.Categories.Utility:CreateModule({
			Name = 'TrapDisabler',
			Tooltip = 'Disables Snap Traps'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Utility/TrapDisabler")
