-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Combat/Sprint.lua

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
	["games/bedwars/6872274481 - game/Combat/Sprint"] = function()
		local Sprint
		local old
		
		Sprint = vape.Categories.Combat:CreateModule({
			Name = 'Sprint',
			Function = function(callback)
				if callback then
					if inputService.TouchEnabled then 
						pcall(function() 
							lplr.PlayerGui.MobileUI['4'].Visible = false 
						end) 
					end
					old = bedwars.SprintController.stopSprinting
					bedwars.SprintController.stopSprinting = function(...)
						local call = old(...)
						bedwars.SprintController:startSprinting()
						return call
					end
					Sprint:Clean(entitylib.Events.LocalAdded:Connect(function() 
						task.delay(0.1, function() 
							bedwars.SprintController:stopSprinting() 
						end) 
					end))
					bedwars.SprintController:stopSprinting()
				else
					if inputService.TouchEnabled then 
						pcall(function() 
							lplr.PlayerGui.MobileUI['4'].Visible = true 
						end) 
					end
					bedwars.SprintController.stopSprinting = old
					bedwars.SprintController:stopSprinting()
				end
			end,
			Tooltip = 'Sets your sprinting to true.'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Combat/Sprint")
