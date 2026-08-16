-- Bundled by luau-bundler
-- Entry: games/universal - base/Legit/TimeChanger.lua

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
	["games/universal - base/Legit/TimeChanger"] = function()
		local TimeChanger
		local Value
		local old
		
		TimeChanger = vape.Legit:CreateModule({
			Name = 'Time Changer',
			Function = function(callback)
				if callback then
					old = lightingService.TimeOfDay
					lightingService.TimeOfDay = Value.Value..':00:00'
				else
					lightingService.TimeOfDay = old
					old = nil
				end
			end,
			Tooltip = 'Change the time of the current world'
		})
		Value = TimeChanger:CreateSlider({
			Name = 'Time',
			Min = 0,
			Max = 24,
			Default = 12,
			Function = function(val)
				if TimeChanger.Enabled then
					lightingService.TimeOfDay = val..':00:00'
				end
			end
		})
		
	end,
}

return __require("games/universal - base/Legit/TimeChanger")
