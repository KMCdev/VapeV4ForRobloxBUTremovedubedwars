-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/NoJumpCooldown.lua

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
	["games/prison life/155615604 - main/Blatant/NoJumpCooldown"] = function()
		local NoJumpCooldown
		local old
		
		local function EntityAdded(ent)
			old = getconnections(ent.Humanoid:GetPropertyChangedSignal('Jump'))[1]
			if not old then
				repeat
					old = getconnections(ent.Humanoid:GetPropertyChangedSignal('Jump'))[1]
					task.wait()
				until old or not NoJumpCooldown.Enabled
		
				if not NoJumpCooldown.Enabled then
					return
				end
			end
		
			if old then
				old:Disable()
			end
		end
		
		NoJumpCooldown = vape.Categories.Blatant:CreateModule({
			Name = 'NoJumpCooldown',
			Function = function(callback)
				if callback then
					NoJumpCooldown:Clean(entitylib.Events.LocalAdded:Connect(EntityAdded))
					if entitylib.isAlive then
						task.spawn(EntityAdded, entitylib.character)
					end
				else
					if old then
						old:Enable()
						old = nil
					end
				end
			end,
			Tooltip = 'Remove the stamina cooldown from jumping'
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/NoJumpCooldown")
