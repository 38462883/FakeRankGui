local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI oluştur
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FakeRankGui"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 280, 0, 320)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Başlık
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -40, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "TaØsØ Hub - Rütbe Paneli"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Scrollable alan
local ScrollFrame = Instance.new("ScrollingFrame", MainFrame)
ScrollFrame.Position = UDim2.new(0, 10, 0, 40)
ScrollFrame.Size = UDim2.new(1, -20, 1, -50)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local Layout = Instance.new("UIListLayout", ScrollFrame)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 4)

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

-- Rütbe butonları
for rank, color in pairs(ranks) do
	local Button = Instance.new("TextButton", ScrollFrame)
	Button.Size = UDim2.new(1, 0, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Button.Text = rank
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.AutoButtonColor = true

	Button.MouseButton1Click:Connect(function()
		LocalPlayer.NameDisplayDistance = 100
		LocalPlayer.DisplayName = rank
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") and LocalPlayer.Character.Head:FindFirstChild("NameTag") then
			LocalPlayer.Character.Head.NameTag.TextColor3 = color
		end
	end)

	local btnCorner = Instance.new("UICorner", Button)
	btnCorner.CornerRadius = UDim.new(0, 6)
end