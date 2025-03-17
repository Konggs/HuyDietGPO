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
    MainFrame.Name                  = "MainFrame"
    MainFrame.AnchorPoint           = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3      = Color3.fromRGB(255, 255, 255)
    MainFrame.BackgroundTransparency = 1  -- 0 = không trong suốt, 1 = trong suốt
    MainFrame.BorderSizePixel       = 0
    MainFrame.Position              = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size                  = UDim2.new(1, 0, 1, 0)
    MainFrame.Parent                = FarmStatusGui
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name                  = "TitleLabel"
    TitleLabel.AnchorPoint           = Vector2.new(0.5, 0.5)
    TitleLabel.BackgroundColor3      = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.BorderSizePixel       = 0
    TitleLabel.Position              = UDim2.new(0.5, 0, 0.3, 0)
    TitleLabel.Size                  = UDim2.new(0, 300, 0, 80)
    TitleLabel.Font                  = Enum.Font.Gotham
    TitleLabel.Text                  = "Cupid Dungeon"
    TitleLabel.TextColor3            = Color3.fromRGB(200, 150, 230)
    TitleLabel.TextSize              = 65
    TitleLabel.Parent                = MainFrame
    local TitleLabelStroke = Instance.new("UIStroke")
    TitleLabelStroke.Color     = Color3.fromRGB(0, 0, 0)
    TitleLabelStroke.Thickness = 1.5
    TitleLabelStroke.Parent    = TitleLabel
    local TimeLabel = Instance.new("TextLabel")
    TimeLabel.Name                  = "TimeLabel"
    TimeLabel.AnchorPoint           = Vector2.new(0.5, 0.5)
    TimeLabel.BackgroundColor3      = Color3.fromRGB(255, 255, 255)
    TimeLabel.BackgroundTransparency = 1
    TimeLabel.BorderSizePixel       = 0
    TimeLabel.Position              = UDim2.new(0.5, 0, 0.7, 0)
    TimeLabel.Size                  = UDim2.new(0, 300, 0, 30)
    TimeLabel.Font                  = Enum.Font.Gotham
    TimeLabel.Text                  = "Time: 00:00"
    TimeLabel.TextColor3            = Color3.fromRGB(0, 0, 0)
    TimeLabel.TextSize              = 16
    TimeLabel.Parent                = MainFrame
    local NpcScrollFrame = Instance.new("ScrollingFrame")
    NpcScrollFrame.Name                  = "NpcScrollFrame"
    NpcScrollFrame.AnchorPoint           = Vector2.new(0.5, 0.5)
    NpcScrollFrame.BackgroundColor3      = Color3.fromRGB(255, 255, 255)
    NpcScrollFrame.BackgroundTransparency = 0.2  -- hơi mờ
    NpcScrollFrame.BorderSizePixel       = 0
    NpcScrollFrame.Position              = UDim2.new(0.5, 0, 0.5, 0)
    NpcScrollFrame.Size                  = UDim2.new(0, 400, 0, 150)
    NpcScrollFrame.ScrollBarThickness    = 6
    NpcScrollFrame.ScrollingDirection    = Enum.ScrollingDirection.Y
    NpcScrollFrame.Parent                = MainFrame
    local Layout = Instance.new("UIListLayout")
    Layout.Parent    = NpcScrollFrame
    Layout.Padding   = UDim.new(0, 4)
    Layout.FillDirection = Enum.FillDirection.Vertical
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    local function getAllNpcs()
        local allNpcs = {}
        for _, npc in ipairs(Workspace:WaitForChild("NPCs"):GetChildren()) do
            local hrp      = npc:FindFirstChild("HumanoidRootPart")
            local humanoid = npc:FindFirstChild("Humanoid")
            if hrp and humanoid then
                table.insert(allNpcs, npc)
            end
        end
        return allNpcs
    end
    task.spawn(function()
        while task.wait(1) do
            for _, child in ipairs(NpcScrollFrame:GetChildren()) do
                if child:IsA("TextLabel") then
                    child:Destroy()
                end
            end
            local npcTable = getAllNpcs()
            if #npcTable == 0 then
                local infoLabel = Instance.new("TextLabel")
                infoLabel.BackgroundTransparency = 1
                infoLabel.BorderSizePixel        = 0
                infoLabel.Size                   = UDim2.new(1, 0, 0, 20)
                infoLabel.Font                   = Enum.Font.Gotham
                infoLabel.Text                   = "No NPC Found"
                infoLabel.TextColor3             = Color3.fromRGB(0, 0, 0)
                infoLabel.TextSize               = 16
                infoLabel.Parent                 = NpcScrollFrame
            else
                for _, npc in ipairs(npcTable) do
                    local hum = npc:FindFirstChild("Humanoid")
                    local label = Instance.new("TextLabel")
                    label.BackgroundTransparency = 1
                    label.BorderSizePixel        = 0
                    label.Size                   = UDim2.new(1, 0, 0, 20)  -- chiều cao 20
                    label.Font                   = Enum.Font.Gotham
                    if hum then
                        label.Text = string.format("%s [%d/%d]", npc.Name, math.floor(hum.Health), math.floor(hum.MaxHealth))
                    else
                        label.Text = npc.Name .. " [No HP Info]"
                    end
                    label.TextColor3 = Color3.fromRGB(0, 0, 0)
                    label.TextSize   = 16
                    label.TextXAlignment = Enum.TextXAlignment.Left
                    label.Parent     = NpcScrollFrame
                end
            end
            TimeLabel.Text = "Time: " .. getTimeSinceStart()
        end
    end)
end
GUI()
