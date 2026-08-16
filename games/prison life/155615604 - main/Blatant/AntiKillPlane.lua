-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/AntiKillPlane.lua

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
	["games/prison life/155615604 - main/Blatant/AntiKillPlane"] = function()
		local AntiKillPlane
		
		AntiKillPlane = vape.Categories.Blatant:CreateModule({
			Name = 'AntiKillPlane',
			Function = function(callback)
				if callback then
					AntiKillPlane:Clean(runService.Heartbeat:Connect(function()
						if entitylib.isAlive then
							local root = entitylib.character.RootPart
							local diff = math.min(root.Position.Y, 179.99) - root.Position.Y
							root.CFrame += Vector3.new(0, diff, 0)
		
							if math.abs(diff) > 0 and root.AssemblyLinearVelocity.Y > 0 then
								root.AssemblyLinearVelocity *= Vector3.new(1, 0, 1)
							end
						end
					end))
				end
			end,
			Tooltip = 'Prevents you from touching the kill plane'
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/AntiKillPlane")
