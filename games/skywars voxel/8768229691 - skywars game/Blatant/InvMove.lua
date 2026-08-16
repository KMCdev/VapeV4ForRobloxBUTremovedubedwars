-- Bundled by luau-bundler
-- Entry: games/skywars voxel/8768229691 - skywars game/Blatant/InvMove.lua

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
	["games/skywars voxel/8768229691 - skywars game/Blatant/InvMove"] = function()
		local InvMove
		local old
		
		InvMove = vape.Categories.Blatant:CreateModule({
			Name = 'InvMove',
			Function = function(callback)
				if callback then
					old = skywars.FocusedController.enableFocus
					skywars.FocusedController.enableFocus = function(self, screen, ...)
						return old(self, true, ...)
					end
				else
					skywars.FocusedController.enableFocus = old
					old = nil
				end
			end,
			Tooltip = 'Allows you to have continuous movement in menus'
		})
	end,
}

return __require("games/skywars voxel/8768229691 - skywars game/Blatant/InvMove")
