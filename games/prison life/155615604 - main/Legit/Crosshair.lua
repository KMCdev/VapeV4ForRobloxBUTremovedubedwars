-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Legit/Crosshair.lua

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
	["games/prison life/155615604 - main/Legit/Crosshair"] = function()
		local Crosshair
		local Image
		local old
		
		Crosshair = vape.Legit:CreateModule({
			Name = 'Crosshair',
			Function = function(callback)
				if callback then
					debug.setconstant(oldequip or pl.Equip, 30, Image.Value:find('rbxasset') and Image.Value or isfile(Image.Value) and getcustomasset(Image.Value) or '')
				else
					debug.setconstant(oldequip or pl.Equip, 30, 'rbxassetid://98794608762931')
				end
			end,
			Tooltip = 'Change the crosshair icon'
		})
		Image = Crosshair:CreateTextBox({
			Name = 'Image',
			Placeholder = 'assetid',
			Function = function()
				if Crosshair.Enabled then
					debug.setconstant(oldequip or pl.Equip, 30, Image.Value:find('rbxasset') and Image.Value or isfile(Image.Value) and getcustomasset(Image.Value) or '')
				end
			end
		})
	end,
}

return __require("games/prison life/155615604 - main/Legit/Crosshair")
