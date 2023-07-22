
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

Section:NewButton("TxtPack5", "", function()
        --// services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

--// importing the textures
local objs = game:GetObjects("rbxassetid://13732145453")
local import = objs[1]
import.Parent = ReplicatedStorage

--// very epic index for swords
local index = {
    {
        name = "wood_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("wood_sword"),
    },
    {
        name = "stone_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("stone_sword"),
    },
    {
        name = "iron_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("iron_sword"),
    },
    {
        name = "diamond_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("diamond_sword"),
    },
    {
        name = "emerald_sword",
        offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
        model = import:WaitForChild("emerald_sword"),
    },
}

--// main viewmodel renderer
local func = Workspace:WaitForChild("Camera").Viewmodel.ChildAdded:Connect(function(tool)
    if not tool:IsA("Accessory") then
        return
    end

    for _, v in pairs(index) do
        if v.name == tool.Name then
            for _, part in pairs(tool:GetDescendants()) do
                if part:IsA("BasePart") then --// Use 'BasePart' instead of 'Part', since it's the base class for 'Part', 'MeshPart', and 'UnionOperation'.
                    part.Transparency = 1
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

            for _, part2 in pairs(tool2:GetDescendants()) do
                if part2:IsA("BasePart") then --// Use 'BasePart' instead of 'Part', since it's the base class for 'Part', 'MeshPart', and 'UnionOperation'.
                    part2.Transparency = 1
                end
            end

            local model2 = v.model:Clone()
            model2.Anchored = false
            model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
            model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
            model2.CFrame *= CFrame.new(1, 0, -0.9) --// Corrected a decimal value format.
            model2.Parent = tool2

            local weld2 = Instance.new("WeldConstraint", model2)
            weld2.Part0 = model2
            weld2.Part1 = tool2:WaitForChild("Handle")
        end
    end
end)


Section:NewButton("TxtPack6", "", function()
                --// services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

--// importing the textures
local objs = game:GetObjects("rbxassetid://13732134128")
local import = objs[1]

import.Parent = ReplicatedStorage --// ReplicatedStorage instead of game:GetService("ReplicatedStorage")

--// very epic index
local index = {

	{
		name = "wood_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("wood_sword"),
	},
	
	{
		name = "stone_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("stone_sword"),
	},
	
	{
		name = "iron_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("iron_sword"),
	},
	
	{
		name = "diamond_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("diamond_sword"),
	}
	
}

--// main viewmodel renderer
local func = Workspace:WaitForChild("Camera").Viewmodel.ChildAdded:Connect(function(tool)
	
	if not tool:IsA("Accessory") then
		return
	end
	
	for _, v in pairs(index) do
	
		if v.name == tool.Name then
		
			for _, part in pairs(tool:GetDescendants()) do
	
				if part:IsA("BasePart") then --// Use 'BasePart' instead of 'Part', since it's the base class for 'Part', 'MeshPart', and 'UnionOperation'.
				
					part.Transparency = 1
				
				end
			
			end
		
			local model = v.model:Clone()
			model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
			model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
			model.Parent = tool
			model.CanCollide = false --// Fixed missing line and set CanCollide to false.
			
			local weld = Instance.new("WeldConstraint", model)
			weld.Part0 = model
			weld.Part1 = tool:WaitForChild("Handle")
			
			local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)
			
			for _, part2 in pairs(tool2:GetDescendants()) do
	
				if part2:IsA("BasePart") then --// Use 'BasePart' instead of 'Part', since it's the base class for 'Part', 'MeshPart', and 'UnionOperation'.
				
					part2.Transparency = 1
				
				end
			
			end
			
			local model2 = v.model:Clone()
			model2.Anchored = false
			model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
			model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
			model2.CFrame *= CFrame.new(1, 0, -0.9)
			model2.Parent = tool2
			model2.CanCollide = false --// Fixed missing line and set CanCollide to false.
			
			local weld2 = Instance.new("WeldConstraint", model2)
			weld2.Part0 = model2
			weld2.Part1 = tool2:WaitForChild("Handle")
		end
	end
end)

Section:NewButton("TxtPack7", "", function()
-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Importing the textures
local objs = game:GetObjects("rbxassetid://13780890894")
local import = objs[1]
import.Parent = ReplicatedStorage

-- Very epic index for swords
local swordIndex = {
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

-- Very epic index for pickaxes
local pickaxeIndex = {
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
}

-- Helper function to set part transparency
local function setPartTransparency(descendants)
    for _, v in pairs(descendants) do
        if v:IsA("BasePart") then
            v.Transparency = 1
        end
    end
end

-- Main viewmodel renderer function
local function viewmodelRenderer(tool, index)
    if not tool:IsA("Accessory") then
        return
    end

    for _, v in pairs(index) do
        if v.name == tool.Name then
            setPartTransparency(tool:GetDescendants())

            local model = v.model:Clone()
            model.CFrame = tool.Handle.CFrame * v.offset
            model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
            model.Parent = tool

            local weld = Instance.new("WeldConstraint", model)
            weld.Part0 = model
            weld.Part1 = tool.Handle

            local tool2 = Players.LocalPlayer.Character[tool.Name]

            setPartTransparency(tool2:GetDescendants())

            local model2 = v.model:Clone()
            model2.Anchored = false
            model2.CFrame = tool2.Handle.CFrame * v.offset
            model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
            model2.Parent = tool2

            local weld2 = Instance.new("WeldConstraint", model)
            weld2.Part0 = model2
            weld2.Part1 = tool2.Handle

            break -- Exit the loop once the tool is found in the index
        end
    end
end

-- Main viewmodel renderer for swords
local swordFunc = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)
    viewmodelRenderer(tool, swordIndex)
end)

-- Main viewmodel renderer for pickaxes
local pickaxeFunc = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)
    viewmodelRenderer(tool, pickaxeIndex)
end)
                        
                
local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("Credit To fakemarioguys (discord name)")
