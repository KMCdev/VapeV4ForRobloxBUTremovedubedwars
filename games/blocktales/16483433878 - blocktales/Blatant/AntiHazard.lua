-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Blatant/AntiHazard.lua

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
	["games/blocktales/16483433878 - blocktales/Blatant/AntiHazard"] = function()
		local AntiHazard
		local old
		
		AntiHazard = vape.Categories.Blatant:CreateModule({
			Name = 'AntiHazard',
			Function = function(callback)
				if callback then
					old = hookfunction(bt.Network.FireServer, function(...)
						local event = ...
						if event == 'TakeDamage' then
							return
						end
		
						return old(...)
					end)
				else
					if old then
						hookfunction(bt.Network.FireServer, old)
						old = nil
					end
				end
			end,
			Tooltip = 'Prevent you from taking damage in the overworld section.'
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Blatant/AntiHazard")
