-- Bundled by luau-bundler
-- Entry: games/jailbreak/606849621 - main/Blatant/AutoArrest.lua

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
	["games/jailbreak/606849621 - main/Blatant/AutoArrest"] = function()
		local AutoArrest
		local cooldown = 0
		
		AutoArrest = vape.Categories.Blatant:CreateModule({
			Name = 'AutoArrest',
			Function = function(callback)
				if callback then
					repeat
						local item = jb.ItemSystemController:GetLocalEquipped()
						if item and item.__ClassName == 'Handcuffs' then
							local localPosition = entitylib.character.Humanoid.HumanoidUnloadServerPosition.Value
							local plrs = entitylib.AllPosition({
								Players = true,
								Part = 'RootPart',
								Range = 50
							})
		
							for _, ent in plrs do
								if ent.Player and isIllegal(ent) then
									local vehicle = ent.Humanoid.Sit and getVehicle(ent) or nil
									if vehicle then
										jb:FireServer('Eject', vehicle)
									elseif not isArrested(ent.Player.Name) and (localPosition - ent.RootPart.Position).Magnitude < 18.4 and cooldown < os.clock() then
										jb:FireServer('Arrest', ent.Player.Name)
										cooldown = os.clock() + 0.5
									end
								end
							end
						end
		
						task.wait(0.016)
					until not AutoArrest.Enabled
				end
			end,
			Tooltip = 'Automatically uses handcuffs on nearby entities'
		})
	end,
}

return __require("games/jailbreak/606849621 - main/Blatant/AutoArrest")
