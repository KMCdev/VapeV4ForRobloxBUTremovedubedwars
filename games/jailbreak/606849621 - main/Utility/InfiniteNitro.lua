-- Bundled by luau-bundler
-- Entry: games/jailbreak/606849621 - main/Utility/InfiniteNitro.lua

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
	["games/jailbreak/606849621 - main/Utility/InfiniteNitro"] = function()
		local nitrotable = debug.getupvalue(jb.VehicleController.NitroShopVisible, 1)
		local oldnitro
		
		InfNitro = vape.Categories.Utility:CreateModule({
			Name = 'InfiniteNitro',
			Function = function(callback)
				if callback then
					oldnitro = nitrotable.Nitro
					jb.VehicleController.updateSpdBarRatio(1)
		
					repeat
						nitrotable.Nitro = 250
						task.wait(0.1)
					until not InfNitro.Enabled
				else
					nitrotable.Nitro = oldnitro
					jb.VehicleController.updateSpdBarRatio(oldnitro / 250)
				end
			end,
			Tooltip = 'Infinite boost for the local car'
		})
	end,
}

return __require("games/jailbreak/606849621 - main/Utility/InfiniteNitro")
