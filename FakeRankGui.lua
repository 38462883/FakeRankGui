-- == Güzel Görsel Butonlu Sahte Rütbe Script ==

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI ve ana çerçeve
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FakeRankGui"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 260, 0, 380)
frame.Position = UDim2.new(0.5, -130, 0.5, -190)
frame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Kapatma butonu
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -32, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.BorderSizePixel = 0
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Rütbe bilgileri
local RANKS = {
	{ "OF-2 Yüzbaşı", Color3.new(1, .6, .2) },
	{ "OF-3 Binbaşı", Color3.new(1, .6, .2) },
	{ "OF-4 Yarbay", Color3.new(1, .6, .2) },
	{ "OF-5 Albay", Color3.new(1, .6, .2) },
	{ "OF-6 Tuğgeneral", Color3.new(.8, .15, .15) },
	{ "OF-7 Tümgeneral", Color3.new(.8, .15, .15) },
	{ "OF-8 Korgeneral", Color3.new(.8, .15, .15) },
	{ "OF-9 Orgeneral", Color3.new(.8, .15, .15) },
}

-- Butonlar alanı
local uiList = Instance.new("UIListLayout", frame)
uiList.Padding = UDim.new(0, 8)
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiList.VerticalAlignment = Enum.VerticalAlignment.Top

-- Buton oluşturma
for i, data in ipairs(RANKS) do
	local rankName, rankColor = data[1], data[2]

	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0, 220, 0, 40)
	btn.BackgroundColor3 = rankColor
	btn.Text = rankName
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.AutoButtonColor = true
	btn.BorderSizePixel = 0
	btn.Position = UDim2.new(0, 20, 0, (i-1)*48 + 60)

	local shadow = Instance.new("UICorner", btn)
	shadow.CornerRadius = UDim.new(0, 10)

	btn.MouseButton1Click:Connect(function()
		local char = player.Character or player.CharacterAdded:Wait()
		local head = char:FindFirstChild("Head")

		if head then
			-- Mevcut rütbe yazısını sil (TextLabel “OR-” içeriyorsa)
			for _, gui in pairs(head:GetChildren()) do
				if gui:IsA("BillboardGui") then
					for _, obj in ipairs(gui:GetDescendants()) do
						if obj:IsA("TextLabel") and string.sub(obj.Text,1,2) == "OR" then
							obj.Text = rankName            -- yeni sahte rütbe
							obj.TextColor3 = Color3.new(0.9,0.9,0.9) -- Uzman Onbaşı renk tonu
						elseif obj:IsA("TextLabel") and obj.Text == player.Name then
							obj.TextColor3 = (i <= 4) and Color3.new(1, .6, .2) or Color3.new(.6, 0, 0)
						end
					end
				end
			end
		end
	end)
end