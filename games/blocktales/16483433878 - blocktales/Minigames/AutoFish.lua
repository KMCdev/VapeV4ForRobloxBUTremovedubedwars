-- Bundled by luau-bundler
-- Entry: games/blocktales/16483433878 - blocktales/Minigames/AutoFish.lua

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
	["games/blocktales/16483433878 - blocktales/Minigames/AutoFish"] = function()
		local AutoFish
		local KeepList
		local old
		
		AutoFish = vape.Categories.Minigames:CreateModule({
			Name = 'AutoFish',
			Function = function(callback)
				if callback then
					local fishman = workspace.NPCs:FindFirstChild('The Seller')
					if not fishman then
						notif('AutoFish', 'Missing fisherman!', 5, 'warning')
						AutoFish:Toggle()
						return
					end
		
					old = workspace.Sounds.Money.Volume
					workspace.Sounds.Money.Volume = 0
		
					repeat
						local fish = lplr.Status:GetAttribute('NextFish')
						local res = bt.Network.InvokeServer('FishItem')
						if res == true then
							if not table.find(KeepList.ListEnabled, fish) then
								bt.Network.InvokeServer('UseItem', fish, fishman)
							end
		
							bt.Network.InvokeServer('BuyItem', fishman.ShopItems:GetChildren()[1], fishman)
						end
		
						task.wait()
					until not AutoFish.Enabled
				else
					if old then
						workspace.Sounds.Money.Volume = old
					end
				end
			end,
			Tooltip = 'Automatically sell and buy fish'
		})
		KeepList = AutoFish:CreateTextList({
			Name = 'Keep List',
			Placeholder = 'item'
		})
	end,
}

return __require("games/blocktales/16483433878 - blocktales/Minigames/AutoFish")
