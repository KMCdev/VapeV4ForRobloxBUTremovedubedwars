-- Bundled by luau-bundler
-- Entry: games/bridge duel/139566161526375 - game/Combat/AutoClicker.lua

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
	["games/bridge duel/139566161526375 - game/Combat/AutoClicker"] = function()
		local AutoClicker
		local CPS
		
		AutoClicker = vape.Categories.Combat:CreateModule({
			Name = 'AutoClicker',
			Function = function(callback)
				if callback then
					repeat
						local tool = getTool()
						if tool and inputService:IsMouseButtonPressed(0) then
							tool:Activate()
						end
		
						task.wait(1 / CPS.GetRandomValue())
					until not AutoClicker.Enabled
				end
			end,
			Tooltip = 'Automatically clicks for you'
		})
		CPS = AutoClicker:CreateTwoSlider({
			Name = 'CPS',
			Min = 1,
			Max = 20,
			DefaultMin = 8,
			DefaultMax = 12
		})
	end,
}

return __require("games/bridge duel/139566161526375 - game/Combat/AutoClicker")
