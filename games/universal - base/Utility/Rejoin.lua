-- Bundled by luau-bundler
-- Entry: games/universal - base/Utility/Rejoin.lua

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
	["games/universal - base/Utility/Rejoin"] = function()
		local Rejoin
		
		Rejoin = vape.Categories.Utility:CreateModule({
			Name = 'Rejoin',
			Function = function(callback)
				if callback then
					notif('Rejoin', 'Rejoining...', 5)
					Rejoin:Toggle()
		
					if playersService.NumPlayers > 1 then
						teleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
					else
						teleportService:Teleport(game.PlaceId)
					end
				end
			end,
			Tooltip = 'Rejoins the server'
		})
	end,
}

return __require("games/universal - base/Utility/Rejoin")
