-- Bundled by luau-bundler
-- Entry: games/frontlines/5938036553 - game/Blatant/Phase.lua

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
	["games/frontlines/5938036553 - game/Blatant/Phase"] = function()
		local Phase
		
		Phase = vape.Categories.Blatant:CreateModule({
			Name = 'Phase',
			Function = function(callback)
				if callback then
					Phase:Clean(entitylib.Events.LocalAdded:Connect(function()
						local root = frontlines.Main.globals.fpv_sol_instances.root
						if root then
							root.CanCollide = false
						end
					end))
		
					local root = frontlines.Main.globals.fpv_sol_instances.root
					if root then
						root.CanCollide = false
					end
				else
					local root = frontlines.Main.globals.fpv_sol_instances.root
					if root then
						root.CanCollide = true
					end
				end
			end,
			Tooltip = 'Lets you Phase/Clip through walls.'
		})
	end,
}

return __require("games/frontlines/5938036553 - game/Blatant/Phase")
