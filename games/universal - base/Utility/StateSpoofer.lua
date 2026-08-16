-- Bundled by luau-bundler
-- Entry: games/universal - base/Utility/StateSpoofer.lua

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
	["games/universal - base/Utility/StateSpoofer"] = function()
		local StateSpoofer
		local State
		local hook
		
		StateSpoofer = vape.Categories.Utility:CreateModule({
			Name = 'StateSpoofer',
			Function = function(callback)
				if callback then
					if not rakNetCheck('StateSpoofer') then
						StateSpoofer:Toggle()
						return
					end
		
					hook = function(packet)
						if packet.AsArray[1] == 0x1b then
							local data = packet.AsBuffer
							buffer.writeu8(data, 25, Enum.HumanoidStateType[State.Value].Value + 32)
							packet:SetData(data)
						end
					end
		
					raknet.add_send_hook(hook)
				elseif hook then
					raknet.remove_send_hook(hook)
					hook = nil
				end
			end,
			Tooltip = 'Spoof humanoid states on the server.'
		})
		local states = {}
		for _, v in Enum.HumanoidStateType:GetEnumItems() do
			if v.Name ~= 'None' then
				table.insert(states, v.Name)
			end
		end
		State = StateSpoofer:CreateDropdown({
			Name = 'Humanoid State',
			List = states
		})
	end,
}

return __require("games/universal - base/Utility/StateSpoofer")
