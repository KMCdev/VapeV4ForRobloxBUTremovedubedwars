-- Bundled by luau-bundler
-- Entry: games/bridge duel/139566161526375 - game/Utility/AutoPlay.lua

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
	["games/bridge duel/139566161526375 - game/Utility/AutoPlay"] = function()
		local AutoPlay
		local Delay
		
		AutoPlay = vape.Categories.Utility:CreateModule({
			Name = 'AutoPlay',
			Function = function(callback)
				if callback then
					AutoPlay:Clean(bd.Blink.game_state.team_won.on(function()
						if bd.ServerData.Submode ~= 'Playground' then
							bd.MatchController:EnterQueue(bd.ServerData.Submode)
						end
					end))
				end
			end,
			Tooltip = 'Automatically queues after the match ends.'
		})
	end,
}

return __require("games/bridge duel/139566161526375 - game/Utility/AutoPlay")
