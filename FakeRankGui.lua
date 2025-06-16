local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI oluştur
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FakeRankGui"

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 250, 0, 340)
MainFrame.Position = UDim2.new(1, -270, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 6)

-- Başlık
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -35, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "TaØsØ Hub - Rütbe Paneli"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Kapatma butonu
local Close = Instance.new("TextButton", MainFrame)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -30, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local CloseCorner = Instance.new("UICorner", Close)
CloseCorner.CornerRadius = UDim.new(0, 4)

-- Rütbeler ve renkleri (sıralı şekilde)
local ranks = {
    {"OF-2 Yüzbaşı", Color3.fromRGB(255, 165, 0)},
    {"OF-3 Binbaşı", Color3.fromRGB(255, 165, 0)},
    {"OF-4 Yarbay", Color3.fromRGB(255, 165, 0)},
    {"OF-5 Albay", Color3.fromRGB(255, 165, 0)},
    {"OF-6 Tuğgeneral", Color3.fromRGB(200, 50, 50)},
    {"OF-7 Tümgeneral", Color3.fromRGB(200, 50, 50)},
    {"OF-8 Korgeneral", Color3.fromRGB(200, 50, 50)},
    {"OF-9 Orgeneral", Color3.fromRGB(200, 50, 50)}
}

-- Rütbe butonları container
local ButtonHolder = Instance.new("Frame", MainFrame)
ButtonHolder.Position = UDim2.new(0, 10, 0, 40)
ButtonHolder.Size = UDim2.new(1, -20, 1, -50)
ButtonHolder.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", ButtonHolder)
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Rütbe butonları
for _, data in ipairs(ranks) do
	local rank, color = unpack(data)
	local Button = Instance.new("TextButton", ButtonHolder)
	Button.Size = UDim2.new(1, 0, 0, 30)
	Button.BackgroundColor3 = color
	Button.Text = rank
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14
	Button.MouseButton1Click:Connect(function()
		LocalPlayer.DisplayName = rank
	end)

	local btnCorner = Instance.new("UICorner", Button)
	btnCorner.CornerRadius = UDim.new(0, 4)
end