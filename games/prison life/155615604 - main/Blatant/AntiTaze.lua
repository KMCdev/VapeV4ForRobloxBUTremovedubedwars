-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/AntiTaze.lua

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
	["games/prison life/155615604 - main/Blatant/AntiTaze"] = function()
		local AntiTaze
		local old, connection
		
		local function EntityAdded(ent)
			connection = getconnections(replicatedStorage.GunRemotes.PlayerTased.OnClientEvent)[1]
			if not (connection and connection.Function) then
				repeat
					connection = getconnections(replicatedStorage.GunRemotes.PlayerTased.OnClientEvent)[1]
					task.wait()
				until connection and connection.Function or not AntiTaze.Enabled
			end
		
			if connection and AntiTaze.Enabled then
				old = hookfunction(connection.Function, function()
					local char = lplr.Character
					lplr:SetAttribute('BackpackEnabled', false)
					if entitylib.isAlive then
						entitylib.character.Humanoid:UnequipTools()
					end
		
					task.wait(3.5)
					if lplr.Character == char then
						lplr:SetAttribute('BackpackEnabled', true)
					end
				end)
			end
		end
		
		AntiTaze = vape.Categories.Blatant:CreateModule({
			Name = 'AntiTaze',
			Function = function(callback)
				if callback then
					AntiTaze:Clean(entitylib.Events.LocalAdded:Connect(EntityAdded))
					if entitylib.isAlive then
						task.spawn(EntityAdded, entitylib.character)
					end
				else
					if old and connection.Function then
						hookfunction(connection.Function, old)
						old = nil
					end
				end
			end,
			Tooltip = 'Prevent you from getting tazed'
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/AntiTaze")
