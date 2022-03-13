-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/hoodsense-ui-library.lua"))()
local venyx = library.new("hoodsense.cc", 8768441000)

-- themes
local themes = {
Background = Color3.fromRGB(0, 0, 14),
Glow = Color3.fromRGB(45, 255, 46),
Accent = Color3.fromRGB(0, 44, 3),
LightContrast = Color3.fromRGB(0, 44, 3),
DarkContrast = Color3.fromRGB(0, 30, 0),  
TextColor = Color3.fromRGB(255, 255, 255)
}

local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/fov.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/esp.lua"))()
ESP:Toggle(false)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
Aiming.TeamCheck(false)
Aiming.VisibleCheck = false
 
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
 
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera

local DaHoodSettings = {
    SilentAim = false,
    AimLock = false,
    Prediction = 0.178
}

-- Silent Aim Page
local SilentAim = venyx:addPage("Silent Aim", 6061283172)
local section1 = SilentAim:addSection("SilentAim Configuration")
local section2 = SilentAim:addSection("Fov Configuration")

section1:addToggle("Silent Aim", nil, function(bool)
    DaHoodSettings.SilentAim = bool
end)

--[[section1:addToggle("Aimlock", nil, function(bool)
    DaHoodSettings.AimLock = bool
end)]]--

section1:addToggle("Predict Lag", nil, function(bool)
    DaHoodSettings.Prediction.Lag = bool
end)

section1:addToggle("FOV Circle", nil, function(bool)
    Aiming.ShowFOV = bool
end)

section2:addSlider("FOV Circle Size", 0, 0, 400, function(value)
    Aiming.FOV = value
end)

section2:addSlider("Hitchance", 0, 0, 400, function(value)
    DaHoodSettings.Prediction = tonumer("0." .. value)
end)

section1:addToggle("Visible Check", nil, function(bool)
    Aiming.VisibleCheck = bool
end)

section1:addToggle("Hit Airshots", nil, function(bool)
    Aiming.Airshots = true
end)

local Avatars = venyx:addPage("Avatar", 6975539891)
local AvatarMods = Avatars:addSection("Avatar Modifications")

AvatarMods:addButton("Animations", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/anims.lua"))()
end)

AvatarMods:addButton("Headless", function(bool)
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v:Destroy()
end
end
end)

AvatarMods:addButton("Korblox", function(bool)
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.RightLowerLeg.MeshId = "rbxassetid://902942093"
    chr.RightLowerLeg.Transparency = "1"
    chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
    chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
    chr.RightFoot.MeshId = "rbxassetid://902942089"
    chr.RightFoot.Transparency = "1"
end)
 
AvatarMods:addButton("Korblox Left", function(bool)
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.LeftLowerLeg.MeshId = "902942093"
    chr.LeftLowerLeg.Transparency = "1"
    chr.LeftUpperLeg.MeshId = "902942096"
    chr.LeftUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
    chr.LeftFoot.MeshId = "902942089"
    chr.LeftFoot.Transparency = "1"
end)

local BUY = venyx:addPage("Teleports", 5026790538)
local teleport = BUY:addSection("Weapons")
local buy = BUY:addSection("Locations")

teleport:addButton("Revolver", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

teleport:addButton("Ak", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-587.529358, 5.39480686, -753.717712, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

teleport:addButton("Smg", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.123413, 5.47666788, -718.031433, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

teleport:addButton("AR", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-591.824158, 5.46046877, -744.731628, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

teleport:addButton("Double Barrel", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1039.59985, 18.8513641, -256.449951, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

teleport:addButton("Shotgun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-578.623657, 5.47212696, -725.131531, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

teleport:addButton("Flame Thrower", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-157.122437, 50.9120102, -104.93145, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

teleport:addButton("Tactical Shotgun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.877533, 45.1272316, -620.630676, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

teleport:addButton("Church", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(147.299988, 18.8493252, 31.7999744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)
 

teleport:addButton("Admin Guns", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872.853516, -34.4276848, -538.013306, -0.999724388, -3.9898886e-08, -0.0234765243, -3.9204977e-08, 1, -3.00177518e-08, 0.0234765243, -2.90890814e-08, -0.999724388)
end)
 

teleport:addButton("Admin Guns 2", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-808.708557, -39.6492004, -932.789368, 0.999899805, 2.01343173e-08, -0.0141554065, -2.17800533e-08, 1, -1.16108232e-07, 0.0141554065, 1.16404912e-07, 0.999899805)
end)

teleport:addButton("Admin Food", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-788.053406, -39.6492004, -932.951233, 0.998369277, 2.46515359e-08, 0.0570784509, -2.8773524e-08, 1, 7.13949646e-08, -0.0570784509, -7.29209759e-08, 0.998369277)
end)

buy:addButton("Buy High-Medium Armor", function(bool)
    local plr = game.Players.LocalPlayer
    local savedarmourpos = plr.Character.HumanoidRootPart.Position
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-938.476685, -25.2498264, 570.100159, -0.0353576206, 9.85617206e-08, -0.999374807, -2.69198441e-09, 1, 9.871858e-08, 0.999374807, 6.18077589e-09, -0.0353576206)
    wait(.2)
 
    fireclickdetector(game.Workspace.Ignored.Shop['[High-Medium Armor] - $2300'].ClickDetector)
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
end)

buy:addButton("Ufo", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.85052466, 132, -736.571106, -0.0460956171, -4.24733706e-08, -0.998937011, 7.26012459e-08, 1, -4.58687275e-08, 0.998937011, -7.46384217e-08, -0.0460956171)
end)

buy:addButton("Casino", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-995, 21.6998043, -153.100037, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

buy:addButton("Rpg", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118.664856, -29.6487694, -272.349792, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

buy:addButton("Bank", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-318.891174, 80.2145309, -257.177429, 0.0479469746, -5.14644114e-08, 0.998850107, -3.12971538e-09, 1, 5.16738901e-08, -0.998850107, -5.60372015e-09, 0.0479469746)
end)

buy:addButton("Taco", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(584.026855, 48.1605072, -474.033936, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

buy:addButton("Drum Gun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-83.548996, 19.7020588, -82.1449585, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

buy:addButton("Revolver Roof", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-634.463135, 80.434761, -204.232559, -0.0190527271, -1.03574322e-07, -0.999818563, 4.36709335e-09, 1, -1.03676342e-07, 0.999818563, -6.3416179e-09, -0.0190527271)
end)

buy:addButton("PlayGround", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-282.694153, 19.7496624, -807.719727, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

buy:addButton("Gas Station", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(604.800415, 46.0998344, -258.249573, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

buy:addButton("Cementery", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.109558, 99.75, -57.2315979, 0.999993503, -0.000633752206, -0.0035054055, 0.000638642872, 0.999998808, 0.00139435288, 0.00350463158, -0.00139658386, 0.999992728)
end)

buy:addButton("School Roof", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-525.353455, 68.125, 311.824402, 0.999992013, 1.03866675e-08, -0.00399552286, -1.03507425e-08, 1, 9.01170427e-09, 0.00399552286, -8.97027519e-09, 0.999992013)
end)

--[[local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/esp.lua"))()
ESP:Toggle(false)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
Aiming.TeamCheck(false)
Aiming.VisibleCheck = false
local ESP = venyx:addPage("Esp", 5012544693)
local section3 = ESP:addSection("Esp Configuration")

section3:addToggle("Enable ESP", nil, function(bool)
    ESP:Toggle(bool)
end)

section3:addToggle("Enable Tracers", nil, function(bool)
    ESP.Tracers = bool
end)
 
section3:addToggle("Enable Names", nil, function(bool)
    ESP.Names = bool
end)

 
section3:addToggle("Enable Boxes", nil, function(bool)
    ESP.Boxes = bool
end)]]--


-- Misc PAGE
local MISC = venyx:addPage("Misc", 5094929967)
local section3 = MISC:addSection("Misc")

section3:addButton("Rejoin Server", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
end)

section3:addButton("Trash Talk [J]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/trash_talk.lua"))()
end)

section3:addButton("Fake Macro [Z]", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yMmUUyyE"))()
end)

section3:addButton("Fly [X]", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/5GWNQ1Ys"))()
end)

section3:addButton("Full Bright", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/full_bright.lua"))()
end)

section3:addSlider("Change FOV", 0, 0, 120, function(value)
    workspace.CurrentCamera.FieldOfView = (value)
end)

local CRACK = venyx:addPage("Extras", 5094929967)
local crackedstuff = CRACK:addSection("Extra Scripts")

crackedstuff:addButton("RAYX", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/rayx.lua'))()
end)

crackedstuff:addButton("Avatar Modifier", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/facechanger.lua'))()
end)

crackedstuff:addButton("Ben Talk", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/ben.lua'))()
end)

crackedstuff:addButton("Admin Fly", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/admin_fly.lua'))()
end)

--Settings PAGE
local SETTINGS = venyx:addPage("Settings", 5416977227)
local section4 = SETTINGS:addSection("Settings & Extras")

section4:addKeybind("Toggle Keybind", Enum.KeyCode.Insert, function()
venyx:toggle()
end, function()
print("[hoodsense.cc] Changed GUI Toggle Keybind")
end)

section4:addButton("Copy discord link", function(bool)
    setclipboard("ekso#0001 <@804245361894883339> | urfriend#2137 <@935540113369346130> | http://hoodsense.cf/")
    wait(1)
    local function callback(text)
        if text == "Yes" then
        print("")
        elseif text == "No" then
        print("")
        end
    end
    
    local bindableFunction= Instance.new("BindableFunction")
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "hoodsense.cc";
        Text = "Credits Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

-- Themes Page
local theme = venyx:addPage("Theme", 5416978384)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

function Aiming.Check()
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end
 
    local Character = Aiming.Character(Aiming.Selected)
    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
 
    if (KOd or Grabbed) then
        return false
    end
 
    return true
end
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
        local SelectedPart = Aiming.SelectedPart
        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
 
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
 
    return __index(t, k)
end)
 
local LMFAO = false
 
UserInputService.InputBegan:Connect(function(Key, Is)
    if Key.UserInputType == Enum.UserInputType.MouseButton2 and not Is then
        LMFAO = true
    end
end)
 
UserInputService.InputEnded:Connect(function(Key, Is)
    if Key.UserInputType == Enum.UserInputType.MouseButton2 and not Is then
        LMFAO = false
    end
end)
 
game:GetService("CoreGui").imgui.Windows.Window.Visible = false
RunService:BindToRenderStep("Aimlock", 0, function()
    if (DaHoodSettings.AimLock and Aiming.Check() and LMFAO) then
        local SelectedPart = Aiming.SelectedPart
 
        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
 
        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)
    end
end)

-- load
venyx:SelectPage(venyx.pages[1], true)
print("_____________________HOODSENSE.CC________________________")
print("| [hoodsense.cc] Executed version: 4.1                  |")
print("| [hoodsense.cc] ESP disabled temporarily due to errors.|")
print("| [hoodsense.cc] Join discord.gg/olifkaa                |")
print("| [hoodsense.cc] Join us http://hoodsense.cf/discord    |")
print("| [hoodsense.cc] Made by ekso#1337 <@804245361894883339>|")
print("| [hoodsense.cc] Website - http://hoodsense.cf          |")
print("_________________________________________________________")
