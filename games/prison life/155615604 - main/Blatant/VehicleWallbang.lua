-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/VehicleWallbang.lua

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
	["games/prison life/155615604 - main/Blatant/VehicleWallbang"] = function()
		local VehicleWallbang
		local modified = {}
		
		local function Modify(part)
			if part:IsA('BasePart') then
				if not modified[part] then
					modified[part] = part.CanQuery
				end
		
				part.CanQuery = false
			end
		end
		
		VehicleWallbang = vape.Categories.Blatant:CreateModule({
			Name = 'VehicleWallbang',
			Function = function(callback)
				if callback then
					VehicleWallbang:Clean(workspace.CarContainer.DescendantAdded:Connect(Modify))
					for _, part in workspace.CarContainer:QueryDescendants('BasePart') do
						Modify(part)
					end
				else
					for i, v in modified do
						i.CanQuery = v
					end
					table.clear(modified)
				end
			end,
			Tooltip = 'Allow you to shoot through vehicles.'
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/VehicleWallbang")
