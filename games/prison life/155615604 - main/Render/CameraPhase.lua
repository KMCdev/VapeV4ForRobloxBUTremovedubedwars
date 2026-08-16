-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Render/CameraPhase.lua

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
	["games/prison life/155615604 - main/Render/CameraPhase"] = function()
		local CameraPhase
		local old
		
		CameraPhase = vape.Categories.Render:CreateModule({
			Name = 'CameraPhase',
			Function = function(callback)
				if callback then
					local req = require(lplr.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper)
					old = debug.getupvalue(debug.getupvalue(req, 3), 7)
					debug.setconstant(old, 16, 0)
				else
					if old then
						debug.setconstant(old, 16, 0.25)
						old = nil
					end
				end
			end,
			Tooltip = 'Allow the camera to phase through walls.'
		})
	end,
}

return __require("games/prison life/155615604 - main/Render/CameraPhase")
