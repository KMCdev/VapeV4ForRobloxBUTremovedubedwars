-- Bundled by luau-bundler
-- Entry: games/universal - base/World/Anti-AFK.lua

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
	["games/universal - base/World/Anti-AFK"] = function()
		local connections = {}
		
		vape.Categories.World:CreateModule({
			Name = 'Anti-AFK',
			Function = function(callback)
				if callback then
					for _, v in getconnections(lplr.Idled) do
						table.insert(connections, v)
						v:Disable()
					end
				else
					for _, v in connections do
						v:Enable()
					end
					table.clear(connections)
				end
			end,
			Tooltip = 'Lets you stay ingame without getting kicked'
		})
	end,
}

return __require("games/universal - base/World/Anti-AFK")
