
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseButton = Instance.new("TextButton")
local Ranks = {
    {Name = "OF-2 Yüzbaşı", Color = Color3.fromRGB(255, 153, 51)},
    {Name = "OF-3 Binbaşı", Color = Color3.fromRGB(255, 153, 51)},
    {Name = "OF-4 Yarbay", Color = Color3.fromRGB(255, 153, 51)},
    {Name = "OF-5 Albay", Color = Color3.fromRGB(255, 153, 51)},
    {Name = "OF-6 Tuğgeneral", Color = Color3.fromRGB(200, 30, 30)},
    {Name = "OF-7 Tümgeneral", Color = Color3.fromRGB(200, 30, 30)},
    {Name = "OF-8 Korgeneral", Color = Color3.fromRGB(200, 30, 30)},
    {Name = "OF-9 Orgeneral", Color = Color3.fromRGB(200, 30, 30)},
}

-- Oyuncu
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Ana GUI ayarları
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.Name = "SahteRutbeGUI"

MainFrame.Size = UDim2.new(0, 250, 0, 350)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Kapatma tuşu
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Parent = MainFrame
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Rütbe butonları
for i, rank in ipairs(Ranks) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Position = UDim2.new(0, 25, 0, 30 * i)
    button.Text = rank.Name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = rank.Color
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = MainFrame

    button.MouseButton1Click:Connect(function()
        -- Gerçek rütbenin yazısını sahte ile değiştir
        local head = player.Character and player.Character:FindFirstChild("Head")
        if head then
            local tag = head:FindFirstChild("Rank") or head:FindFirstChildWhichIsA("BillboardGui")
            if tag then
                for _, v in ipairs(tag:GetDescendants()) do
                    if v:IsA("TextLabel") and string.find(v.Text, "OR") then
                        v.Text = rank.Name
                        v.TextColor3 = rank.Color
                    elseif v:IsA("TextLabel") and v.Text == player.Name then
                        v.TextColor3 = Color3.fromRGB(170, 0, 0) -- İsim rengi koyu kırmızı
                    end
                end
            end
        end
    end)
end