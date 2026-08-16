-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Utility/ShopTierBypass.lua

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
	["games/bedwars/6872274481 - game/Utility/ShopTierBypass"] = function()
		local ShopTierBypass
		local tiered, nexttier = {}, {}
		
		ShopTierBypass = vape.Categories.Utility:CreateModule({
			Name = 'ShopTierBypass',
			Function = function(callback)
				if callback then
					repeat task.wait() until store.shopLoaded or not ShopTierBypass.Enabled
					if ShopTierBypass.Enabled then
						for _, v in bedwars.Shop.ShopItems do
							tiered[v] = v.tiered
							nexttier[v] = v.nextTier
							v.nextTier = nil
							v.tiered = nil
						end
					end
				else
					for i, v in tiered do
						i.tiered = v
					end
					for i, v in nexttier do
						i.nextTier = v
					end
					table.clear(nexttier)
					table.clear(tiered)
				end
			end,
			Tooltip = 'Lets you buy things like armor early.'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Utility/ShopTierBypass")
