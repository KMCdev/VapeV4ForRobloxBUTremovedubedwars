-- Bundled by luau-bundler
-- Entry: games/skywars voxel/8542259458 - skywars lobby.lua

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
	["games/skywars voxel/8542259458 - skywars lobby"] = function()
		local run = function(func) 
			func() 
		end
		local cloneref = cloneref or function(obj) 
			return obj 
		end
		local playersService = cloneref(game:GetService('Players'))
		local inputService = cloneref(game:GetService('UserInputService'))
		local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
		local collectionService = cloneref(game:GetService('CollectionService'))
		local httpService = cloneref(game:GetService('HttpService'))
		local coreGui = cloneref(game:GetService('CoreGui'))
		local gameCamera = workspace.CurrentCamera
		local lplr = playersService.LocalPlayer
		
		local vape = shared.vape
		local sessioninfo = vape.Libraries.sessioninfo
		
		run(function()
			local kills = sessioninfo:AddItem('Kills')
			local eggs = sessioninfo:AddItem('Eggs')
			local wins = sessioninfo:AddItem('Wins')
			local games = sessioninfo:AddItem('Games')
		end)
	end,
}

return __require("games/skywars voxel/8542259458 - skywars lobby")
