local ReplicatedStorage = game:GetService('ReplicatedStorage') 
local remoteEvent = ReplicatedStorage:WaitForChild('BuyTool')
local boostcoast = 50

local function buyItem (player, tool)
    if player.Character:FindFirstChild(tool.Name) then 
    end

    if player.Backpack:FindFirstChild(tool.Name) then
        return
    end

    if player.leaderstats.Coins.Value >= tool.Price.Value then 
        player.leaderstats.Coins.Value -= tool.Price.Value
        local giveTool = ReplicatedStorage.ShopItems[tool.Name]:Clone()
        giveTool.Parent = player.Backpack
    end
end

local function buyBoost (player)
    if player.leaderstats.Coins.Value >= boostcoast then
        local humanoid = player.Character:FindFirstChild('Humanoid')
        if humanoid then
            player.leaderstats.Coins.Value -= boostcoast
            humanoid.UseJumpPower = true
            humanoid.JumpPower += 10
        end
    end
end

local function buyItemOrBoost(player, tool)
    if tool == "boost" then
        buyBoost(player)
    else
    buyItem(player, tool)
    end
end

remoteEvent.OnServerEvent:Connect(buyItemOrBoost)

 

