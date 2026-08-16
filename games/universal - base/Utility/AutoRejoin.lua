-- Bundled by luau-bundler
-- Entry: games/universal - base/Utility/AutoRejoin.lua

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
	["games/universal - base/Utility/AutoRejoin"] = function()
		local AutoRejoin
		local Sort
		
		AutoRejoin = vape.Categories.Utility:CreateModule({
			Name = 'AutoRejoin',
			Function = function(callback)
				if callback then
					local check
					AutoRejoin:Clean(guiService.ErrorMessageChanged:Connect(function(str)
						if (not check or guiService:GetErrorCode() ~= Enum.ConnectionError.DisconnectLuaKick) and guiService:GetErrorCode() ~= Enum.ConnectionError.DisconnectConnectionLost and not str:lower():find('ban') then
							check = true
							serverHop(nil, Sort.Value)
						end
					end))
				end
			end,
			Tooltip = 'Automatically rejoins into a new server if you get disconnected / kicked'
		})
		Sort = AutoRejoin:CreateDropdown({
			Name = 'Sort',
			List = {'Descending', 'Ascending'},
			Tooltip = 'Descending - Prefers full servers\nAscending - Prefers empty servers'
		})
	end,
}

return __require("games/universal - base/Utility/AutoRejoin")
