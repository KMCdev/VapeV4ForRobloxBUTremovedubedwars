-- Bundled by luau-bundler
-- Entry: games/132768098780837 - blockwars/Utility/AutoQueue.lua

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
	["games/132768098780837 - blockwars/Utility/AutoQueue"] = function()
		local AutoQueue
		
		AutoQueue = vape.Categories.Utility:CreateModule({
			Name = 'AutoQueue',
			Function = function(callback)
				if callback then
					if workspace:GetAttribute('ServerType') == 'Lobby' then
						task.spawn(function()
							bw.RemoteIndex.Matchmaking_Request:InvokeServer('queue')
						end)
					end
				end
			end,
			Tooltip = 'Automatically queue in the lobby.'
		})
	end,
}

return __require("games/132768098780837 - blockwars/Utility/AutoQueue")
