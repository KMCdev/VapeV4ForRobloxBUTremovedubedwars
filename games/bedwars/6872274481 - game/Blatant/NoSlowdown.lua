-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Blatant/NoSlowdown.lua

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
	["games/bedwars/6872274481 - game/Blatant/NoSlowdown"] = function()
		local old
		
		vape.Categories.Blatant:CreateModule({
			Name = 'NoSlowdown',
			Function = function(callback)
				local modifier = bedwars.SprintController:getMovementStatusModifier()
				if callback then
					old = modifier.addModifier
					modifier.addModifier = function(self, tab)
						if tab.moveSpeedMultiplier then
							tab.moveSpeedMultiplier = math.max(tab.moveSpeedMultiplier, 1)
						end
						return old(self, tab)
					end
		
					for i in modifier.modifiers do
						if (i.moveSpeedMultiplier or 1) < 1 then
							modifier:removeModifier(i)
						end
					end
				else
					modifier.addModifier = old
					old = nil
				end
			end,
			Tooltip = 'Prevents slowing down when using items.'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Blatant/NoSlowdown")
