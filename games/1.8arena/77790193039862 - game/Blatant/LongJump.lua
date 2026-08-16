-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/Blatant/LongJump.lua

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
	["games/1.8arena/77790193039862 - game/Blatant/LongJump"] = function()
		local Value
		local AutoDisable
		
		LongJump = vape.Categories.Blatant:CreateModule({
			Name = 'LongJump',
			Function = function(callback)
				if callback then
					local exempt = tick() + 0.1
					LongJump:Clean(runService.PreSimulation:Connect(function(dt)
						if entitylib.isAlive then
							local movedir = calculateMoveVector() * Value.Value
							local onground = debug.getupvalue(arena.MoveFunction, 4)
		
							if onground then
								if exempt < tick() and AutoDisable.Enabled then
									if LongJump.Enabled then
										LongJump:Toggle()
									end
								else
									debug.setupvalue(arena.TickFunction, 6, Vector3.new(movedir.X, 30, movedir.Z))
								end
							end
		
							local velocity = debug.getupvalue(arena.TickFunction, 6)
							debug.setupvalue(arena.TickFunction, 6, Vector3.new(movedir.X, velocity.Y, movedir.Z))
						end
					end))
				end
			end,
			Tooltip = 'Lets you jump farther'
		})
		Value = LongJump:CreateSlider({
			Name = 'Speed',
			Min = 1,
			Max = 150,
			Default = 50,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
		AutoDisable = LongJump:CreateToggle({
			Name = 'Auto Disable',
			Default = true
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/Blatant/LongJump")
