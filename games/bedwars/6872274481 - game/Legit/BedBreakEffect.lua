-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/BedBreakEffect.lua

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
	["games/bedwars/6872274481 - game/Legit/BedBreakEffect"] = function()
		local BedBreakEffect
		local Mode
		local List
		local NameToId = {}
		
		BedBreakEffect = vape.Legit:CreateModule({
			Name = 'Bed Break Effect',
			Function = function(callback)
				if callback then
		            BedBreakEffect:Clean(vapeEvents.BedwarsBedBreak.Event:Connect(function(data)
		                firesignal(bedwars.Client:Get('BedBreakEffectTriggered').instance.OnClientEvent, {
		                    player = data.player,
		                    position = data.bedBlockPosition * 3,
		                    effectType = NameToId[List.Value],
		                    teamId = data.brokenBedTeam.id,
		                    centerBedPosition = data.bedBlockPosition * 3
		                })
		            end))
		        end
			end,
			Tooltip = 'Custom bed break effects'
		})
		local BreakEffectName = {}
		for i, v in bedwars.BedBreakEffectMeta do
			table.insert(BreakEffectName, v.name)
			NameToId[v.name] = i
		end
		table.sort(BreakEffectName)
		List = BedBreakEffect:CreateDropdown({
			Name = 'Effect',
			List = BreakEffectName
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/BedBreakEffect")
