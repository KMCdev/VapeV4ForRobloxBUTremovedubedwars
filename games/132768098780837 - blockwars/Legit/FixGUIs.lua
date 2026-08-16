-- Bundled by luau-bundler
-- Entry: games/132768098780837 - blockwars/Legit/FixGUIs.lua

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
	["games/132768098780837 - blockwars/Legit/FixGUIs"] = function()
		local FixGUIs
		
		FixGUIs = vape.Legit:CreateModule({
			Name = 'FixGUIs',
			Function = function(callback)
				if callback then
					local guis = {lplr.PlayerGui:FindFirstChild('Team_UpgradesV3', true), lplr.PlayerGui:FindFirstChild('ItemShopV3', true)}
					if #guis < 2 then
						repeat
							guis = {lplr.PlayerGui:FindFirstChild('Team_UpgradesV3', true), lplr.PlayerGui:FindFirstChild('ItemShopV3', true)}
							task.wait()
						until #guis >= 2 or not FixGUIs.Enabled
		
						if not FixGUIs.Enabled then
							return
						end
					end
		
					local vis = false
					local mouse = Instance.new('ImageLabel')
					mouse.Size = UDim2.fromOffset(20, 20)
					mouse.Visible = false
					mouse.Parent = vape.gui
					FixGUIs:Clean(mouse)
		
					for _, gui in guis do
						if gui then
							for _, v in gui:QueryDescendants('TextButton') do
								local ancestor = v:FindFirstAncestorWhichIsA('ScrollingFrame')
								if not ancestor then
									v.Modal = true
								end
							end
		
							vis = vis or gui.Visible
							FixGUIs:Clean(gui:GetPropertyChangedSignal('Visible'):Connect(function()
								vis = gui.Visible
							end))
						end
					end
		
					FixGUIs:Clean(runService.Heartbeat:Connect(function()
						local location = inputService:GetMouseLocation()
						mouse.Visible = vis
						if mouse.Visible then
							mouse.Position = UDim2.fromOffset(location.X, location.Y)
						end
					end))
				end
			end,
			Tooltip = 'Fix GUI\'s in first person.'
		})
	end,
}

return __require("games/132768098780837 - blockwars/Legit/FixGUIs")
