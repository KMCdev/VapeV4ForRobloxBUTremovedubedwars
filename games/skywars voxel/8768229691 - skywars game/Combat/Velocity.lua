-- Bundled by luau-bundler
-- Entry: games/skywars voxel/8768229691 - skywars game/Combat/Velocity.lua

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
	["games/skywars voxel/8768229691 - skywars game/Combat/Velocity"] = function()
		local Velocity
		local Horizontal
		local Vertical
		local Chance
		local Targeting
		local connection
		local rand, old = Random.new()
		
		local function velocityFunction(...)
			if rand:NextNumber(0, 100) > Chance.Value then return old(...) end
		
			local args = table.pack(...)
			local check = (not Targeting.Enabled) or entitylib.EntityPosition({
				Range = 50,
				Part = 'RootPart',
				Players = true
			})
		
			if check then
				local hort, vert = (Horizontal.Value / 100), (Vertical.Value / 100)
				if hort == 0 and vert == 0 then return end
				args[1] = Vector3.new(args[1].X * hort, args[1].Y * vert, args[1].Z * hort)
			end
		
			return old(unpack(args, 1, args.n))
		end
		
		Velocity = vape.Categories.Combat:CreateModule({
			Name = 'Velocity',
			Function = function(callback)
				if callback then
					connection = getconnections(debug.getupvalue(debug.getupvalue(skywars.Remotes[remotes['PlayerVelocityController:onStart']].connect, 1).fireClient, 1).OnClientEvent)[1]
					if not connection then return end
		
					old = hookfunction(connection.Function, function(...)
						return velocityFunction(...)
					end)
				else
					if old then
						hookfunction(connection.Function, old)
					end
					connection = nil
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
		Targeting = Velocity:CreateToggle({Name = 'Only when targeting'})
	end,
}

return __require("games/skywars voxel/8768229691 - skywars game/Combat/Velocity")
