-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Combat/NoClickDelay.lua

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
	["games/bedwars/6872274481 - game/Combat/NoClickDelay"] = function()
		local old
		
		vape.Categories.Combat:CreateModule({
			Name = 'NoClickDelay',
			Function = function(callback)
				if callback then
					old = bedwars.SwordController.isClickingTooFast
					bedwars.SwordController.isClickingTooFast = function(self)
						self.lastSwing = os.clock()
						return false
					end
				else
					bedwars.SwordController.isClickingTooFast = old
				end
			end,
			Tooltip = 'Remove the CPS cap'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Combat/NoClickDelay")
