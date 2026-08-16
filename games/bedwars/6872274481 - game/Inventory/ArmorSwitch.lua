-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Inventory/ArmorSwitch.lua

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
	["games/bedwars/6872274481 - game/Inventory/ArmorSwitch"] = function()
		local ArmorSwitch
		local Mode
		local Targets
		local Range
		
		ArmorSwitch = vape.Categories.Inventory:CreateModule({
			Name = 'ArmorSwitch',
			Function = function(callback)
				if callback then
					if Mode.Value == 'Toggle' then
						repeat
							local state = entitylib.EntityPosition({
								Part = 'RootPart',
								Range = Range.Value,
								Players = Targets.Players.Enabled,
								NPCs = Targets.NPCs.Enabled,
								Wallcheck = Targets.Walls.Enabled
							}) and true or false
		
							for i = 0, 2 do
								if (store.inventory.inventory.armor[i + 1] ~= 'empty') ~= state and ArmorSwitch.Enabled then
									bedwars.Store:dispatch({
										type = 'InventorySetArmorItem',
										item = store.inventory.inventory.armor[i + 1] == 'empty' and state and getBestArmor(i) or nil,
										armorSlot = i
									})
									vapeEvents.InventoryChanged.Event:Wait()
								end
							end
							task.wait(0.1)
						until not ArmorSwitch.Enabled
					else
						ArmorSwitch:Toggle()
						for i = 0, 2 do
							bedwars.Store:dispatch({
								type = 'InventorySetArmorItem',
								item = store.inventory.inventory.armor[i + 1] == 'empty' and getBestArmor(i) or nil,
								armorSlot = i
							})
							vapeEvents.InventoryChanged.Event:Wait()
						end
					end
				end
			end,
			Tooltip = 'Puts on / takes off armor when toggled for baiting.'
		})
		Mode = ArmorSwitch:CreateDropdown({
			Name = 'Mode',
			List = {'Toggle', 'On Key'}
		})
		Targets = ArmorSwitch:CreateTargets({
			Players = true,
			NPCs = true
		})
		Range = ArmorSwitch:CreateSlider({
			Name = 'Range',
			Min = 1,
			Max = 30,
			Default = 30,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Inventory/ArmorSwitch")
