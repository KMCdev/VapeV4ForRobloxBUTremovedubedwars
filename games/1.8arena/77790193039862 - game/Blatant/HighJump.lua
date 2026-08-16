-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/Blatant/HighJump.lua

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
	["games/1.8arena/77790193039862 - game/Blatant/HighJump"] = function()
		local HighJump
		local Value
		local AutoDisable
		
		local function jump()
			local onground = debug.getupvalue(arena.MoveFunction, 4)
			if onground then
				local velocity = debug.getupvalue(arena.TickFunction, 6)
				debug.setupvalue(arena.TickFunction, 6, Vector3.new(velocity.X, Value.Value, velocity.Z))
			end
		end
		
		HighJump = vape.Categories.Blatant:CreateModule({
			Name = 'HighJump',
			Function = function(callback)
				if callback then
					if AutoDisable.Enabled then
						jump()
						HighJump:Toggle()
					else
						HighJump:Clean(runService.RenderStepped:Connect(function()
							if not inputService:GetFocusedTextBox() and inputService:IsKeyDown(Enum.KeyCode.Space) then
								jump()
							end
						end))
					end
				end
			end,
			Tooltip = 'Lets you jump higher'
		})
		Value = HighJump:CreateSlider({
			Name = 'Velocity',
			Min = 1,
			Max = 150,
			Default = 50,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
		AutoDisable = HighJump:CreateToggle({
			Name = 'Auto Disable',
			Default = true
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/Blatant/HighJump")
