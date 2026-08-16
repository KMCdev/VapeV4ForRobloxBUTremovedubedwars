-- Bundled by luau-bundler
-- Entry: games/universal - base/Render/Fullbright.lua

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
	["games/universal - base/Render/Fullbright"] = function()
		local Fullbright
		local Mode
		local oldsettings = {}
		local flag
		
		local function ChangeLighting(prop)
			if flag then
				return
			end
		
			flag = true
			lightingService.Ambient = Color3.new(1, 1, 1)
			lightingService.OutdoorAmbient = Color3.new(1, 1, 1)
			lightingService.Brightness = 3
			runService.RenderStepped:Wait()
			flag = false
		end
		
		Fullbright = vape.Categories.Render:CreateModule({
			Name = 'Fullbright',
			Function = function(callback)
				if callback then
					if Mode.Value == 'Lighting' then
						for _, v in {'Ambient', 'OutdoorAmbient', 'Brightness'} do
							oldsettings[v] = lightingService[v]
						end
		
						Fullbright:Clean(lightingService.Changed:Connect(ChangeLighting))
						task.spawn(ChangeLighting)
					else
						local inst = Instance.new('PointLight')
						inst.Range = 1000
						Fullbright:Clean(inst)
		
						repeat
							inst.Parent = entitylib.isAlive and entitylib.character.RootPart or nil
							task.wait(0.1)
						until not Fullbright.Enabled
					end
				else
					flag = false
					for i, v in oldsettings do
						lightingService[i] = v
					end
					table.clear(oldsettings)
				end
			end,
			Tooltip = 'Increase the lighting of the world around you.'
		})
		Mode = Fullbright:CreateDropdown({
			Name = 'Mode',
			List = {'Lighting', 'PointLight'},
			Function = function()
				if Fullbright.Enabled then
					Fullbright:Toggle()
					Fullbright:Toggle()
				end
			end
		})
	end,
}

return __require("games/universal - base/Render/Fullbright")
