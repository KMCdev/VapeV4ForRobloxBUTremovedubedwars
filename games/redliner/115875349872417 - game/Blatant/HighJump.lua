-- Bundled by luau-bundler
-- Entry: games/redliner/115875349872417 - game/Blatant/HighJump.lua

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
	["games/redliner/115875349872417 - game/Blatant/HighJump"] = function()
		local HighJump
		local Value
		
		HighJump = vape.Categories.Blatant:CreateModule({
			Name = 'HighJump',
			Function = function(callback)
				if callback then
					HighJump:Toggle()
					addVelocity(Vector3.new(0, Value.Value, 0))
				end
			end,
			ExtraText = function()
				return 'Redliner'
			end,
			Tooltip = 'Lets you jump higher'
		})
		Value = HighJump:CreateSlider({
			Name = 'Velocity',
			Min = 1,
			Max = 150,
			Default = 50,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
	end,
}

return __require("games/redliner/115875349872417 - game/Blatant/HighJump")
