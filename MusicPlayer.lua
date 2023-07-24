local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()
Library.DefaultColor = Color3.fromRGB(255,0,0)

Library:Notification({
	Text = "Made by fakemarioguys noice :)",
	Duration = 5
})
----------------------------
wait (3)
-- Song Player GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Background Frame
local background = Instance.new("Frame")
background.Size = UDim2.new(0, 200, 0, 100)
background.BackgroundColor3 = Color3.new(220, 20, 60)
background.BorderColor3 = Color3.new(1, 1, 1)
background.BackgroundTransparency = 0.5
background.Position = UDim2.new(0.5, -100, 0.5, -50)
background.Active = true
background.Draggable = true
background.Parent = gui

-- Song ID Input Box
local idBox = Instance.new("TextBox")
idBox.Size = UDim2.new(0.5, 0, 0.2, 0)
idBox.Position = UDim2.new(0.25, 0, 0.2, 0)
idBox.Text = "Enter Your Song ID"
idBox.Parent = background

-- Play Button
local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0.4, 0, 0.2, 0)
playButton.Position = UDim2.new(0.05, 0, 0.5, 0)
playButton.Text = "Play"
playButton.Parent = background

-- Stop Button
local stopButton = Instance.new("TextButton")
stopButton.Size = UDim2.new(0.4, 0, 0.2, 0)
stopButton.Position = UDim2.new(0.55, 0, 0.5, 0)
stopButton.Text = "Stop"
stopButton.Parent = background

-- Audio Instance
local audio = Instance.new("Sound")
audio.Parent = game.Workspace

-- Side Notification
local notification = Instance.new("TextLabel")
notification.Size = UDim2.new(0, 200, 0, 20)
notification.Position = UDim2.new(1, 0, 0.5, -10)
notification.BackgroundColor3 = Color3.new(1, 1, 1)
notification.BackgroundTransparency = 0.5
notification.TextColor3 = Color3.new(0, 0, 0)
notification.Text = "(FE)"
notification.Parent = gui

-- Play Button Functionality
playButton.MouseButton1Click:Connect(function()
    local id = tonumber(idBox.Text)
    if id then
        audio.SoundId = "rbxassetid://"..id
        audio:Play()
    end
end)

-- Stop Button Functionality
stopButton.MouseButton1Click:Connect(function()
    audio:Stop()
end)
