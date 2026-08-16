-- Bundled by luau-bundler
-- Entry: games/redliner/115875349872417 - game/Combat/Reach.lua

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
	["games/redliner/115875349872417 - game/Combat/Reach"] = function()
		local Reach
		
		Reach = vape.Categories.Combat:CreateModule({
			Name = 'Reach',
			Function = function(callback)
				if callback then
					SendHook:Add('Reach', function(args)
						local self = args[1]
						if self and rawget(self, 'Name') == redline.AttackPacket then
							if typeof(args[4]) == 'string' then
								for _, box in redline_boxes do
									if #castHitbox(box.data, CFrame.lookAlong(entitylib.character.RootPart.Position + Vector3.new(0, 2, 0), args[5])) > 0 then
										args[4] = box.boxtype
										break
									end
								end
							end
						end
					end, 2)
				else
					SendHook:Remove('Reach')
				end
			end,
			Tooltip = 'Extends attack reach by picking the best hitbox type. (RISKY)'
		})
	end,
}

return __require("games/redliner/115875349872417 - game/Combat/Reach")
