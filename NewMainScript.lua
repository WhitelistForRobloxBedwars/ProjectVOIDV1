loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Project VOID CustomModule Private UI", "Serpent")

--Tab
local Tab1 = Window:NewTab("Home")
local Tab2 = Window:NewTab("Blatant")
local Tab3 = Window:NewTab("Render")
local Tab = Window:NewTab("Credits")

--Section
local Tab2Section = Tab2:NewSection("Blatant")
local Tab3Section = Tab3:NewSection("Render")
local TabSection = Tab:NewSection("Credit To fakemarioguys (discord name)")

--Blatant
Tab2Section:NewToggle("ScytheDisabler Using With Fly Of Vape", "", function(state)
    if state then
        task.spawn(function()
            repeat
                task.wait(0.01)
                local item = getItemNear("scythe")
                if item and lplr.Character.HandInvItem.Value == item.tool then 
                    if bedwars.ClientHandler:Get("ScytheDash"):CallServer({direction = Vector3.new(math.huge, math.huge, math.huge)}) then 
                        bedwarsStore.grapple = tick() + 1.5
                    end
                end
            until (not Tab2Section:GetToggle())
        end)
    end
end)

Tab2Section:NewToggle("OldScytheDisabler (SD)", "OldACBypass", function(state)
    if state then
        while task.wait() do
            local args = {
                [1] = {
                    ["direction"] = Vector3.new(0.5041335225105286, -1.6061335372796748e-08, 0.863625705242157)
                }
            }
        
            game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("ScytheDash"):InvokeServer(unpack(args))
        end
    end
end)

Tab2Section:NewToggle("SpeedSD", "", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
    end
end)

Tab2Section:NewToggle("InfiniteJump", "", function(state)
    if state then
        local infiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
    else
        infiniteJumpEnabled = false
    end
end)

Tab2Section:NewButton("Inf Yield", "", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Tab2Section:NewToggle("SpeedTracker", "", function(state)
    if state then
        speedTrackerEnabled = true

        local player = game:GetService("Players").LocalPlayer
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "SpeedTrackerGui"

        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "TextLabel"
        textLabel.Size = UDim2.new(0, 200, 0, 30)
        textLabel.Position = UDim2.new(0, 0, 0.652, 0)
        textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
        textLabel.BackgroundTransparency = 0.5
        textLabel.BorderSizePixel = 0
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.TextSize = 18
        textLabel.Font = Enum.Font.SourceSans
        textLabel.Text = "Speed: N/A" -- Initial text
        textLabel.Parent = screenGui

        speedLabel = textLabel

        screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    else
        speedTrackerEnabled = false
        if speedLabel then
            local screenGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("SpeedTrackerGui")
            if screenGui then
                screenGui:Destroy()
            end
        end
    end
end)

Tab2Section:NewToggle("Coordinate", "", function(state)
    if state then
        local player = game:GetService("Players").LocalPlayer
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "CoordinatesGui"

        local label = Instance.new("TextLabel")
        label.Name = "CoordinatesLabel"
        label.Parent = screenGui
        label.Size = UDim2.new(0, 200, 0, 30)
        label.Position = UDim2.new(0, 0, 0.7, 0)
        label.BackgroundTransparency = 0.5
        label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 18
        label.Font = Enum.Font.SourceSans

        local function updateCoordinates()
            if player.Character then
                local character = player.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local position = humanoidRootPart.Position
                    local formattedPosition = string.format("%d, %d, %d", math.floor(position.X), math.floor(position.Y), math.floor(position.Z))
                    label.Text = "Coordinates: " .. formattedPosition
                else
                    label.Text = "Coordinates: N/A"
                end
            else
                label.Text = "Coordinates: N/A"
            end
        end

        player.CharacterAdded:Connect(updateCoordinates)
        game:GetService("RunService").Heartbeat:Connect(updateCoordinates)

        screenGui.Parent = game:GetService("CoreGui")
    else
        local screenGui = game:GetService("CoreGui"):FindFirstChild("CoordinatesGui")
        if screenGui then
            screenGui:Destroy()
        end
    end
end)

local SpawnParts = {} -- Table to store the spawned parts
local hpbar = {Enabled = false}

Tab2Section:NewToggle("SpawnESP", "", function(state)
    if state then
        local rainbowColors = { -- Define the rainbow colors here
            Color3.fromRGB(255, 0, 0),
            Color3.fromRGB(255, 127, 0),
            Color3.fromRGB(255, 255, 0),
            -- Add more colors if needed
        }
        local currentIndex = 1 -- Track the current color index

        for i, v2 in pairs(workspace.MapCFrames:GetChildren()) do
            if v2.Name:find("spawn") and v2.Name ~= "spawn" and v2.Name:find("respawn") == nil then
                local part = Instance.new("Part")
                part.Size = Vector3.new(1, 1000, 1)
                part.Position = v2.Value.p
                part.Anchored = true
                part.Parent = workspace
                part.CanCollide = false
                part.Transparency = 0.5
                part.Material = Enum.Material.Neon
                part.Color = rainbowColors[currentIndex]
                bedwars.QueryUtil:setQueryIgnored(part, true)
                table.insert(SpawnParts, part)

                currentIndex = currentIndex % #rainbowColors + 1
            end
        end

        spawn(function()
            while true do
                task.wait(0.5) -- Change color every 0.5 seconds

                for i, part in pairs(SpawnParts) do
                    part.Color = rainbowColors[currentIndex]
                    currentIndex = currentIndex % #rainbowColors + 1
                end
            end
        end)
    else
        for i, v in pairs(SpawnParts) do
            v:Destroy()
        end
        table.clear(SpawnParts)
    end
end)

-- Render
Tab3Section:NewToggle("RainbowHotBar", "", function(state)
    if state then
        task.spawn(function()
            function TapeRB(X) return math.acos(math.cos(X * math.pi)) / math.pi end
            local counter = 0
            hpbar.Enabled = true
            while hpbar.Enabled do
                local hotbar = game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1']
                local alpha = TapeRB(counter)
                hotbar.BackgroundColor3 = Color3.fromHSV(alpha, 1, 1)
                hotbar.BackgroundTransparency = 0.01 
                counter = counter + 0.02
                wait(0.079) 
            end
        end)
    else
        hpbar.Enabled = false
        game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromRGB(203, 54, 36)
        game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundTransparency = 0
    end
end)

Tab3Section:NewToggle("SpaceSky", "", function(state)
    if state then
        game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
        game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
        game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
        game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
        game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
        game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
        game.Lighting.FogColor = Color3.new(236, 88, 241)
        game.Lighting.FogEnd = 200
        game.Lighting.FogStart = 0
        game.Lighting.Ambient = Color3.new(0.5, 0, 1)
    else
        game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
        game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
        game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
        game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
        game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
        game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
        game.Lighting.FogColor = Color3.new(1, 1, 1)
        game.Lighting.FogEnd = 10000
        game.Lighting.FogStart = 0
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)

Tab3Section:NewToggle("DragonBreath", "", function(state)
    if state then
        task.spawn(function()
            repeat
                task.wait(0.001)
                local success, module = pcall(function()
                    return game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("DragonBreath")
                end)

                if success and module then
                    local player = game:GetService("Players").LocalPlayer
                    module:FireServer({player = player})
                else
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Project VOID Notify";
                        Text = "Try Again";
                        Duration = 5;
                    })
                    break
                end
            until (not breathe.Enabled)
        end)
    end
end)

Tab3Section:NewButton("WaterMark", "ButtonInfo", function()
    local screenGui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("TextDisplayGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "TextDisplayGui"
        screenGui.Parent = game.Players.LocalPlayer.PlayerGui

        -- Create a TextLabel
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "TextLabel"
        textLabel.Size = UDim2.new(0, 200, 0, 50)
        textLabel.Position = UDim2.new(0, 0, 0.878, 0)
        textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
        textLabel.BackgroundTransparency = 0.5
        textLabel.BorderSizePixel = 0
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.TextSize = 20
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.Text = "Project VOID V5 (Private)" -- Set your desired text here
        textLabel.Parent = screenGui
    else
        screenGui:Destroy()
    end
end)

Tab3Section:NewButton("Ping Counter", "Ping Detector", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/MvKKJ331", true))()
end)

Tab3Section:NewButton("Fps Counter", "Fps Detector", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ySHJdZpb", true))()
end)

Tab3Section:NewButton("ChatMover", "", function()
    local chatWindowConfig = game:GetService("TextChatService").ChatWindowConfiguration
    if chatWindowConfig.HorizontalAlignment == Enum.HorizontalAlignment.Top then
        chatWindowConfig.HorizontalAlignment = Enum.HorizontalAlignment.Left
        chatWindowConfig.VerticalAlignment = Enum.VerticalAlignment.Center
    else
        chatWindowConfig.HorizontalAlignment = Enum.HorizontalAlignment.Top
        chatWindowConfig.VerticalAlignment = Enum.VerticalAlignment.Center
    end
end)

Tab3Section:NewButton("TxtPack1", "", function()
    -- services
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")

    -- importing the textures
    local objs = game:GetObjects("rbxassetid://13481568688")
    local import = objs[1]
    import.Parent = ReplicatedStorage

    -- very epic index
    local index = {
        {
            name = "wood_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Wood_Sword"),
        },
        {
            name = "stone_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Stone_Sword"),
        },
        {
            name = "iron_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Iron_Sword"),
        },
        {
            name = "diamond_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Diamond_Sword"),
        },
        {
            name = "emerald_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Emerald_Sword"),
        },
        {
            name = "wood_pickaxe",
            offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
            model = import:WaitForChild("Wood_Pickaxe"),
        },
        {
            name = "stone_pickaxe",
            offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
            model = import:WaitForChild("Stone_Pickaxe"),
        },
        {
            name = "iron_pickaxe",
            offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
            model = import:WaitForChild("Iron_Pickaxe"),
        },
        {
            name = "diamond_pickaxe",
            offset = CFrame.Angles(math.rad(0), math.rad(80), math.rad(-95)),
            model = import:WaitForChild("Diamond_Pickaxe"),
        },
        {
            name = "wood_axe",
            offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
            model = import:WaitForChild("Wood_Axe"),
        },
        {
            name = "stone_axe",
            offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
            model = import:WaitForChild("Stone_Axe"),
        },
        {
            name = "iron_axe",
            offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
            model = import:WaitForChild("Iron_Axe"),
        },
        {
            name = "diamond_axe",
            offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-95)),
            model = import:WaitForChild("Diamond_Axe"),
        },
        {
            name = "fireball",
            offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(95)),
            model = import:WaitForChild("Fireball"),
        },
        {
            name = "telepearl",
            offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(95)),
            model = import:WaitForChild("Telepearl"),
        },
    }

    -- main viewmodel renderer
    local func = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)
        if not tool:IsA("Accessory") then return end

        for i, v in pairs(index) do
            if v.name == tool.Name then
                for i, v in pairs(tool:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end

                local model = v.model:Clone()
                model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
                model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                model.Parent = tool

                local weld = Instance.new("WeldConstraint", model)
                weld.Part0 = model
                weld.Part1 = tool:WaitForChild("Handle")

                local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)

                for i, v in pairs(tool2:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end

                local model2 = v.model:Clone()
                model2.Anchored = false
                model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
                model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                model2.CFrame *= CFrame.new(1, 0, -.9)
                model2.Parent = tool2

                local weld2 = Instance.new("WeldConstraint", model)
                weld2.Part0 = model2
                weld2.Part1 = tool2:WaitForChild("Handle")
            end
        end
    end)
end)

Tab3Section:NewButton("TxtPack2", "Not Skidded Ok?", function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    local objs = game:GetObjects("rbxassetid://13804645310")
    local import = objs[1]
    import.Parent = ReplicatedStorage

    local index = {
        {
            name = "wood_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Wood_Sword"),
        },
        {
            name = "stone_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Stone_Sword"),
        },
        {
            name = "iron_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Iron_Sword"),
        },
        {
            name = "diamond_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Diamond_Sword"),
        },
        {
            name = "emerald_sword",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
            model = import:WaitForChild("Emerald_Sword"),
        },
        {
            name = "rageblade",
            offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-270)),
            model = import:WaitForChild("Rageblade"),
        },
    }

    local func = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)
        if not tool:IsA("Accessory") then return end

        for i, v in pairs(index) do
            if v.name == tool.Name then
                for i, v in pairs(tool:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end

                local model = v.model:Clone()
                model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
                model.CFrame *= CFrame.Angles(math.rad(0), math.rad(100), math.rad(0))
                model.Parent = tool

                local weld = Instance.new("WeldConstraint", model)
                weld.Part0 = model
                weld.Part1 = tool:WaitForChild("Handle")

                local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)

                for i, v in pairs(tool2:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end

                local model2 = v.model:Clone()
                model2.Anchored = false
                model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
                model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-105), math.rad(0))
                model2.CFrame *= CFrame.new(-0.4, 0, -0.10)
                model2.Parent = tool2

                local weld2 = Instance.new("WeldConstraint", model)
                weld2.Part0 = model2
                weld2.Part1 = tool2:WaitForChild("Handle")
            end
        end
    end)
end)

Tab3Section:NewButton("CustomDamage", "", function()
    local Messages = {"Pow!",  "Punch!", "KnockedOut!", "RIP!", "KO!", "Knock!", "Clapped!", "GetGood!", "Splat!", "Dong!", "BodyShot!", "Shot!", "Ez!", "L!", "Bad!", "Pew!", "Thump!", "Ding!", "Bong!", "Wham!", "Hit!", "Smack!", "Nuke!", "SkillIssue!", "Ram!", "Bang!", "Pop!", "Beamed!", "Bonk!", "Sliced!", "Headshot!", "Boom!"}
    local old
    local FunnyIndicator = {Enabled = false}
    old = debug.getupvalue(bedwars.DamageIndicator, 10)["Create"]
    if FunnyIndicator.Enabled then
        debug.setupvalue(bedwars.DamageIndicator, 10, {
            Create = function(self, obj, ...)
                spawn(function()
                    pcall(function()
                        obj.Parent.Text = Messages[math.random(1, #Messages)]
                        obj.Parent.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    end)
                end)
                return game:GetService("TweenService"):Create(obj, ...)
            end
        })
    else
        debug.setupvalue(bedwars.DamageIndicator, 10, {
            Create = old
        })
        old = nil
    end
end)

Tab3Section:NewButton("ChatTag", "", function()
    local textChatService = game:GetService("TextChatService")
    textChatService.OnIncomingMessage = function(message)
        local properties = Instance.new("TextChatMessageProperties")
        if message.TextSource then
            local player = game:GetService("Players"):GetPlayerByUserId(message.TextSource.UserId)
            if player and player.UserId == playersService.LocalPlayer.UserId then
                properties.PrefixText = "<font color='#2ce698'>[Project VOID User🔥]</font> " .. message.PrefixText
            end
        end
        return properties
    end
end)

Tab3Section:NewButton("PrivateChatTag", "", function()
    local textChatService = game:GetService("TextChatService")
    textChatService.OnIncomingMessage = function(message)
        local properties = Instance.new("TextChatMessageProperties")
        if message.TextSource then
            local player = game:GetService("Players"):GetPlayerByUserId(message.TextSource.UserId)
            if player.Name == "BedwarsIsbestgame0" or player.Name == "BedwarsFromOhio1" or player.Name == "BedwarsIsBest5563" or player.Name == "AntiCheatBad1880" or player.Name == "Season8IsBestTYDev" or player.Name == "BedwarsIsGoodLol2" or player.Name == "ambushcomehereeee" then
                properties.PrefixText = "<font color='#cc0000'>[Project VOID Owner💫☄️]</font> " .. message.PrefixText
            elseif player.Name == "killerrodot12" or player.Name == "Techbed3" or player.Name == "kindreckjohn12345" or player.Name == "Black_history100" then
                properties.PrefixText = "<font color='#cc0000'>[Project VOID Tester😎]</font> " .. message.PrefixText
            end
        end
        return properties
    end
end)

Tab3Section:NewToggle("PartyExploit", "", function(state)
    if state then
        task.spawn(function()
            repeat
                task.wait(0.001)
                game:GetService("ReplicatedStorage"):WaitForChild("events-@easy-games/game-core:shared/game-core-networking@getEvents.Events"):WaitForChild("useAbility"):FireServer("PARTY_POPPER")
            until (not Confetti.Enabled)
        end)
    end
end)

Tab3Section:NewButton("FPSUnlocker", "", function()
    local setfpscap = game:GetService("RunService").SetFPSCap
    if setfpscap then
        setfpscap(10000)
    else
        setfpscap(9999)
    end
end)

--Home
local Tab1Section = Tab1:NewSection("Welcome: " .. plrname .. " To: Project VOID CustomModule Private UI")
local Tab1Section = Tab1:NewSection("Player Id: " .. game.Players.LocalPlayer.UserId)
local Tab1Section = Tab1:NewSection("Account Age: " .. game.Players.LocalPlayer.AccountAge)
