-- Bundled by luau-bundler
-- Entry: games/bedwars/6872274481 - game/World/AutoSuffocate.lua

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
	["games/bedwars/6872274481 - game/World/AutoSuffocate"] = function()
		local AutoSuffocate
		local Range
		local LimitItem
		
		local function fixPosition(pos)
			return bedwars.BlockController:getBlockPosition(pos) * 3
		end
		
		AutoSuffocate = vape.Categories.World:CreateModule({
			Name = 'AutoSuffocate',
			Function = function(callback)
				if callback then
					repeat
						local item = store.hand.toolType == 'block' and store.hand.tool.Name or not LimitItem.Enabled and getWool()
		
						if item then
							local plrs = entitylib.AllPosition({
								Part = 'RootPart',
								Range = Range.Value,
								Players = true
							})
		
							for _, ent in plrs do
								local needPlaced = {}
		
								for _, side in Enum.NormalId:GetEnumItems() do
									side = Vector3.fromNormalId(side)
									if side.Y ~= 0 then continue end
		
									side = fixPosition(ent.RootPart.Position + side * 2)
									if not getPlacedBlock(side) then
										table.insert(needPlaced, side)
									end
								end
		
								if #needPlaced < 3 then
									table.insert(needPlaced, fixPosition(ent.Head.Position))
									table.insert(needPlaced, fixPosition(ent.RootPart.Position - Vector3.new(0, 1, 0)))
		
									for _, pos in needPlaced do
										if not getPlacedBlock(pos) then
											task.spawn(bedwars.placeBlock, pos, item)
											break
										end
									end
								end
							end
						end
		
						task.wait(0.09)
					until not AutoSuffocate.Enabled
				end
			end,
			Tooltip = 'Places blocks on nearby confined entities'
		})
		Range = AutoSuffocate:CreateSlider({
			Name = 'Range',
			Min = 1,
			Max = 20,
			Default = 20,
			Suffix = function(val)
				return val == 1 and 'stud' or 'studs'
			end
		})
		LimitItem = AutoSuffocate:CreateToggle({
			Name = 'Limit to Items',
			Default = true
		})
	end,
}

return __require("games/bedwars/6872274481 - game/World/AutoSuffocate")
