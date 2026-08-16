-- Bundled by luau-bundler
-- Entry: games/skywars voxel/8768229691 - skywars game/Combat/AutoClicker.lua

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
	["games/skywars voxel/8768229691 - skywars game/Combat/AutoClicker"] = function()
		local AutoClicker
		local CPS
		local Blocks
		local BlocksCPS = {Object = {}}
		local Thread
		local old
		
		local function AutoClick()
			Thread = task.delay(1 / 8, function()
				repeat
					local held = store.hand
					if held then
						if held.Rewrite and Blocks.Enabled then
							local block = skywars.ItemMeta[held.Rewrite.Type:gsub('{TeamId}', skywars.TeamController:getPlayerTeamId(lplr) or 'White')]
							local ray = skywars.BlockRaycastController:executeRaycast(inputService:GetMouseLocation(), 1, 0, block)
							if ray and ray.BlockPosition then
								skywars.BlockController:placeBlock(ray.BlockPosition, held.Name, block, ray.Rotation)
							end
						elseif held.Melee then
							skywars.MeleeController:strike(held)
						end
					end
		
					task.wait(1 / (held and held.Rewrite and BlocksCPS or CPS).GetRandomValue())
				until not AutoClicker.Enabled
			end)
		end
		
		AutoClicker = vape.Categories.Combat:CreateModule({
			Name = 'AutoClicker',
			Function = function(callback)
				if callback then
					AutoClicker:Clean(inputService.InputBegan:Connect(function(input, gameProcessed)
						if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
							AutoClick()
						end
					end))
		
					AutoClicker:Clean(inputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 and Thread then
							task.cancel(Thread)
							Thread = nil
						end
					end))
				end
			end,
			Tooltip = 'Hold attack button to automatically click'
		})
		CPS = AutoClicker:CreateTwoSlider({
			Name = 'CPS',
			Min = 1,
			Max = 9,
			DefaultMin = 9,
			DefaultMax = 9
		})
		Blocks = AutoClicker:CreateToggle({
			Name = 'Place Blocks',
			Default = true,
			Function = function(callback)
				BlocksCPS.Object.Visible = callback
			end
		})
		BlocksCPS = AutoClicker:CreateTwoSlider({
			Name = 'Block CPS',
			Min = 1,
			Max = 20,
			DefaultMin = 9,
			DefaultMax = 9,
			Darker = true
		})
	end,
}

return __require("games/skywars voxel/8768229691 - skywars game/Combat/AutoClicker")
