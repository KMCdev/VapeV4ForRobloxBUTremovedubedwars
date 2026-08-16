-- Bundled by luau-bundler
-- Entry: games/universal - base/Blatant/Timer.lua

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
	["games/universal - base/Blatant/Timer"] = function()
		local Timer
		local Value
		
		Timer = vape.Categories.Blatant:CreateModule({
			Name = 'Timer',
			Function = function(callback)
				if callback then
					setfflag('SimEnableStepPhysics', 'True')
					setfflag('SimEnableStepPhysicsSelective', 'True')
		
					Timer:Clean(runService.RenderStepped:Connect(function(dt)
						if Value.Value > 1 then
							runService:Pause()
							workspace:StepPhysics(dt * (Value.Value - 1), {entitylib.character.RootPart})
							runService:Run()
						end
					end))
				end
			end,
			Tooltip = 'Change the game speed.'
		})
		Value = Timer:CreateSlider({
			Name = 'Value',
			Min = 1,
			Max = 3,
			Decimal = 10
		})
	end,
}

return __require("games/universal - base/Blatant/Timer")
