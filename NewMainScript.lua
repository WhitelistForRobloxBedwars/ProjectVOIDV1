local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("Project VOID Texture UI", "Serpent")

--Tab
local Tab = Window:NewTab("Home")
local Tab1 = Window:NewTab("Main")
local Tab2 = Window:NewTab("Credits")

--Section
local TabSection = Tab1:NewSection("Welcome:" ..plrname.. " To: Project VOID Texture UI")
local Tab1Section = Tab3:NewSection("Choose Texture")
local Tab2Section = Tab:NewSection("Credit To fakemarioguys (discord name)")

--Label
TabSection:NewLabel("Player Id: "..game.Players.LocalPlayer.UserId .."")
TabSection:NewLabel("Account Age: "..game.Players.LocalPlayer.AccountAge.."")

--Main
Tab1Section:NewButton("Vape", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)

Tab1Section:NewButton("TxtPack1", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectVOIDV1/ProjectVOIDV1/main/Texture.lua"))()
end)

Tab1Section:NewButton("TxtPack2", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ayto0/HardWare/main/SnoopyLeakedTexturePack", true))()
end)

Tab1Section:NewButton("TxtPack3", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectVOIDV1/ProjectVOIDV1/main/Texture2.lua"))()
end)

Tab1Section:NewButton("TxtPack4", "", function()
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
