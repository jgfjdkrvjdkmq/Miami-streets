-- Money System - Miami Streets Style
-- Coloca este script en ServerScriptService

local DataStoreService = game:GetService("DataStoreService")
local MoneyStore = DataStoreService:GetDataStore("PlayerMoneyV1")

game.Players.PlayerAdded:Connect(function(player)
	-- Leaderstats
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local money = Instance.new("IntValue")
	money.Name = "Dinero"
	money.Value = 1000 -- Dinero inicial
	money.Parent = leaderstats

	-- Cargar dinero
	local success, savedMoney = pcall(function()
		return MoneyStore:GetAsync(player.UserId)
	end)

	if success and savedMoney then
		money.Value = savedMoney
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	-- Guardar dinero
	local money = player.leaderstats.Dinero.Value

	pcall(function()
		MoneyStore:SetAsync(player.UserId, money)
	end)
end)
