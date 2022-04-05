local Config = {
    WindowName = "hoodsense.cc",
	Color = Color3.fromRGB(22, 88, 232),
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

local Tab1 = Window:CreateTab("Main")
local Tab4 = Window:CreateTab("Teleports")
local Tab5 = Window:CreateTab("Misc")
local Tab6 = Window:CreateTab("Credits")
local Tab7 = Window:CreateTab("Settings")

local Section1 = Tab1:CreateSection("Silentaim Configuration")
local Section2 = Tab1:CreateSection("Fov Configuration")
local Section5 = Tab1:CreateSection("Esp Configuration")
local Section6 = Tab1:CreateSection("Avatar Modifications")
local Section13 = Tab1:CreateSection("Faces")
local Section7 = Tab4:CreateSection("Guns")
local Section8 = Tab4:CreateSection("Places")
local Section9 = Tab5:CreateSection("Misc")
local Section10 = Tab5:CreateSection("Extra Scripts")
local Section11 = Tab6:CreateSection("Credits")
local Section12 = Tab6:CreateSection("Partners")
local Section3 = Tab7:CreateSection("Menu")
local Section4 = Tab7:CreateSection("Background")

local PartnersLabel = Section12:CreateLabel("Supporting with creating project!")
PartnersLabel:UpdateText("Supporting with creating project!")

------------------------
-----//MAIN  PAGE-----
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

local fovcolor =Section1:CreateColorpicker("Fov Color", function(color)
	Aiming.FOVColour = color
end)
fovcolor:AddToolTip("Change FOV color.")
fovcolor:UpdateColor(Color3.fromRGB(20, 124, 255))


local FovCircleSize = Section2:CreateSlider("Fov Circle Size", 0,400,nil,true, function(value)
    Aiming.FOV = value
end)
FovCircleSize:AddToolTip("Customize Fov Circle Size.")

local HitChanceSlider = Section2:CreateSlider("Hitchance", 0,400,nil,false, function(value)
    DaHoodSettings.Prediction = tonumer("0." .. value)
end)
HitChanceSlider:AddToolTip("Customize hitchance.")

local animationgamepass = Section6:CreateButton("Animation Gamepass", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/animation_gamepass.lua'))()
end)
animationgamepass:AddToolTip("Loads Animation Gamepass (Press P to close.)")

local meanie = Section13:CreateButton("Meanie", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/508490451.lua'))()
end)
meanie:AddToolTip("Changes your face to Meanie.")

local sshf = Section13:CreateButton("Super Super Happy Face", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/494290547.lua'))()
end)
sshf:AddToolTip("Changes your face to Super Super Happy Face.")

--[[local silverpunk = Section13:CreateButton("Silver Punk Face", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/387256104.lua'))()
end)
silverpunk:AddToolTip("Changes your face to Silver Punk Face.")]]

local yum = Section13:CreateButton("Yum", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/26018945.lua'))()
end)
yum:AddToolTip("Changes your face to Yum.")

local playful = Section13:CreateButton("Playful Vampire", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/2409281591.lua'))()
end)
playful:AddToolTip("Changes your face to Playful Vampire.")

--[[local beastmode = Section13:CreateButton("Beast Mode", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/faces/127959433.lua'))()
end)
beastmode:AddToolTip("Changes your face to Beast Mode.")]]--
------------------------
-----// ESP PAGE -----
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

local espcolor = Section5:CreateColorpicker("Esp Color", function(color)
	ESP.Color = color
end)
espcolor:UpdateColor(Color3.fromRGB(20, 124, 255))
espcolor:AddToolTip("Change ESP Color.")
------------------------
-----// AV  PAGE -----
local animbutton = Section6:CreateButton("Animations", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/anims.lua"))()
end)
animbutton:AddToolTip("Changes your animations.")

local headlbutton = Section6:CreateButton("Headless", function(bool)
game.Players.LocalPlayer.Character.Head.Transparency = 1
for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
if (v:IsA("Decal")) then
v:Destroy()
end
end
end)
headlbutton:AddToolTip("Gives you headless. [NOT FE]")

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

local animatedbeastmode = Section6:CreateButton("Animated Beast Mode", function()
	while true do
local player = game.Players.LocalPlayer.Character
if player:findFirstChild("Humanoid") then
    player.Head.face.Texture = "https://www.roblox.com/asset/?id=209712379"
    end
wait(1)
if player:findFirstChild("Humanoid") then
    player.Head.face.Texture = "https://www.roblox.com/asset/?id=127959433"
    end
wait(1)
end
end)
animatedbeastmode:AddToolTip("Makes your face animated.")
------------------------
-----// TP  PAGE -----
local revolver = Section7:CreateButton("Revolver", function(bool)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

local ak = Section7:CreateButton("Ak", function(bool)
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

local armor = Section7:CreateButton("High Medium Armor", function(bool)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-939, -25, 571)
end)

local bat = Section7:CreateButton("Bat", function(bool)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(380, 49, -283)
end)

local mediumarmor = Section7:CreateButton("Medium Armor", function(bool)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(528, 50, -637)
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
---//  MISC  PAGES ---
local rejoin = Section9:CreateButton("Rejoin Server", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
end)
rejoin:AddToolTip("Rejoins Server.")

local hop = Section9:CreateButton("Server hop", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/serverhop.lua'))()
end)
local trash = Section9:CreateButton("Trash Talk", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/trash_talk.lua"))()
end)
trash:AddToolTip("Loads Trash Talk. [J]")

local macro = Section9:CreateButton("Fake Macro", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/yMmUUyyE"))()
end)
macro:AddToolTip("Loads Fake Macro. [Z]")

local fly = Section9:CreateButton("Buggy Fly", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/fly.lua"))()
end)
fly:AddToolTip("Loads Buggy Fly. [X]")

local fullbright = Section9:CreateButton("Full Bright", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/full_bright.lua"))()
end)
fullbright:AddToolTip("Loads Full Bright.")

local nocooldown = Section9:CreateButton("No jump cooldown", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/no-jump-cooldown.lua'))()
end)
nocooldown:AddToolTip("Removes jump cooldown.")

local weightfarm = Section9:CreateButton("Weight Farm", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/weight_farm.lua'))()
end)
weightfarm:AddToolTip("Runs Weight Farm.")

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
swagfly:AddToolTip("Loads Swag Mode Admin Fly. [X]")

local crash = Section10:CreateButton("Better Crash", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GS21Official/DH-TB-Crash/main/Swagmode%20crash%20modified%20(better%20FPS)%20crash'))()
end)
crash:AddToolTip("Loads Swag Mode Modified Crash (For potato pc's.)")

local panic = Section10:CreateButton("Rage quit", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/ragequit.lua'))()
end)
panic:AddToolTip("Why u mad bro?")

local swagmode = Section10:CreateButton("Swag Mode", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))()
end)
swagmode:AddToolTip("Loads Swag Mode.")

local swagcrash = Section10:CreateButton("Swag Crasher", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SuperCustomServerCrasher'))()
end)
swagcrash:AddToolTip("Loads Swag Mode Crash (DOESN'T WORKS ON LOW-END PC'S)")
------------------------
---// CREDITS PAGE ---
local CreditsLabel1 = Section11:CreateLabel("Made with love by hoodsense team!")
CreditsLabel1:UpdateText("Made with love by hoodsense team!")
local discord = Section11:CreateButton("Brought to you by hoodsense.", function(bool)
    setclipboard("pawel#0008 <@804245361894883339> | urfriend#2137 <@935540113369346130> | https://hoodsense.cf/")
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

local CreditsLabel2 = Section11:CreateLabel("Our Staff")
CreditsLabel2:UpdateText("Our Staff")

local discord = Section11:CreateButton("pawel#0008", function(bool)
    setclipboard("pawel#0008 <@804245361894883339>")
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

local discord = Section11:CreateButton("xdzz#2137", function(bool)
    setclipboard("xdzz#2137 <@935540113369346130>")
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

local discord = Section11:CreateButton("! ave#0005", function(bool)
    setclipboard("! ave#0005 <@557671767565664285>")
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

local discord = Section11:CreateButton("Copy website link.", function(bool)
    setclipboard("http://hoodsense.cf")
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

local partnerslabel1 = Section12:CreateLabel("Da hood cash services")
partnerslabel1:UpdateText("Da hood cash services")

local partners1 = Section12:CreateButton("discord.gg/axq", function(bool)
    setclipboard("https://discord.gg/axq")
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
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)

local partnerslabel2 = Section12:CreateLabel("Other supporters")
partnerslabel2:UpdateText("Other supporters")

local partners2 = Section12:CreateButton("v3rmillion.net", function(bool)
    setclipboard("https://v3rmillion.net")
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
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)
local partners = Section12:CreateButton("krnl.ca", function(bool)
    setclipboard("https://krnl.ca")
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
        Text = "Supporter Copied on clipboard!";
        Icon = "rbxassetid://8768441000";
        Duration = "BLANK";
        callbakc = bindableFunction;
        Button1 = "Okay!";
    })
end)
local partners3 = Section12:CreateButton("ryos.best", function(bool)
    setclipboard("https://ryos.best")
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
        Text = "Supporter Copied on clipboard!";
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
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagons","Circles","Flowers","Waves"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("5553946656")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagons" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Waves" then
		Window:SetBackground("2151741365")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(0, 0, 0))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.25)


-------------------------------
-----// AIMING FUNCTION -----
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
-----------------------------------------------------------
game.StarterGui:SetCore("SendNotification", {
    Title = "hoodsense.cc";
    Text = "Welcome to hoodsense.cc!";
    Icon = "http://www.roblox.com/asset/?id=8768441000";
    Duration = "10";
    callbakc = bindableFunction;
    Button1 = "Okay!";
})
print("_____________________HOODSENSE.CC________________________")
print("| [hoodsense.cc] Executed version: 5.2                  |")
print("| [hoodsense.cc] Fixed silent aim!                      |")
print("| [hoodsense.cc] Join us http://hoodsense.cf/discord    |")
print("| [hoodsense.cc] Made by <z3#0001 <@804245361894883339> |")
print("| [hoodsense.cc] Website - https://hoodsense.cf         |")
print("_________________________________________________________")
loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/emoji.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/dp.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/dp2.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/p1.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/p2.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/p3.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/p4.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/p5.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/saopidjaopsdjp2wa/uyoibxcvrwqedhfg/main/p6.lua'))()

-------------------------------------------------------------------------
--[[
██╗░░██╗░█████╗░░█████╗░██████╗░░██████╗███████╗███╗░░██╗░██████╗███████╗
██║░░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║██╔════╝██╔════╝
███████║██║░░██║██║░░██║██║░░██║╚█████╗░████╗░░██╔██╗██║╚█████╗░█████╗░░
██╔══██║██║░░██║██║░░██║██║░░██║░╚═══██╗██╔══╝░░██║╚████║░╚═══██╗██╔══╝░░
██║░░██║╚█████╔╝╚█████╔╝██████╔╝██████╔╝███████╗██║░╚███║██████╔╝███████╗
╚═╝░░╚═╝░╚════╝░░╚════╝░╚═════╝░╚═════╝░╚══════╝╚═╝░░╚══╝╚═════╝░╚══════╝
]]
-------------------------------------------------------------------------
while true do
warn("---------------------------")
warn("---------------------------")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("-[[[[-----------------]]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][]-------------------")
warn("-[[[[][][][]---------------")
warn("-[[[[][][][][][][][][------")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[-------------------]]]-")
warn("-[[[[][][][][][][][][------")
warn("-[[[[][][][]---------------")
warn("-[[[[][]-------------------")
warn("---------------------------")
warn("---------------------------")
print("                          ")
print("                          ")
print("                          ")
print("                          ")
print("                          ")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[[[[--------------]]]]-")
warn("-[[[[[[[[-------------]]]]-")
warn("-[[[[-[[[[------------]]]]-")
warn("-[[[[--[[[[-----------]]]]-")
warn("-[[[[---[[[[----------]]]]-")
warn("-[[[[----[[[[---------]]]]-")
warn("-[[[[-----[[[[--------]]]]-")
warn("-[[[[------[[[[-------]]]]-")
warn("-[[[[-------[[[[------]]]]-")
warn("-[[[[--------[[[[-----]]]]-")
warn("-[[[[---------[[[[----]]]]-")
warn("-[[[[----------[[[[---]]]]-")
warn("-[[[[-----------[[[[--]]]]-")
warn("-[[[[------------[[[[-]]]]-")
warn("-[[[[-------------[[[[]]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-----------------------]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
print("                          ")
warn("---------------------------")
warn("---------------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[-----------------------")
warn("-[[[[][][][][][][][][][]]]-")
warn("-[[[[][][][][][][][][][]]]-")
warn("---------------------------")
warn("---------------------------")
print("                          ")
wait(69420)
end
