-- TAØsØ Hub - 
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TAØsØHub"
gui.ResetOnSpawn = false

-- Drag Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 500)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- UI Corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = mainFrame

-- Başlık
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "TAØsØ Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1
title.Parent = mainFrame

-- Click Sound
local clickSound = Instance.new("Sound", gui)
clickSound.SoundId = "rbxassetid://12221967" -- Basit click sesi
clickSound.Volume = 0.5

-- Fonksiyon: Buton Oluştur
function createButton(name, yPos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.Text = name
    btn.TextScaled = true
    btn.AutoButtonColor = true
    btn.Parent = mainFrame
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(function()
        clickSound:Play()
        callback()
    end)
end

-- Rütbe Sistemi (Basit örnek)
local ranks = {
    ["OF-2 Yüzbaşı"] = Color3.fromRGB(255, 170, 0),
    ["OF-3 Binbaşı"] = Color3.fromRGB(255, 170, 0),
    ["OF-4 Yarbay"] = Color3.fromRGB(255, 170, 0),
    ["OF-5 Albay"] = Color3.fromRGB(255, 170, 0),
    ["OF-6 Tuğgeneral"] = Color3.fromRGB(255, 0, 0),
    ["OF-7 Tümgeneral"] = Color3.fromRGB(220, 0, 0),
    ["OF-8 Korgeneral"] = Color3.fromRGB(200, 0, 0),
    ["OF-9 Orgeneral"] = Color3.fromRGB(180, 0, 0)
}

-- Rütbe Seçimi
local yOffset = 60
for name, color in pairs(ranks) do
    createButton(name, yOffset, function()
        local tag = player:FindFirstChild("FakeRank")
        if tag then tag:Destroy() end
        local newTag = Instance.new("StringValue", player)
        newTag.Name = "FakeRank"
        newTag.Value = name
        -- Tag göstermek için
        player.DisplayName = "<font color=\"rgb("..math.floor(color.R*255)..","..math.floor(color.G*255)..","..math.floor(color.B*255)..")\">["..name.."]</font> "..player.Name
    end)
    yOffset += 45
end

-- Takım Sistemi
local teams = {
    "Ordu subayları",
    "Askeri İnzibat",
    "Kara Kuvvetleri",
    "Hava Kuvvetleri",
    "Jandarma"
}
for _, team in ipairs(teams) do
    createButton("Takım: "..team, yOffset, function()
        print("Takım değiştir: "..team)
    end)
    yOffset += 45
end

-- Tema Seçici
createButton("🌗 Tema: Açık / Koyu", yOffset, function()
    mainFrame.BackgroundColor3 = mainFrame.BackgroundColor3 == Color3.fromRGB(25,25,25)
        and Color3.fromRGB(240,240,240) or Color3.fromRGB(25,25,25)
end)
yOffset += 45

-- Dil Seçimi
createButton("🌐 Dili Değiştir (TR/EN)", yOffset, function()
    print("Dil seçimi yapıldı.")
end)
yOffset += 45

-- Müzik Seçici
local musicLinks = {
    ["Ceddin Deden"] = "rbxassetid://1837635126",
    ["Mehter Phonk"] = "rbxassetid://8972110996",
    ["Sürpriz Parça"] = "rbxassetid://1843527082"
}
for name, id in pairs(musicLinks) do
    createButton("🎵 "..name, yOffset, function()
        local music = gui:FindFirstChild("Music") or Instance.new("Sound", gui)
        music.Name = "Music"
        music.SoundId = id
        music.Looped = true
        music.Volume = 0.4
        music:Play()
    end)
    yOffset += 45
end

-- GUI Kapatma Tuşu
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Parent = mainFrame
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
Instance.new("UICorner", closeBtn)

-- Giriş Animasyonu
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame:TweenSize(UDim2.new(0, 420, 0, 500), "Out", "Bounce", 1.2)

-- Profil Kartı ve Yapay Zeka, kullanıcı ayarı sistemleri temel yapıda eklenebilir.
-- Daha fazla fonksiyon için bölümlere ayrılı script yapılması önerilir.