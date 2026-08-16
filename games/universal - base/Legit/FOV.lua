-- Bundled by luau-bundler
-- Entry: games/universal - base/Legit/FOV.lua

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
	["games/universal - base/Legit/FOV"] = function()
		local FOV
		local Value
		local oldfov
		
		FOV = vape.Legit:CreateModule({
			Name = 'FOV',
			Function = function(callback)
				if callback then
					oldfov = gameCamera.FieldOfView
					repeat
						gameCamera.FieldOfView = Value.Value
						task.wait()
					until not FOV.Enabled
				else
					gameCamera.FieldOfView = oldfov
				end
			end,
			Tooltip = 'Adjusts camera vision'
		})
		Value = FOV:CreateSlider({
			Name = 'FOV',
			Min = 30,
			Max = 120
		})
	end,
}

return __require("games/universal - base/Legit/FOV")
