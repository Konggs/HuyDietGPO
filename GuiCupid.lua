local RunService = game:GetService("RunService")
local CoreGui    = game:GetService("CoreGui")
local Workspace  = game:GetService("Workspace")
RunService:Set3dRenderingEnabled(false)
local function GUI()
    local startTime = tick()
    local function getTimeSinceStart()
        local elapsed = tick() - startTime
        local minutes = math.floor(elapsed / 60)
        local seconds = math.floor(elapsed % 60)
        return string.format("%02d:%02d", minutes, seconds)
    end
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name   = "CupidDungeonGui"
    ScreenGui.Parent = CoreGui
    ScreenGui.Enabled = true
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name                   = "TitleLabel"
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.BorderSizePixel        = 0
    TitleLabel.AnchorPoint            = Vector2.new(0.5, 0.5)
    TitleLabel.Position = UDim2.new(0.5, 0, 0.2, 0)
    TitleLabel.Size     = UDim2.new(0.3, 0, 0.08, 0)
    TitleLabel.Font          = Enum.Font.Gotham
    TitleLabel.Text          = "Cupid Dungeon"
    TitleLabel.TextColor3    = Color3.fromRGB(0, 0, 0)
    TitleLabel.TextScaled    = true
    TitleLabel.Parent        = ScreenGui
    local NpcScrollFrame = Instance.new("ScrollingFrame")
    NpcScrollFrame.Name                   = "NpcScrollFrame"
    NpcScrollFrame.BackgroundColor3       = Color3.fromRGB(230, 230, 230)
    NpcScrollFrame.BackgroundTransparency = 0.2
    NpcScrollFrame.BorderSizePixel        = 0
    NpcScrollFrame.AnchorPoint            = Vector2.new(0.5, 0.5)
    NpcScrollFrame.Position = UDim2.new(0.5, 0, 0.4, 0)
    NpcScrollFrame.Size     = UDim2.new(0.4, 0, 0.25, 0)
    NpcScrollFrame.ScrollBarThickness     = 6
    NpcScrollFrame.ScrollingDirection     = Enum.ScrollingDirection.Y
    NpcScrollFrame.Parent                 = ScreenGui
    local layout = Instance.new("UIListLayout")
    layout.Padding            = UDim.new(0, 4)
    layout.FillDirection      = Enum.FillDirection.Vertical
    layout.SortOrder          = Enum.SortOrder.LayoutOrder
    layout.Parent             = NpcScrollFrame
    local TimeLabel = Instance.new("TextLabel")
    TimeLabel.Name                   = "TimeLabel"
    TimeLabel.BackgroundTransparency = 1
    TimeLabel.BorderSizePixel        = 0
    TimeLabel.AnchorPoint            = Vector2.new(0.5, 0.5)
    TimeLabel.Position = UDim2.new(0.5, 0, 0.65, 0)
    TimeLabel.Size     = UDim2.new(0.2, 0, 0.06, 0)
    TimeLabel.Font      = Enum.Font.GothamBold
    TimeLabel.Text      = "Time: 00:00"
    TimeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TimeLabel.TextScaled = true
    TimeLabel.Parent     = ScreenGui
    local function getAllNpcs()
        local allNpcs = {}
        local npcsFolder = Workspace:FindFirstChild("NPCs")
        if npcsFolder then
            for _, npc in ipairs(npcsFolder:GetChildren()) do
                local hrp      = npc:FindFirstChild("HumanoidRootPart")
                local humanoid = npc:FindFirstChild("Humanoid")
                if hrp and humanoid then
                    table.insert(allNpcs, npc)
                end
            end
        end
        return allNpcs
    end
    task.spawn(function()
        while task.wait(1) do
        pcall(function()
            for _, child in ipairs(NpcScrollFrame:GetChildren()) do
                if child:IsA("TextLabel") then
                    child:Destroy()
                end
            end
            local npcs = getAllNpcs()
            if #npcs == 0 then
                local noNpcLabel = Instance.new("TextLabel")
                noNpcLabel.BackgroundTransparency = 1
                noNpcLabel.Size                   = UDim2.new(1, 0, 0, 30) 
                noNpcLabel.Font                   = Enum.Font.Gotham
                noNpcLabel.Text                   = "No NPC Found"
                noNpcLabel.TextColor3             = Color3.fromRGB(0, 0, 0)
                noNpcLabel.TextScaled             = true
                noNpcLabel.Parent                 = NpcScrollFrame
            else
                for _, npc in ipairs(npcs) do
                    local hum = npc:FindFirstChild("Humanoid")
                    local lbl = Instance.new("TextLabel")
                    lbl.BackgroundTransparency = 1
                    lbl.Size = UDim2.new(1, 0, 0, 30)
                    lbl.Font = Enum.Font.Gotham
                    lbl.TextColor3 = Color3.fromRGB(0, 0, 0)
                    lbl.TextScaled = true
                    lbl.TextXAlignment = Enum.TextXAlignment.Left
                    if hum then
                        lbl.Text = string.format("%s [%d/%d]",
                            npc.Name,
                            math.floor(hum.Health),
                            math.floor(hum.MaxHealth)
                        )
                    else
                        lbl.Text = npc.Name .. " [No HP Info]"
                    end
                    lbl.Parent = NpcScrollFrame
                end
            end
            TimeLabel.Text = "Time: " .. getTimeSinceStart()
            end)
        end
    end)
end

GUI()
