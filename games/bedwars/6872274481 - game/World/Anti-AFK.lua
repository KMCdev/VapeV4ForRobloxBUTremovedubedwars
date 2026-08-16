-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/World/Anti-AFK.lua

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
	["games/bedwars/6872274481 - game/World/Anti-AFK"] = function()
		vape.Categories.World:CreateModule({
			Name = 'Anti-AFK',
			Function = function(callback)
				if callback then
					for _, v in getconnections(lplr.Idled) do
						v:Disconnect()
					end
		
					for _, v in getconnections(runService.Heartbeat) do
						if type(v.Function) == 'function' and table.find(debug.getconstants(v.Function), remotes.AfkStatus) then
							v:Disconnect()
						end
					end
		
					bedwars.Client:Get(remotes.AfkStatus):SendToServer({
						afk = false
					})
				end
			end,
			Tooltip = 'Lets you stay ingame without getting kicked'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/World/Anti-AFK")
