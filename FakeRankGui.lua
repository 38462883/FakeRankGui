--// TA ØsØ Hub - Tam Entegre Rütbe & Takım Paneli
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local SoundSvc = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer

-- Tık sesi
local clickSound = Instance.new("Sound", SoundSvc)
clickSound.SoundId = "rbxassetid://461874213"
clickSound.Volume = 1

-- Rütbe tanımları
local Ranks = {
    ["Of-1 Asteğmen"] = {isimRenk = Color3.fromRGB(255, 165, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-2 Yüzbaşı"] = {isimRenk = Color3.fromRGB(255, 165, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-3 Binbaşı"] = {isimRenk = Color3.fromRGB(255, 165, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-4 Yarbay"] = {isimRenk = Color3.fromRGB(255, 165, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-5 Albay"] = {isimRenk = Color3.fromRGB(255, 165, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-6 Tuğgeneral"] = {isimRenk = Color3.fromRGB(255, 0, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-7 Tümgeneral"] = {isimRenk = Color3.fromRGB(255, 0, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-8 Korgeneral"] = {isimRenk = Color3.fromRGB(255, 0, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
    ["Of-9 Orgeneral"] = {isimRenk = Color3.fromRGB(255, 0, 0), rütbeRenk = Color3.fromRGB(255, 255, 255)},
}

-- Takım tanımları
local Teams = {
    ["Jandarma"] = Color3.fromRGB(0, 0, 139),
    ["Sınır Müfettişleri"] = Color3.fromRGB(128, 128, 128),
    ["Askeri İnzibat"] = Color3.fromRGB(0, 0, 0),
    ["Ordu Subayları"] = Color3.fromRGB(255, 0, 0),
}

-- Eski GUI'yi kaldır
if LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("TAOsO_Hub") then
    LocalPlayer.PlayerGui.TAOsO_Hub:Destroy()
end

-- Ana GUI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
ScreenGui.Name = "TAOsO_Hub"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 360)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", MainFrame)
stroke.Color = Color3.fromRGB(80, 80, 80)
stroke.Thickness = 1.5

-- Başlık
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "TA ØsØ Hub – Rütbe & Takımlar"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Rütbe Bölümü başlığı
local RankTitle = Instance.new("TextLabel", MainFrame)
RankTitle.Size = UDim2.new(1, 0, 0, 25)
RankTitle.Position = UDim2.new(0, 0, 0, 50)
RankTitle.BackgroundTransparency = 1
RankTitle.Text = "Rütbeler"
RankTitle.Font = Enum.Font.GothamSemibold
RankTitle.TextSize = 16
RankTitle.TextColor3 = Color3.fromRGB(200, 200, 200)

-- Rütbe butonları container
local RankContainer = Instance.new("Frame", MainFrame)
RankContainer.Size = UDim2.new(1, -20, 0, 180)
RankContainer.Position = UDim2.new(0, 10, 0, 80)
RankContainer.BackgroundTransparency = 1

local rankList = Instance.new("UIListLayout", RankContainer)
rankList.Padding = UDim.new(0, 4)
rankList.SortOrder = Enum.SortOrder.LayoutOrder

-- Rütbe buton fonksiyonu
for rankName, colors in pairs(Ranks) do
    local btn = Instance.new("TextButton", RankContainer)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.AutoButtonColor = true
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Text = rankName
    btn.TextColor3 = colors.rütbeRenk
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function()
        clickSound:Play()
        getgenv().Fake = getgenv().Fake or {}
        getgenv().Fake.Rank = rankName
        getgenv().Fake.RankColor = colors.rütbeRenk
        getgenv().Fake.NameColor = colors.isimRenk
    end)
end

-- Takımlar Bölümü başlığı
local TeamTitle = Instance.new("TextLabel", MainFrame)
TeamTitle.Size = UDim2.new(1, 0, 0, 25)
TeamTitle.Position = UDim2.new(0, 0, 0, 270)
TeamTitle.BackgroundTransparency = 1
TeamTitle.Text = "Takımlar"
TeamTitle.Font = Enum.Font.GothamSemibold
TeamTitle.TextSize = 16
TeamTitle.TextColor3 = Color3.fromRGB(200, 200, 200)

-- Takım butonları container
local TeamContainer = Instance.new("Frame", MainFrame)
TeamContainer.Size = UDim2.new(1, -20, 0, 70)
TeamContainer.Position = UDim2.new(0, 10, 0, 300)
TeamContainer.BackgroundTransparency = 1

local teamList = Instance.new("UIGridLayout", TeamContainer)
teamList.CellSize = UDim2.new(0, 180, 0, 30)
teamList.CellPadding = UDim2.new(0, 10, 0, 10)

-- Takım buton fonksiyonu
for teamName, teamColor in pairs(Teams) do
    local btn = Instance.new("TextButton", TeamContainer)
    btn.Size = UDim2.new(0, 180, 0, 30)
    btn.BackgroundColor3 = teamColor
    btn.AutoButtonColor = true
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Text = teamName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function()
        clickSound:Play()
        getgenv().Fake = getgenv().Fake or {}
        getgenv().Fake.Team = teamName
        getgenv().Fake.TeamColor = teamColor
    end)
end
