-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/Combat/Sprint.lua

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
	["games/1.8arena/77790193039862 - game/Combat/Sprint"] = function()
		local Sprint
		
		Sprint = vape.Categories.Combat:CreateModule({
			Name = 'Sprint',
			Function = function(callback)
				if callback then
					repeat
						arena.PlayerState.Preferences.AutoSprint = true
						task.wait(0.016)
					until not Sprint.Enabled
				end
			end,
			Tooltip = 'Sets your sprinting to true.'
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/Combat/Sprint")
