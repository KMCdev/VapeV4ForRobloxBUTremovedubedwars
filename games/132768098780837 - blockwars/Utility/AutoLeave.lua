-- Bundled by luau-bundler
-- Entry: games/132768098780837 - blockwars/Utility/AutoLeave.lua

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
	["games/132768098780837 - blockwars/Utility/AutoLeave"] = function()
		local AutoLeave
		
		AutoLeave = vape.Categories.Utility:CreateModule({
			Name = 'AutoLeave',
			Function = function(callback)
				if callback then
					AutoLeave:Clean(bw.RemoteIndex.Victory_Show.OnClientEvent:Connect(function()
						replicatedStorage.GameEvents.BedWarsRemotes.Return_To_Lobby:FireServer()
					end))
				end
			end,
			Tooltip = 'Automatically leave after the match ends.'
		})
	end,
}

return __require("games/132768098780837 - blockwars/Utility/AutoLeave")
