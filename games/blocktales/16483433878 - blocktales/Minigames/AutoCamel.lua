-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Minigames/AutoCamel.lua

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
	["games/blocktales/16483433878 - blocktales/Minigames/AutoCamel"] = function()
		local AutoCamel
		
		AutoCamel = vape.Categories.Minigames:CreateModule({
			Name = 'AutoCamel',
			Function = function(callback)
				if callback then
					local camel = workspace.NPCs:FindFirstChild('Abu Baba')
					if not camel then
						notif('AutoCamel', 'Missing camel seller!', 5, 'warning')
						AutoCamel:Toggle()
						return
					end
		
					local module = require(camel.Dialogue:FindFirstChild('RunScript', true).ModuleScript)
					repeat
						if (lplr:GetAttribute('TIX') or 0) >= 30 then
							module:Run()
						end
		
						task.wait(0.5)
					until not AutoCamel.Enabled
				end
			end,
			Tooltip = 'Automatically buy camels'
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Minigames/AutoCamel")
