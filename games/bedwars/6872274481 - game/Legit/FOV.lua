-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/FOV.lua

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
	["games/bedwars/6872274481 - game/Legit/FOV"] = function()
		local FOV
		local Value
		local old, old2
		
		FOV = vape.Legit:CreateModule({
			Name = 'FOV',
			Function = function(callback)
				if callback then
					old = bedwars.FovController.setFOV
					old2 = bedwars.FovController.getFOV
					bedwars.FovController.setFOV = function(self) 
						return old(self, Value.Value) 
					end
					bedwars.FovController.getFOV = function() 
						return Value.Value 
					end
				else
					bedwars.FovController.setFOV = old
					bedwars.FovController.getFOV = old2
				end
				
				bedwars.FovController:setFOV(bedwars.Store:getState().Settings.fov)
			end,
			Tooltip = 'Adjusts camera vision'
		})
		Value = FOV:CreateSlider({
			Name = 'FOV',
			Min = 30,
			Max = 120
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/FOV")
