-- Bundled by luau-bundler
-- Entry: games/universal - base/Legit/ChinaHat.lua

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
	["games/universal - base/Legit/ChinaHat"] = function()
		local ChinaHat
		local Material
		local Color
		local hat
		
		ChinaHat = vape.Legit:CreateModule({
			Name = 'China Hat',
			Function = function(callback)
				if callback then
					if vape.ThreadFix then
						setthreadidentity(8)
					end
		
					hat = Instance.new('MeshPart')
					hat.Size = Vector3.new(3, 0.7, 3)
					hat.Name = 'ChinaHat'
					hat.Material = Enum.Material[Material.Value]
					hat.Color = Color3.fromHSV(Color.Hue, Color.Sat, Color.Value)
					hat.CanCollide = false
					hat.CanQuery = false
					hat.Massless = true
					hat.MeshId = 'http://www.roblox.com/asset/?id=1778999'
					hat.Transparency = 1 - Color.Opacity
					hat.Parent = gameCamera
					hat.CFrame = entitylib.isAlive and entitylib.character.Head.CFrame + Vector3.new(0, 1, 0) or CFrame.identity
					local weld = Instance.new('WeldConstraint')
					weld.Part0 = hat
					weld.Part1 = entitylib.isAlive and entitylib.character.Head or nil
					weld.Parent = hat
		
					ChinaHat:Clean(hat)
					ChinaHat:Clean(entitylib.Events.LocalAdded:Connect(function(char)
						if weld then
							weld:Destroy()
						end
						hat.Parent = gameCamera
						hat.CFrame = char.Head.CFrame + Vector3.new(0, 1, 0)
						hat.Velocity = Vector3.zero
						weld = Instance.new('WeldConstraint')
						weld.Part0 = hat
						weld.Part1 = char.Head
						weld.Parent = hat
					end))
		
					repeat
						hat.LocalTransparencyModifier = ((gameCamera.CFrame.Position - gameCamera.Focus.Position).Magnitude <= 0.6 and 1 or 0)
						task.wait()
					until not ChinaHat.Enabled
				else
					hat = nil
				end
			end,
			Tooltip = 'Puts a china hat on your character (ty mastadawn)'
		})
		local materials = {'ForceField'}
		for _, v in Enum.Material:GetEnumItems() do
			if v.Name ~= 'ForceField' then
				table.insert(materials, v.Name)
			end
		end
		Material = ChinaHat:CreateDropdown({
			Name = 'Material',
			List = materials,
			Function = function(val)
				if hat then
					hat.Material = Enum.Material[val]
				end
			end
		})
		Color = ChinaHat:CreateColorSlider({
			Name = 'Hat Color',
			DefaultOpacity = 0.7,
			Function = function(hue, sat, val, opacity)
				if hat then
					hat.Color = Color3.fromHSV(hue, sat, val)
					hat.Transparency = 1 - opacity
				end
			end
		})
	end,
}

return __require("games/universal - base/Legit/ChinaHat")
