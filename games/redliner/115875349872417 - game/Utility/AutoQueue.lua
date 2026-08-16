-- Bundled by luau-bundler
-- Entry: games/redliner/115875349872417 - game/Utility/AutoQueue.lua

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
	["games/redliner/115875349872417 - game/Utility/AutoQueue"] = function()
		local AutoQueue
		
		AutoQueue = vape.Categories.Utility:CreateModule({
			Name = 'AutoQueue',
			Function = function(callback)
				if callback then
					AutoQueue:Clean(vapeEvents.MatchEnded.Event:Connect(function(_, obj)
						task.defer(function()
							firesignal(obj.Main.requeuebutton.Activated)
						end)
					end))
				end
			end,
			Tooltip = 'Automatically requeue after the match ends.'
		})
	end,
}

return __require("games/redliner/115875349872417 - game/Utility/AutoQueue")
