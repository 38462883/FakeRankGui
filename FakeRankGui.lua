-- TAØSØ Hub | Rütbe GUI
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI varsa kaldır
if player.PlayerGui:FindFirstChild("TAOSOGui") then
    player.PlayerGui:FindFirstChild("TAOSOGui"):Destroy()
end

-- Ana GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TAOSOGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Ana Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- UICorner (Köşeleri yumuşat)
local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "TAØSØ Rütbe Paneli"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = mainFrame

-- UIListLayout
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 6)
layout.FillDirection = Enum.FillDirection.Vertical
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = mainFrame

-- Rütbeler
local ranks = {
    ["OF-2"] = {"Yüzbaşı", Color3.fromRGB(255, 165, 0)}, -- Turuncu
    ["OF-3"] = {"Binbaşı", Color3.fromRGB(255, 165, 0)},
    ["OF-4"] = {"Yarbay",  Color3.fromRGB(255, 165, 0)},
    ["OF-5"] = {"Albay",   Color3.fromRGB(255, 165, 0)},
    ["OF-6"] = {"Tuğgeneral", Color3.fromRGB(200, 50, 50)}, -- Kırmızı
    ["OF-7"] = {"Tümgeneral", Color3.fromRGB(200, 50, 50)},
    ["OF-8"] = {"Korgeneral", Color3.fromRGB(200, 50, 50)},
    ["OF-9"] = {"Orgeneral",  Color3.fromRGB(200, 50, 50)},
}

-- Fonksiyon: Rütbe Ekle
local function addRankButton(code, name, nameColor)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.Text = code .. " - " .. name
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.TextColor3 = nameColor
    btn.Parent = mainFrame

    btn.MouseButton1Click:Connect(function()
        -- İsim rengini değiştir
        player.CharacterAppearanceLoaded:Wait()
        local nameGui = player:FindFirstChild("NameDisplay")
        if not nameGui then
            nameGui = Instance.new("BillboardGui", player)
            nameGui.Name = "NameDisplay"
            nameGui.Size = UDim2.new(0, 200, 0, 50)
            nameGui.AlwaysOnTop = false
            nameGui.StudsOffset = Vector3.new(0, 3, 0)
            nameGui.Adornee = player.Character:WaitForChild("Head")
            local nameLabel = Instance.new("TextLabel", nameGui)
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = player.Name .. " - " .. code
            nameLabel.TextColor3 = nameColor
            nameLabel.TextScaled = true
            nameLabel.Font = Enum.Font.GothamBold
        end
    end)
end

-- Rütbe butonlarını ekle
for code, data in pairs(ranks) do
    local name = data[1]
    local color = data[2]
    addRankButton(code, name, color)
end