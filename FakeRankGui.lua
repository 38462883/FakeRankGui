

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Ana GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FakeRankGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Ana Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 450)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

-- Kapatma Butonu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Parent = mainFrame
closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Dikey Buton Dizilimi
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = mainFrame
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Rütbeler
local ranks = {
	{Title = "OF-2 Yüzbaşı", Color = Color3.fromRGB(255, 170, 0)},
	{Title = "OF-3 Binbaşı", Color = Color3.fromRGB(255, 170, 0)},
	{Title = "OF-4 Yarbay", Color = Color3.fromRGB(255, 170, 0)},
	{Title = "OF-5 Albay", Color = Color3.fromRGB(255, 170, 0)},
	{Title = "OF-6 Tuğgeneral", Color = Color3.fromRGB(255, 50, 50)},
	{Title = "OF-7 Tümgeneral", Color = Color3.fromRGB(255, 50, 50)},
	{Title = "OF-8 Korgeneral", Color = Color3.fromRGB(255, 50, 50)},
	{Title = "OF-9 Orgeneral", Color = Color3.fromRGB(255, 50, 50)},
}

-- Rütbe Uygulama Fonksiyonu
local function applyRank(text, color)
	local char = player.Character or player.CharacterAdded:Wait()
	local head = char:WaitForChild("Head")
	local existing = head:FindFirstChild("RankTag")
	if existing then existing:Destroy() end

	local billboard = Instance.new("BillboardGui", head)
	billboard.Name = "RankTag"
	billboard.Size = UDim2.new(0, 200, 0, 40)
	billboard.StudsOffset = Vector3.new(0, 2.5, 0)
	billboard.AlwaysOnTop = true

	local label = Instance.new("TextLabel", billboard)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = text
	label.TextColor3 = color
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
end

-- Butonları Oluştur
for _, r in pairs(ranks) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Text = r.Title
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = r.Color
	btn.Font = Enum.Font.Gotham
	btn.TextScaled = true
	btn.BorderSizePixel = 0
	btn.Parent = mainFrame
	btn.MouseButton1Click:Connect(function()
		applyRank(r.Title, r.Color)
	end)
end