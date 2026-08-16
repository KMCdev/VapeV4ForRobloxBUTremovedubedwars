-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/World/AutoTool.lua

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
	["games/bedwars/6872274481 - game/World/AutoTool"] = function()
		local AutoTool
		local old, event
		
		local function switchHotbarItem(block)
			if block and not block:GetAttribute('NoBreak') and not block:GetAttribute('Team'..(lplr:GetAttribute('Team') or 0)..'NoBreak') then
				local tool, slot = store.tools[bedwars.ItemMeta[block.Name].block.breakType], nil
				if tool then
					for i, v in store.inventory.hotbar do
						if v.item and v.item.itemType == tool.itemType then slot = i - 1 break end
					end
		
					if hotbarSwitch(slot) then
						if inputService:IsMouseButtonPressed(0) then 
							event:Fire() 
						end
						return true
					end
				end
			end
		end
		
		AutoTool = vape.Categories.World:CreateModule({
			Name = 'AutoTool',
			Function = function(callback)
				if callback then
					event = Instance.new('BindableEvent')
					AutoTool:Clean(event)
					AutoTool:Clean(event.Event:Connect(function()
						contextActionService:CallFunction('block-break', Enum.UserInputState.Begin, newproxy(true))
					end))
					old = bedwars.BlockBreaker.hitBlock
					bedwars.BlockBreaker.hitBlock = function(self, maid, raycastparams, ...)
						local block = self.clientManager:getBlockSelector():getMouseInfo(1, {ray = raycastparams})
						if switchHotbarItem(block and block.target and block.target.blockInstance or nil) then return end
						return old(self, maid, raycastparams, ...)
					end
				else
					bedwars.BlockBreaker.hitBlock = old
					old = nil
				end
			end,
			Tooltip = 'Automatically selects the correct tool'
		})
	end,
}

return __require("games/bedwars/6872274481 - game/World/AutoTool")
