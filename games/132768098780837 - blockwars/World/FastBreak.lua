-- Bundled by luau-bundler
-- Entry: games/132768098780837 - blockwars/World/FastBreak.lua

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
	["games/132768098780837 - blockwars/World/FastBreak"] = function()
		local FastBreak
		local Value
		local old
		
		FastBreak = vape.Categories.World:CreateModule({
			Name = 'FastBreak',
			Function = function(callback)
				if callback then
					old = hookfunction(bw.BlockBreakConstants.CooldownFor, function(...)
						return old(...) * (Value.Value / 100)
					end)
				else
					if old then
						hookfunction(bw.BlockBreakConstants.CooldownFor, old)
						old = nil
					end
				end
			end,
			Tooltip = 'Allow you to swing the pickaxe faster.'
		})
		Value = FastBreak:CreateSlider({
			Name = 'Break Speed Percent',
			Min = 0,
			Max = 100,
			Default = 50,
			Suffix = '%'
		})
	end,
}

return __require("games/132768098780837 - blockwars/World/FastBreak")
