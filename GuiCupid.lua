local function GUI()
    local CoreGui   = game:GetService("CoreGui")
    local Workspace = game:GetService("Workspace")
    local Lighting  = game:GetService("Lighting")
    local startTime = tick()
    local function getTimeSinceStart()
        local elapsed = tick() - startTime
        local HOUR   = math.floor(elapsed / 3600)
        local MINUTE = math.floor((elapsed % 3600) / 60)
        local SECOND = math.floor(elapsed % 60)
        HOUR   = (HOUR < 10)   and ("0" .. HOUR)   or HOUR
        MINUTE = (MINUTE < 10) and ("0" .. MINUTE) or MINUTE
        SECOND = (SECOND < 10) and ("0" .. SECOND) or SECOND

        return string.format("%s:%s:%s", HOUR, MINUTE, SECOND)
    end
    local FarmStatusGui = Instance.new("ScreenGui")
    FarmStatusGui.Name   = "Cupid Dungeon"
    FarmStatusGui.Parent = CoreGui
    FarmStatusGui.Enabled = true
    local MainFrame = Instance.new("Frame")
    MainFrame.Name              = "MainFrame"
    MainFrame.AnchorPoint       = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3  = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0.999
    MainFrame.BorderSizePixel   = 0
    MainFrame.Position          = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size              = UDim2.new(1, 0, 1, 0)
    MainFrame.Parent            = FarmStatusGui
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name                  = "TitleLabel"
    TitleLabel.AnchorPoint           = Vector2.new(0.5, 0.5)
    TitleLabel.BackgroundColor3      = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 0.999
    TitleLabel.BorderSizePixel       = 0
    TitleLabel.Position              = UDim2.new(0.5, 0, 0.5, -45)
    TitleLabel.Size                  = UDim2.new(0, 300, 0, 80)
    TitleLabel.Font                  = Enum.Font.Gotham
    TitleLabel.Text                  = "Cupid Dungeon"
    TitleLabel.TextColor3            = Color3.fromRGB(175, 187, 230)
    TitleLabel.TextSize              = 65
    TitleLabel.Parent                = MainFrame
    local TitleLabelStroke = Instance.new("UIStroke")
    TitleLabelStroke.Color     = Color3.fromRGB(175, 187, 230)
    TitleLabelStroke.Thickness = 1.5
    TitleLabelStroke.Parent    = TitleLabel
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name                  = "StatusLabel"
    StatusLabel.AnchorPoint           = Vector2.new(0.5, 0.5)
    StatusLabel.BackgroundColor3      = Color3.fromRGB(255, 255, 255)
    StatusLabel.BackgroundTransparency = 0.999
    StatusLabel.BorderSizePixel       = 0
    StatusLabel.Position              = UDim2.new(0.5, 0, 0.5, 0)
    StatusLabel.Size                  = UDim2.new(0, 300, 0, 30)
    StatusLabel.Font                  = Enum.Font.Gotham
    StatusLabel.Text                  = "Status: ..."
    StatusLabel.TextColor3            = Color3.fromRGB(0, 0, 0)
    StatusLabel.TextSize              = 20
    StatusLabel.Parent                = MainFrame
    local TimeLabel = Instance.new("TextLabel")
    TimeLabel.Name                  = "TimeLabel"
    TimeLabel.AnchorPoint           = Vector2.new(0.5, 0.5)
    TimeLabel.BackgroundColor3      = Color3.fromRGB(255, 255, 255)
    TimeLabel.BackgroundTransparency = 0.999
    TimeLabel.BorderSizePixel       = 0
    TimeLabel.Position              = UDim2.new(0.5, 0, 0.5, 32)
    TimeLabel.Size                  = UDim2.new(0, 300, 0, 20)
    TimeLabel.Font                  = Enum.Font.Gotham
    TimeLabel.Text                  = "Time: 0s"
    TimeLabel.TextColor3            = Color3.fromRGB(0, 0, 0)
    TimeLabel.TextSize              = 16
    TimeLabel.Parent                = MainFrame
    local Blur = Instance.new("BlurEffect")
    Blur.Size   = 50
    Blur.Parent = Lighting
    Blur.Enabled = true
    local DropShadowHolder = Instance.new("Frame")
    DropShadowHolder.Name                  = "DropShadowHolder"
    DropShadowHolder.ZIndex                = 0
    DropShadowHolder.Size                  = UDim2.new(1, 0, 1, 0)
    DropShadowHolder.BackgroundTransparency = 1
    DropShadowHolder.BorderSizePixel       = 0
    DropShadowHolder.Parent                = MainFrame
    local DropShadow = Instance.new("ImageLabel")
    DropShadow.Name                  = "DropShadow"
    DropShadow.ZIndex                = 0
    DropShadow.Image                 = "rbxassetid://18274042189"
    DropShadow.ImageColor3           = Color3.fromRGB(0, 0, 0)
    DropShadow.ImageTransparency     = 0.999
    DropShadow.ScaleType             = Enum.ScaleType.Slice
    DropShadow.SliceCenter           = Rect.new(49, 49, 450, 450)
    DropShadow.AnchorPoint           = Vector2.new(0.5, 0.5)
    DropShadow.BackgroundTransparency = 1
    DropShadow.BorderSizePixel       = 0
    DropShadow.Position              = UDim2.new(0.5, 0, 0.5, 0)
    DropShadow.Size                  = UDim2.new(1, 47, 1, 47)
    DropShadow.Parent                = DropShadowHolder
    local function getAllNpcs()
        local allNpcs = {}
        for _, npc in ipairs(Workspace.NPCs:GetChildren()) do
            local hrp      = npc:FindFirstChild("HumanoidRootPart")
            local humanoid = npc:FindFirstChild("Humanoid")
            if hrp and humanoid then
                table.insert(allNpcs, npc)
            end
        end
        return allNpcs
    end
    spawn(function()
        while task.wait(1) do
            local npcTable = getAllNpcs()
            if #npcTable > 0 then
                local lines = {}
                for _, npc in ipairs(npcTable) do
                    local hum = npc:FindFirstChild("Humanoid")
                    if hum then
                        table.insert(
                            lines, 
                            string.format("%s [%d/%d]",
                                npc.Name, 
                                math.floor(hum.Health), 
                                math.floor(hum.MaxHealth)
                            )
                        )
                    else
                        table.insert(lines, npc.Name .. " [No HP Info]")
                    end
                end
                StatusLabel.Text = "Status: Killing " .. table.concat(lines, ", ")
            else
                StatusLabel.Text = "Status: No NPC Found"
            end
            TimeLabel.Text = "Time: " .. getTimeSinceStart()
        end
    end)
end
GUI()
