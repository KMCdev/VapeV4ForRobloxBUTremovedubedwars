-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/WinEffect.lua

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
	["games/bedwars/6872274481 - game/Legit/WinEffect"] = function()
		local WinEffect
		local List
		local NameToId = {}
		
		WinEffect = vape.Legit:CreateModule({
			Name = 'WinEffect',
			Function = function(callback)
				if callback then
					WinEffect:Clean(vapeEvents.MatchEndEvent.Event:Connect(function()
						for i, v in getconnections(bedwars.Client:Get('WinEffectTriggered').instance.OnClientEvent) do
							if v.Function then
								v.Function({
									winEffectType = NameToId[List.Value],
									winningPlayer = lplr
								})
							end
						end
					end))
				end
			end,
			Tooltip = 'Allows you to select any clientside win effect'
		})
		local WinEffectName = {}
		for i, v in bedwars.WinEffectMeta do
			table.insert(WinEffectName, v.name)
			NameToId[v.name] = i
		end
		table.sort(WinEffectName)
		List = WinEffect:CreateDropdown({
			Name = 'Effects',
			List = WinEffectName
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/WinEffect")
