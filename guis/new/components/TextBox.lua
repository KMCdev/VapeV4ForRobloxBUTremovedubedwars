-- Bundled by luau-bundler
-- Entry: guis/new/components/TextBox.lua

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
	["guis/new/components/TextBox"] = function()
		local optionapi = {
			Type = 'TextBox',
			Value = optionsettings.Default or '',
			Index = 0
		}
		
		local textbox = Instance.new('TextButton')
		textbox.Name = optionsettings.Name..'TextBox'
		textbox.Size = UDim2.new(1, 0, 0, 58)
		textbox.BackgroundColor3 = color.Dark(children.BackgroundColor3, optionsettings.Darker and 0.02 or 0)
		textbox.BorderSizePixel = 0
		textbox.AutoButtonColor = false
		textbox.Visible = optionsettings.Visible == nil or optionsettings.Visible
		textbox.Text = ''
		textbox.Parent = children
		addTooltip(textbox, optionsettings.Tooltip)
		local title = Instance.new('TextLabel')
		title.Size = UDim2.new(1, -10, 0, 20)
		title.Position = UDim2.fromOffset(10, 3)
		title.BackgroundTransparency = 1
		title.Text = optionsettings.Name
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.TextColor3 = uipallet.Text
		title.TextSize = 12
		title.FontFace = uipallet.Font
		title.Parent = textbox
		local bkg = Instance.new('Frame')
		bkg.Name = 'BKG'
		bkg.Size = UDim2.new(1, -20, 0, 29)
		bkg.Position = UDim2.fromOffset(10, 23)
		bkg.BackgroundColor3 = color.Light(uipallet.Main, 0.02)
		bkg.Parent = textbox
		addCorner(bkg, UDim.new(0, 4))
		local box = Instance.new('TextBox')
		box.Size = UDim2.new(1, -8, 1, 0)
		box.Position = UDim2.fromOffset(8, 0)
		box.BackgroundTransparency = 1
		box.Text = optionsettings.Default or ''
		box.PlaceholderText = optionsettings.Placeholder or 'Click to set'
		box.TextXAlignment = Enum.TextXAlignment.Left
		box.TextColor3 = color.Dark(uipallet.Text, 0.16)
		box.PlaceholderColor3 = color.Dark(uipallet.Text, 0.31)
		box.TextSize = 12
		box.FontFace = uipallet.Font
		box.ClearTextOnFocus = false
		box.Parent = bkg
		optionsettings.Function = optionsettings.Function or function() end
		
		function optionapi:Save(tab)
			tab[optionsettings.Name] = {Value = self.Value}
		end
		
		function optionapi:Load(tab)
			if self.Value ~= tab.Value then
				self:SetValue(tab.Value)
			end
		end
		
		function optionapi:SetValue(val, enter)
			self.Value = val
			box.Text = val
			optionsettings.Function(enter)
		end
		
		textbox.MouseButton1Click:Connect(function()
			box:CaptureFocus()
		end)
		box.FocusLost:Connect(function(enter)
			optionapi:SetValue(box.Text, enter)
		end)
		box:GetPropertyChangedSignal('Text'):Connect(function()
			optionapi:SetValue(box.Text)
		end)
		
		optionapi.Object = textbox
		api.Options[optionsettings.Name] = optionapi
		
		return optionapi
	end,
}

return __require("guis/new/components/TextBox")
