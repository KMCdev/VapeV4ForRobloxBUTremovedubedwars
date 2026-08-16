-- Bundled by luau-bundler
-- Entry: games/universal - base/World/Parkour.lua

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
	["games/universal - base/World/Parkour"] = function()
		local Parkour
		
		Parkour = vape.Categories.World:CreateModule({
			Name = 'Parkour',
			Function = function(callback)
				if callback then 
					local oldfloor
					Parkour:Clean(runService.RenderStepped:Connect(function()
						if entitylib.isAlive then 
							local material = entitylib.character.Humanoid.FloorMaterial
							if material == Enum.Material.Air and oldfloor ~= Enum.Material.Air then 
								entitylib.character.Humanoid.Jump = true
							end
							oldfloor = material
						end
					end))
				end
			end,
			Tooltip = 'Automatically jumps after reaching the edge'
		})
	end,
}

return __require("games/universal - base/World/Parkour")
