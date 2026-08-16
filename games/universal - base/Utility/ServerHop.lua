-- Bundled by luau-bundler
-- Entry: games/universal - base/Utility/ServerHop.lua

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
	["games/universal - base/Utility/ServerHop"] = function()
		local ServerHop
		local Sort
		
		ServerHop = vape.Categories.Utility:CreateModule({
			Name = 'ServerHop',
			Function = function(callback)
				if callback then
					ServerHop:Toggle()
					serverHop(nil, Sort.Value)
				end
			end,
			Tooltip = 'Teleports into a unique server'
		})
		Sort = ServerHop:CreateDropdown({
			Name = 'Sort',
			List = {'Descending', 'Ascending'},
			Tooltip = 'Descending - Prefers full servers\nAscending - Prefers empty servers'
		})
		ServerHop:CreateButton({
			Name = 'Rejoin Previous Server',
			Function = function()
				notif('ServerHop', shared.vapeserverhopprevious and 'Rejoining previous server...' or 'Cannot find previous server', 5)
				if shared.vapeserverhopprevious then
					teleportService:TeleportToPlaceInstance(game.PlaceId, shared.vapeserverhopprevious)
				end
			end
		})
	end,
}

return __require("games/universal - base/Utility/ServerHop")
