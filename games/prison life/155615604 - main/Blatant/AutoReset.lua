-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/AutoReset.lua

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
	["games/prison life/155615604 - main/Blatant/AutoReset"] = function()
		local AutoReset
		
		AutoReset = vape.Categories.Blatant:CreateModule({
			Name = 'AutoReset',
			Function = function(callback)
				if callback then
					AutoReset:Clean(lplr:GetPropertyChangedSignal('Team'):Connect(function()
						if lplr.Team == teams.Criminals and entitylib.isAlive then
							entitylib.character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
						end
					end))
				end
			end,
			Tooltip = 'Automatically reset after becoming a criminal.'
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/AutoReset")
