task.delay(
    5,
    function()
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 1
            end
        end
        workspace.DescendantAdded:Connect(
            function(v)
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
        )
        workspace.ClientAnimatorThrottling = Enum.ClientAnimatorThrottlingMode.Enabled
        workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
        settings():GetService("RenderSettings").EagerBulkExecution = false
        workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
        game:GetService("Lighting").GlobalShadows = false
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        local g = game
        local w = g.Workspace
        local l = g.Lighting
        local t = w.Terrain
        t.WaterWaveSize = 0
        t.WaterWaveSpeed = 0
        t.WaterReflectance = 0
        t.WaterTransparency = 0
        l.GlobalShadows = false
        l.FogEnd = 9e9
        l.Brightness = 0
        for _, v in ipairs(g:GetDescendants()) do
            pcall(
                function()
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
                end
            )
        end
        w.ChildAdded:Connect(
            function(v)
                pcall(
                    function()
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
                    end
                )
            end
        )
        for _, effect in ipairs(l:GetChildren()) do
            if
                effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or
                    effect:IsA("BloomEffect") or
                    effect:IsA("DepthOfFieldEffect")
             then
                effect.Enabled = false
            end
        end
        l.ChildAdded:Connect(
            function(v)
                if
                    v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or
                        v:IsA("BloomEffect") or
                        v:IsA("DepthOfFieldEffect")
                 then
                    v.Enabled = false
                end
            end
        )

        if game.Players.LocalPlayer:FindFirstChild("PlayerGui") then
            local guiNames = {
                "BackpackGui",
                "BossHP",
                "BountyHunt",
                "BubbleHP",
                "ButtonEffects",
                "Abilities",
                "BattleRoyaleMiniMap",
                "Crafting",
                "Crews",
                "DebugPixels",
                "EmoteGui",
                "CustomBackpack",
                "Compass",
                "Inventory",
                "Notifications",
                "UIIndicator",
                "globalFeed",
                "TopbarStandard",
                "TopbarStandardClipped",
                "TopbarCenteredClipped",
                "TopbarCentered",
                "Tips",
                "QuestTracker",
                "Quest",
                "Party",
                "Modes",
                "MobileMouseIcon",
                "HealthBars",
                "Display"
            }
            for _, name in ipairs(guiNames) do
                local gui = game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild(name)
                if gui then
                    gui.Enabled = false
                end
            end
        end
    end
)
