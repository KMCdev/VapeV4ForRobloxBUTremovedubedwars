-- Bundled by luau-bundler
-- Entry: games/893973440 - flee the facility/Blatant/NoSlowdown.lua

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
	["games/893973440 - flee the facility/Blatant/NoSlowdown"] = function()
		local NoSlowdown
		local old
		
		NoSlowdown = vape.Categories.Blatant:CreateModule({
			Name = 'NoSlowdown',
			Function = function(callback)
				if callback then
					repeat
						for _, v in getconnections(inputService.JumpRequest) do
							if v.Function and debug.info(v.Function, 's'):find('PowersLocalScript') then
								old = v
								v:Disable()
							end
						end
		
						task.wait(0.1)
					until not NoSlowdown.Enabled
				else
					if old then
						old:Enable()
						old = nil
					end
				end
			end,
			Tooltip = 'Prevent slowing down when jumping as the beast'
		})
	end,
}

return __require("games/893973440 - flee the facility/Blatant/NoSlowdown")
