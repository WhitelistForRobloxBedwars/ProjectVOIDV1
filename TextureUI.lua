
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library:CreateLib("Texture UI", "Serpent")
local GameId = game.PlaceId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local plrname = plr.Name
local plrid = plr.UserId
local plrchr = plr.Character
local plrage = plr.AccountAge
local plrcount = #game.Players:GetPlayers()

local Tab = Window:NewTab("Home")
local TabSection = Tab:NewSection("Welcome: " .. game.Players.LocalPlayer.Name .. " To: Project VOID Texture UI")
local Section = Tab:NewSection("Choose Texture")
Section:NewLabel("Player Id: " .. game.Players.LocalPlayer.UserId)
Section:NewLabel("Account Age: " .. game.Players.LocalPlayer.AccountAge)

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Choose Texture")

Section:NewButton("TxtPack1", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectVOIDV1/ProjectVOIDV1/main/Texture.lua"))()
end)

Section:NewButton("TxtPack2", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ayto0/HardWare/main/SnoopyLeakedTexturePack", true))()
end)

Section:NewButton("TxtPack3", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectVOIDV1/ProjectVOIDV1/main/Texture2.lua"))()
end)

Section:NewButton("TxtPack4", "", function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    local objs = game:GetObjects("rbxassetid://14060102755")
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
    }

    local func = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)
        if not tool:IsA("Accessory") then
            return
        end

        for _, v in pairs(index) do
            if v.name == tool.Name then
                for _, part in pairs(tool:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("UnionOperation") then
                        part.Transparency = 1
                    end
                end

                local model = v.model:Clone()
                model.CFrame = tool.Handle.CFrame * v.offset
                model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                model.Parent = tool

                local weld = Instance.new("WeldConstraint", model)
                weld.Part0 = model
                weld.Part1 = tool.Handle

                local tool2 = Players.LocalPlayer.Character:FindFirstChild(tool.Name)
                if tool2 then
                    for _, part in pairs(tool2:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("UnionOperation") then
                            part.Transparency = 1
                        end
                    end

                    local model2 = v.model:Clone()
                    model2.Anchored = false
                    model2.CFrame = tool2.Handle.CFrame * v.offset
                    model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
                    model2.CFrame *= CFrame.new(0.36, 0, -0.75)
                    model2.Parent = tool2

                    local weld2 = Instance.new("WeldConstraint", model2)
                    weld2.Part0 = model2
                    weld2.Part1 = tool2.Handle
                end
            end
        end
    end)
end)

local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("Credit To fakemarioguys (discord name)")
