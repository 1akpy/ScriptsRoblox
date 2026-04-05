

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Name = "ManMen"
mainMenu.Size = UDim2.new(0, 329, 0, 119)
mainMenu.Position = UDim2.new(0.29922, 0, 0.22222, 0)
mainMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainMenu.BackgroundTransparency = 0.5
mainMenu.BorderSizePixel = 0
mainMenu.Parent = screenGui

Instance.new("UICorner", mainMenu)

local header = Instance.new("Frame")
header.Name = "okak"
header.Size = UDim2.new(0, 329, 0, 31)
header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
header.BackgroundTransparency = 0.65
header.BorderSizePixel = 0
header.Parent = mainMenu

Instance.new("UICorner", header)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 303, 0, 43)
titleLabel.Position = UDim2.new(-0.00087, 0, -0.21976, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "StudLongJumpObby @zyluhub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.TextWrapped = true
titleLabel.RichText = true
titleLabel.FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
titleLabel.Parent = header

local frame1 = Instance.new("Frame")
frame1.Name = "1"
frame1.Size = UDim2.new(0, 147, 0, 66)
frame1.Position = UDim2.new(0.03325, 0, 0.30775, 0)
frame1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame1.BackgroundTransparency = 0.65
frame1.BorderSizePixel = 0
frame1.Parent = mainMenu

Instance.new("UICorner", frame1)

local label1 = Instance.new("TextLabel")
label1.Size = UDim2.new(0, 140, 0, 32)
label1.BackgroundTransparency = 1
label1.Text = "All Stage"
label1.TextColor3 = Color3.fromRGB(255, 255, 255)
label1.TextScaled = true
label1.TextWrapped = true
label1.RichText = true
label1.FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
label1.Parent = frame1

local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 120, 0, 19)
button1.Position = UDim2.new(0.08781, 0, 0.62121, 0)
button1.BackgroundColor3 = Color3.fromRGB(27, 255, 0)
button1.Text = "CLICK"
button1.TextColor3 = Color3.fromRGB(0, 0, 0)
button1.TextScaled = true
button1.TextWrapped = true
button1.BorderSizePixel = 0
button1.FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
button1.Parent = frame1

Instance.new("UICorner", button1)

button1.MouseButton1Click:Connect(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    for i = 0, 51 do
        task.wait(0.1)
        hrp.CFrame = workspace.Checkpoints[i].CFrame
    end
end)

local frame2 = Instance.new("Frame")
frame2.Name = "2"
frame2.Size = UDim2.new(0, 147, 0, 66)
frame2.Position = UDim2.new(0.51673, 0, 0.30775, 0)
frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame2.BackgroundTransparency = 0.65
frame2.BorderSizePixel = 0
frame2.Parent = mainMenu

Instance.new("UICorner", frame2)

local label2 = Instance.new("TextLabel")
label2.Size = UDim2.new(0, 146, 0, 41)
label2.BackgroundTransparency = 1
label2.Text = "Rebirth TELEPORT"
label2.TextColor3 = Color3.fromRGB(255, 255, 255)
label2.TextScaled = true
label2.TextWrapped = true
label2.RichText = true
label2.AutoLocalize = false
label2.FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
label2.Parent = frame2

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 120, 0, 19)
button2.Position = UDim2.new(0.08781, 0, 0.62121, 0)
button2.BackgroundColor3 = Color3.fromRGB(27, 255, 0)
button2.Text = "CLICK"
button2.TextColor3 = Color3.fromRGB(0, 0, 0)
button2.TextScaled = true
button2.TextWrapped = true
button2.BorderSizePixel = 0
button2.FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
button2.Parent = frame2

Instance.new("UICorner", button2)

button2.MouseButton1Click:Connect(function()
    local char = player.Character or player.CharacterAdded:Wait()
    char.HumanoidRootPart.CFrame = workspace.RebirthPart.CFrame
end)

local isMenuOpen = true
local isDragging = false
local dragStartPos, menuStartPos

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        isMenuOpen = not isMenuOpen
        mainMenu.Visible = isMenuOpen
    end
end)

header.Active = true

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStartPos = UserInputService:GetMouseLocation()
        menuStartPos = mainMenu.Position
    end
end)

header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not isDragging or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
    local delta = UserInputService:GetMouseLocation() - dragStartPos
    mainMenu.Position = UDim2.new(
        menuStartPos.X.Scale + delta.X / mainMenu.Parent.AbsoluteSize.X,
        0,
        menuStartPos.Y.Scale + delta.Y / mainMenu.Parent.AbsoluteSize.Y,
        0
    )
end)
