-- Bundled by luau-bundler
-- Entry: games/redliner/115875349872417 - game/Blatant/InfiniteDash.lua

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
	["games/redliner/115875349872417 - game/Blatant/InfiniteDash"] = function()
		local InfiniteDash
		
		InfiniteDash = vape.Categories.Blatant:CreateModule({
			Name = 'InfiniteDash',
			Function = function(callback)
				if callback then
					if redline[redline.MoveController] and type(redline[redline.MoveController][redline.DashVariable]) == 'number' and type(redline[redline.MoveController][redline.DashRecoverVariable]) == 'number' then
						InfiniteDash:Clean(runService.PreSimulation:Connect(function()
							rawset(redline[redline.MoveController], redline.DashVariable, 3)
							rawset(redline[redline.MoveController], redline.DashRecoverVariable, 3)
						end))
					end
				end
			end,
			Tooltip = 'Allows you to dash infinitely.'
		})
	end,
}

return __require("games/redliner/115875349872417 - game/Blatant/InfiniteDash")
