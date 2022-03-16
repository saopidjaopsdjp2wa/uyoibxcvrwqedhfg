local Config = {
    WindowName = "hoodsense.cc",
	Color = Color3.fromRGB(),
	Keybind = Enum.KeyCode.V
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

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

local Tab1 = Window:CreateTab("Aiming")
local Tab2 = Window:CreateTab("Visuals")
local Tab3 = Window:CreateTab("Avatar")
local Tab4 = Window:CreateTab("Teleports")
local Tab5 = Window:CreateTab("Misc")
local Tab6 = Window:CreateTab("Credits")
local Tab7 = Window:CreateTab("Settings")

local Section1 = Tab1:CreateSection("Silentaim Configuration")
local Section2 = Tab1:CreateSection("Fov Configuration")
local Section5 = Tab2:CreateSection("Esp Configuration")
local Section6 = Tab3:CreateSection("Avatar Modifications")
local Section7 = Tab4:CreateSection("Guns")
local Section8 = Tab4:CreateSection("Places")
local Section9 = Tab5:CreateSection("Misc")
local Section10 = Tab5:CreateSection("Extra Scripts")
local Section11 = Tab6:CreateSection("Credits")
local Section12 = Tab6:CreateSection("Partners")
local Section3 = Tab7:CreateSection("Menu")
local Section4 = Tab7:CreateSection("Background")

local CreditsLabel = Section11:CreateLabel("Brought to you by hoodsense team.")
CreditsLabel:UpdateText("Made with ❤ by ekso!")

local PartnersLabel = Section12:CreateLabel("Brought to you by hoodsense team.")
PartnersLabel:UpdateText("Partners supporting us!")

------------------------
-----//AIMINGPAGE\\-----
local SilentAimToggle = Section1:CreateToggle("Silent Aim", nil, function(bool)
    DaHoodSettings.SilentAim = bool
end)
SilentAimToggle:AddToolTip("Enables Silentaim.")

local PredictLagToggle = Section1:CreateToggle("Predict Lag", nil, function(bool)
    DaHoodSettings.Prediction.Lag = bool
end)
PredictLagToggle:AddToolTip("Enables Predict Lag.")

local FovCircleToggle = Section1:CreateToggle("FOV Circle", nil, function(bool)
    Aiming.ShowFOV = bool
end)
FovCircleToggle:AddToolTip("Enables FOV Circle.")

local VisibleCheckToggle = Section1:CreateToggle("Visible Check", nil, function(bool)
    Aiming.VisibleCheck = bool
end)
VisibleCheckToggle:AddToolTip("Checks if target is visible.")

local HitAirShootsToggle = Section1:CreateToggle("Hit Airshots", nil, function(bool)
    Aiming.Airshots = true
end)
HitAirShootsToggle:AddToolTip("Hits Airshots.")

    FovCircleSize = Section2:CreateSlider("Fov Circle Size", 0,400,nil,false, function(value)
    Aiming.FOV = value
end)
FovCircleSize:AddToolTip("Customize Fov Circle Size.")

local HitChanceSlider = Section2:CreateSlider("Hitchance", 0,400,nil,false, function(value)
    DaHoodSettings.Prediction = tonumer("0." .. value)
end)
HitChanceSlider:AddToolTip("Customize hitchance.")
------------------------
-----// ESP PAGE \\-----
local espToggle = Section5:CreateToggle("Enable ESP", nil, function(bool)
    ESP:Toggle(bool)
end)
espToggle:AddToolTip("Enables ESP.")

local tracersToggle = Section5:CreateToggle("Enable Tracers", nil, function(bool)
    ESP.Tracers = bool
end)
tracersToggle:AddToolTip("Enables Tracers.")

local namesToggle = Section5:CreateToggle("Enable Names", nil, function(bool)
    ESP.Names = bool
end)
namesToggle:AddToolTip("Enables Names.")

local boxesToggle = Section5:CreateToggle("Enable Boxes", nil, function(bool)
    ESP.Boxes = bool
end)
tracersToggle:AddToolTip("Enables Boxes.")
------------------------
-----// AV  PAGE \\-----
local animbutton = Section6:CreateButton("Animations", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/anims.lua"))()
end)
animbutton:AddToolTip("Avatar Modification. [NOT FE]")

local headlbutton = Section6:CreateButton("Headless", function(bool)
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v:Destroy()
end
end
end)
headlbutton:AddToolTip("Avatar Modification. [NOT FE]")

local korbloxbutton = Section6:CreateButton("Korblox", function(bool)
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.RightLowerLeg.MeshId = "rbxassetid://902942093"
    chr.RightLowerLeg.Transparency = "1"
    chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
    chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
    chr.RightFoot.MeshId = "rbxassetid://902942089"
    chr.RightFoot.Transparency = "1"
end)
korbloxbutton:AddToolTip("Avatar Modification. [NOT FE]")

local korbloxbuttonleft = Section6:CreateButton("Korblox Left", function(bool)
    local ply = game.Players.LocalPlayer
    local chr = ply.Character
    chr.LeftLowerLeg.MeshId = "902942093"
    chr.LeftLowerLeg.Transparency = "1"
    chr.LeftUpperLeg.MeshId = "902942096"
    chr.LeftUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
    chr.LeftFoot.MeshId = "902942089"
    chr.LeftFoot.Transparency = "1"
end)
korbloxbuttonleft:AddToolTip("Avatar Modification. [NOT FE]")
------------------------
-----// TP  PAGE \\-----
local revolver = Section7:CreateButton("Revolver", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local ak = Section7:("Ak", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-587.529358, 5.39480686, -753.717712, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local smg = Section7:CreateButton("Smg", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.123413, 5.47666788, -718.031433, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local ar = Section7:CreateButton("AR", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-591.824158, 5.46046877, -744.731628, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local dbs = Section7:CreateButton("Double Barrel", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1039.59985, 18.8513641, -256.449951, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local shotgun = Section7:CreateButton("Shotgun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-578.623657, 5.47212696, -725.131531, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local flame = Section7:CreateButton("Flame Thrower", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-157.122437, 50.9120102, -104.93145, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local tac = Section7:CreateButton("Tactical Shotgun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.877533, 45.1272316, -620.630676, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local rpg = Section7:CreateButton("Rpg", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118.664856, -29.6487694, -272.349792, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local drumgun = Section7:CreateButton("Drum Gun", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-83.548996, 19.7020588, -82.1449585, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local armor = Section7:CreateButton("Buy High-Medium Armor", function(bool)
    local plr = game.Players.LocalPlayer
    local savedarmourpos = plr.Character.HumanoidRootPart.Position
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-938.476685, -25.2498264, 570.100159, -0.0353576206, 9.85617206e-08, -0.999374807, -2.69198441e-09, 1, 9.871858e-08, 0.999374807, 6.18077589e-09, -0.0353576206)
    wait(.2)
 
    fireclickdetector(game.Workspace.Ignored.Shop['[High-Medium Armor] - $2300'].ClickDetector)
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
end)
-----// PLACES -----
local church = Section8:CreateButton("Church", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(147.299988, 18.8493252, 31.7999744, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local admin1 = Section8:CreateButton("Admin Guns", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872.853516, -34.4276848, -538.013306, -0.999724388, -3.9898886e-08, -0.0234765243, -3.9204977e-08, 1, -3.00177518e-08, 0.0234765243, -2.90890814e-08, -0.999724388)
end)

local admin2 = Section8:CreateButton("Admin Guns 2", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-808.708557, -39.6492004, -932.789368, 0.999899805, 2.01343173e-08, -0.0141554065, -2.17800533e-08, 1, -1.16108232e-07, 0.0141554065, 1.16404912e-07, 0.999899805)
end)

local admin3 = Section8:CreateButton("Admin Food", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-788.053406, -39.6492004, -932.951233, 0.998369277, 2.46515359e-08, 0.0570784509, -2.8773524e-08, 1, 7.13949646e-08, -0.0570784509, -7.29209759e-08, 0.998369277)
end)

local ufo = Section8:CreateButton("Ufo", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.85052466, 132, -736.571106, -0.0460956171, -4.24733706e-08, -0.998937011, 7.26012459e-08, 1, -4.58687275e-08, 0.998937011, -7.46384217e-08, -0.0460956171)
end)

local casino = Section8:CreateButton("Casino", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-995, 21.6998043, -153.100037, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local bank = Section8:CreateButton("Bank", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-318.891174, 80.2145309, -257.177429, 0.0479469746, -5.14644114e-08, 0.998850107, -3.12971538e-09, 1, 5.16738901e-08, -0.998850107, -5.60372015e-09, 0.0479469746)
end)

local taco = Section8:CreateButton("Taco", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(584.026855, 48.1605072, -474.033936, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local revRoof = Section8:CreateButton("Revolver Roof", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-634.463135, 80.434761, -204.232559, -0.0190527271, -1.03574322e-07, -0.999818563, 4.36709335e-09, 1, -1.03676342e-07, 0.999818563, -6.3416179e-09, -0.0190527271)
end)

local playground = Section8:CreateButton("PlayGround", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-282.694153, 19.7496624, -807.719727, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

local gas = Section8:CreateButton("Gas Station", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(604.800415, 46.0998344, -258.249573, 0, 0, 1, 0, 1, -0, -1, 0, 0)
end)

local cementery = Section8:CreateButton("Cementery", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.109558, 99.75, -57.2315979, 0.999993503, -0.000633752206, -0.0035054055, 0.000638642872, 0.999998808, 0.00139435288, 0.00350463158, -0.00139658386, 0.999992728)
end)

local school = Section8:CreateButton("School Roof", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-525.353455, 68.125, 311.824402, 0.999992013, 1.03866675e-08, -0.00399552286, -1.03507425e-08, 1, 9.01170427e-09, 0.00399552286, -8.97027519e-09, 0.999992013)
end)
------------------------
---//  MISC  PAGES \\---
local rejoin = Section9:CreateButton("Rejoin Server", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
end)
rejoin:AddToolTip("Rejoins Server.")

local trash = Section9:CreateButton("Trash Talk", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/trash_talk.lua"))()
end)
trash:AddToolTip("Loads Trash Talk. [J]")

local macro = Section9:CreateButton("Fake Macro", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yMmUUyyE"))()
end)
macro:AddToolTip("Loads Fake Macro. [Z]")

local fly = Section9:CreateButton("Trash Talk [J]", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/trash_talk.lua"))()
end)
fly:AddToolTip("Loads Fly. [X]")

local fullbright = Section9:CreateButton("Full Bright", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/full_bright.lua"))()
end)
fullbright:AddToolTip("Loads Full Bright.")

local rayx = Section10:CreateButton("RAYX", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/rayx.lua'))()
end)
rayx:AddToolTip("Loads rayx.")

local avatarchanger = Section10:CreateButton("Avatar Modifier", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/facechanger.lua'))()
end)
avatarchanger:AddToolTip("Loads Avatar Modifier. [NOT FE]")

local ben = Section10:CreateButton("Ben Talk", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/ben.lua"))()
end)
ben:AddToolTip("Loads Ben Talk. [K]")

local swagfly = Section10:CreateButton("Admin Fly", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/cracked%20stuff/admin_fly.lua'))()
end)
------------------------
---// CREDITS PAGE \\---
local discord = Section11:CreateButton("Copy discord link", function(bool)
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

local partners = Section12:CreateButton("discord.gg/olifkaa", function(bool)
    setclipboard("https://discord.gg/olifkaa")
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
        Text = "Partners Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)
------------------------
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)


-------------------------------
-----// AIMING FUNCTION \\-----
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
-------------------------------
print("_____________________HOODSENSE.CC________________________")
print("| [hoodsense.cc] Executed version: 4.2                  |")
print("| [hoodsense.cc] ESP is working now!                    |")
print("| [hoodsense.cc] Join discord.gg/olifkaa                |")
print("| [hoodsense.cc] Join us http://hoodsense.cf/discord    |")
print("| [hoodsense.cc] Made by ekso#1337 <@804245361894883339>|")
print("| [hoodsense.cc] Website - http://hoodsense.cf          |")
print("_________________________________________________________")
