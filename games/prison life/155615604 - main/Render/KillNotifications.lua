-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Render/KillNotifications.lua

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
	["games/prison life/155615604 - main/Render/KillNotifications"] = function()
		local KillNotifications
		
		KillNotifications = vape.Categories.Render:CreateModule({
			Name = 'KillNotifications',
			Function = function(callback)
				if callback then
					KillNotifications:Clean(vapeEvents.PlayerKill.Event:Connect(function(killer, victim)
						if victim == lplr.Name and killer ~= lplr.Name then
							notif('KillNotifications', killer..' killed you!', 5)
						end
					end))
				end
			end,
			Tooltip = 'Sends a notification of who killed you.'
		})
	end,
}

return __require("games/prison life/155615604 - main/Render/KillNotifications")
