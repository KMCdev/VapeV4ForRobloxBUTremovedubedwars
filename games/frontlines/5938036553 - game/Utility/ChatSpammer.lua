-- Bundled by luau-bundler
-- Entry: games/frontlines/5938036553 - game/Utility/ChatSpammer.lua

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
	["games/frontlines/5938036553 - game/Utility/ChatSpammer"] = function()
		local ChatSpammer
		local Lines
		local Mode
		local Delay
		local Hide
		local oldchat
		
		ChatSpammer = vape.Categories.Utility:CreateModule({
			Name = 'ChatSpammer',
			Function = function(callback)
				if callback then
					local ind = 1
					repeat
						local message = (#Lines.ListEnabled > 0 and Lines.ListEnabled[math.random(1, #Lines.ListEnabled)] or 'vxpe on top')
						if Mode.Value == 'Order' and #Lines.ListEnabled > 0 then
							message = Lines.ListEnabled[ind] or Lines.ListEnabled[1]
							ind += 1
							if ind > #Lines.ListEnabled then 
								ind = 1 
							end
						end
						frontlines.Main.utils.net_msg_util.c_prep_net_msg(frontlines.Main.globals.null_net_msg_state, frontlines.Main.enums.c_net_msg.CHAT, message:sub(1, 100))
						task.wait(1)
					until not ChatSpammer.Enabled
				end
			end,
			Tooltip = 'Automatically types in chat'
		})
		Lines = ChatSpammer:CreateTextList({Name = 'Lines'})
		Mode = ChatSpammer:CreateDropdown({
			Name = 'Mode',
			List = {'Random', 'Order'}
		})
	end,
}

return __require("games/frontlines/5938036553 - game/Utility/ChatSpammer")
