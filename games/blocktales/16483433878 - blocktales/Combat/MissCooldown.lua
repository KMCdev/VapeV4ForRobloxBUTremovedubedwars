-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Combat/MissCooldown.lua

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
	["games/blocktales/16483433878 - blocktales/Combat/MissCooldown"] = function()
		local MissCooldown
		local index = game.PlaceId ~= 16483433878 and 20 or 53
		
		MissCooldown = vape.Categories.Combat:CreateModule({
			Name = 'MissCooldown',
			Function = function(callback)
				if callback then
					debug.setconstant(bt.BattleClient.input, index, 0)
				else
					debug.setconstant(bt.BattleClient.input, index, 0.2)
				end
			end,
			Tooltip = 'Remove the cooldown when missing a block or action.'
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Combat/MissCooldown")
