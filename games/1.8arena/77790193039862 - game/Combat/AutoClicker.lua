-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/Combat/AutoClicker.lua

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
	["games/1.8arena/77790193039862 - game/Combat/AutoClicker"] = function()
		local AutoClicker
		local CPS
		local Thread
		
		local function AutoClick()
			if Thread then
				task.cancel(Thread)
			end
		
			Thread = task.delay(1 / CPS.GetRandomValue(), function()
				repeat
					task.spawn(arena.Client.startHit)
					task.wait(1 / CPS.GetRandomValue())
				until not AutoClicker.Enabled
			end)
		end
		
		AutoClicker = vape.Categories.Combat:CreateModule({
			Name = 'AutoClicker',
			Function = function(callback)
				if callback then
					AutoClicker:Clean(inputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							AutoClick()
						end
					end))
		
					AutoClicker:Clean(inputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Thread then
							task.cancel(Thread)
							Thread = nil
						end
					end))
				else
					if Thread then
						task.cancel(Thread)
						Thread = nil
					end
				end
			end,
			Tooltip = 'Hold attack button to automatically click'
		})
		CPS = AutoClicker:CreateTwoSlider({
			Name = 'CPS',
			Min = 1,
			Max = 9,
			DefaultMin = 7,
			DefaultMax = 7
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/Combat/AutoClicker")
