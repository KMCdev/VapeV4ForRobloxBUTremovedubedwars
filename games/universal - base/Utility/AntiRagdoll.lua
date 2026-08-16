-- Bundled by luau-bundler
-- Entry: games/universal - base/Utility/AntiRagdoll.lua

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
	["games/universal - base/Utility/AntiRagdoll"] = function()
		local AntiRagdoll
		
		AntiRagdoll = vape.Categories.Utility:CreateModule({
			Name = 'AntiRagdoll',
			Function = function(callback)
				if entitylib.isAlive then
					entitylib.character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not callback)
				end
		
				if callback then
					AntiRagdoll:Clean(entitylib.Events.LocalAdded:Connect(function(char)
						char.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
					end))
				end
			end,
			Tooltip = 'Prevents you from getting knocked down in a ragdoll state'
		})
	end,
}

return __require("games/universal - base/Utility/AntiRagdoll")
