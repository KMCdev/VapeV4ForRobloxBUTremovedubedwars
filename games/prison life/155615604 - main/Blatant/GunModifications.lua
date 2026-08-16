-- Bundled by luau-bundler
-- Entry: games/prison life/155615604 - main/Blatant/GunModifications.lua

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
	["games/prison life/155615604 - main/Blatant/GunModifications"] = function()
		local GunModifications
		local Spread
		local FireRate
		local Automatic
		local olddata, old = {}
		local oldhook
		
		local function Modify()
			local data = debug.getupvalue(oldshoot or pl.Shoot, 10)
			if data and GunModifications.Enabled then
				if old ~= data then
					olddata = table.clone(data)
					old = data
				end
		
				data.SpreadRadius = Spread.Enabled and 0 or olddata.SpreadRadius
				data.FireRate = (olddata.FireRate or 0) * (FireRate.Value / 100)
				data.AutoFire = Automatic.Enabled or olddata.AutoFire
			end
		end
		
		
		GunModifications = vape.Categories.Blatant:CreateModule({
			Name = 'GunModifications',
			Function = function(callback)
				if callback then
					oldequip = hookfunction(pl.Equip, function(...)
						local res = table.pack(oldequip(...))
						Modify()
						return unpack(res, 1, res.n)
					end)
		
					Modify()
				else
					if oldequip then
						if restorefunction then
							restorefunction(pl.Equip)
						else
							oldequip = nil
						end
					end
		
					if old then
						for i, v in olddata do
							old[i] = v
						end
						table.clear(olddata)
						old = nil
					end
				end
			end,
			Tooltip = 'Apply various modifications to enhance any firearm'
		})
		FireRate = GunModifications:CreateSlider({
			Name = 'FireRate Multiplier',
			Min = 1,
			Max = 100,
			Default = 100,
			Suffix = '%',
			Function = Modify
		})
		Spread = GunModifications:CreateToggle({
			Name = 'No Spread',
			Function = Modify
		})
		Automatic = GunModifications:CreateToggle({
			Name = 'Full Automatic',
			Function = Modify
		})
	end,
}

return __require("games/prison life/155615604 - main/Blatant/GunModifications")
