-- Bundled by luau-bundler
-- Entry: guis/old/components/Targets.lua

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
	["guis/old/components/Targets"] = function()
		local optionapi = {
			Type = 'Targets',
			Function = optionsettings.Function or function() end
		}
		
		function optionapi:Save() end
		function optionapi:Load() end
		
		optionapi.Object = {Visible = true}
		api.Options.Targets = optionapi
		
		return mainapi.TargetOptions
	end,
}

return __require("guis/old/components/Targets")
