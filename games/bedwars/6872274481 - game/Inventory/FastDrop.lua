-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Inventory/FastDrop.lua

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
	["games/bedwars/6872274481 - game/Inventory/FastDrop"] = function()
		local FastDrop
		
		FastDrop = vape.Categories.Inventory:CreateModule({
			Name = 'FastDrop',
			Function = function(callback)
				if callback then
					repeat
						if entitylib.isAlive and (not store.inventory.opened) and (inputService:IsKeyDown(Enum.KeyCode.H) or inputService:IsKeyDown(Enum.KeyCode.Backspace)) and inputService:GetFocusedTextBox() == nil then
							task.spawn(bedwars.ItemDropController.dropItemInHand)
							task.wait()
						else
							task.wait(0.1)
						end
					until not FastDrop.Enabled
				end
			end,
			Tooltip = 'Drops items fast when you hold Q'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Inventory/FastDrop")
