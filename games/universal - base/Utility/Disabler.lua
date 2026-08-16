-- Bundled by luau-bundler
-- Entry: games/universal - base/Utility/Disabler.lua

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
	["games/universal - base/Utility/Disabler"] = function()
		local Disabler
		
		local function characterAdded(char)
			for _, v in getconnections(char.RootPart:GetPropertyChangedSignal('CFrame')) do
				hookfunction(v.Function, function() end)
			end
		
			for _, v in getconnections(char.RootPart:GetPropertyChangedSignal('Velocity')) do
				hookfunction(v.Function, function() end)
			end
		end
		
		Disabler = vape.Categories.Utility:CreateModule({
			Name = 'Disabler',
			Function = function(callback)
				if callback then
					Disabler:Clean(entitylib.Events.LocalAdded:Connect(characterAdded))
					if entitylib.isAlive then
						characterAdded(entitylib.character)
					end
				end
			end,
			Tooltip = 'Disables GetPropertyChangedSignal detections for movement'
		})
	end,
}

return __require("games/universal - base/Utility/Disabler")
