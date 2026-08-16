-- Bundled by luau-bundler
-- Entry: games/skywars voxel/8768229691 - skywars game/Blatant/NoSlowdown.lua

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
	["games/skywars voxel/8768229691 - skywars game/Blatant/NoSlowdown"] = function()
		local old, oldcheck
		
		vape.Categories.Blatant:CreateModule({
			Name = 'NoSlowdown',
			Function = function(callback)
				if callback then
					old = skywars.HumanoidController.addSpeedModifier
					oldcheck = skywars.SprintingController.setCanSprint
		
					skywars.HumanoidController.addSpeedModifier = function(self, index, speed)
						speed = math.max(speed, 1)
						return old(self, index, speed)
					end
		
					skywars.SprintingController.setCanSprint = function(self, canSprint)
						return oldcheck(self, true)
					end
		
					for i, v in skywars.HumanoidController.speedModifiers do
						if v < 1 then
							skywars.HumanoidController:removeSpeedModifier(i)
						end
					end
		
					skywars.SprintingController:setCanSprint(true)
					skywars.SprintingController:enableSprinting()
				else
					skywars.HumanoidController.addSpeedModifier = old
					skywars.SprintingController.setCanSprint = oldcheck
					old = nil
					oldcheck = nil
				end
			end,
			Tooltip = 'Prevents slowing down when using items.'
		})
	end,
}

return __require("games/skywars voxel/8768229691 - skywars game/Blatant/NoSlowdown")
