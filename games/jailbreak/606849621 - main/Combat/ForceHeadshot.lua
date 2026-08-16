-- Bundled by luau-bundler
-- Entry: games/jailbreak/606849621 - main/Combat/ForceHeadshot.lua

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
	["games/jailbreak/606849621 - main/Combat/ForceHeadshot"] = function()
		local ForceHeadshot
		
		ForceHeadshot = vape.Categories.Combat:CreateModule({
			Name = 'ForceHeadshot',
			Function = function(callback)
				if callback then
					local hook
					hook = hookfunction(jb.GunController.BulletEmitterOnLocalHitPlayer, function(...)
						local shotData = select(15, ...)
						shotData.isHeadshot = true
						return hook(...)
					end)
				else
					restorefunction(jb.GunController.BulletEmitterOnLocalHitPlayer)
				end
			end,
			Tooltip = 'Modifies bullets to always do headshot damage.'
		})
	end,
}

return __require("games/jailbreak/606849621 - main/Combat/ForceHeadshot")
