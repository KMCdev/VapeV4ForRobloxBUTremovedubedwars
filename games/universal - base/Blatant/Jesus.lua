-- Bundled by luau-bundler
-- Entry: games/universal - base/Blatant/Jesus.lua

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
	["games/universal - base/Blatant/Jesus"] = function()
		local Jesus
		local params = RaycastParams.new()
		params.FilterType = Enum.RaycastFilterType.Include
		
		Jesus = vape.Categories.Blatant:CreateModule({
			Name = 'Jesus',
			Function = function(callback)
				if callback then
					local terrain = workspace:FindFirstChildWhichIsA('Terrain')
					params.FilterDescendantsInstances = {terrain}
					local Platform = Instance.new('Part')
					Platform.CanQuery = false
					Platform.Anchored = true
					Platform.Size = Vector3.one
					Platform.Transparency = 1
					Platform.Parent = gameCamera
		
					Jesus:Clean(Platform)
					Jesus:Clean(runService.PreSimulation:Connect(function()
						if entitylib.isAlive then
							local root = entitylib.character.RootPart
							local ray = workspace:Raycast(root.Position, Vector3.new(0, -((root.Size.Y / 2) + entitylib.character.HipHeight + math.abs(root.AssemblyLinearVelocity.Y * 0.032)), 0), params)
		
							if ray and ray.Material == Enum.Material.Water then
								Platform.CFrame = CFrame.new(ray.Position)
							else
								Platform.CFrame = CFrame.new(10000, 10000, 10000)
							end
						end
					end))
				end
			end,
			Tooltip = 'Allow you to stand on terrain water'
		})
	end,
}

return __require("games/universal - base/Blatant/Jesus")
