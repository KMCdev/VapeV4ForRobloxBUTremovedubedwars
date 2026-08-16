-- Bundled by luau-bundler
-- Entry: games/bridge duel/139566161526375 - game/Blatant/NoSlowdown.lua

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
	["games/bridge duel/139566161526375 - game/Blatant/NoSlowdown"] = function()
		local old
		
		vape.Categories.Blatant:CreateModule({
			Name = 'NoSlowdown',
			Function = function(callback)
				local func = debug.getproto(bd.MovementController.KnitStart, 7)
		
				if callback then
					old = debug.getconstants(func)
					for i, v in old do
						if type(v) == 'string' and (v:find('Client') or v == 'IsChargingBow') and v ~= 'ClientSneaking' then
							debug.setconstant(func, i, 'IsSpectating')
						end
					end
				else
					for i, v in old do
						debug.setconstant(func, i, v)
					end
					table.clear(old)
				end
			end,
			Tooltip = 'Prevents slowing down when using items.'
		})
	end,
}

return __require("games/bridge duel/139566161526375 - game/Blatant/NoSlowdown")
