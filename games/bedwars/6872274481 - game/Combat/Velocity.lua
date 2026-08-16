-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/Combat/Velocity.lua

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
	["games/bedwars/6872274481 - game/Combat/Velocity"] = function()
		local Velocity
		local Horizontal
		local Vertical
		local Chance
		local TargetCheck
		local rand, old = Random.new()
		
		Velocity = vape.Categories.Combat:CreateModule({
			Name = 'Velocity',
			Function = function(callback)
				if callback then
					old = bedwars.KnockbackUtil.applyKnockback
					bedwars.KnockbackUtil.applyKnockback = function(root, mass, dir, knockback, ...)
						if rand:NextNumber(0, 100) > Chance.Value then return end
						local check = (not TargetCheck.Enabled) or entitylib.EntityPosition({
							Range = 50,
							Part = 'RootPart',
							Players = true
						})
		
						if check then
							knockback = knockback or {}
							if Horizontal.Value == 0 and Vertical.Value == 0 then return end
							knockback.horizontal = (knockback.horizontal or 1) * (Horizontal.Value / 100)
							knockback.vertical = (knockback.vertical or 1) * (Vertical.Value / 100)
						end
						
						return old(root, mass, dir, knockback, ...)
					end
				else
					bedwars.KnockbackUtil.applyKnockback = old
				end
			end,
			Tooltip = 'Reduces knockback taken'
		})
		Horizontal = Velocity:CreateSlider({
			Name = 'Horizontal',
			Min = 0,
			Max = 100,
			Default = 0,
			Suffix = '%'
		})
		Vertical = Velocity:CreateSlider({
			Name = 'Vertical',
			Min = 0,
			Max = 100,
			Default = 0,
			Suffix = '%'
		})
		Chance = Velocity:CreateSlider({
			Name = 'Chance',
			Min = 0,
			Max = 100,
			Default = 100,
			Suffix = '%'
		})
		TargetCheck = Velocity:CreateToggle({Name = 'Only when targeting'})
	end,
}

return __require("games/bedwars/6872274481 - game/Combat/Velocity")
