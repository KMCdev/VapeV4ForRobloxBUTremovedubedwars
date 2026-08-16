-- Bundled by luau-bundler
-- Entry: games/jailbreak/606849621 - main/Blatant/LazerGodmode.lua

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
	["games/jailbreak/606849621 - main/Blatant/LazerGodmode"] = function()
		LazerGodmode = vape.Categories.Blatant:CreateModule({Name = 'LazerGodmode'})
	end,
}

return __require("games/jailbreak/606849621 - main/Blatant/LazerGodmode")
