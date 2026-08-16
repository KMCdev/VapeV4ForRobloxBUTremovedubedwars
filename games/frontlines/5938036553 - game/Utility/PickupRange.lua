-- Bundled by luau-bundler
-- Entry: games/frontlines/5938036553 - game/Utility/PickupRange.lua

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
	["games/frontlines/5938036553 - game/Utility/PickupRange"] = function()
		local PickupRange
		local Range
		
		PickupRange = vape.Categories.Utility:CreateModule({
			Name = 'PickupRange',
			Function = function(callback)
				if callback then
					repeat
						if entitylib.isAlive then
							for i, v in frontlines.Main.globals.equipment_drop_ids do
								local obj = frontlines.Main.globals.equipments[v]
								if obj and obj.model and obj.model.PrimaryPart and (obj.model.PrimaryPart.Position - entitylib.character.RootPart.Position).Magnitude < Range.Value then
									if frontlines.Main.matrix_bit(frontlines.PickupBit, v) == 0 then
										frontlines.Main.set_matrix_bit(frontlines.PickupBit, v, true)
										frontlines.Main.utils.net_msg_util.c_prep_net_msg(frontlines.Main.globals.combat_net_msg_state, frontlines.Main.enums.c_net_msg.PICKUP_AMMO, v)
										break
									end
								end
							end
						end
		
						task.wait(0.05)
					until not PickupRange.Enabled
				end
			end,
			Tooltip = 'Picks up ammo from dropped guns in the proximity'
		})
		Range = PickupRange:CreateSlider({
			Name = 'Range',
			Min = 1,
			Max = 20,
			Default = 20
		})
	end,
}

return __require("games/frontlines/5938036553 - game/Utility/PickupRange")
