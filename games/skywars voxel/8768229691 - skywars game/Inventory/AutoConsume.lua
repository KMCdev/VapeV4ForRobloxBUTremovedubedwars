-- Bundled by luau-bundler
-- Entry: games/skywars voxel/8768229691 - skywars game/Inventory/AutoConsume.lua

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
	["games/skywars voxel/8768229691 - skywars game/Inventory/AutoConsume"] = function()
		local AutoConsume
		
		local function consumeCheck()
			if (lplr:GetAttribute('Shield') or 0) <= 0 and getItem('Shield') then
				skywars.Remotes[remotes.updateActiveItem]:fire('Shield')
				skywars.Remotes[remotes.usePowerUp]:fire()
				skywars.Remotes[remotes.updateActiveItem]:fire(store.hand.Name)
			end
		end
		
		AutoConsume = vape.Categories.Inventory:CreateModule({
			Name = 'AutoConsume',
			Function = function(callback)
				if callback then
					AutoConsume:Clean(vapeEvents.InventoryAmountChanged.Event:Connect(consumeCheck))
					AutoConsume:Clean(lplr:GetAttributeChangedSignal('Shield'):Connect(consumeCheck))
					consumeCheck()
				end
			end,
			Tooltip = 'Automatically uses shield potions.'
		})
	end,
}

return __require("games/skywars voxel/8768229691 - skywars game/Inventory/AutoConsume")
