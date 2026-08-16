-- Bundled by luau-bundler
-- Entry: games/frontlines/5938036553 - game/Utility/AutoRespawn.lua

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
	["games/frontlines/5938036553 - game/Utility/AutoRespawn"] = function()
		local AutoRespawn
		
		AutoRespawn = vape.Categories.Utility:CreateModule({
			Name = 'AutoRespawn',
			Function = function(callback)
				if callback then
					AutoRespawn:Clean(hookEvent('ENTER_CLI_KILLCAM', function(id, health)
						task.delay(0, function()
							frontlines.Main.exe_set(frontlines.Main.exe_set_t.CTRL_KILLCAM_TO_COMBAT_RELEASE)
						end)
					end))
				end
			end,
			Tooltip = 'Automatically respawns after death'
		})
	end,
}

return __require("games/frontlines/5938036553 - game/Utility/AutoRespawn")
