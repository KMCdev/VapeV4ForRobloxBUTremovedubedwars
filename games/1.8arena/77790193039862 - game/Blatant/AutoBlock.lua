-- Bundled by luau-bundler
-- Entry: games/1.8arena/77790193039862 - game/Blatant/AutoBlock.lua

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
	["games/1.8arena/77790193039862 - game/Blatant/AutoBlock"] = function()
		local AutoBlock
		
		AutoBlock = vape.Categories.Blatant:CreateModule({
			Name = 'AutoBlock',
			Function = function(callback)
				if callback then
					oldhit = hookfunction(arena.Client.startHit, function(...)
						if debug.getupvalue(oldhit, 6) then
							arena.Client.endBlockEvent:FireServer()
							debug.setupvalue(oldhit, 6, false)
		
							local results = table.pack(oldhit(...))
							arena.Client.beginBlockEvent:FireServer()
							debug.setupvalue(oldhit, 6, true)
		
							return unpack(results, 1, results.n)
						else
							return oldhit(...)
						end
					end)
				else
					if oldhit then
						hookfunction(arena.Client.startHit, oldhit)
						oldhit = nil
					end
				end
			end,
			Tooltip = 'Automatically unblock and reblock before hitting'
		})
	end,
}

return __require("games/1.8arena/77790193039862 - game/Blatant/AutoBlock")
