-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Utility/AutoPlay.lua

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
	["games/bedwars/6872274481 - game/Utility/AutoPlay"] = function()
		local AutoPlay
		local Random
		
		local function isEveryoneDead()
			return #bedwars.Store:getState().Party.members <= 0
		end
		
		local function joinQueue()
			if not bedwars.Store:getState().Game.customMatch and bedwars.Store:getState().Party.leader.userId == lplr.UserId and bedwars.Store:getState().Party.queueState == 0 then
				if Random.Enabled then
					local listofmodes = {}
					for i, v in bedwars.QueueMeta do
						if not v.disabled and not v.voiceChatOnly and not v.rankCategory then 
							table.insert(listofmodes, i) 
						end
					end
					bedwars.QueueController:joinQueue(listofmodes[math.random(1, #listofmodes)])
				else
					bedwars.QueueController:joinQueue(store.queueType)
				end
			end
		end
		
		AutoPlay = vape.Categories.Utility:CreateModule({
			Name = 'AutoPlay',
			Function = function(callback)
				if callback then
					AutoPlay:Clean(vapeEvents.EntityDeathEvent.Event:Connect(function(deathTable)
						if deathTable.finalKill and deathTable.entityInstance == lplr.Character and isEveryoneDead() and store.matchState ~= 2 then
							joinQueue()
						end
					end))
					AutoPlay:Clean(vapeEvents.MatchEndEvent.Event:Connect(joinQueue))
				end
			end,
			Tooltip = 'Automatically queues after the match ends.'
		})
		Random = AutoPlay:CreateToggle({
			Name = 'Random',
			Tooltip = 'Chooses a random mode'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Utility/AutoPlay")
