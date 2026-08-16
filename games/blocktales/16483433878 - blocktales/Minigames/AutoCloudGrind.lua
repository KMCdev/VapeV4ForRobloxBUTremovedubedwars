-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Minigames/AutoCloudGrind.lua

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
	["games/blocktales/16483433878 - blocktales/Minigames/AutoCloudGrind"] = function()
		local AutoCloudGrind
		
		AutoCloudGrind = vape.Categories.Minigames:CreateModule({
			Name = 'AutoCloudGrind',
			Function = function(callback)
				if callback then
					repeat
						if bt.Variables.arena and bt.Variables.arena:GetAttribute('State') == 'Picking' then
							local doRun = true
							for _, v in bt.Variables.arena.Goon:GetChildren() do
								local drop = v.Value and v.Value:GetAttribute('Item_Drop')
		
								if drop and drop:find('FX ') and not bt.Variables.data.CardCollection[drop] then
									doRun = false
								end
							end
		
							if doRun then
								bt.Network.FireServer('CommitToMove', 'Run Away', nil, nil)
								task.wait(3)
							else
								workspace.Sounds.Money:Play()
								workspace.Sounds.Money.Ended:Wait()
							end
						end
		
						task.wait(0.05)
					until not AutoCloudGrind.Enabled
				end
			end,
			Tooltip = 'Automatically grind for SFX Cards from Cloudie (floor 51)'
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Minigames/AutoCloudGrind")
