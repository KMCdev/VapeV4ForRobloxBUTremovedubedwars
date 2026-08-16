-- Bundled by luau-bundler
-- Entry: main.luau

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
	["main"] = function()
		local Math = require("./util/math")
		
		local value = Math.lerp(0, 100, 0.5)
		print("Lerped value:", Math.clamp(value, 0, 40))
		
	end,
}

return __require("main")
