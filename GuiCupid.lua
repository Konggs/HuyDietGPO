local function GUI()
    local CoreGui   = game:GetService("CoreGui")
    local Workspace = game:GetService("Workspace")
    local Lighting  = game:GetService("Lighting")
    local startTime = tick()
    local function getTimeSinceStart()
        local elapsed = tick() - startTime
        local minutes = math.floor(elapsed / 60)
        local seconds = math.floor(elapsed % 60)
        return string.format("%02d:%02d", minutes, seconds)
    end
    local FarmStatusGui = Instance.new("ScreenGui")
    FarmStatusGui.Name   = "Cupid Dungeon"
    FarmStatusGui.Parent = CoreGui
    FarmStatusGui.Enabled = true
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(1, 0, 1, 0)
    MainFrame.Parent = FarmStatusGui
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.BorderSizePixel = 0
    TitleLabel.Position = UDim2.new(0.5, 0, 0.5, -45)
    TitleLabel.Size = UDim2.new(0, 300, 0, 80)
    TitleLabel.Font = Enum.Font.Gotham
    TitleLabel.Text = "Cupid Dungeon"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 65
    TitleLabel.Parent = MainFrame
    local TitleLabelStroke = Instance.new("UIStroke")
    TitleLabelStroke.Color = Color3.fromRGB(0, 0, 0)
    TitleLabelStroke.Thickness = 1.5
    TitleLabelStroke.Parent = TitleLabel
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name = "StatusLabel"
    StatusLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    StatusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.BorderSizePixel = 0
    StatusLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    StatusLabel.Size = UDim2.new(0, 300, 0, 30)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = "Status: ..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.TextSize = 20
    StatusLabel.Parent = MainFrame
    local TimeLabel = Instance.new("TextLabel")
    TimeLabel.Name = "TimeLabel"
    TimeLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    TimeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TimeLabel.BackgroundTransparency = 1
    TimeLabel.BorderSizePixel = 0
    TimeLabel.Position = UDim2.new(0.5, 0, 0.5, 32)
    TimeLabel.Size = UDim2.new(0, 300, 0, 20)
    TimeLabel.Font = Enum.Font.Gotham
    TimeLabel.Text = "Time: 00:00"
    TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TimeLabel.TextSize = 16
    TimeLabel.Parent = MainFrame
    spawn(function()
        while task.wait(1) do
            StatusLabel.Text = "Status: No NPC Found"
            TimeLabel.Text = "Time: " .. getTimeSinceStart()
        end
    end)
end
GUI()
