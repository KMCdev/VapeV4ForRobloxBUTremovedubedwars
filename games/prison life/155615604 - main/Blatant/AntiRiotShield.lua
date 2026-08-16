-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/AntiRiotShield.lua

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
	["games/prison life/155615604 - main/Blatant/AntiRiotShield"] = function()
		local AntiRiotShield
		
		AntiRiotShield = vape.Categories.Blatant:CreateModule({
			Name = 'AntiRiotShield',
			Function = function(callback)
				if callback then
					repeat
						for _, ent in entitylib.List do
							local shield = ent.Character:FindFirstChild('RiotShieldPart')
							if shield then
								shield.CanQuery = false
							end
						end
		
						task.wait(0.05)
					until not AntiRiotShield.Enabled
				else
					for _, ent in entitylib.List do
						local shield = ent.Character:FindFirstChild('RiotShieldPart')
						if shield then
							shield.CanQuery = true
						end
					end
				end
			end,
			Tooltip = 'Allow you to shoot through riot shields.'
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/AntiRiotShield")
