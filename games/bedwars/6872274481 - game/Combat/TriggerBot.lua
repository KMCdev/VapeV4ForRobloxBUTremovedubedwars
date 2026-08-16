-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Combat/TriggerBot.lua

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
	["games/bedwars/6872274481 - game/Combat/TriggerBot"] = function()
		local TriggerBot
		local CPS
		local rayParams = RaycastParams.new()
		
		TriggerBot = vape.Categories.Combat:CreateModule({
			Name = 'TriggerBot',
			Function = function(callback)
				if callback then
					repeat
						local doAttack
						if not bedwars.AppController:isLayerOpen(bedwars.UILayers.MAIN) then
							if entitylib.isAlive and store.hand.toolType == 'sword' and bedwars.DaoController.chargingMaid == nil then
								local attackRange = bedwars.ItemMeta[store.hand.tool.Name].sword.attackRange
								rayParams.FilterDescendantsInstances = {lplr.Character}
		
								local unit = lplr:GetMouse().UnitRay
								local localPos = entitylib.character.RootPart.Position
								local rayRange = (attackRange or 14.4)
								local ray = bedwars.QueryUtil:raycast(unit.Origin, unit.Direction * 200, rayParams)
								if ray and (localPos - ray.Instance.Position).Magnitude <= rayRange then
									local limit = (attackRange)
									for _, ent in entitylib.List do
										doAttack = ent.Targetable and ray.Instance:IsDescendantOf(ent.Character) and (localPos - ent.RootPart.Position).Magnitude <= rayRange
										if doAttack then
											break
										end
									end
								end
		
								doAttack = doAttack or bedwars.SwordController:getTargetInRegion(attackRange or 3.8 * 3, 0)
								if doAttack then
									bedwars.SwordController:swingSwordAtMouse()
								end
							end
						end
		
						task.wait(doAttack and 1 / CPS.GetRandomValue() or 0.016)
					until not TriggerBot.Enabled
				end
			end,
			Tooltip = 'Automatically swings when hovering over a entity'
		})
		CPS = TriggerBot:CreateTwoSlider({
			Name = 'CPS',
			Min = 1,
			Max = 9,
			DefaultMin = 7,
			DefaultMax = 7
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Combat/TriggerBot")
