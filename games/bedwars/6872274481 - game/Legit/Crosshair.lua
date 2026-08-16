-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/Crosshair.lua

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
	["games/bedwars/6872274481 - game/Legit/Crosshair"] = function()
		local old
		local Image
		
		local Crosshair = vape.Legit:CreateModule({
			Name = 'Crosshair',
			Function = function(callback)
				if callback then
					old = debug.getconstant(bedwars.ViewmodelController.showCrosshair, 25)
					debug.setconstant(bedwars.ViewmodelController.showCrosshair, 25, Image.Value)
					debug.setconstant(bedwars.ViewmodelController.showCrosshair, 37, Image.Value)
				else
					debug.setconstant(bedwars.ViewmodelController.showCrosshair, 25, old)
					debug.setconstant(bedwars.ViewmodelController.showCrosshair, 37, old)
					old = nil
				end
		
				if bedwars.ViewmodelController.crosshair then
					bedwars.ViewmodelController:hideCrosshair()
					bedwars.ViewmodelController:showCrosshair()
				end
			end,
			Tooltip = 'Custom first person crosshair depending on the image choosen.'
		})
		Image = Crosshair:CreateTextBox({
			Name = 'Image',
			Placeholder = 'image id (roblox)',
			Function = function(enter)
				if enter and Crosshair.Enabled then
					Crosshair:Toggle()
					Crosshair:Toggle()
				end
			end
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/Crosshair")
