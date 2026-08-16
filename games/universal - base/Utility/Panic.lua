-- Bundled by luau-bundler
-- Entry: games/universal - base/Utility/Panic.lua

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
	["games/universal - base/Utility/Panic"] = function()
		vape.Categories.Utility:CreateModule({
			Name = 'Panic',
			Function = function(callback)
				if callback then
					for _, v in vape.Modules do
						if v.Enabled then
							v:Toggle()
						end
					end
				end
			end,
			Tooltip = 'Disables all currently enabled modules'
		})
	end,
}

return __require("games/universal - base/Utility/Panic")
