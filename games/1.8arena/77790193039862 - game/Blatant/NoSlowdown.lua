-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/Blatant/NoSlowdown.lua

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
	["games/1.8arena/77790193039862 - game/Blatant/NoSlowdown"] = function()
		local NoSlowdown
		local old
		
		NoSlowdown = vape.Categories.Blatant:CreateModule({
			Name = 'NoSlowdown',
			Function = function(callback)
				if callback then
					old = debug.getupvalue(arena.MoveFunction, 17)
					debug.setupvalue(arena.MoveFunction, 17, debug.getupvalue(arena.MoveFunction, 19))
				else
					if old then
						debug.setupvalue(arena.MoveFunction, 17, old)
						old = nil
					end
				end
			end,
			Tooltip = 'Prevent you from slowing down when using items.'
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/Blatant/NoSlowdown")
