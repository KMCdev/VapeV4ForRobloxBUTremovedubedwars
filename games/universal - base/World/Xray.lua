-- Bundled by luau-bundler
-- Entry: games/universal - base/World/Xray.lua

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
	["games/universal - base/World/Xray"] = function()
		local Xray
		local List
		local modified = {}
		
		local function modifyPart(v)
			if v:IsA('BasePart') and not table.find(List.ListEnabled, v.Name) then
				modified[v] = true
				v.LocalTransparencyModifier = 0.5
			end
		end
		
		Xray = vape.Categories.World:CreateModule({
			Name = 'Xray',
			Function = function(callback)
				if callback then
					Xray:Clean(workspace.DescendantAdded:Connect(modifyPart))
					for _, v in workspace:GetDescendants() do
						modifyPart(v)
					end
				else
					for i in modified do
						i.LocalTransparencyModifier = 0
					end
					table.clear(modified)
				end
			end,
			Tooltip = 'Renders whitelisted parts through walls.'
		})
		List = Xray:CreateTextList({
			Name = 'Part',
			Function = function()
				if Xray.Enabled then
					Xray:Toggle()
					Xray:Toggle()
				end
			end
		})
	end,
}

return __require("games/universal - base/World/Xray")
