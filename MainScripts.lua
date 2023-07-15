local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Project VOID CustomModule Public UI", "Serpent")

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
local infiniteJumpEnabled = false

Tab2Section:NewToggle("InfiniteJump", "", function(state)
    infiniteJumpEnabled = state
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState("Jumping")
        end
    end
end)

--Render
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
        textLabel.Text = "Project VOID V5 (Public)" -- Set your desired text here
        textLabel.Parent = screenGui
    else
        screenGui:Destroy()
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

--Home
local Section = Tab1:NewSection("Welcome:" ..plrname.. " To: Project VOID CustomModule Public UI")
local Section = Tab1:NewSection("Player Id: "..game.Players.LocalPlayer.UserId .."")
local Section = Tab1:NewSection("Account Age: "..game.Players.LocalPlayer.AccountAge.."")
