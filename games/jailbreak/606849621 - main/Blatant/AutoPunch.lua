-- Bundled by luau-bundler
-- Entry: games/jailbreak/606849621 - main/Blatant/AutoPunch.lua

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
	["games/jailbreak/606849621 - main/Blatant/AutoPunch"] = function()
		local AutoPunch
		
		AutoPunch = vape.Categories.Blatant:CreateModule({
			Name = 'AutoPunch',
			Function = function(callback)
				if callback then
					repeat
						if entitylib.isAlive then
							jb:FireServer('Punch')
						end
		
						task.wait(0.3)
					until not AutoPunch.Enabled
				end
			end,
			Tooltip = 'Always punches people infront of you'
		})
	end,
}

return __require("games/jailbreak/606849621 - main/Blatant/AutoPunch")
