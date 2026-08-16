-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Legit/SoundChanger.lua

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
	["games/bedwars/6872274481 - game/Legit/SoundChanger"] = function()
		local SoundChanger
		local List
		local soundlist = {}
		local old
		
		SoundChanger = vape.Legit:CreateModule({
			Name = 'SoundChanger',
			Function = function(callback)
				if callback then
					old = bedwars.SoundManager.playSound
					bedwars.SoundManager.playSound = function(self, id, ...)
						if soundlist[id] then
							id = soundlist[id]
						end
		
						return old(self, id, ...)
					end
				else
					bedwars.SoundManager.playSound = old
					old = nil
				end
			end,
			Tooltip = 'Change ingame sounds to custom ones.'
		})
		List = SoundChanger:CreateTextList({
			Name = 'Sounds',
			Placeholder = '(DAMAGE_1/ben.mp3)',
			Function = function()
				table.clear(soundlist)
				for _, entry in List.ListEnabled do
					local split = entry:split('/')
					local id = bedwars.SoundList[split[1]]
					if id and #split > 1 then
						soundlist[id] = split[2]:find('rbxasset') and split[2] or isfile(split[2]) and assetfunction(split[2]) or ''
					end
				end
			end
		})
	end,
}

return __require("games/bedwars/6872274481 - game/Legit/SoundChanger")
