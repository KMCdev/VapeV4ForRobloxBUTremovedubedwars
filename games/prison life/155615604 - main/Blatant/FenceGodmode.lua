-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/FenceGodmode.lua

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
	["games/prison life/155615604 - main/Blatant/FenceGodmode"] = function()
		local FenceGodmode
		
		FenceGodmode = vape.Categories.Blatant:CreateModule({
			Name = 'FenceGodmode',
			Function = function(callback)
				for _, fence in workspace.Prison_Fences:QueryDescendants('BasePart:has(> TouchTransmitter)') do
					fence.CanTouch = not callback
				end
			end,
			Tooltip = 'Ignore damage from standing ontop of fences.'
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/FenceGodmode")
