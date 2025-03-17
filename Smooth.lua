task.delay(5, function()
    local Players = game:GetService("Players")
    local RS = game:GetService("ReplicatedStorage")
    local WS = game:GetService("Workspace")
    local LG = game:GetService("Lighting")
    local userSettings = settings()
    local renderSettings = userSettings:GetService("RenderSettings")
    local localPlayer = Players.LocalPlayer
    local terrain = WS.Terrain
    for _, v in ipairs(WS:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
        end
    end
    WS.DescendantAdded:Connect(function(v)
        if v:IsA("BasePart") then
            v.Transparency = 1
        end
    end)
    WS.ClientAnimatorThrottling = Enum.ClientAnimatorThrottlingMode.Enabled
    WS.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
    renderSettings.EagerBulkExecution = false
    WS.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
    LG.GlobalShadows = false
    userSettings.Rendering.QualityLevel = Enum.QualityLevel.Level01
    terrain.WaterWaveSize = 0
    terrain.WaterWaveSpeed = 0
    terrain.WaterReflectance = 0
    terrain.WaterTransparency = 0
    LG.GlobalShadows = false
    LG.FogEnd = 9e9
    LG.Brightness = 0
    for _, v in ipairs(game:GetDescendants()) do
        pcall(function()
            if v:IsA("BasePart") then
                if v:IsA("MeshPart") then
                    v.Material = Enum.Material.Plastic
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
                else
                    v.Material = Enum.Material.Plastic
                    v.Reflectance = 0
                    v.Transparency = 1
                end
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end)
    end
    WS.ChildAdded:Connect(function(v)
        pcall(function()
            if v:IsA("BasePart") then
                if v:IsA("MeshPart") then
                    v.Material = Enum.Material.Plastic
                    v.Reflectance = 0
                    v.TextureID = 10385902758728957
                else
                    v.Material = Enum.Material.Plastic
                    v.Reflectance = 0
                    v.Transparency = 1
                end
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end)
    end)
    for _, effect in ipairs(LG:GetChildren()) do
        if effect:IsA("BlurEffect")
        or effect:IsA("SunRaysEffect")
        or effect:IsA("ColorCorrectionEffect")
        or effect:IsA("BloomEffect")
        or effect:IsA("DepthOfFieldEffect") then
            effect.Enabled = false
        end
    end
    LG.ChildAdded:Connect(function(v)
        if v:IsA("BlurEffect")
        or v:IsA("SunRaysEffect")
        or v:IsA("ColorCorrectionEffect")
        or v:IsA("BloomEffect")
        or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end)
    if localPlayer:FindFirstChild("PlayerGui") then
        local playerGui = localPlayer:FindFirstChild("PlayerGui")
        local guiNames = {
            "BackpackGui","BossHP","BountyHunt","BubbleHP","ButtonEffects","Abilities","BattleRoyaleMiniMap",
            "Crafting","Crews","DebugPixels","EmoteGui","CustomBackpack","Compass","Inventory","Notifications",
            "UIIndicator","globalFeed","TopbarStandard","TopbarStandardClipped","TopbarCenteredClipped",
            "TopbarCentered","Tips","QuestTracker","Quest","Party","Modes","MobileMouseIcon","HealthBars","Display","HUD"
        }
        for _, name in ipairs(guiNames) do
            local gui = playerGui:FindFirstChild(name)
            if gui then
                gui.Enabled = false
            end
        end
    end
    local Effects = RS:FindFirstChild("Effects")
    local HitEffect = Effects and Effects:FindFirstChild("HitEffect")
    if HitEffect then
        HitEffect:Destroy()
    end
    local counter = Players[localPlayer.Name].PlayerScripts.ClientMain.Combo
    if counter then
        counter:Destroy()
    end
    local deadNPCs = WS:FindFirstChild("Effects") and WS.Effects:FindFirstChild("DeadNPCs")
    if deadNPCs then
        deadNPCs:Destroy()
    end
    local damageHighlight = Effects and Effects:FindFirstChild("DamageHighlight")
    if damageHighlight then
        damageHighlight:Destroy()
    end
end)
