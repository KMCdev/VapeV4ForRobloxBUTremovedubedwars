-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Blatant/FlyingAttack.lua

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
	["games/blocktales/16483433878 - blocktales/Blatant/FlyingAttack"] = function()
		local FlyingAttack
		
		FlyingAttack = vape.Categories.Blatant:CreateModule({
			Name = 'FlyingAttack',
			Function = function(callback)
				if callback then
					debug.setconstant(bt.Shucky.PossibleFirst, 7, '_Flying')
				else
					debug.setconstant(bt.Shucky.PossibleFirst, 7, 'Flying')
				end
			end,
			Tooltip = 'Allow you to attack flying enemies with onground attacks.'
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Blatant/FlyingAttack")
