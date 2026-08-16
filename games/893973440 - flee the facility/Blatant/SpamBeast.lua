-- Bundled by luau-bundler
-- Entry: games/893973440 - flee the facility/Blatant/SpamBeast.lua

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
	["games/893973440 - flee the facility/Blatant/SpamBeast"] = function()
		local SpamBeast
		
		SpamBeast = vape.Categories.Blatant:CreateModule({
			Name = 'SpamBeast',
			Function = function(callback)
				if callback then
					repeat
						for _, v in entitylib.List do
							local rem = v.IsBeast and v.Character:FindFirstChild('PowersEvent', true)
							if rem and rem:IsA('RemoteEvent') then
								rem:FireServer('Input')
							end
						end
		
						task.wait(0.1)
					until not SpamBeast.Enabled
				end
			end,
			Tooltip = 'Force the beast to use abilities'
		})
	end,
}

return __require("games/893973440 - flee the facility/Blatant/SpamBeast")
