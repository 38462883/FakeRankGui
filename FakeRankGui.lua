local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI oluştur
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FakeRankGui"
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 230)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -115)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- UICorner
local corner = Instance.new("UICorner", MainFrame)
corner.CornerRadius = UDim.new(0, 8)

-- Kapat butonu
local Close = Instance.new("TextButton", MainFrame)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -30, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255,255,255)
Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Başlık
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -35, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "TaØsØ Hub - Rütbe Paneli"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Rütbeler ve renkleri
local ranks = {
    ["OF-2 Yüzbaşı"] = Color3.fromRGB(255, 165, 0),
    ["OF-3 Binbaşı"] = Color3.fromRGB(255, 165, 0),
    ["OF-4 Yarbay"] = Color3.fromRGB(255, 165, 0),
    ["OF-5 Albay"] = Color3.fromRGB(255, 165, 0),
    ["OF-6 Tuğgeneral"] = Color3.fromRGB(200, 50, 50),
    ["OF-7 Tümgeneral"] = Color3.fromRGB(200, 50, 50),
    ["OF-8 Korgeneral"] = Color3.fromRGB(200, 50, 50),
    ["OF-9 Orgeneral"] = Color3.fromRGB(200, 50, 50)
}

-- UIListLayout
local Layout = Instance.new("UIListLayout")
Layout.Parent = MainFrame
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 4)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.VerticalAlignment = Enum.VerticalAlignment.Top
Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	MainFrame.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y)
end)

-- Rütbe butonları
for rank, color in pairs(ranks) do
	local Button = Instance.new("TextButton", MainFrame)
	Button.Size = UDim2.new(1, -20, 0, 25)
	Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Button.Text = rank
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.MouseButton1Click:Connect(function()
		LocalPlayer.NameDisplayDistance = 100
		LocalPlayer.DisplayName = rank
		LocalPlayer.Character.Head.NameTag.TextColor3 = color
	end)

	local btnCorner = Instance.new("UICorner", Button)
	btnCorner.CornerRadius = UDim.new(0, 4)
end