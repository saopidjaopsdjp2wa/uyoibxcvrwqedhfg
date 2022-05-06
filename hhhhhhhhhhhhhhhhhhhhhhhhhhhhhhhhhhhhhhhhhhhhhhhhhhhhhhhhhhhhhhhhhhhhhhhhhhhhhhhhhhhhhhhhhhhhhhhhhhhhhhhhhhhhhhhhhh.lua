local GetService = setmetatable({}, {
    __index = function(self, key)
    return game:GetService(key)
    end
})

local http_request = http_request or request or syn.request;
local a = {
	['cmd'] = 'INVITE_BROWSER',
	['args'] = {
		["code"] = 'zp'
	},
	['nonce'] = game:GetService('HttpService'):GenerateGUID(true)
}

http_request({
	Url = 'http://127.0.0.1:6463/rpc?v=1',
	Method = 'POST',
	Headers = {
		['Content-Type'] = 'application/json',
		['Origin'] = 'https://discord.com'
	},
	Body = game:GetService('HttpService'):JSONEncode(a)
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/library.lua", true))()
local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()

local Notify = NotifyLibrary.Notify

local RunService = GetService.RunService
local Players = GetService.Players
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = workspace.CurrentCamera
local UserInputService = GetService.UserInputService
local GuiInset = GetService.GuiService:GetGuiInset()
local AimbotFOV = Drawing.new("Circle")
AimbotFOV.Thickness = 1
local SilentAimFOV = Drawing.new("Circle")
SilentAimFOV.Thickness = 1
local Insert = table.insert
local Network = GetService.NetworkClient
local ZapFolder = Instance.new("Folder", workspace)
ZapFolder.Name = "Zap-Folder"
local StarterGui = GetService.StarterGui
local ReplicatedStorage = GetService.ReplicatedStorage
local AnimationModule = {
    Astronaut = {
        "rbxassetid://891621366",
        "rbxassetid://891633237",
        "rbxassetid://891667138",
        "rbxassetid://891636393",
        "rbxassetid://891627522",
        "rbxassetid://891609353",
        "rbxassetid://891617961"
    },
    Bubbly = {
        "rbxassetid://910004836",
        "rbxassetid://910009958",
        "rbxassetid://910034870",
        "rbxassetid://910025107",
        "rbxassetid://910016857",
        "rbxassetid://910001910",
        "rbxassetid://910030921",
        "rbxassetid://910028158"
    },
    Cartoony = {
        "rbxassetid://742637544",
        "rbxassetid://742638445",
        "rbxassetid://742640026",
        "rbxassetid://742638842",
        "rbxassetid://742637942",
        "rbxassetid://742636889",
        "rbxassetid://742637151"
    },
    Confindent = {
        "rbxassetid://1069977950",
        "rbxassetid://1069987858",
        "rbxassetid://1070017263",
        "rbxassetid://1070001516",
        "rbxassetid://1069984524",
        "rbxassetid://1069946257",
        "rbxassetid://1069973677"
    },
    Cowboy = {
        "rbxassetid://1014390418",
        "rbxassetid://1014398616",
        "rbxassetid://1014421541",
        "rbxassetid://1014401683",
        "rbxassetid://1014394726",
        "rbxassetid://1014380606",
        "rbxassetid://1014384571"
    },
    Default = {
        "http://www.roblox.com/asset/?id=507766666",
        "http://www.roblox.com/asset/?id=507766951",
        "http://www.roblox.com/asset/?id=507777826",
        "http://www.roblox.com/asset/?id=507767714",
        "http://www.roblox.com/asset/?id=507765000",
        "http://www.roblox.com/asset/?id=507765644",
        "http://www.roblox.com/asset/?id=507767968"
    },
    Elder = {
        "rbxassetid://845397899",
        "rbxassetid://845400520",
        "rbxassetid://845403856",
        "rbxassetid://845386501",
        "rbxassetid://845398858",
        "rbxassetid://845392038",
        "rbxassetid://845396048" 
    },
    Ghost = {
        "rbxassetid://616006778",
        "rbxassetid://616008087",
        "rbxassetid://616013216",
        "rbxassetid://616013216",
        "rbxassetid://616008936",
        "rbxassetid://616005863",
        "rbxassetid://616012453",
        "rbxassetid://616011509"
    },
    Knight = {
        "rbxassetid://657595757",
        "rbxassetid://657568135",
        "rbxassetid://657552124",
        "rbxassetid://657564596",
        "rbxassetid://658409194",
        "rbxassetid://658360781",
        "rbxassetid://657600338"
    },
    Levitation = {
        "rbxassetid://616006778",
        "rbxassetid://616008087",
        "rbxassetid://616013216",
        "rbxassetid://616010382",
        "rbxassetid://616008936",
        "rbxassetid://616003713",
        "rbxassetid://616005863"
    },
    Mage = {
        "rbxassetid://707742142",
        "rbxassetid://707855907",
        "rbxassetid://707897309",
        "rbxassetid://707861613",
        "rbxassetid://707853694",
        "rbxassetid://707826056",
        "rbxassetid://707829716"
    },
    Ninja = {
        "rbxassetid://656117400",
        "rbxassetid://656118341",
        "rbxassetid://656121766",
        "rbxassetid://656118852",
        "rbxassetid://656117878",
        "rbxassetid://656114359",
        "rbxassetid://656115606"
    },
    OldSchool = {
        "rbxassetid://5319828216",
        "rbxassetid://5319831086",
        "rbxassetid://5319847204",
        "rbxassetid://5319844329",
        "rbxassetid://5319841935",
        "rbxassetid://5319839762",
        "rbxassetid://5319852613",
        "rbxassetid://5319850266"
    },
    Patrol = {
        "rbxassetid://1149612882",
        "rbxassetid://1150842221",
        "rbxassetid://1151231493",
        "rbxassetid://1150967949",
        "rbxassetid://1148811837",
        "rbxassetid://1148811837",
        "rbxassetid://1148863382"
    },
    Pirtate = {
        "rbxassetid://750781874",
        "rbxassetid://750782770",
        "rbxassetid://750785693",
        "rbxassetid://750783738",
        "rbxassetid://750782230",
        "rbxassetid://750779899",
        "rbxassetid://750780242"
    },
    Popstar = {
        "rbxassetid://1212900985",
        "rbxassetid://1150842221",
        "rbxassetid://1212980338",
        "rbxassetid://1212980348",
        "rbxassetid://1212954642",
        "rbxassetid://1213044953",
        "rbxassetid://1212900995"
    },
    Princess = {
        "rbxassetid://941003647",
        "rbxassetid://941013098",
        "rbxassetid://941028902",
        "rbxassetid://941015281",
        "rbxassetid://941008832",
        "rbxassetid://940996062",
        "rbxassetid://941000007"
    },
    Robot = {
        "rbxassetid://616088211",
        "rbxassetid://616089559",
        "rbxassetid://616095330",
        "rbxassetid://616091570",
        "rbxassetid://616090535",
        "rbxassetid://616086039",
        "rbxassetid://616087089"
    },
    Rthro = {
        "rbxassetid://2510196951",
        "rbxassetid://2510197257",
        "rbxassetid://2510202577",
        "rbxassetid://2510198475",
        "rbxassetid://2510197830",
        "rbxassetid://2510195892",
        "rbxassetid://02510201162",
        "rbxassetid://2510199791",
        "rbxassetid://2510192778"
    },
    Sneaky = {
        "rbxassetid://1132473842",
        "rbxassetid://1132477671",
        "rbxassetid://1132510133",
        "rbxassetid://1132494274",
        "rbxassetid://1132489853",
        "rbxassetid://1132461372",
        "rbxassetid://1132469004"
    },
    Stylish = {
        "rbxassetid://616136790",
        "rbxassetid://616138447",
        "rbxassetid://616146177",
        "rbxassetid://616140816",
        "rbxassetid://616139451",
        "rbxassetid://616133594",
        "rbxassetid://616134815"
    },
    Superhero = {
        "rbxassetid://782841498",
        "rbxassetid://782845736",
        "rbxassetid://782843345",
        "rbxassetid://782842708",
        "rbxassetid://782847020",
        "rbxassetid://782843869",
        "rbxassetid://782846423"
    },
    Toy = {
        "rbxassetid://782841498",
        "rbxassetid://782845736",
        "rbxassetid://782843345",
        "rbxassetid://782842708",
        "rbxassetid://782847020",
        "rbxassetid://782843869",
        "rbxassetid://782846423"
    },
    Vampire = {
        "rbxassetid://1083445855",
        "rbxassetid://1083450166",
        "rbxassetid://1083473930",
        "rbxassetid://1083462077",
        "rbxassetid://1083455352",
        "rbxassetid://1083439238",
        "rbxassetid://1083443587"
    },
    Werewolf = {
        "rbxassetid://1083195517",
        "rbxassetid://1083214717",
        "rbxassetid://1083178339",
        "rbxassetid://1083216690",
        "rbxassetid://1083218792",
        "rbxassetid://1083182000",
        "rbxassetid://1083189019"
    },
    Zombie = {
        "rbxassetid://616158929",
        "rbxassetid://616160636",
        "rbxassetid://616168032",
        "rbxassetid://616163682",
        "rbxassetid://616161997",
        "rbxassetid://616156119",
        "rbxassetid://616157476"
    }
}

local AnimationsName = {
    "Astronaut",
    "Bubbly",
    "Cartoony",
    "Confindent",
    "Cowboy",
    "Default",
    "Elder",
    "Ghost",
    "Knight",
    "Levitation",
    "Mage",
    "Ninja",
    "OldSchool",
    "Patrol",
    "Pirate",
    "Popstar",
    "Princess",
    "Robot",
    "Rthro",
    'Sneaky',
    "Stylish",
    "Superhero",
    "Toy",
    "Vampire",
    "Werewolf",
    "Zombie"
}

local AnimationState = {
    Idle = "Default",
    Walk = "Default",
    Run = "Default",
    Jump = "Default",
    Climb = "Default",
    Fall = "Default",
}

local ZapSettings = {
    Aiming = {
        Aimbot = {
            Enabled = false,
            AimAssist = false,
            IsAiming = false,
            ShowFOV = false,
            FOVColor = Library.theme.accentcolor,
            UseNearestDistance = false,
            WallCheck = false,
            KnockedOutCheck = false,
            GrabbedCheck = false,
            Hitboxes = {"Head"}
        },
        TriggerBot = {
            Enabled = false,
            Delay = false,
            DelayAmount = 0
        },
        SilentAim = {
            Enabled = false,
            ShowFOV = false,
            FOVColor = Library.theme.accentcolor,
            WallCheck = false,
            KnockedOutCheck = false,
            UseNearestDistance = false,
            GrabbedCheck = false,
            Hitboxes = {"Head"}
        },
        TargetAim = {
            Enabled = false,
            ShowFOV = false,
            FOVColor = Library.theme.accentcolor,
            WallCheck = false,
            KnockedOutCheck = false,
            UseNearestDistance = false,
            GrabbedCheck = false,
            Hitboxes = {"Head"},
            Target = nil
        },
        AimingSettings = {
            MovementPrediction = false,
            MovementPredictionAmount = 0.165 * 1,
            HitChance = false,
            HitChanceAmount = {
                HitPercent = 100,
                NotHitPercent = 0
            },
            AimAssistType = "Camera",
            MovementPrediction = false,
            MovementPredictionAmount = 0.165 * 1,
            SmoothingTracing = false,
            SmoothingTracingAmount = 5,
            PingBasedPrediction = false,
            GetVelocity = 0.165
        },
        TargetAimSettings = {
            UnlockTargetKnocked = false,
            NotificationAlert = false,
        },
        FOV = {
            FOVFilled = false,
            AimAssistSize = 100,
            SilentAimSize = 100,
            TargetAimSize = 100
        },
        Whitelist = {
            Players = {},
            Friends = {},
            Holder = "",
            Enabled = false,
            CrewEnabled = false,
            FriendsWhitelist = false
        },
    },
    Blatant = {
        BlatantAA = {
            Enabled = false,
            NoAutoRotate = false,
            UndergroundWallbang = false,
            Underground = false,
            AntiAimType = "Jitter",
            AntiAimSpeed = 100,
            JitterAngle = 180
        },
        LegitAA = {
            Enabled = false,
            AntiAimAt = false,
            AntiAimAtDistance = 20
        },
        FakeLag = {
            Enabled = false,
            TriggerAmount = 5
        },
        Movement = {
            SpeedEnabled = false,
            SpeedType = "Default",
            SpeedRender = "Default",
            SpeedAmount = 5
        },
        Reaching = {
            FistReach = false,
            MeleeReach = false
        },
        Character = {
            AntiGrab = false,
            AntiStomp = false,
            AntiStompType = "Nil Char",
            AntiBag = false,
            AutoArmor = false,
            AutoLettuce = false,
            AutoReload = false
        },
        Farming = {
            ATMFarm = false,
            ShoeFarm = false,
            MuscleFarm = false,
            MuscleFarmingType = "Normal",
            BoxFarm = false,
            HospitalFarm = false,
            ATMPick = false
        },
        Cash = {
            AutoDrop = false,
            AutoDropAmount = 5000,
            AutoPickCash = false
        }
    },
    Teleport = {
        TeleportReturn = false,
        ReturnDelay = false,
        AutoPurchase = false,
        AmmoPurchaseAmount = 1
    }
}

local ZapModule = {
    Old = {
        CFrame,
    },
    God = {
        MeleeAlive = false,
        GodMelee = false,
        GodBullet = false,
        AntiRagdoll = false
    },
    LagTick = 0,
    Ignores = {
        "UpperTorso",
        "LowerTorso",
        "Head",
        "LeftHand",
        "LeftUpperArm",
        "LeftLowerArm",
        "RightHand",
        "RightUpperArm",
        "RightLowerArm"
    },
    PingBasedPrediction = 0.165,
    Instance = {},
    Teleport = {
        Players = {},
        Food = {
            "Cranberry",
            "Donut",
            "Pizza",
            "Chicken",
            "Popcorn",
            "Hamburger",
            "Taco",
            "Starblox Latte",
            "Lettuce",
            "Lemonade"
        },
        Location = {
            "Bank",
            "Boxing Place",
            "Police Station",
            "Admin Base",
            "Sewers",
            "Shoe Store",
            "Hospital",
            "Phone Store",
            "Taco Shack",
            "Casino",
            "UFO",
            "Fire Station",
            "Church",
            "Downhill Shop",
            "Uphill Shop"
        },
        Gun = {
            "Glock",
            "SMG",
            "Silencer",
            "TacticalShotgun",
            "P90",
            "AUG",
            "Shotgun",
            "RPG",
            "AR",
            "Double-Barrel SG",
            "Flamethrower",
            "Revolver",
            "LMG",
            "AK47",
            "DrumGun",
            "Silencer",
            "GrenadeLauncher",
            "Taser",
            "SilencerAR",
            "Grenade"
        },
        Armor = {
            "High-Medium Armor",
            "Medium Armor"
        },
        Mask = {
            "Surgeon Mask",
            "Riot Mask",
            "Pitchfork",
            "Hockey Mask",
            "Breathing Mask",
            "Pumpkin Mask",
            "Skull Mask",
            "Paintball Mask",
            "Ninja Mask"
        },
        Weight = {
            "Weights",
            "HeavyWeights"
        },
        Melee = {
            "Shovel",
            "Bat",
            "Pencil",
            "StopSign",
            "Knife",
            "Pitchfork"
        },
        Phone = {
            "iPhone",
            "iPhoneB",
            "iPhoneG",
            "iPhoneP",
            "Old Phone",
            "Orange Phone",
            "Original Phone",
        },
        Bike = {
            "DuoBike",
            "Solo Bike",
        },
        Extra = {
            "PepperSpray",
            "LockPicker",
            "Flashlight",
            "Flowers",
            "Money Gun",
            "Brown Bag",
            "Anti Bodies",
            "Firework"
        }
    }
}

Notify({
    Title = "Zap",
    Description = "Hello, " ..game.Players.LocalPlayer.DisplayName..".",
    Duration = 3
})
wait(0.2)
Notify({
    Title = "Zap",
    Description = "Loading...",
    Duration = 6
})
wait(5)

print("_____________________________ZAP____________________________")
print("| [zap.lua] Executed version: 1.0")
print("| [zap.lua] Your user is: "..game.Players.LocalPlayer.Name.. "") 
print("| [zap.lua] Your id is: "..game.Players.LocalPlayer.UserId.. "")
print("| [zap.lua] Job id: " ..game.JobId.. "")
print("| [zap.lua] Join us discord.gg/zp                 ")
print("| [zap.lua] Made by grek <@804245361894883339>     ")
print("____________________________________________________________")

loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/chatspy.lua'))()

local Players = game:GetService("Players")

loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/emoji.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/blacklist.lua'))()

Players.PlayerAdded:Connect(function(player)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/emoji.lua'))()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/blacklist.lua'))()
end)
loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/emoji.lua'))()

--[[

                  ███████╗░█████╗░██████╗░░░░██╗░░░░░██╗░░░██╗░█████╗░
                  ╚════██║██╔══██╗██╔══██╗░░░██║░░░░░██║░░░██║██╔══██╗
                  ░░███╔═╝███████║██████╔╝░░░██║░░░░░██║░░░██║███████║
                  ██╔══╝░░██╔══██║██╔═══╝░░░░██║░░░░░██║░░░██║██╔══██║
                  ███████╗██║░░██║██║░░░░░██╗███████╗╚██████╔╝██║░░██║
                  ╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝
]]

local Window = Library:CreateWindow("Zap", Vector2.new(492, 598), Enum.KeyCode.RightShift)
local AimingTab = Window:CreateTab("Aiming")


local RageSection = AimingTab:CreateSector("Silent Aim", "left")
local SilentAimToggle = RageSection:AddToggle('Enabled', false, function(Boolean)
    ZapSettings.Aiming.SilentAim.Enabled = Boolean
end)

SilentAimToggle:AddKeybind()

local SilentAimFOVToggle = RageSection:AddToggle('Show FOV', false, function(Boolean)
    ZapSettings.Aiming.SilentAim.ShowFOV = Boolean
end)

SilentAimFOVToggle:AddColorpicker(Library.theme.accentcolor, function(Color)
	ZapSettings.Aiming.SilentAim.FOVColor = Color
end)
RageSection:AddToggle('Use Nearest Distance', false, function(Boolean)
    ZapSettings.Aiming.SilentAim.NearestDistance = Boolean
end)

RageSection:AddToggle('Visible Check', false, function(Boolean)
    ZapSettings.Aiming.SilentAim.WallCheck = Boolean
end)

RageSection:AddToggle('Knock Out Check', false, function(Boolean)
    ZapSettings.Aiming.SilentAim.KnockedOutCheck = Boolean
end)

RageSection:AddToggle('Grabbed Check', false, function(Boolean)
    ZapSettings.Aiming.SilentAim.GrabbedCheck = Boolean
end)

RageSection:AddDropdown('Hitboxes', {"Head", "HumanoidRootPart"}, {"Head"}, true, function(Value)
    ZapSettings.Aiming.SilentAim.Hitboxes = Value
end)

-- Target Aim Setion --
local RageSection = AimingTab:CreateSector("Target Aim", "left")
local TargetAimToggle = RageSection:AddToggle('Enabled', false, function(Boolean)
    ZapSettings.Aiming.TargetAim.Enabled = Boolean
end)

TargetAimToggle:AddKeybind()

local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/fov.lua"))()
Aiming.FOV = 30

local SilentAimFOVToggle = RageSection:AddToggle('Show FOV', false, function(bool)
    Aiming.ShowFOV = bool
end)

SilentAimFOVToggle:AddColorpicker(Library.theme.accentcolor, function(Color)
    Aiming.FOVColour = Color
end)

RageSection:AddToggle('Visible Check', false, function(Boolean)
    ZapSettings.Aiming.TargetAim.WallCheck = Boolean
end)

RageSection:AddToggle('Knock Out Check', false, function(Boolean)
    ZapSettings.Aiming.TargetAim.KnockedOutCheck = Boolean
end)

RageSection:AddToggle('Grabbed Check', false, function(Boolean)
    ZapSettings.Aiming.TargetAim.GrabbedCheck = Boolean
end)

RageSection:AddDropdown('Hitboxes', {"Head", "HumanoidRootPart"}, {"Head"}, true, function(Value)
    ZapSettings.Aiming.TargetAim.Hitboxes = Value
end)

-- Aimlock section --

local aimlock = AimingTab:CreateSector("Aimlock", "left")
local aimlocktoggle = aimlock:AddButton("Enabled", function()
getgenv().AimPart = "Head"
getgenv().AimlockKey = ""
getgenv().AimRadius = 30
getgenv().ThirdPerson = true
getgenv().FirstPerson = true
getgenv().TeamCheck = false
getgenv().PredictMovement = true
getgenv().PredictionVelocity = 9
local L_27_, L_28_, L_29_, L_30_ =
    game:GetService "Players",
game:GetService "UserInputService",
game:GetService "RunService",
game:GetService "StarterGui"
local L_31_, L_32_, L_33_, L_34_, L_35_, L_36_, L_37_ =
    L_27_.LocalPlayer,
L_27_.LocalPlayer:GetMouse(),
workspace.CurrentCamera,
CFrame.new,
Ray.new,
Vector3.new,
Vector2.new
local L_38_, L_39_, L_40_ = true, false, false
local L_41_
getgenv().CiazwareUniversalAimbotLoaded = true
getgenv().WorldToViewportPoint = function(L_42_arg0)
    return L_33_:WorldToViewportPoint(L_42_arg0)
end
getgenv().WorldToScreenPoint = function(L_43_arg0)
    return L_33_.WorldToScreenPoint(L_33_, L_43_arg0)
end
getgenv().GetObscuringObjects = function(L_44_arg0)
    if L_44_arg0 and L_44_arg0:FindFirstChild(getgenv().AimPart) and L_31_ and L_31_.Character:FindFirstChild("Head") then
        local L_45_ = workspace:FindPartOnRay(L_35_(L_44_arg0[getgenv().AimPart].Position, L_31_.Character.Head.Position))
        if L_45_ then
            return L_45_:IsDescendantOf(L_44_arg0)
        end
    end
end
getgenv().GetNearestTarget = function()
    local L_46_ = {}
    local L_47_ = {}
    local L_48_ = {}
    for L_50_forvar0, L_51_forvar1 in pairs(L_27_:GetPlayers()) do
        if L_51_forvar1 ~= L_31_ then
            table.insert(L_46_, L_51_forvar1)
        end
    end
    for L_52_forvar0, L_53_forvar1 in pairs(L_46_) do
        if L_53_forvar1.Character ~= nil then
            local L_54_ = L_53_forvar1.Character:FindFirstChild("Head")
            if getgenv().TeamCheck == true and L_53_forvar1.Team ~= L_31_.Team then
                local L_55_ =
                    (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local L_56_ =
                    Ray.new(
                        game.Workspace.CurrentCamera.CFrame.p,
                        (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_55_
                    )
                local L_57_, L_58_ = game.Workspace:FindPartOnRay(L_56_, game.Workspace)
                local L_59_ = math.floor((L_58_ - L_54_.Position).magnitude)
                L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
                L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_55_
                L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
                L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_59_
                table.insert(L_48_, L_59_)
            elseif getgenv().TeamCheck == false and L_53_forvar1.Team == L_31_.Team then
                local L_60_ =
                    (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                local L_61_ =
                    Ray.new(
                        game.Workspace.CurrentCamera.CFrame.p,
                        (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_60_
                    )
                local L_62_, L_63_ = game.Workspace:FindPartOnRay(L_61_, game.Workspace)
                local L_64_ = math.floor((L_63_ - L_54_.Position).magnitude)
                L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
                L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_60_
                L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
                L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_64_
                table.insert(L_48_, L_64_)
            end
        end
    end
    if unpack(L_48_) == nil then
        return nil
    end
    local L_49_ = math.floor(math.min(unpack(L_48_)))
    if L_49_ > getgenv().AimRadius then
        return nil
    end
    for L_65_forvar0, L_66_forvar1 in pairs(L_47_) do
        if L_66_forvar1.diff == L_49_ then
            return L_66_forvar1.plr
        end
    end
    return nil
end
L_32_.KeyDown:Connect(
    function(L_67_arg0)
        if L_67_arg0 == AimlockKey and L_41_ == nil then
            pcall(
                function()
                    if L_39_ ~= true then
                        L_39_ = true
                    end
                    local L_68_
                    L_68_ = GetNearestTarget()
                    if L_68_ ~= nil then
                        L_41_ = L_68_
                    end
                end
            )
        elseif L_67_arg0 == AimlockKey and L_41_ ~= nil then
            if L_41_ ~= nil then
                L_41_ = nil
            end
            if L_39_ ~= false then
                L_39_ = false
            end
        end
    end
)
L_29_.RenderStepped:Connect(
    function()
        if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
            if
                (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 or
                (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1
            then
                L_40_ = true
            else
                L_40_ = false
            end
        elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
            if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 then
                L_40_ = true
            else
                L_40_ = false
            end
        elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
            if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1 then
                L_40_ = true
            else
                L_40_ = false
            end
        end
        if L_38_ == true and L_39_ == true then
            if L_41_ and L_41_.Character and L_41_.Character:FindFirstChild(getgenv().AimPart) then
                if getgenv().FirstPerson == true then
                    if L_40_ == true then
                        if getgenv().PredictMovement == true then
                            L_33_.CFrame =
                                L_34_(
                                    L_33_.CFrame.p,
                                    L_41_.Character[getgenv().AimPart].Position +
                                    L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                )
                        elseif getgenv().PredictMovement == false then
                            L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
                        end
                    end
                elseif getgenv().ThirdPerson == true then
                    if L_40_ == true then
                        if getgenv().PredictMovement == true then
                            L_33_.CFrame =
                                L_34_(
                                    L_33_.CFrame.p,
                                    L_41_.Character[getgenv().AimPart].Position +
                                    L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                )
                        elseif getgenv().PredictMovement == false then
                            L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
                        end
                    end
                end
            end
        end
    end)
end)

aimlock:AddTextbox("Aimlock Key", nil, function(L_69_arg0)
	getgenv().AimlockKey = L_69_arg0
end)

aimlock:AddTextbox("Aimlock Prediction", nil, function(L_70_arg0)
    PredictionVelocity = L_70_arg0
end)

aimlock:AddDropdown("Aim Part", {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"}, "Head", false, function(L_71_arg0)
    getgenv().AimPart = L_71_arg0
end)

local othersection = AimingTab:CreateSector("", "left")
-- Aim Assist FOV Section --

local AimbotFOVSection = AimingTab:CreateSector("Fov Settings", "right")
AimbotFOVSection:AddToggle('Filled', false, function(Boolean)
    ZapSettings.Aiming.FOV.FOVFilled = Boolean
end)

AimbotFOVSection:AddSlider("Transparency", 0, 9, 9, 1, function(Value)
    ZapSettings.Aiming.FOV.Transparency = tonumber("0." .. Value)
end)

AimbotFOVSection:AddSlider("Silent Aim Size", 0, 100, 500, 1, function(Value)
    ZapSettings.Aiming.FOV.SilentAimSize = Value
end)

-- Target Aim Settings Section --

local TargetAimSettings = AimingTab:CreateSector("Target Aim Settings", "right")

local TargetBind = TargetAimSettings:AddKeybind("Keybind", false, function()
    
end, function()
    if ZapSettings.Aiming.TargetAim.Enabled then
        local NearestTarget, NearestDistance = NearestMouse()
        if NearestTarget and Visible(NearestTarget.Character.HumanoidRootPart, LocalPlayer.Character.HumanoidRootPart) then
            ZapSettings.Aiming.TargetAim.Target = NearestTarget.Name
            if ZapSettings.Aiming.TargetAimSettings.NotificationAlert then
                Notify({
                    Title = "Zap",
                    Description = "Target " .. NearestTarget.Name,
                    Duration = 3
                })
            end
        end
    end
end)

TargetAimSettings:AddToggle('Unlock Target Knocked', false, function(State)
    ZapSettings.Aiming.TargetAimSettings.UnlockTargetKnocked = State
end)

TargetAimSettings:AddToggle('Notification Alert', false, function(State)
    ZapSettings.Aiming.TargetAimSettings.NotificationAlert = State
end)

local TracerSettings = {
    TracerAimLock = {
        Enabled = true,
        Aimlockkey = "",
        Prediction = 0.135,
        Aimpart = 'Head',
        Notifications = true
    },
    Settings = {
        Thickness = 3,
        Transparency = 1,
        Color = Color3.fromRGB(204, 50, 50),
        FOV = true
    }
}

        local Inset = game:GetService("GuiService"):GetGuiInset().Y
        
        local Line = Drawing.new("Line")
        local Circle = Drawing.new("Circle")
        
        local Plr
        
        Mouse.KeyDown:Connect(function(KeyPressed)
            if KeyPressed == (TracerSettings.TracerAimLock.Aimlockkey) then
                if TracerSettings.TracerAimLock.Enabled == true then
                    TracerSettings.TracerAimLock.Enabled = false
                    if TracerSettings.TracerAimLock.Notifications == true then
                        Plr = FindClosestPlayer()
                        Notify({
                        Title = "Zap",
                        Description = "Unlocked",
                        Duration = 3
                        })
                    end
                else
                    Plr = FindClosestPlayer()
                    TracerSettings.TracerAimLock.Enabled = true
                    if TracerSettings.TracerAimLock.Notifications == true then
                        Notify({
                        Title = "Zap",
                        Description = "Target ".. tostring(Plr.Character.Humanoid.DisplayName),
                        Duration = 3
                        })
                    end
                end
            end
        end)
        
        function FindClosestPlayer()
            local ClosestDistance, ClosestPlayer = math.huge, nil;
            for _, Player in next, game:GetService("Players"):GetPlayers() do
                local ISNTKNOCKED = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
                local ISNTGRABBED = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil
        
                if Player ~= LocalPlayer then
                    local Character = Player.Character
                    if Character and Character.Humanoid.Health > 1 and ISNTKNOCKED and ISNTGRABBED then
                        local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
                                                                                                     .Position)
                        if IsVisibleOnViewPort then
                            local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                            if Distance < ClosestDistance then
                                ClosestPlayer = Player
                                ClosestDistance = Distance
                            end
                        end
                    end
                end
            end
            return ClosestPlayer, ClosestDistance
        end
        
        RunService.Heartbeat:connect(function()
            if TracerSettings.TracerAimLock.Enabled == true then
                local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[TracerSettings.TracerAimLock.Aimpart].Position +
                                                                      (Plr.Character[TracerSettings.TracerAimLock.Aimpart].Velocity *
                                                                      TracerSettings.TracerAimLock.Prediction))
                Line.Color = TracerSettings.Settings.Color
                Line.Transparency = TracerSettings.Settings .Transparency
                Line.Thickness = TracerSettings.Settings .Thickness
                Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
                Line.To = Vector2.new(Vector.X, Vector.Y)
                Line.Visible = true
                Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset)
                Circle.Visible = TracerSettings.Settings.FOV
                Circle.Thickness = 1.5
                Circle.Thickness = 2
                Circle.Radius = 60
                Circle.Color = TracerSettings.Settings.Color
            elseif TracerSettings.TracerAimLock.FOV == true then
                Circle.Visible = true
            else
                Circle.Visible = false
                Line.Visible = false
            end
        end)
        
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        mt.__namecall = newcclosure(function(...)
            local args = {...}
            if TracerSettings.TracerAimLock.Enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                args[3] = Plr.Character[TracerSettings.TracerAimLock.Aimpart].Position +
                              (Plr.Character[TracerSettings.TracerAimLock.Aimpart].Velocity * TracerSettings.TracerAimLock.Prediction)
        
                return old(unpack(args))
            end
            return old(...)
        end)

local TracerLockSection = AimingTab:CreateSector("Tracer Lock", "right")
TracerLockSection:AddToggle("Enabled", false, function(p)
    if p == true then
    TracerSettings.TracerAimLock.Enabled = true
    elseif p == false then
    TracerSettings.TracerAimLock.Enabled = false
    TracerSettings.Settings.FOV = false
    TracerSettings.TracerAimLock.Aimlockkey = ""
    end
end)

local ShowFovToggle = TracerLockSection:AddToggle("Show FOV", false, function(bool)
    TracerSettings.Settings.FOV = bool
end)
ShowFovToggle:AddColorpicker(Library.theme.accentcolor, function(Color)
    TracerSettings.Settings.Color = Color
end)


TracerLockSection:AddTextbox("Keybind", nil, function(Key)
    TracerSettings.TracerAimLock.Aimlockkey = Key
end)


local WhitelistSection = AimingTab:CreateSector("Target Aim Whitelist", "right")

WhitelistSection:AddToggle('Enabled', false, function(State)
    ZapSettings.Aiming.Whitelist.Enabled = State
end)

WhitelistSection:AddTextbox("Player Username", nil, function(Text)
    if Text ~= nil and Find(Text) ~= nil and Players:FindFirstChild(Find(Text)) then
        ZapSettings.Aiming.Whitelist.Holder = Find(Text)
    else
        Notify({
            Title = "Zap",
            Description = "Player not found.",
            Duration = 3
        })
    end
end)

WhitelistSection:AddButton('Whitelist', function(State)
    if ZapSettings.Aiming.Whitelist.Holder ~= nil and Players:FindFirstChild(ZapSettings.Aiming.Whitelist.Holder) then
        if table.find(ZapSettings.Aiming.Whitelist.Players, ZapSettings.Aiming.Whitelist.Holder) then
            Notify({
                Title = "Zap",
                Description = ZapSettings.Aiming.Whitelist.Holder .. " is whitelisted.",
                Duration = 3
            })
        else
            Insert(ZapSettings.Aiming.Whitelist.Players, ZapSettings.Aiming.Whitelist.Holder)
            Notify({
                Title = "Zap",
                Description = "Whitelisted " .. ZapSettings.Aiming.Whitelist.Holder,
                Duration = 3
            })
        end
    else
        Notify({
            Title = "Zap",
            Description = "Player not found.",
            Duration = 3
        })
    end
end)

WhitelistSection:AddButton('Unwhitelist', function()
    if ZapSettings.Aiming.Whitelist.Holder ~= nil and Players:FindFirstChild(ZapSettings.Aiming.Whitelist.Holder) then
        if table.find(ZapSettings.Aiming.Whitelist.Players, ZapSettings.Aiming.Whitelist.Holder) then
            Remove(ZapSettings.Aiming.Whitelist.Players, ZapSettings.Aiming.Whitelist.Holder)
            Notify({
                Title = "Zap",
                Description = "Removed " .. ZapSettings.Aiming.Whitelist.Holder,
                Duration = 5
            })
        else
            Notify({
                Title = "Zap",
                Description = ZapSettings.Aiming.Whitelist.Holder .. " is not whitelisted.",
                Duration = 5
            })
        end
    else
        Notify({
            Title = "Zap",
            Description = "Player is not found",
            Duration = 3
        })
    end
end)

WhitelistSection:AddToggle('Whitelist Crew', false, function(State)
    ZapSettings.Aiming.Whitelist.CrewEnabled = State
end)

WhitelistSection:AddToggle('Whitelist Friends', false, function(State)
    ZapSettings.Aiming.Whitelist.FriendsWhitelist = State
end)

local othersection = AimingTab:CreateSector("", "right")
othersection:AddLabel("")
othersection:AddLabel("")

-- Blatant Tab --

local BlatantTab = Window:CreateTab("Character")

local MovementSector = BlatantTab:CreateSector("Speed", "right")

local BlatantAntiAimSector = BlatantTab:CreateSector("Anti Aim", "left")

local SpeedToggle = MovementSector:AddToggle('Enabled', false, function(State)
    ZapSettings.Blatant.Movement.SpeedEnabled = State
end)
SpeedToggle:AddKeybind()

SpeedToggle:AddSlider(0, 5, 10, 1, function(Value)
    ZapSettings.Blatant.Movement.SpeedAmount = Value
end)

MovementSector:AddDropdown("Speed Type", {"CFrame"}, "CFrame", false, function(Value)
    ZapSettings.Blatant.Movement.SpeedType = Value
end)

MovementSector:AddDropdown("Speed Render Type", {"Default", "Fast"}, "Default", false, function(Value)
    ZapSettings.Blatant.Movement.SpeedRenderType = Value
end)

local AntiAimToggle = BlatantAntiAimSector:AddToggle('Enabled', false, function(State)
    ZapSettings.Blatant.BlatantAA.Enabled = State
end)

AntiAimToggle:AddKeybind()

BlatantAntiAimSector:AddToggle('No Rotate', false, function(State)
    ZapSettings.Blatant.BlatantAA.NoAutoRotate = State
end)

local UndergroundWallBangToggle = BlatantAntiAimSector:AddToggle('Float Underground', false, function(State)
    pcall(function()
        if State then
			wait(0.5)
			Float = Instance.new("BodyVelocity")
			Float.Parent = LocalPlayer.Character.HumanoidRootPart
			Float.MaxForce = Vector3.new(100000, 100000, 100000)
			Float.Velocity = Vector3.new(0, 0, 0)
			wait(0.25)
			LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -9.5, 0)
			Cham(LocalPlayer, true)
			ZapSettings.Blatant.BlatantAA.UndergroundWallbang = true
            SpeedToggle:Set(true)
		else
			LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 9.5, 0)
			Cham(LocalPlayer, false)
			Float:Destroy()
			ZapSettings.Blatant.BlatantAA.UndergroundWallbang = false
            SpeedToggle:Set(false)
		end
    end)
end)

UndergroundWallBangToggle:AddKeybind()

local FlyWallBangToggle = BlatantAntiAimSector:AddToggle('Float Sky', false, function(State)
    pcall(function()
        if State then
			wait(0.5)
			Float = Instance.new("BodyVelocity")
			Float.Parent = LocalPlayer.Character.HumanoidRootPart
			Float.MaxForce = Vector3.new(100000, 100000, 100000)
			Float.Velocity = Vector3.new(0, 0, 0)
			wait(0.25)
			LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 65.5, 0)
			Cham(LocalPlayer, true)
			ZapSettings.Blatant.BlatantAA.UndergroundWallbang = true
            SpeedToggle:Set(true)
		else
			LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 9.5, 0)
			Cham(LocalPlayer, false)
			Float:Destroy()
			ZapSettings.Blatant.BlatantAA.UndergroundWallbang = false
            SpeedToggle:Set(false)
		end
    end)
end)
FlyWallBangToggle:AddKeybind()

BlatantAntiAimSector:AddDropdown("Type", {"Jitter", "Spin"}, "Jitter", false, function(Value)
    ZapSettings.Blatant.BlatantAA.AntiAimType = Value
end)

BlatantAntiAimSector:AddSlider("Anti Aim Speed", 0, 100, 300, 1, function(Value)
    ZapSettings.Blatant.BlatantAA.AntiAimSpeed = Value
end)

BlatantAntiAimSector:AddSlider("Jitter Angle", 0, 180, 360, 1, function(Value)
    ZapSettings.Blatant.BlatantAA.JitterAngle = Value
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/esp.lua"))()
ESP:Toggle(false)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false

local EspSector = BlatantTab:CreateSector("Esp", "left")

local espToggle = EspSector:AddToggle("Enabled", false, function(bool)
    ESP:Toggle(bool)
end)

local tracersToggle = EspSector:AddToggle("Tracers", false, function(bool)
    ESP.Tracers = bool
end)

local namesToggle = EspSector:AddToggle("Names", false, function(bool)
    ESP.Names = bool
end)

local boxesToggle = EspSector:AddToggle("Boxes", false, function(bool)
    ESP.Boxes = bool
end)
espToggle:AddKeybind()

local GodModeSector = BlatantTab:CreateSector("God Mode", "left")

GodModeSector:AddButton("Gun", function()
    ZapModule.God.GodBullet = true
    NilBody()
end)

GodModeSector:AddButton("Melee", function()
    ZapModule.God.GodMelee = true
    NilBody()
end)

GodModeSector:AddButton("Anti Ragdoll", function()
    ZapModule.God.AntiRagdoll = true
    NilBody()
end)

GodModeSector:AddButton("God Block", function()
    pcall(function()
        LocalPlayer.Character.BodyEffects.Defense.CurrentTimeBlock:Destroy()
    end)
end)

local ReachingSector = BlatantTab:CreateSector("Reaching", "left")

local fistsreach = ReachingSector:AddToggle("Reach", nil, function(e)
    if e == true then
        game:GetService('RunService'):BindToRenderStep("Reach", 0 , function()
            local success, err = pcall(function()
                if game.Players.LocalPlayer.Character.BodyEffects.Attacking.Value == true then
                    for i,v in pairs(game:GetService('Players'):GetChildren()) do
                        if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
                            if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild('Handle') then
                                    firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, v.Character.UpperTorso, 0)
                                else
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
                                end
                            end
                        end
                    end
                end
            end)
        end)
    elseif e == false then
        game:GetService('RunService'):UnbindFromRenderStep("Reach")
    end
end)
fistsreach:AddKeybind()


local CharacterSector = BlatantTab:CreateSector("Toggles", "right")

CharacterSector:AddToggle('Anti Stomp', false, function(State)
    ZapSettings.Blatant.Character.AntiStomp = State
end)

CharacterSector:AddDropdown("Anti Stomp Type", {"Nil Char"}, "Nil Char", false, function(State)
    ZapSettings.Blatant.Character.AntiStompType = State
end)

CharacterSector:AddToggle('Anti Bag', false, function(State)
    ZapSettings.Blatant.Character.AntiBag = State
end)

CharacterSector:AddToggle('Anti Grab', false, function(State)
    ZapSettings.Blatant.Character.AntiGrab = State
end)

CharacterSector:AddToggle("Auto Stomp", nil, function(r)
    if r == true then
        game:GetService('RunService'):BindToRenderStep("Auto-Stomp", 0 , function()
            game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
        end)
    elseif r == false then
        game:GetService('RunService'):UnbindFromRenderStep("Auto-Stomp")
    end
end)

CharacterSector:AddToggle('Auto Armor', false, function(State)
    ZapSettings.Blatant.Character.AutoArmor = State
end)

CharacterSector:AddToggle('Auto Reload', false, function(State)
    ZapSettings.Blatant.Character.AutoReload = State
end)

CharacterSector:AddToggle("Cash Aura", false, function(State)
    ZapSettings.Blatant.Cash.AutoPickCash = State
end)

local FarmingSector = BlatantTab:CreateSector("Farming", "right")

FarmingSector:AddToggle('Shoe Farm', false, function(State)
    ZapSettings.Blatant.Farming.ShoeFarm = State
end)

FarmingSector:AddToggle('ATM Farm', false, function(State)
    ZapSettings.Blatant.Farming.ATMFarm = State
end)

FarmingSector:AddToggle('Hospital Farm', false, function(State)
    ZapSettings.Blatant.Farming.HospitalFarm = State
end)

local BoxFarmToggle = FarmingSector:AddToggle('Box Farm', false, function(State)
    ZapSettings.Blatant.Farming.BoxFarm = State
end)
BoxFarmToggle:AddKeybind()

FarmingSector:AddToggle('Muscle Farm', false, function(State)
    ZapSettings.Blatant.Farming.MuscleFarm = State
end)

FarmingSector:AddDropdown("Muscle Farming Type", {"Normal", "Heavy"}, "Normal", false, function(State)
    ZapSettings.Blatant.Farming.MuscleFarmingType = State
end)


FarmingSector:AddToggle('Auto Lettuce', false, function(State)
    ZapSettings.Blatant.Character.AutoLettuce = State
end)

local CashSector = BlatantTab:CreateSector("Selling", "left")

local AutoDropToggle = CashSector:AddToggle("Auto Drop", false, function(State)
    ZapSettings.Blatant.Cash.AutoDrop = State
end)

AutoDropToggle:AddSlider(1000, 1000, 10000, 1, function(Value)
    ZapSettings.Blatant.Cash.AutoDropAmount = Value
end)

-- Auto Buy Tab --

local TeleportTab = Window:CreateTab("Teleports")

local TeleportModule = {
    Food = ZapModule.Teleport.Food[1],
    Gun = ZapModule.Teleport.Gun[1],
    Location = ZapModule.Teleport.Location[1],
    Armor = ZapModule.Teleport.Armor[1],
    Melee = ZapModule.Teleport.Melee[1],
    Extra = ZapModule.Teleport.Extra[1],
    Bike = ZapModule.Teleport.Bike[1],
    Mask = ZapModule.Teleport.Mask[1],
    Phone = ZapModule.Teleport.Phone[1],
    Weight = ZapModule.Teleport.Weight[1],
    AutoSet = {
        Tools = {}
    }
}

local FoodSector = TeleportTab:CreateSector("Food Teleport", "left")
FoodSector:AddDropdown("Food Selection", ZapModule.Teleport.Food, ZapModule.Teleport.Food[1], false, function(Value)
    TeleportModule.Food = Value
end)

FoodSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Food))
end)

local GunSector = TeleportTab:CreateSector("Gun Teleport", "left")
GunSector:AddDropdown("Gun Selection", ZapModule.Teleport.Gun, ZapModule.Teleport.Gun[1], false, function(Value)
    TeleportModule.Gun = Value
end)

GunSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Gun))
    spawn(function()
        for i = 1, ZapSettings.Teleport.AmmoPurchaseAmount do
            TeleportBuy(ToolAmmo(TeleportModule.Gun))
            wait(1)
        end
    end)
end)

local ArmorSector = TeleportTab:CreateSector("Armor Teleport", "left")
ArmorSector:AddDropdown("Armor Selection", ZapModule.Teleport.Armor, ZapModule.Teleport.Armor[1], false, function(Value)
    TeleportModule.Armor = Value
end)

ArmorSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Armor))
end)

local MeleeSector = TeleportTab:CreateSector("Melee Teleport", "left")
MeleeSector:AddDropdown("Melee Selection", ZapModule.Teleport.Melee, ZapModule.Teleport.Melee[1], false, function(Value)
    TeleportModule.Melee = Value
end)

MeleeSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Melee))
end)

local ExtraSector = TeleportTab:CreateSector("Extra Teleport", "left")
ExtraSector:AddDropdown("Extra Selection", ZapModule.Teleport.Extra, ZapModule.Teleport.Extra[1], false, function(Value)
    TeleportModule.Extra = Value
end)

ExtraSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Extra))
end)

local BikeSector = TeleportTab:CreateSector("Bike Teleport", "left")
BikeSector:AddDropdown("Bike Selection", ZapModule.Teleport.Bike, ZapModule.Teleport.Bike[1], false, function(Value)
    TeleportModule.Bike = Value
end)

BikeSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Bike))
end)

local MaskSector = TeleportTab:CreateSector("Mask Teleport", "left")
MaskSector:AddDropdown("Mask Selection", ZapModule.Teleport.Mask, ZapModule.Teleport.Mask[1], false, function(Value)
    TeleportModule.Mask = Value
end)

MaskSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Mask))
end)

local PhoneSector = TeleportTab:CreateSector("Phone Teleport", "left")
PhoneSector:AddDropdown("Phone Selection", ZapModule.Teleport.Phone, ZapModule.Teleport.Phone[1], false, function(Value)
    TeleportModule.Phone = Value
end)

PhoneSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Phone))
end)

local WeightSector = TeleportTab:CreateSector("Weight Teleport", "left")
WeightSector:AddDropdown("Weight Selection", ZapModule.Teleport.Weight, ZapModule.Teleport.Weight[1], false, function(Value)
    TeleportModule.Weight = Value
end)

WeightSector:AddButton("Teleport", function()
    TeleportBuy(ToolName(TeleportModule.Weight))
end)

local TeleportSettings = TeleportTab:CreateSector("Teleport Settings", "right")
TeleportSettings:AddToggle("Teleport Back", false, function(State)
    ZapSettings.Teleport.TeleportReturn = State
end)

TeleportSettings:AddSlider("Teleport Back Delay", 0, 1, 100, 1, function(Value)
    ZapSettings.Teleport.ReturnDelay = Value
end)

TeleportSettings:AddToggle("Auto Purchase", false, function(State)
    ZapSettings.Teleport.AutoPurchase = State
end)

TeleportSettings:AddSlider("Ammo Purchase Amount", 0, 1, 100, 1, function(Value)
    ZapSettings.Teleport.AmmoPurchaseAmount = Value
end)

local AutoSetTab = TeleportTab:CreateSector("Set", "right")
for i, v in pairs(ZapModule.Teleport.Armor) do
    AutoSetTab:AddToggle(v, false, function(State)
        if State then
            if not table.find(TeleportModule.AutoSet.Tools, v) then
                table.insert(TeleportModule.AutoSet.Tools, v)
            end
        else
            Remove(TeleportModule.AutoSet.Tools, v)
        end
    end)
end

for i, v in pairs(ZapModule.Teleport.Gun) do
    AutoSetTab:AddToggle(v, false, function(State)
        if State then
            if not table.find(TeleportModule.AutoSet.Tools, v) then
                table.insert(TeleportModule.AutoSet.Tools, v)
            end
        else
            Remove(TeleportModule.AutoSet.Tools, v)
        end
    end)
end

AutoSetTab:AddButton("Teleport", function()
    if Alive(LocalPlayer) then
        for i, v in pairs(TeleportModule.AutoSet.Tools) do
            if string.find(v:lower(), "armor") then
                if ZapSettings.Teleport.ArmorValueCheck and LocalPlayer.Character.BodyEffects.Armor.Value < 0 then
                    TeleportBuy(ToolName(v, true))
                else
                    TeleportBuy(ToolName(v, true))
                end
            else
                TeleportBuy(ToolName(v, true))
                spawn(function()
                    for i = 1, ZapSettings.Teleport.AmmoPurchaseAmount do
                        TeleportBuy(ToolAmmo(v), true)
                        wait(1)
                    end
                end)
            end
        end
    end
end)

-- Miscellaneous Window --
local MiscellaneousTab = Window:CreateTab("Miscellaneous")

LocalPlayer.CharacterAdded:Connect(function()
    wait(0.5)
    ZapModule.God.GodMeleeAlive = false
    if LocalPlayer.Character:FindFirstChild("BodyEffects") then
        if ZapModule.God.GodBullet then
            GodFunction(ZapModule.God.GodBullet)
            LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
        end
        if ZapModule.God.GodMelee then
            GodFunction(ZapModule.God.GodMelee)
            ZapModule.God.GodMeleeAlive = true
            LocalPlayer.Character.BodyEffects.Armor:Destroy()
            LocalPlayer.Character.BodyEffects.Defense:Destroy()
        end
        if ZapModule.God.AntiRagdoll then
            GodFunction(ZapModule.God.AntiRagdoll)
        end
    end
    wait(0.5)
    if ZapSettings.Blatant.BlatantAA.Underground then
        Underground(true)
    end
    wait(0.4)
    if ZapSettings.Blatant.BlatantAA.UndergroundWallbang then
        Float = Instance.new("BodyVelocity")
        Float.Parent = LocalPlayer.Character.HumanoidRootPart
        Float.MaxForce = Vector3.new(100000, 100000, 100000)
        Float.Velocity = Vector3.new(0, 0, 0)
        wait(0.25)
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -11.5, 0)
        Cham(LocalPlayer, true)
        ZapSettings.Blatant.BlatantAA.UndergroundWallbang = true
    end
    LocalPlayer.Character.Animate.idle.Animation1.AnimationId = AnimationModule[AnimationState.Idle][1]
    LocalPlayer.Character.Animate.idle.Animation2.AnimationId = AnimationModule[AnimationState.Idle][2]
    LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = AnimationModule[AnimationState.Walk][3]
    LocalPlayer.Character.Animate.run.RunAnim.AnimationId = AnimationModule[AnimationState.Run][4]
    LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = AnimationModule[AnimationState.Jump][5]
    LocalPlayer.Character.Animate.climb.ClimbAnim.AnimationId = AnimationModule[AnimationState.Climb][6]
    LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = AnimationModule[AnimationState.Fall][7]
    for i, v in pairs(AnimationState) do
        print(i, v)
    end
end)

local AnimationSector = MiscellaneousTab:CreateSector("Animation", "left")
AnimationSector:AddDropdown("Idle", AnimationsName, "Default", false, function(State)
    if Alive(LocalPlayer) then
        LocalPlayer.Character.Animate.idle.Animation1.AnimationId = AnimationModule[State][1]
        LocalPlayer.Character.Animate.idle.Animation2.AnimationId = AnimationModule[State][2]
        AnimationState.Idle = State
    end
end)

AnimationSector:AddDropdown("Walk", AnimationsName, "Default", false, function(State)
    if Alive(LocalPlayer) then
        LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = AnimationModule[State][3]
        AnimationState.Walk = State
    end
end)

AnimationSector:AddDropdown("Run", AnimationsName, "Default", false, function(State)
    if Alive(LocalPlayer) then
        LocalPlayer.Character.Animate.run.RunAnim.AnimationId = AnimationModule[State][4]
        AnimationState.Run = State
    end
end)

AnimationSector:AddDropdown("Jump", AnimationsName, "Default", false, function(State)
    if Alive(LocalPlayer) then
        LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = AnimationModule[State][5]
        AnimationState.Jump = State
    end
end)

AnimationSector:AddDropdown("Climb", AnimationsName, "Default", false, function(State)
    if Alive(LocalPlayer) then
        LocalPlayer.Character.Animate.climb.ClimbAnim.AnimationId = AnimationModule[State][6]
        AnimationState.Climb = State
    end
end)

AnimationSector:AddDropdown("Fall", AnimationsName, "Default", false, function(State)
    if Alive(LocalPlayer) then
        LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = AnimationModule[State][7]
        AnimationState.Fall = State
    end
end)

local ScriptsSection = MiscellaneousTab:CreateSector("Scripts", "right")

local fpsboost = ScriptsSection:AddButton('Low gfx', function(state)
    if state then
    
        local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
        local g = game
        local w = g.Workspace
        local l = g.Lighting
        local t = w.Terrain
        t.WaterWaveSize = 0
        t.WaterWaveSpeed = 0
        t.WaterReflectance = 0
        t.WaterTransparency = 0
        l.GlobalShadows = false
        l.FogEnd = 9e9
        l.Brightness = 0
        settings().Rendering.QualityLevel = "Level01"
        for i, v in pairs(g:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
                v.TextureID = 10385902758728957
            end
        end
        for i, e in pairs(l:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end
    else
      end
    wait(2)
    Notify({
        Title = "Zap",
        Description = "Fps boost enabled!",
        Duration = 3
    })
end)

local rejoin = ScriptsSection:AddButton("Rejoin", function(State)
    Notify({
        Title = "Zap",
        Description = "Rejoining...",
        Duration = 3
    })
    wait(1.5)
    loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
end)
    
local hop = ScriptsSection:AddButton("Server hop", function(State)
    Notify({
        Title = "Zap",
        Description = "Searching for server...",
        Duration = 3
    })
    wait(2)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/serverhop.lua'))()
end)
local trash = ScriptsSection:AddButton("Trash Talk", function(State)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/trash_talk.lua"))()
    Notify({
        Title = "Zap",
        Description = "Trash talk keybind is J!",
        Duration = 3
    })
end)

local macro = ScriptsSection:AddButton("Fake Macro", function(State)
   loadstring(game:HttpGet("https://pastebin.com/raw/yMmUUyyE"))()
   Notify({
    Title = "Zap",
    Description = "Fake macro keybind is Z!",
    Duration = 3
})
end)

local fly = ScriptsSection:AddButton("Fly", function(State)
    Notify({
        Title = "Zap",
        Description = "Fly keybind is X!",
        Duration = 3
    })
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/fly.lua"))()
end)

local fullbright = ScriptsSection:AddButton("Full Bright", function(State)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/full_bright.lua"))()
end)

local nocooldown = ScriptsSection:AddButton("No jump cooldown", function(State)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/no-jump-cooldown.lua'))()
end)
    

local reset = ScriptsSection:AddButton("Reset Character", function(reset)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

local idepomilion = ScriptsSection:AddButton('Sing', function(State)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Mam głód pierdolę wszystko","All")
wait(1)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ty stój kiedy idę po milion","All")
wait(1.2)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("jxak znxów coś mi nie wyszło","All")
wait(1.3)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("i huj nadal idę po milion","All")
wait(0.7)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("już nie czekam na przyszłość ","All")
wait(0.8)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("alxe nie mów nic bo","All")
wait(0.9)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("bo bo idę po milion", "All")
end)

local ben = ScriptsSection:AddButton("Ben Talk", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/ben.lua"))()
    Notify({
        Title = "Zap",
        Description = "Ben Talk keybind is K!",
        Duration = 3
    })
end)


local panic = ScriptsSection:AddButton("Rage quit", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/eksotopro/holders/main/ragequit.lua'))()
end)

local speedboost = ScriptsSection:AddButton("Speed", function()
    plr = game:GetService('Players').LocalPlayer
    down = true
     
    function onButton1Down(mouse)
        down = true
        while down do
            if not down then break end
            local char = plr.Character
            char.HumanoidRootPart.Velocity = char.HumanoidRootPart.CFrame.lookVector * 190
            wait()
        end
    end
     
    function onButton1Up(mouse)
        down = false
    end
     
    function onSelected(mouse)
        mouse.KeyDown:connect(function(m) if m:lower()=="c"then onButton1Down(mouse)end end)
        mouse.KeyUp:connect(function(m) if m:lower()=="c"then onButton1Up(mouse)end end)
    end
    onSelected(game.Players.LocalPlayer:GetMouse())
    Notify({
        Title = "Zap",
        Description = "Speed keybind is C!",
        Duration = 3
    })
end)
getgenv().Multiplier = -0.27
local antilock = ScriptsSection:AddButton("Antilock", function()
    Notify({
        Title = "Zap",
        Description = "Anti lock keybind is H!",
        Duration = 3
    })
    local userInput = game:service('UserInputService')
    local runService = game:service('RunService')
    userInput.InputBegan:connect(function(Key)
    if Key.KeyCode == Enum.KeyCode.H then
        Enabled = not Enabled
        if Enabled == true then
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().Multiplier
                runService.Stepped:wait()
            until Enabled == false
        end
    end
end)
end)

local antilockfix = ScriptsSection:AddButton("Fix Antilock", function()
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                wait(0.1)
                if child:FindFirstChild("LocalScript") then
                    child.LocalScript:FireServer()
                end
            end
        end)
    end)
    Notify({
        Title = "Zap",
        Description = "Anti lock should be fixed!",
        Duration = 3
    })
end)


if syn then
    MiscellaneousTab:CreateConfigSystem("left")
else
    Notify({
        Title = "Zap",
        Description = "Executor Doesn't Support Configs.",
        Duration = 3
    })
end

local CreditsSection = MiscellaneousTab:CreateSector("Developers", "right")
local discord = CreditsSection:AddButton("Our Team", function(bool)
    setclipboard("grek#1337 <@557595801682182147> | $ Adxn#0001 <@818413928841084938> | https://ekso.gq/")
    Notify({
        Title = "Zap",
        Description = "Team copied on clipboard!",
        Duration = 3
    })
end)

local discord1 = CreditsSection:AddButton("grek#1337", function(bool)
    setclipboard("grek#1337 <@557595801682182147>")
    Notify({
        Title = "Zap",
        Description = "Staff member copied on clipboard!",
        Duration = 3
    })
end)

local discord2 = CreditsSection:AddButton("$ Adxn#0001", function(bool)
    setclipboard("$ Adxn#0001 <@818413928841084938>")
    Notify({
        Title = "Zap",
        Description = "Staff member copied on clipboard!",
        Duration = 3
    })
end)

Notify({
    Title = "Zap",
    Description = "Finished Loading!",
    Duration = 3
})

for _, v in next, Players:GetPlayers() do
    if v ~= LocalPlayer and v:IsFriendsWith(LocalPlayer.UserId) then
        Insert(ZapSettings.Aiming.Whitelist.Friends, v.Name)
    end
end

Players.PlayerAdded:Connect(function(_Player)
    if _Player ~= LocalPlayer and _Player:IsFriendsWith(LocalPlayer.UserId) then
        Insert(ZapSettings.Aiming.Whitelist.Friends, _Player.Name)
    end
end)

Players.PlayerRemoving:Connect(function(_Player)
    if _Player ~= LocalPlayer and _Player:IsFriendsWith(LocalPlayer.UserId) then
        Remove(ZapSettings.Aiming.Whitelist.Friends, _Player.Name)
    end
end)

function NoSpace(Data)
    return Data:gsub("%s+", "") or Data
end
    
function Find(Data)
    local Target = nil
    
    for i, v in next, Players:GetPlayers() do
        if v.Name ~= LocalPlayer.Name and v.Name:lower():match('^'.. NoSpace(Data):lower()) then
            Target = v.Name
        end
    end
    
    return Target
end

function Alive(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") ~= nil and Player.Character:FindFirstChild("Humanoid") ~= nil and Player.Character:FindFirstChild("Head") ~= nil then
        return true
    end
    return false
end

function Knocked(Player)
    if Alive(Player) then
        if Player.Character.BodyEffects["K.O"].Value then
            return true
        end
        return false
    end
    return false
end

function Grabbing(Player)
    if Alive(Player) then
        if Player.Character:FindFirstChild("GRABBING_CONSTRAINT") then
            return true
        end
        return false
    end
    return false
end

function NearestDistance()
    local Target = nil
    local Distance = math.huge
    
    for i, v in next, Players:GetPlayers() do
        if v ~= LocalPlayer and Alive(LocalPlayer) and Alive(v) then
            local DistanceFromPlayer = (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if Distance > DistanceFromPlayer then
                if (not ZapSettings.Aiming.Whitelist.FriendsWhitelist or not table.find(ZapSettings.Aiming.Whitelist.Friends, v.Name)) and (not ZapSettings.Aiming.Whitelist.CrewEnabled or v:FindFirstChild("DataFolder") and v.DataFolder.Information:FindFirstChild("Crew") and not tonumber(v.DataFolder.Information.Crew.Value) == tonumber(LocalPlayer.DataFolder.Information.Crew.Value)) and (not ZapSettings.Aiming.Whitelist.Enabled or not table.find(ZapSettings.Aiming.Whitelist.Players, v.Name)) then
                    Target = v
                    Distance = DistanceFromPlayer
                end
            end
        end
    end

    return Target, Distance
end

function NearestMouse()
    local Target = nil
    local Distance = math.huge

    for i, v in next, Players:GetPlayers() do
        if v ~= LocalPlayer and Alive(LocalPlayer) and Alive(v) then
            local RootPosition, RootVisible = CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local DistanceFromMouse = (Vector2.new(RootPosition.X, RootPosition.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            if RootVisible and Distance > DistanceFromMouse then
                if (not ZapSettings.Aiming.Whitelist.FriendsWhitelist or not table.find(ZapSettings.Aiming.Whitelist.Friends, v.Name)) and (not ZapSettings.Aiming.Whitelist.CrewEnabled or v:FindFirstChild("DataFolder") and v.DataFolder.Information:FindFirstChild("Crew") and not tonumber(v.DataFolder.Information.Crew.Value) == tonumber(LocalPlayer.DataFolder.Information.Crew.Value)) and (not ZapSettings.Aiming.Whitelist.Enabled or not table.find(ZapSettings.Aiming.Whitelist.Players, v.Name)) then
                    Target = v
                    Distance = DistanceFromMouse
                end
            end
        end
    end

    return Target, Distance
end

function NearestType(Type)
    if Type == "Distance" then
        return NearestDistance()
    elseif Type == "Mouse" then
        return NearestMouse()
    end
end

function Jitter(Speed, Angle)
    if Alive(LocalPlayer) then
        local Jit = Speed or math.random(30, 90)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.CFrame.Position) * CFrame.Angles(0, math.rad(Angle) + math.rad((math.random(1, 2) == 1 and Jit or -Jit)), 0) 
    end
end

function TableLowerFind(Table, CurrentName)
    local TableName
    for i, v in pairs(Table) do
        if string.find(CurrentName:gsub("%[", ""):gsub("%]", ""):lower(), v:lower()) then
            TableName = v
        end
    end
    return TableName
end
    
function Spin(Speed)
    if Alive(LocalPlayer) then
        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(Speed), 0)
    end
end

function TeleportBuy(Target, AutoSetDelay)
    if workspace.Ignored.Shop:FindFirstChild(Target) and Alive(LocalPlayer) then
        ZapModule.Old.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.05)
        LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Ignored.Shop[Target].Head.CFrame * CFrame.new(0, 3, 0)
        wait(0.15)
        if ZapSettings.Teleport.AutoPurchase then
            for i = 1, 10 do
                fireclickdetector(Workspace.Ignored.Shop[Target].ClickDetector)
            end
        end
        if ZapSettings.Teleport.TeleportReturn then
            wait(ZapSettings.Teleport.ReturnDelay)
            LocalPlayer.Character.HumanoidRootPart.CFrame = ZapModule.Old.CFrame  
        end
        if AutoSetDelay then
            wait(1)
        end
    end
end

function Buy(Target, Delay, LagBack)
    if workspace.Ignored.Shop:FindFirstChild(Target) and Alive(LocalPlayer) then
        ZapModule.Old.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.05)
        LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Ignored.Shop[Target].Head.CFrame * CFrame.new(0, 3, 0)
        wait(0.15)
        for i = 1, 3 do
            fireclickdetector(Workspace.Ignored.Shop[Target].ClickDetector)
        end
        if LagBack then
            wait(1)
            LocalPlayer.Character.HumanoidRootPart.CFrame = ZapModule.Old.CFrame  
        end
        if Delay ~= nil then
            wait(Delay)
        end
    end
end

function Visible(OriginPart, Part)
    if Alive(LocalPlayer) then
        local IgnoreList = {CurrentCamera, LocalPlayer.Character, OriginPart.Parent}
        local Parts = CurrentCamera:GetPartsObscuringTarget({OriginPart.Position, Part.Position}, IgnoreList)
    
        for i, v in pairs(Parts) do
            if v.Transparency >= 0.3 then
                ZapModule.Instance[#ZapModule.Instance + 1] = v
            end
    
            if v.Material == Enum.Material.Glass then
                ZapModule.Instance[#ZapModule.Instance + 1] = v
            end
        end
    
        return #Parts == 0
    end
    return true
end

function ToolName(Name)
    for Check = 1, 100000 do
        if Workspace.Ignored.Shop:FindFirstChild("[" .. Name .. "] - $" .. Check) then
            return tostring("[" .. Name .. "] - $" .. Check)
        end
    end
end

function ToolAmmo(Name)
    for Check1 = 1, 250 do
        for Check2 = 1, 250 do
            if Workspace.Ignored.Shop:FindFirstChild(Check1 .. " [" .. Name .. " Ammo] - $" .. Check2) then
                return tostring(Check1 .. " [" .. Name .. " Ammo] - $" .. Check2)
            end
        end
    end
end

function Invisible()
    if Alive(LocalPlayer) then
        ZapModule.Old.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        print(ZapModule.Old.CFrame)
        wait(0.1)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 96995694596945934234234234, 0)
        wait(0.1)
        LocalPlayer.Character.LowerTorso.Root:Destroy()
        for _, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("MeshPart") and not table.find(ZapModule.Ignores, v.Name) then
                v:Destroy()
            end
        end
        wait(0.1)
        LocalPlayer.Character.HumanoidRootPart.CFrame = ZapModule.Old.CFrame
    end
end

function NilBody()
    if Alive(LocalPlayer) then
        for i, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart") then
                if v.Name ~= "HumanoidRootPart" then
                    v:Destroy()
                end
            end
        end
    end
end

function ChanceTable(Table)
    local Chance = 0
    for i, v in pairs(Table) do
        Chance = Chance + v
    end
    Chance = math.random(0, Chance)
    for i, v in pairs(Table) do
        Chance = Chance - v
        if Chance <= 0 then
            return i
        end
    end	
end

function RandomTable(Table)
    local Values = 0
    for i, v in pairs(Table) do
        Values = i
    end
    
    return Table[math.random(1, Values)]
end

function Remove(Data, Data2)
    for i, v in pairs(Data) do
        if v == Data2 then
            table.remove(Data, i)
        end
    end
end

function IsVisible(GetPosition, IgnoreLists)
    return #CurrentCamera:GetPartsObscuringTarget({game.Players.LocalPlayer.Character.Head.Position, GetPosition}, IgnoreLists) == 0 and true or false
end

function GodFunction(Variable)
    LocalPlayer.Character.RagdollConstraints:Destroy()
    local Folder = Instance.new("Folder", LocalPlayer.Character)
    Folder.Name = "FULLY_LOADED_CHAR"
    wait()
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    Variable = false
end

function Cham(Data, State)
    local BoxVar = nil
    local GlowVar = nil
    if State then
        for _, v in pairs(Data.Character:GetChildren()) do
            if v:IsA("BasePart") and v.Transparency ~= 1 then
                if not v:FindFirstChild("Box") then
                    BoxVar = Instance.new("BoxHandleAdornment", v)
                    BoxVar.Name = "Box"
                    BoxVar.AlwaysOnTop = true
                    BoxVar.ZIndex = 4
                    BoxVar.Adornee = v
                    BoxVar.Color3 = Color3.fromRGB(153, 0, 0)
                    BoxVar.Transparency = 0.5
                    BoxVar.Size = v.Size + Vector3.new(0.02, 0.02, 0.02)
                end
            end
        end
    else
        for i, v in pairs(Data.Character:GetChildren()) do
            if v:IsA("BasePart") and v.Transparency ~= 1 then
                if v:FindFirstChild("Box") then
                    v["Box"]:Destroy()
                end
            end
        end
        
        return BoxVar, GlowVar
    end
end

UserInputService.InputBegan:Connect(function(Key, Event)
    if Key.UserInputType == Enum.UserInputType.MouseButton2 and not Event then
        ZapSettings.Aiming.Aimbot.IsAiming = true
    end
end)

UserInputService.InputEnded:Connect(function(Key, Event)
    if Key.UserInputType == Enum.UserInputType.MouseButton2 and not Event then
        ZapSettings.Aiming.Aimbot.IsAiming = false
    end
end)

RunService.Heartbeat:Connect(function()
    if Alive(LocalPlayer) then
        if ZapSettings.Blatant.Movement.SpeedEnabled and ZapSettings.Blatant.Movement.SpeedType == "CFrame" then
            if ZapSettings.Blatant.Movement.SpeedRenderType == "Default" then
                if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    for i = 1, ZapSettings.Blatant.Movement.SpeedAmount do
                        LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection)
                    end
                end
            end
        end
        if ZapSettings.Blatant.Character.AntiStomp then
            if Knocked(LocalPlayer) then
                if ZapSettings.Blatant.Character.AntiStompType == "Nil Char" then
                    NilBody()
                end
                if ZapSettings.Blatant.Character.AntiStompType == "Show Body" then
                    pcall(function()
                        LocalPlayer.Character.Humanoid:Destroy()
                    end)
                end
            end
        end
        if ZapSettings.Blatant.Character.AntiBag then
            if LocalPlayer.Character:FindFirstChild("Christmas_Sock") then
                LocalPlayer.Character:FindFirstChild("Christmas_Sock"):Destroy()
            end
        end
        if ZapSettings.Blatant.Character.AntiGrab and LocalPlayer.Character:FindFirstChild("GRABBING_CONSTRAINT") then
            LocalPlayer.Character["GRABBING_CONSTRAINT"]:Destroy()
        end
    end
end)

RunService.Stepped:Connect(function()
	if ZapSettings.Blatant.BlatantAA.UndergroundWallbang then
		for i, v in pairs(LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide == true then
				v.CanCollide = false
			end
		end
	end
end)

spawn(function()
    while wait() do
        if Alive(LocalPlayer) then
            if ZapSettings.Blatant.Character.AutoLettuce then
                pcall(function()
                    Buy("[Lettuce] - $5", 1)
                    if LocalPlayer.Backpack:FindFirstChild("[Lettuce]") then
                        LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["[Lettuce]"])
                    end
                    wait(0.5)
                    LocalPlayer.Character["[Lettuce]"]:Activate()
                end)
            end
            if ZapSettings.Blatant.Character.AutoReload then
                local Gun = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if Gun ~= nil and Gun:FindFirstChild("MaxAmmo") then
                    if Gun.Ammo.Value == 0 then
                        ReplicatedStorage.MainEvent:FireServer("Reload", Gun)
                    end
                end
            end
            if ZapSettings.Blatant.Character.AutoArmor then
                if LocalPlayer.Character.BodyEffects.Armor.Value == 0 then
                    Buy("[High-Medium Armor] - $2300", 0.5, true)
                end
            end
            if ZapSettings.Blatant.Farming.MuscleFarm then
                pcall(function()
                    if ZapSettings.Blatant.Farming.MuscleFarmingType == "Normal" then
                        if not LocalPlayer.Backpack:FindFirstChild("[Weights]") then
                            Buy("[Weights] - $120", 1)
                        end
                        if LocalPlayer.Backpack:FindFirstChild("[Weights]") then
                            LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["[Weights]"])
                        end
                        LocalPlayer.Character["[Weights]"]:Activate()
                    end
                    if ZapSettings.Blatant.Farming.MuscleFarmingType == "Heavy" then
                        if not LocalPlayer.Backpack:FindFirstChild("[HeavyWeights]") then
                            Buy("[HeavyWeights] - $250", 1)
                        end
                        if LocalPlayer.Backpack:FindFirstChild("[HeavyWeights]") then
                            LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["[HeavyWeights]"])
                        end
                        LocalPlayer.Character["[HeavyWeights]"]:Activate()
                    end
                end)
            end
            if ZapSettings.Blatant.Farming.ShoeFarm then
                pcall(function()
                    for i, v in pairs(Workspace.Ignored.Drop:GetChildren()) do
                        if v.Name == "MeshPart" then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 2, 0)
                            local ShoeDistance = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            if ShoeDistance < 25 then
                                fireclickdetector(v.ClickDetector)
                            end
                        else
                            fireclickdetector(Workspace.Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector)
                        end
                    end
                end)
            end
            if ZapSettings.Blatant.Farming.HospitalFarm then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(116, 23, -479)
                for _, v in pairs(Workspace.Ignored.HospitalJob:GetChildren()) do
                    if v.Name == "Can I get the Green bottle" then
                        fireclickdetector(v.Parent.Green.ClickDetector)
                        wait(1)
                        fireclickdetector(v.ClickDetector)
                    end
                    if v.Name == "Can I get the Blue bottle" then
                        fireclickdetector(v.Parent.Blue.ClickDetector)
                        wait(1)
                        fireclickdetector(v.ClickDetector)
                    end
                    if v.Name == "Can I get the Red bottle" then
                        fireclickdetector(v.Parent.Red.ClickDetector)
                        wait(1)
                        fireclickdetector(v.ClickDetector)
                    end
                end
            end
            if ZapSettings.Blatant.Farming.BoxFarm then
                pcall(function()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.MAP.Map.ArenaBOX.PunchingBagInGame["pretty ransom"].CFrame * CFrame.new(0, -1, 3)
                    if LocalPlayer.Backpack:FindFirstChild("Combat") then
                        LocalPlayer.Backpack.Combat.Parent = LocalPlayer.Character
                    end
                end)
                mouse1click()
            end
        end
    end
end)

spawn(function()
    while wait() do
        if ZapSettings.Blatant.Farming.ATMFarm then
            for _, v in pairs(Workspace.Cashiers:GetChildren()) do
                if v:FindFirstChild("Head") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat
                        ZapSettings.Blatant.Farming.ATMPick = false
                        wait()
                        if ZapSettings.Blatant.Farming.ATMFarm then
                            if Alive(LocalPlayer) then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0, -1, 2.5)
                                if LocalPlayer.Backpack:FindFirstChild("Combat") then
                                    LocalPlayer.Backpack.Combat.Parent = LocalPlayer.Character
                                end
                                --if LocalPlayer.Character:FindFirstChild("Combat") then
                                    LocalPlayer.Character["Combat"]:Activate()
                                --end
                            end
                        end
                    until v.Humanoid.Health <= 0 or not ZapSettings.Blatant.Farming.ATMFarm
                    pcall(function()
                        LocalPlayer.Character:FindFirstChildOfClass("Tool").Parent = LocalPlayer.Backpack
                    end)
                    ZapSettings.Blatant.Farming.ATMPick = true
                    wait(5)
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Alive(LocalPlayer) then
        if ZapSettings.Aiming.AimingSettings.PingBasedPrediction then
            local PingStats = GetService.Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
            local Value = tostring(PingStats)
            local PingValue = Value:split(" ")
            local PingNumber = tonumber(PingValue[1])
    
            if PingNumber < 130 then
                ZapSettings.Aiming.AimingSettings.GetVelocity = PingNumber / 1000 + 0.037
            else
                ZapSettings.Aiming.AimingSettings.GetVelocity = PingNumber / 1000 + 0.033
            end
        else
            ZapSettings.Aiming.AimingSettings.GetVelocity = 0.165
        end
        if ZapSettings.Blatant.Cash.AutoDrop then
            ReplicatedStorage.MainEvent:FireServer("DropMoney", tostring(ZapSettings.Blatant.Cash.AutoDropAmount))
        end
        if ZapSettings.Blatant.Cash.AutoPickCash then
            pcall(function()
                for _, v in pairs(Workspace.Ignored.Drop:GetChildren()) do
                    if v.Name == "MoneyDrop" then
                        local MoneyMagnitude = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                        if MoneyMagnitude < 25 then
                            fireclickdetector(v.ClickDetector)
                        end 
                    end
                end
            end)
        end
        if ZapSettings.Blatant.Farming.ATMPick then
            pcall(function()
                for _, v in pairs(Workspace.Ignored.Drop:GetChildren()) do
                    if v.Name == "MoneyDrop" then
                        local MoneyMagnitude = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if MoneyMagnitude < 25 then
                            fireclickdetector(v.ClickDetector)
                        end 
                    end
                end
            end)
        end
        if ZapSettings.Blatant.Movement.SpeedEnabled and ZapSettings.Blatant.Movement.SpeedType == "CFrame" then
            if ZapSettings.Blatant.Movement.SpeedRenderType == "Fast" and Alive(LocalPlayer) then
                if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    for i = 1, ZapSettings.Blatant.Movement.SpeedAmount do
                        LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection)
                    end
                end
            end
        end
        if ZapSettings.Blatant.Reaching.FistReach and LocalPlayer.Character.LeftHand.Transparency ~= 1 then
            LocalPlayer.Character.LeftHand.Size = Vector3.new(45, 45, 45)
            LocalPlayer.Character.RightHand.Size = Vector3.new(45, 45, 45)
            LocalPlayer.Character.RightHand.Massless = true
            LocalPlayer.Character.LeftHand.Massless = true
            LocalPlayer.Character.RightHand.Transparency = 1
            LocalPlayer.Character.LeftHand.Transparency = 1
        end
        if ZapSettings.Blatant.Reaching.MeleeReach then
            local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if Tool ~= nil and not Tool:FindFirstChild("Ammo") and TableLowerFind(ZapModule.Teleport.Melee, Tool.Name) ~= nil and Tool:FindFirstChild("Handle") then
                if Tool.Handle.Transparency ~= 1 then
                    Tool.Handle.Size = Vector3.new(45, 45, 45)
                    Tool.Handle.Transparency = 1
                end
            end
        else
            local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if Tool ~= nil and not Tool:FindFirstChild("Ammo") and TableLowerFind(ZapModule.Teleport.Melee, Tool.Name) ~= nil and Tool:FindFirstChild("Handle") then
                if Tool.Handle.Transparency == 1 then
                    if Tool.Name == "knife" then
                        Tool.Handle.Size = Vector3.new(2.19574, 0.449288, 0.102495)
                    end
                    if Tool.Name == "bat" then
                        Tool.Handle.Size = Vector3.new(0.559523, 4.68133, 0.559523)
                    end
                    if Tool.Name == "pencil" then
                        Tool.Handle.Size = Vector3.new(0.375586, 1.9, 0.375587)
                    end
                    if Tool.Name == "pitchfork" then
                        Tool.Handle.Size = Vector3.new(1.0553, 5.86135, 0.316619)
                    end
                    if Tool.Name == "shovel" then
                        Tool.Handle.Size = Vector3.new(1.68383, 5.903, 0.337731)
                    end
                    Tool.Handle.Transparency = 0
                end
            end
        end
        if ZapSettings.Blatant.LegitAA.Enabled then
            if ZapSettings.Blatant.LegitAA.AntiPointAt then
                for i, v in next, Players:GetPlayers() do
                    if v ~= LocalPlayer and Alive(v) and Alive(LocalPlayer) then
                        local BodyEffects = v.Character:FindFirstChild("BodyEffects")
                        local MousePos = BodyEffects:FindFirstChild("MousePos")
                        if BodyEffects ~= nil and MousePos ~= nil then
                            local EnemyMouseMagnitude = (LocalPlayer.Character.HumanoidRootPart.Position - MousePos.Value).Magnitude
                            if ZapSettings.Blatant.LegitAA.AntiAimAtDistance > EnemyMouseMagnitude then
                                Root.CFrame = Root.CFrame * CFrame.new(math.random(1, 2) == 1 and 2 or -2, 0, 0)
                            end
                        end
                    end
                end
            end
        end
        if ZapSettings.Blatant.BlatantAA.Enabled then
                if ZapSettings.Blatant.BlatantAA.AntiAimType == "Jitter" then
                    Jitter(ZapSettings.Blatant.BlatantAA.AntiAimSpeed, ZapSettings.Blatant.BlatantAA.JitterAngle)
                else
                    Spin(ZapSettings.Blatant.BlatantAA.AntiAimSpeed)
                end
                if ZapSettings.Blatant.BlatantAA.NoAutoRotate then
                    LocalPlayer.Character.Humanoid.AutoRotate = false
                else
                    LocalPlayer.Character.Humanoid.AutoRotate = true
                end
        else
            LocalPlayer.Character.Humanoid.AutoRotate = true
        end
    end
    if ZapSettings.Aiming.TargetAimSettings.UnlockTargetKnocked then
        if ZapSettings.Aiming.TargetAimSettings.Target ~= nil and Players:FindFirstChild(ZapSettings.Aiming.TargetAimSettings.Target) then
            if Knocked(Players:FindFirstChild(ZapSettings.Aiming.TargetAimSettings.Target)) then
                ZapSettings.Aiming.TargetAimSettings.Target = nil
            end
        end
    end
    if ZapSettings.Aiming.SilentAim.ShowFOV then
        SilentAimFOV.Visible = true
        SilentAimFOV.Radius = ZapSettings.Aiming.FOV.SilentAimSize
        SilentAimFOV.Filled = ZapSettings.Aiming.FOV.FOVFilled
        SilentAimFOV.Transparency = ZapSettings.Aiming.FOV.Transparency
        SilentAimFOV.NumSides = 100
        SilentAimFOV.Color = ZapSettings.Aiming.SilentAim.FOVColor
        SilentAimFOV.Position = Vector2.new(Mouse.X, Mouse.Y + GuiInset.Y)
    else
        SilentAimFOV.Visible = false
    end
    if ZapSettings.Aiming.Aimbot.Enabled then
        if ZapSettings.Aiming.Aimbot.ShowFOV then
            AimbotFOV.Visible = true
            AimbotFOV.Radius = ZapSettings.Aiming.FOV.AimAssistSize
            AimbotFOV.Filled = ZapSettings.Aiming.FOV.FOVFilled
            AimbotFOV.Transparency = ZapSettings.Aiming.FOV.Transparency
            AimbotFOV.NumSides = 100
            AimbotFOV.Color = ZapSettings.Aiming.Aimbot.FOVColor
            AimbotFOV.Position = Vector2.new(Mouse.X, Mouse.Y + GuiInset.Y)
        else
            AimbotFOV.Visible = false
        end
        if ZapSettings.Aiming.Aimbot.AimAssist and ZapSettings.Aiming.Aimbot.IsAiming then
            local NearestTarget, NearestDistance = NearestType(ZapSettings.Aiming.Aimbot.UseNearestDistance and "Distance" or "Mouse")

            if NearestTarget and (not ZapSettings.Aiming.Aimbot.GrabbedCheck or not Grabbing(NearestTarget)) and (not ZapSettings.Aiming.Aimbot.KnockedOutCheck or not Knocked(NearestTarget)) and (not ZapSettings.Aiming.Aimbot.ShowFOV or ZapSettings.Aiming.FOV.AimAssistSize > NearestDistance) and (not ZapSettings.Aiming.Aimbot.WallCheck or Visible(NearestTarget.Character.HumanoidRootPart, LocalPlayer.Character.HumanoidRootPart)) then
                local TargetPart = (NearestTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and NearestTarget.Character.LeftFoot or NearestTarget.Character[RandomTable(ZapSettings.Aiming.Aimbot.Hitboxes)])
                local Prediction = (ZapSettings.Aiming.TargetAimSettings.MovementPrediction and TargetPart.CFrame + (TargetPart.Velocity * ZapSettings.Aiming.TargetAimSettings.MovementPredictionAmount) or TargetPart.CFrame + (TargetPart.Velocity * ZapSettings.Aiming.AimingSettings.GetVelocity))
                
                if ZapSettings.Aiming.AimbotSettings.AimAssistType == "Mouse" then
                    local NearestPosition, NearestVisible = CurrentCamera:WorldToScreenPoint(Prediction.Position)
                    local MouseLocation = CurrentCamera:WorldToScreenPoint(Mouse.Hit.Position)
                    local EndPosition = (ZapSettings.Aiming.AimbotSettings.SmoothingTracing and Vector2.new((NearestPosition.X - MouseLocation.X) / ZapSettings.Aiming.AimbotSettings.SmoothingTracingAmount, (NearestPosition.Y - MouseLocation.Y) / ZapSettings.Aiming.AimbotSettings.SmoothingTracingAmount) or Vector2.new((NearestPosition.X - MouseLocation.X) / 1.4, (NearestPosition.Y - MouseLocation.Y) / 1.4))
                    
                    if NearestVisible then
                        mousemoverel(EndPosition.X, EndPosition.Y)
                    end
                elseif ZapSettings.Aiming.AimbotSettings.AimAssistType == "Camera" then
                    CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Prediction.Position)
                end
            end
        end
    else
        AimbotFOV.Visible = false
    end
end)

spawn(function()
    while wait(1 / 16) do
        LagTick = math.clamp(ZapModule.LagTick + 1, 0, ZapSettings.Blatant.FakeLag.TriggerAmount)
        if Alive(Player) and ZapSettings.Blatant.FakeLag.Enabled then
            if LagTick == math.random(1, ZapSettings.Blatant.FakeLag.TriggerAmount) then
                Network:SetOutgoingKBPSLimit(9e9)
                ZapFolder:ClearAllChildren()
                LagTick = 0
            else
                if ZapSettings.Blatant.FakeLag.Enabled then
                    Network:SetOutgoingKBPSLimit(1)
                end
            end
        else
            ZapFolder:ClearAllChildren()
            Network:SetOutgoingKBPSLimit(9e9)
        end
    end
end)

local __namecall -- cock ;)
__namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
    local Method = getnamecallmethod()

    if tostring(self.Name) == "MainEvent" and tostring(Method) == "FireServer" then
        if Args[1] == "TeleportDetect" or Args[1] == "CHECKER_1" or Args[1] == "OneMoreTime" then
            return
        end
    end

    return __namecall(self, ...)
end)

local __index -- <3
__index = hookmetamethod(game, "__index", function(self, key)
    if self == Mouse and (tostring(key) == "Hit" or tostring(key) == "Target") then
        if ZapSettings.Aiming.TargetAim.Enabled then
            if ZapSettings.Aiming.TargetAim.Target ~= nil and ChanceTable(ZapSettings.Aiming.AimingSettings.HitChanceAmount) == "HitPercent" then
                if Players:FindFirstChild(ZapSettings.Aiming.TargetAim.Target) ~= nil and (not ZapSettings.Aiming.TargetAim.GrabbedCheck or not Grabbing(Players[ZapSettings.Aiming.TargetAim.Target])) and (not ZapSettings.Aiming.TargetAim.KnockedOutCheck or not Knocked(Players[ZapSettings.Aiming.TargetAim.Target])) and (not ZapSettings.Aiming.TargetAim.ShowFOV or ZapSettings.Aiming.FOV.TargetAimSize > (LocalPlayer.Character.Head.Position - Players[ZapSettings.Aiming.TargetAim.Target].Character.Head.Position).Magnitude) and (not ZapSettings.Aiming.TargetAim.WallCheck or Visible(Players[ZapSettings.Aiming.TargetAim.Target].Character.HumanoidRootPart, LocalPlayer.Character.HumanoidRootPart)) then
                    local TargetPart = (Players[ZapSettings.Aiming.TargetAim.Target].Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and Players[ZapSettings.Aiming.TargetAim.Target].Character.LeftFoot or Players[ZapSettings.Aiming.TargetAim.Target].Character[RandomTable(ZapSettings.Aiming.TargetAim.Hitboxes)])
                    local Prediction = (ZapSettings.Aiming.TargetAimSettings.MovementPrediction and TargetPart.CFrame + (TargetPart.Velocity * ZapSettings.Aiming.TargetAimSettings.MovementPredictionAmount) or TargetPart.CFrame + (TargetPart.Velocity * ZapSettings.Aiming.AimingSettings.GetVelocity))

                    return (tostring(key) == "Hit" and Prediction or tostring(key) == "Target" and TargetPart)
                end
            end
        else    
            if ZapSettings.Aiming.SilentAim.Enabled and ChanceTable(ZapSettings.Aiming.AimingSettings.HitChanceAmount) == "HitPercent" then
                local NearestTarget, NearestDistance = NearestType(ZapSettings.Aiming.SilentAim.UseNearestDistance and "Distance" or "Mouse")
    
                if NearestTarget and (not ZapSettings.Aiming.SilentAim.GrabbedCheck or not Grabbing(NearestTarget)) and (not ZapSettings.Aiming.SilentAim.KnockedOutCheck or not Knocked(NearestTarget)) and (not ZapSettings.Aiming.SilentAim.ShowFOV or ZapSettings.Aiming.FOV.SilentAimSize > NearestDistance) and (not ZapSettings.Aiming.SilentAim.WallCheck or IsVisible(NearestTarget.Character.Head.Position, {NearestTarget.Character, LocalPlayer.Character, CurrentCamera}) == true) then
                    local TargetPart = (NearestTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and NearestTarget.Character.LeftFoot or NearestTarget.Character[RandomTable(ZapSettings.Aiming.SilentAim.Hitboxes)])
                    local Prediction = (ZapSettings.Aiming.TargetAimSettings.MovementPrediction and TargetPart.CFrame + (TargetPart.Velocity * ZapSettings.Aiming.TargetAimSettings.MovementPredictionAmount) or TargetPart.CFrame + (TargetPart.Velocity * ZapSettings.Aiming.AimingSettings.GetVelocity))
    
                    return (tostring(key) == "Hit" and Prediction or tostring(key) == "Target" and TargetPart)
                end
            end
        end
        
    end

    return __index(self, key)
end)

while wait() do
    if ZapSettings.Aiming.TriggerBot.Enabled then
        for i, v in next, Players:GetPlayers() do 
            if Alive(v) then 
                if Mouse.Target:IsDescendantOf(v.Character) then 
                    mouse1press()
                    wait()
                    mouse1release()
                    if ZapSettings.Aiming.TriggerBot.Delay then
                        wait(ZapSettings.Aiming.TriggerBot.DelayAmount)
                    end
                end 
            end
        end
    end
end
