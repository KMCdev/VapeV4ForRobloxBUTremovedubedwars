-- Bundled by luau-bundler
-- Entry: games/frontlines/5938036553 - game/Render/NoHurtCam.lua

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
	["games/frontlines/5938036553 - game/Render/NoHurtCam"] = function()
		local NoHurtCam
		
		NoHurtCam = vape.Categories.Render:CreateModule({
			Name = 'NoHurtCam',
			Function = function(callback)
				if callback then
					NoHurtCam:Clean(hookEvent('UPDATE_FPV_SOL_DAMAGE_GFX', function() return true end))
					NoHurtCam:Clean(hookEvent('UPDATE_FPV_SOL_HEALTH_SFX', function() return true end))
					NoHurtCam:Clean(hookEvent('DISPLAY_SUPPRESSION_VIGNETTE', function() return true end))
				end
			end,
			Tooltip = 'Removes camera flash after taking damage'
		})
	end,
}

return __require("games/frontlines/5938036553 - game/Render/NoHurtCam")
