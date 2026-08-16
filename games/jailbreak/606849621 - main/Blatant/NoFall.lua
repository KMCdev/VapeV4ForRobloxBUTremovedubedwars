-- Bundled by luau-bundler
-- Entry: games/jailbreak/606849621 - main/Blatant/NoFall.lua

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
	["games/jailbreak/606849621 - main/Blatant/NoFall"] = function()
		vape.Categories.Blatant:CreateModule({
			Name = 'NoFall',
			Function = function(callback)
				debug.setconstant(debug.getupvalue(jb.FallingController.Init, 20), 9, callback and 'Archivable' or 'Sit')
			end,
			Tooltip = 'Disables ragdoll handling & fall damage'
		})
	end,
}

return __require("games/jailbreak/606849621 - main/Blatant/NoFall")
