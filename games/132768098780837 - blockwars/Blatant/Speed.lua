-- Bundled by luau-bundler
-- Entry: games/132768098780837 - blockwars/Blatant/Speed.lua

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
	["games/132768098780837 - blockwars/Blatant/Speed"] = function()
		local Speed
		local Value
		local AutoJump
		local AutoJumpCustom
		local AutoJumpValue
		
		Speed = vape.Categories.Blatant:CreateModule({
			Name = 'Speed',
			Function = function(callback)
				if callback then
					if not AnticheatBypass.Enabled then
						AnticheatBypass:Toggle()
					end
		
					Speed:Clean(runService.PreSimulation:Connect(function(dt)
						if entitylib.isAlive and not Fly.Enabled then
							local state = entitylib.character.Humanoid:GetState()
							if state == Enum.HumanoidStateType.Climbing then return end
							applySpeed(Value.Value, dt)
		
							if AutoJump.Enabled and entitylib.character.Humanoid.FloorMaterial ~= Enum.Material.Air and movevec ~= Vector3.zero then
								if AutoJumpCustom.Enabled then
									local velocity = entitylib.character.RootPart.Velocity * Vector3.new(1, 0, 1)
									entitylib.character.RootPart.Velocity = Vector3.new(velocity.X, AutoJumpValue.Value, velocity.Z)
								else
									entitylib.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
								end
							end
						end
					end))
				end
			end,
			ExtraText = function()
				return 'BlockWars'
			end,
			Tooltip = 'Increases your movement with various methods.'
		})
		Value = Speed:CreateSlider({
			Name = 'Speed',
			Min = 1,
			Max = 38,
			Default = 38,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
		AutoJump = Speed:CreateToggle({
			Name = 'AutoJump',
			Function = function(callback)
				AutoJumpCustom.Object.Visible = callback
			end
		})
		AutoJumpCustom = Speed:CreateToggle({
			Name = 'Custom Jump',
			Function = function(callback)
				AutoJumpValue.Object.Visible = callback
			end,
			Tooltip = 'Allows you to adjust the jump power',
			Darker = true,
			Visible = false
		})
		AutoJumpValue = Speed:CreateSlider({
			Name = 'Jump Power',
			Min = 1,
			Max = 50,
			Default = 30,
			Darker = true,
			Visible = false
		})
	end,
}

return __require("games/132768098780837 - blockwars/Blatant/Speed")
