-- Bundled by luau-bundler
-- Entry: games/132768098780837 - blockwars/Legit/HideShield.lua

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
	["games/132768098780837 - blockwars/Legit/HideShield"] = function()
		local HideShield
		local parts = {}
		
		local function localAdded(char)
			local shield = char.Character:WaitForChild('ShieldModel', 10)
			if shield then
				parts = shield:QueryDescendants('BasePart')
			end
		end
		
		HideShield = vape.Legit:CreateModule({
			Name = 'HideShield',
			Function = function(callback)
				if callback then
					HideShield:Clean(entitylib.Events.LocalAdded:Connect(localAdded))
					if entitylib.isAlive then
						task.spawn(localAdded, entitylib.character)
					end
		
					repeat
						for _, v in parts do
							v.Transparency = 1
						end
		
						task.wait()
					until not HideShield.Enabled
				else
					table.clear(parts)
				end
			end,
			Tooltip = 'Hide the shield entirely.'
		})
	end,
}

return __require("games/132768098780837 - blockwars/Legit/HideShield")
