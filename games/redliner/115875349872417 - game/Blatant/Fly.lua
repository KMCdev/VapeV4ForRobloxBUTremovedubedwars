-- Bundled by luau-bundler
-- Entry: games/redliner/115875349872417 - game/Blatant/Fly.lua

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
	["games/redliner/115875349872417 - game/Blatant/Fly"] = function()
		local Fly
		local LongJump
		run(function()
			local Value
			local VerticalValue
			local up, down = 0, 0
		
			Fly = vape.Categories.Blatant:CreateModule({
				Name = 'Fly',
				Function = function(callback)
					if callback then
						Fly:Clean(runService.PreSimulation:Connect(function(dt)
							addVelocity(Vector3.new(0, 3.5 + (up + down) * VerticalValue.Value, 0))
						end))
		
						up, down = 0, 0
						for _, v in {'InputBegan', 'InputEnded'} do
							Fly:Clean(inputService[v]:Connect(function(input)
								if not inputService:GetFocusedTextBox() then
									if input.KeyCode == Enum.KeyCode.Space then
										up = v == 'InputBegan' and 1 or 0
									elseif input.KeyCode == Enum.KeyCode.LeftAlt then
										down = v == 'InputBegan' and -1 or 0
									end
								end
							end))
						end
					end
				end,
				ExtraText = function()
					return 'Redliner'
				end,
				Tooltip = 'Makes you go zoom.'
			})
			--[[Value = Fly:CreateSlider({
				Name = 'Speed',
				Min = 1,
				Max = 150,
				Default = 50,
				Suffix = function(val)
					return val == 1 and 'stud' or 'studs'
				end
			})]]
			VerticalValue = Fly:CreateSlider({
				Name = 'Vertical Speed',
				Min = 1,
				Max = 150,
				Default = 50,
				Suffix = function(val)
					return val == 1 and 'stud' or 'studs'
				end
			})
		end)
	end,
}

return __require("games/redliner/115875349872417 - game/Blatant/Fly")
