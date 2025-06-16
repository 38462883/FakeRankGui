local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "FakeRankGui"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

local Close = Instance.new("TextButton", MainFrame)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -30, 0, 5)
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -35, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "TaØsØ Hub - Rütbe Paneli"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Rütbeler sıralı
local rankList = {
    {name = "OF-2 Yüzbaşı", color = Color3.fromRGB(255, 165, 0)},
    {name = "OF-3 Binbaşı", color = Color3.fromRGB(255, 165, 0)},
    {name = "OF-4 Yarbay", color = Color3.fromRGB(255, 165, 0)},
    {name = "OF-5 Albay", color = Color3.fromRGB(255, 165, 0)},
    {name = "OF-6 Tuğgeneral", color = Color3.fromRGB(200, 50, 50)},
    {name = "OF-7 Tümgeneral", color = Color3.fromRGB(200, 50, 50)},
    {name = "OF-8 Korgeneral", color = Color3.fromRGB(200, 50, 50)},
    {name = "OF-9 Orgeneral", color = Color3.fromRGB(200, 50, 50)}
}

local ButtonHolder = Instance.new("Frame", MainFrame)
ButtonHolder.Size = UDim2.new(1, -20, 1, -60)
ButtonHolder.Position = UDim2.new(0, 10, 0, 40)
ButtonHolder.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", ButtonHolder)
layout.Padding = UDim.new(0, 4)
layout.SortOrder = Enum.SortOrder.LayoutOrder

for _, info in ipairs(rankList) do
	local Button = Instance.new("TextButton", ButtonHolder)
	Button.Size = UDim2.new(1, 0, 0, 25)
	Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Button.Text = info.name
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 14

	Button.MouseButton1Click:Connect(function()
		-- DisplayName client tarafından değiştirilemez, bu yüzden sadece renk ve mesajla göster
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
			local tag = LocalPlayer.Character.Head:FindFirstChild("NameTag")
			if tag and tag:IsA("TextLabel") then
				tag.TextColor3 = info.color
			end
		end
	end)

	local btnCorner = Instance.new("UICorner", Button)
	btnCorner.CornerRadius = UDim.new(0, 4)
end