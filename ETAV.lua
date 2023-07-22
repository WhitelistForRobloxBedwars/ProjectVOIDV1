loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
wait(3)
repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local LIB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

local RainbowHotbar = LIB("Render", {
    Name = "RainbowHotbar",
    Function = function(callback) 
        if callback then
                            hotbar.BackgroundColor3 = Color3.fromHSV(alpha, 1, 1)
                    hotbar.BackgroundTransparency = 0.01
                    counter = counter + 0.02
                    wait(0.079)
                end
            end)
        else
            game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromRGB(203, 54, 36)
            game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundTransparency = 0
        end
    end
    HoverText = "Makes your health bar rainbow"
})

local InfiniteJump = LIB("Utility", {
        Name = "InfiniteJump",
        Function = function(callback)
            if callback then
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
        end
    })
end)

local player = game:GetService("Players").LocalPlayer
local character = player.Character

local glowingParts = {}
local rainbowColors = {
    Color3.new(1, 0, 1), -- Red
    Color3.new(1, 0.5, 0), -- Orange
    Color3.new(1, 1, 0), -- Yellow
    Color3.new(0, 1, 0), -- Green
    Color3.new(1, 0, 0), -- Blue
    Color3.new(0.5, 0, 1), -- Indigo
    Color3.new(1, 0, 1) -- Violet
}

local function setRainbowGlow(part)
    if part:IsA("BasePart") then
        local glow = Instance.new("SurfaceLight")
        glow.Color = rainbowColors[1]
        glow.Brightness = 1
        glow.Range = 15
        glow.Parent = part
        glowingParts[part] = glow
    end
end

local function glowCharacterWithRainbow()
    for _, part in ipairs(character:GetDescendants()) do
        setRainbowGlow(part)
    end
end

local function stopRainbowGlowCharacter()
    for part, glow in pairs(glowingParts) do
        glow:Destroy()
        glowingParts[part] = nil
    end
end

local function onButtonToggle(callback)
    if callback then
        glowCharacterWithRainbow()
    else
        stopRainbowGlowCharacter()
    end
end

local ShinyCharacter = LIB("World", {
    Name = "ShinyCharacter",
    Function = onButtonToggle
})

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    if rainbowGlowButton.IsActive then
        glowCharacterWithRainbow()
    end
end)

local SpacceSky = LIB("Render", {
    Name = "SpaceSky",
    Function = function(callback) 
        if callback then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=159454299"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=159454296"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=159454293"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=159454286"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=159454300"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=159454288"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

local UI = LIB("Utility", {
    Name = "TextureUI",
    Function = function(callback)
            if callback then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectVOIDV1/ProjectVOIDV1/main/TextureUI.lua"))()
            end
        end
    })
end)

local UI = LIB("Utility", {
    Name = "ClosetCheatUI",
    Function = function(callback)
            if callback then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectVOIDV1/ProjectVOIDV1/main/ClosetCheat.lua"))()
            end
        end
    })
end)
