-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/CleanKit.lua

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
	["games/bedwars/6872274481 - game/Legit/CleanKit"] = function()
		vape.Legit:CreateModule({
			Name = 'Clean Kit',
			Function = function(callback)
				if callback then
					bedwars.WindWalkerController.spawnOrb = function() end
					local zephyreffect = lplr.PlayerGui:FindFirstChild('WindWalkerEffect', true)
					if zephyreffect then 
						zephyreffect.Visible = false 
					end
				end
			end,
			Tooltip = 'Removes zephyr status indicator'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/CleanKit")
