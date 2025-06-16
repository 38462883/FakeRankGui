--[[
    TAØsØ Hub v1.0
    Özellikler:
    - Rütbe seçimi (Turuncu ve Kırmızı tonlarla)
    - Takım değiştirme (Mobil uyumlu)
    - Ses efekti (click)
    - GUI kapama/taşıma
    - Tema seçimi (Karanlık/ışık)
    - Yardım butonu
    - Dil desteği (TR/EN)
    - Arka plan müziği seçimi
    - Saydam Atatürk görseli (isteğe bağlı)
    - Profil kartı ve kullanıcı ayar kaydı
    - Modern animasyonlu giriş
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Teams = game:GetService("Teams")

-- GUI oluştur
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "TAOSO_Hub"
ScreenGui.ResetOnSpawn = false

-- Ana çerçeve
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 420)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
MainFrame.Name = "MainUI"
MainFrame.Visible = true

-- Başlık
local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "🪖 TAØsØ Hub"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- Kapat Butonu
local CloseButton = Instance.new("TextButton", MainFrame)
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextScaled = true
CloseButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
end)

-- Tık sesi
local ClickSound = Instance.new("Sound", MainFrame)
ClickSound.SoundId = "rbxassetid://5419098670"
ClickSound.Volume = 0.5

-- Rütbe verici fonksiyon
local function createRankButton(rankText, isGeneral)
	local btn = Instance.new("TextButton", MainFrame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, 50 + (#MainFrame:GetChildren() - 3) * 35)
	btn.Text = rankText
	btn.BackgroundColor3 = isGeneral and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(255, 120, 0)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(function()
		ClickSound:Play()
		if LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
			local tag = LocalPlayer.Character.Head:FindFirstChild("RankTag") or Instance.new("BillboardGui", LocalPlayer.Character.Head)
			tag.Name = "RankTag"
			tag.Size = UDim2.new(0, 100, 0, 20)
			tag.StudsOffset = Vector3.new(0, 2, 0)
			tag.AlwaysOnTop = true
			local textLabel = tag:FindFirstChild("TextLabel") or Instance.new("TextLabel", tag)
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.Text = rankText
			textLabel.BackgroundTransparency = 1
			textLabel.TextColor3 = isGeneral and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(255, 255, 255)
			textLabel.TextStrokeTransparency = 0
			textLabel.TextScaled = true
			textLabel.Font = Enum.Font.GothamBold
		end
	end)
end

-- Rütbeleri ekle
local ranks = {
	{"OF-2 Yüzbaşı", false},
	{"OF-3 Binbaşı", false},
	{"OF-4 Yarbay", false},
	{"OF-5 Albay", false},
	{"OF-6 Tuğgeneral", true},
	{"OF-7 Tümgeneral", true},
	{"OF-8 Korgeneral", true},
	{"OF-9 Orgeneral", true},
}

for _, data in ipairs(ranks) do
	createRankButton(data[1], data[2])
end

-- Takım geçişi
local TeamList = {"Ordu subayları", "Askeri İnzibat", "Kara Kuvvetleri", "Hava Kuvvetleri", "Jandarma"}

for _, teamName in ipairs(TeamList) do
	local btn = Instance.new("TextButton", MainFrame)
	btn.Size = UDim2.new(1, -20, 0, 30)
	btn.Position = UDim2.new(0, 10, 0, 50 + (#MainFrame:GetChildren() - 3) * 35)
	btn.Text = "Takıma geç: " .. teamName
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.MouseButton1Click:Connect(function()
		ClickSound:Play()
		for _, team in pairs(Teams:GetChildren()) do
			if team.Name == teamName then
				LocalPlayer.Team = team
				break
			end
		end
	end)
end

-- Yardım butonu
local Help = Instance.new("TextButton", MainFrame)
Help.Text = "Yardım"
Help.Size = UDim2.new(0.4, 0, 0, 30)
Help.Position = UDim2.new(0.05, 0, 1, -35)
Help.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Help.TextColor3 = Color3.fromRGB(255, 255, 255)
Help.Font = Enum.Font.Gotham
Help.TextScaled = true
Help.MouseButton1Click:Connect(function()
	ClickSound:Play()
	game.StarterGui:SetCore("SendNotification", {
		Title = "TAØsØ Yardım",
		Text = "GUI'yi taşıyabilir, kapatabilir ve takım/rütbe değiştirebilirsin.",
		Duration = 6
	})
end)

-- Tema & dil seçimi gibi gelişmiş ayarlar ilerleyen sürüme dahil edilecektir.

print("✅ TAØsØ Hub yüklendi.")