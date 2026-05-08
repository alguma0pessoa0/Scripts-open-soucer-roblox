-- ==========================================
-- OPPKS HUB â€” UI + Galactic Dumper v1.7.5 logic
-- ==========================================

local env = _G
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- â”€â”€ Positions â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local pos1 = Vector3.new(-352.98, -7, 74.30)
local pos2 = Vector3.new(-352.98, -6.49, 45.76)

local spot1_sequence = {
    CFrame.new(-370.810913, -7.00000334, 41.2687263,
        0.99984771, 1.22364419e-09, 0.0174523517,
        -6.54859778e-10, 1, -3.2596418e-08,
        -0.0174523517, 3.25800258e-08, 0.99984771),
    CFrame.new(-336.355286, -5.10107088, 17.2327671,
        -0.999883354, -2.76150569e-08, 0.0152716246,
        -2.88224964e-08, 1, -7.88441525e-08,
        -0.0152716246, -7.9275118e-08, -0.999883354)
}

local spot2_sequence = {
    CFrame.new(-354.782867, -7.00000334, 92.8209305,
        -0.999997616, -1.11891862e-09, -0.00218066527,
        -1.11958298e-09, 1, 3.03415071e-10,
        0.00218066527, 3.05855785e-10, -0.999997616),
    CFrame.new(-336.942902, -5.10106993, 99.3276443,
        0.999914348, -3.63984611e-08, 0.0130875716,
        3.67094941e-08, 1, -2.35254749e-08,
        -0.0130875716, 2.40038975e-08, 0.999914348)
}

-- â”€â”€ ResetToWork (flags + char reset) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local function ResetToWork()
    local flags = {
        {"GameNetPVHeaderRotationalVelocityZeroCutoffExponent", "-5000"},
        {"LargeReplicatorWrite5", "true"},
        {"LargeReplicatorEnabled9", "true"},
        {"AngularVelociryLimit", "360"},
        {"TimestepArbiterVelocityCriteriaThresholdTwoDt", "2147483646"},
        {"S2PhysicsSenderRate", "15000"},
        {"DisableDPIScale", "true"},
        {"MaxDataPacketPerSend", "2147483647"},
        {"ServerMaxBandwith", "52"},
        {"PhysicsSenderMaxBandwidthBps", "20000"},
        {"MaxTimestepMultiplierBuoyancy", "2147483647"},
        {"SimOwnedNOUCountThresholdMillionth", "2147483647"},
        {"MaxMissedWorldStepsRemembered", "-2147483648"},
        {"CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth", "1"},
        {"StreamJobNOUVolumeLengthCap", "2147483647"},
        {"DebugSendDistInSteps", "-2147483648"},
        {"MaxTimestepMultiplierAcceleration", "2147483647"},
        {"LargeReplicatorRead5", "true"},
        {"SimExplicitlyCappedTimestepMultiplier", "2147483646"},
        {"GameNetDontSendRedundantNumTimes", "1"},
        {"CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent", "1"},
        {"CheckPVCachedRotVelThresholdPercent", "10"},
        {"LargeReplicatorSerializeRead3", "true"},
        {"ReplicationFocusNouExtentsSizeCutoffForPauseStuds", "2147483647"},
        {"NextGenReplicatorEnabledWrite4", "true"},
        {"CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth", "1"},
        {"GameNetDontSendRedundantDeltaPositionMillionth", "1"},
        {"InterpolationFrameVelocityThresholdMillionth", "5"},
        {"StreamJobNOUVolumeCap", "2147483647"},
        {"InterpolationFrameRotVelocityThresholdMillionth", "5"},
        {"WorldStepMax", "30"},
        {"TimestepArbiterHumanoidLinearVelThreshold", "1"},
        {"InterpolationFramePositionThresholdMillionth", "5"},
        {"TimestepArbiterHumanoidTurningVelThreshold", "1"},
        {"MaxTimestepMultiplierContstraint", "2147483647"},
        {"GameNetPVHeaderLinearVelocityZeroCutoffExponent", "-5000"},
        {"CheckPVCachedVelThresholdPercent", "10"},
        {"TimestepArbiterOmegaThou", "1073741823"},
        {"MaxAcceptableUpdateDelay", "1"},
        {"LargeReplicatorSerializeWrite4", "true"},
    }
    for _, data in ipairs(flags) do
        pcall(function() if setfflag then setfflag(data[1], data[2]) end end)
    end
    local char = player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Dead) end
        char:ClearAllChildren()
        local f = Instance.new("Model", workspace)
        player.Character = f
        task.wait()
        player.Character = char
        f:Destroy()
    end
end

task.spawn(function() task.wait(1) ResetToWork() end)

-- â”€â”€ Cleanup old SemiTP / old GUI â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
pcall(function()
    local v2 = player:FindFirstChild("PlayerGui")
    if v2 then
        local v3 = v2:FindFirstChild("UGC_SemiTP")
        if v3 then v3:Destroy() end
    end
end)
if CoreGui:FindFirstChild("oppks71HubGui") then
    CoreGui["oppksHubGui"]:Destroy()
end

-- â”€â”€ ScreenGui â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "oppks71HubGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = CoreGui

-- â”€â”€ Main Frame â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 210, 0, 355)
mainFrame.Position = UDim2.new(0.5, -105, 0.5, -177)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 16, 22)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Thickness = 2
mainStroke.Color = Color3.fromRGB(140, 80, 220)

-- â”€â”€ Title â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 22)
titleLabel.Position = UDim2.new(0, 0, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Winixs Hub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 16
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = mainFrame

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, 0, 0, 14)
subtitleLabel.Position = UDim2.new(0, 0, 0, 34)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Best Hub"
subtitleLabel.TextColor3 = Color3.fromRGB(140, 130, 155)
subtitleLabel.TextSize = 10
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
subtitleLabel.Parent = mainFrame

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -24, 0, 1)
divider.Position = UDim2.new(0, 12, 0, 52)
divider.BackgroundColor3 = Color3.fromRGB(60, 50, 70)
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- â”€â”€ BOOST toggle (Mia Speed Boost logic) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local boostEnabled = false
local SpeedValue   = 22.5
local JumpValue    = 35

-- Editable value rows (TextBox)
local function makeEditableRow(labelText, defaultValue, yPos, onChanged)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -24, 0, 30)
    row.Position = UDim2.new(0, 12, 0, yPos)
    row.BackgroundTransparency = 1
    row.Parent = mainFrame

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.55, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = Color3.fromRGB(220, 215, 230)
    lbl.TextSize = 12
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local valBox = Instance.new("Frame")
    valBox.Size = UDim2.new(0, 60, 0, 26)
    valBox.Position = UDim2.new(1, -60, 0.5, -13)
    valBox.BackgroundColor3 = Color3.fromRGB(30, 26, 38)
    valBox.BorderSizePixel = 0
    valBox.Parent = row
    Instance.new("UICorner", valBox).CornerRadius = UDim.new(0, 6)

    local tb = Instance.new("TextBox")
    tb.Size = UDim2.new(1, -6, 1, 0)
    tb.Position = UDim2.new(0, 3, 0, 0)
    tb.BackgroundTransparency = 1
    tb.Text = tostring(defaultValue)
    tb.TextColor3 = Color3.fromRGB(200, 195, 215)
    tb.TextSize = 12
    tb.Font = Enum.Font.GothamBold
    tb.TextXAlignment = Enum.TextXAlignment.Center
    tb.ClearTextOnFocus = false
    tb.Parent = valBox

    tb.FocusLost:Connect(function()
        local v = tonumber(tb.Text)
        if v then
            onChanged(v)
        else
            tb.Text = tostring(defaultValue)
        end
    end)

    return tb
end

makeEditableRow("Walk Speed", SpeedValue, 62, function(v)
    SpeedValue = v
end)
makeEditableRow("Jump Power", JumpValue, 98, function(v)
    JumpValue = v
end)

local boostBtn = Instance.new("TextButton")
boostBtn.Size = UDim2.new(1, -24, 0, 36)
boostBtn.Position = UDim2.new(0, 12, 0, 140)
boostBtn.BackgroundColor3 = Color3.fromRGB(60, 170, 60)
boostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
boostBtn.Text = "BOOST + ON"
boostBtn.TextSize = 13
boostBtn.Font = Enum.Font.GothamBlack
boostBtn.BorderSizePixel = 0
boostBtn.Parent = mainFrame
Instance.new("UICorner", boostBtn).CornerRadius = UDim.new(0, 8)

boostBtn.MouseButton1Click:Connect(function()
    boostEnabled = not boostEnabled
    TweenService:Create(boostBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = boostEnabled and Color3.fromRGB(60, 170, 60) or Color3.fromRGB(80, 75, 95)
    }):Play()
    boostBtn.Text = boostEnabled and "BOOST + ON" or "BOOST + OFF"
end)

-- Mia Speed Boost: velocity-based movement + JumpPower override
RunService.Heartbeat:Connect(function()
    if not boostEnabled then return end
    local char = player.Character
    local hum  = char and char:FindFirstChildOfClass("Humanoid")
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if hum and root then
        if hum.MoveDirection.Magnitude > 0 then
            root.Velocity = Vector3.new(
                hum.MoveDirection.X * SpeedValue,
                root.Velocity.Y,
                hum.MoveDirection.Z * SpeedValue
            )
        end
        hum.UseJumpPower = true
        hum.JumpPower = JumpValue
    end
end)

-- â”€â”€ Giant Potion auto toggle â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local giantAutoEnabled = true

local giantRow = Instance.new("Frame")
giantRow.Size = UDim2.new(1, -24, 0, 30)
giantRow.Position = UDim2.new(0, 12, 0, 188)
giantRow.BackgroundTransparency = 1
giantRow.Parent = mainFrame

local giantLabel = Instance.new("TextLabel")
giantLabel.Size = UDim2.new(0.72, 0, 1, 0)
giantLabel.BackgroundTransparency = 1
giantLabel.Text = "Giant Potion (no work)"
giantLabel.TextColor3 = Color3.fromRGB(220, 215, 230)
giantLabel.TextSize = 12
giantLabel.Font = Enum.Font.Gotham
giantLabel.TextXAlignment = Enum.TextXAlignment.Left
giantLabel.Parent = giantRow

local toggleBox = Instance.new("TextButton")
toggleBox.Size = UDim2.new(0, 28, 0, 28)
toggleBox.Position = UDim2.new(1, -28, 0.5, -14)
toggleBox.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
toggleBox.Text = ""
toggleBox.BorderSizePixel = 0
toggleBox.Parent = giantRow
Instance.new("UICorner", toggleBox).CornerRadius = UDim.new(0, 6)

local checkMark = Instance.new("TextLabel")
checkMark.Size = UDim2.new(1, 0, 1, 0)
checkMark.BackgroundTransparency = 1
checkMark.Text = "off"
checkMark.TextColor3 = Color3.fromRGB(80, 200, 80)
checkMark.TextSize = 16
checkMark.Font = Enum.Font.GothamBold
checkMark.Visible = true
checkMark.Parent = toggleBox

toggleBox.MouseButton1Click:Connect(function()
    giantAutoEnabled = not giantAutoEnabled
    checkMark.Visible = giantAutoEnabled
    toggleBox.BackgroundColor3 = giantAutoEnabled and Color3.fromRGB(40, 80, 40) or Color3.fromRGB(30, 26, 38)
end)

task.spawn(function()
    while true do
        task.wait(0.5)
        if giantAutoEnabled then
            local char = player.Character
            if char then
                local b = player:FindFirstChild("Backpack")
                if b then
                    local potion = b:FindFirstChild("Giant Potion") or b:FindFirstChild("Giant Potion ðŸ§ª")
                    if potion then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then hum:EquipTool(potion) end
                    end
                end
            end
        end
    end
end)

-- â”€â”€ STEAL + Left button â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local stealLeftBtn = Instance.new("TextButton")
stealLeftBtn.Size = UDim2.new(1, -24, 0, 36)
stealLeftBtn.Position = UDim2.new(0, 12, 0, 232)
stealLeftBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 55)
stealLeftBtn.TextColor3 = Color3.fromRGB(180, 140, 255)
stealLeftBtn.Text = "STEAL + Left"
stealLeftBtn.TextSize = 13
stealLeftBtn.Font = Enum.Font.GothamBold
stealLeftBtn.BorderSizePixel = 0
stealLeftBtn.Parent = mainFrame
Instance.new("UICorner", stealLeftBtn).CornerRadius = UDim.new(0, 8)
local slStroke = Instance.new("UIStroke", stealLeftBtn)
slStroke.Color = Color3.fromRGB(100, 70, 180)
slStroke.Thickness = 1.5

-- â”€â”€ STEAL + Right button â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local stealRightBtn = Instance.new("TextButton")
stealRightBtn.Size = UDim2.new(1, -24, 0, 36)
stealRightBtn.Position = UDim2.new(0, 12, 0, 278)
stealRightBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 15)
stealRightBtn.TextColor3 = Color3.fromRGB(255, 200, 50)
stealRightBtn.Text = "STEAL + Right"
stealRightBtn.TextSize = 13
stealRightBtn.Font = Enum.Font.GothamBold
stealRightBtn.BorderSizePixel = 0
stealRightBtn.Parent = mainFrame
Instance.new("UICorner", stealRightBtn).CornerRadius = UDim.new(0, 8)
local srStroke = Instance.new("UIStroke", stealRightBtn)
srStroke.Color = Color3.fromRGB(180, 130, 30)
srStroke.Thickness = 1.5

-- â”€â”€ Progress bar â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1, -24, 0, 8)
barBg.Position = UDim2.new(0, 12, 0, 330)
barBg.BackgroundColor3 = Color3.fromRGB(30, 26, 38)
barBg.BorderSizePixel = 0
barBg.ClipsDescendants = true
barBg.Parent = mainFrame
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(140, 80, 220)
barFill.BorderSizePixel = 0
barFill.Parent = barBg
Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

-- â”€â”€ Drag â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local dragging, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos  = mainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
                     input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- â”€â”€ Steal logic â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local allAnimalsCache    = {}
local InternalStealCache = {}
local IsStealing         = false
local StealProgress      = 0

local function getHRP()
    local char = player.Character
    return char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso"))
end

local function isMyBase(plotName)
    local plot = workspace.Plots:FindFirstChild(plotName)
    return plot
        and plot:FindFirstChild("PlotSign")
        and plot.PlotSign:FindFirstChild("YourBase")
        and plot.PlotSign.YourBase.Enabled
end

local function scan()
    table.clear(allAnimalsCache)
    for _, p in ipairs(workspace.Plots:GetChildren()) do
        if not isMyBase(p.Name) and p:FindFirstChild("AnimalPodiums") then
            for _, pod in ipairs(p.AnimalPodiums:GetChildren()) do
                if pod:FindFirstChild("Base") then
                    table.insert(allAnimalsCache, {
                        plot          = p.Name,
                        slot          = pod.Name,
                        worldPosition = pod:GetPivot().Position,
                        uid           = p.Name .. "_" .. pod.Name
                    })
                end
            end
        end
    end
end

task.spawn(function() while task.wait(5) do scan() end end)
scan()

local function buildSteal(prompt)
    if InternalStealCache[prompt] then return end
    local d = {hold = {}, trig = {}, ready = true}
    local ok1, c1 = pcall(getconnections, prompt.PromptButtonHoldBegan)
    if ok1 then for _, c in ipairs(c1) do table.insert(d.hold, c.Function) end end
    local ok2, c2 = pcall(getconnections, prompt.Triggered)
    if ok2 then for _, c in ipairs(c2) do table.insert(d.trig, c.Function) end end
    InternalStealCache[prompt] = d
end

local function execSteal(prompt, animal, seq)
    buildSteal(prompt)
    local d = InternalStealCache[prompt]
    if not d or not d.ready or IsStealing then return end
    d.ready = false
    IsStealing = true
    StealProgress = 0
    local tpDone = false
    task.spawn(function()
        for _, f in ipairs(d.hold) do task.spawn(f) end
        local s = tick()
        while tick() - s < 1.3 do
            StealProgress = (tick() - s) / 1.3
            if StealProgress >= 0.73 and not tpDone then
                tpDone = true
                local hrp = getHRP()
                if hrp then
                    local b = player:FindFirstChild("Backpack")
                    if b and b:FindFirstChild("Flying Carpet") then
                        player.Character.Humanoid:EquipTool(b["Flying Carpet"])
                        task.wait(0.1)
                    end
                    hrp.CFrame = seq[1]
                    task.wait(0.1)
                    hrp.CFrame = seq[2]
                    task.wait(0.2)
                    local d1 = (hrp.Position - pos1).Magnitude
                    local d2 = (hrp.Position - pos2).Magnitude
                    hrp.CFrame = CFrame.new(d1 < d2 and pos1 or pos2)
                end
            end
            task.wait()
        end
        for _, f in ipairs(d.trig) do task.spawn(f) end
        task.wait(0.2)
        d.ready = true
        IsStealing = false
        StealProgress = 0
    end)
end

local function findNearestTarget()
    local hrp = getHRP()
    if not hrp or IsStealing then return nil end
    scan()
    local target, dist = nil, 200
    for _, a in ipairs(allAnimalsCache) do
        local dd = (hrp.Position - a.worldPosition).Magnitude
        if dd < dist then dist = dd; target = a end
    end
    return target
end

stealLeftBtn.MouseButton1Click:Connect(function()
    local target = findNearestTarget()
    if target then
        local p = workspace.Plots[target.plot]
            .AnimalPodiums[target.slot].Base.Spawn
            .PromptAttachment:FindFirstChildOfClass("ProximityPrompt")
        if p then execSteal(p, target, spot1_sequence) end
    end
end)

stealRightBtn.MouseButton1Click:Connect(function()
    local target = findNearestTarget()
    if target then
        local p = workspace.Plots[target.plot]
            .AnimalPodiums[target.slot].Base.Spawn
            .PromptAttachment:FindFirstChildOfClass("ProximityPrompt")
        if p then execSteal(p, target, spot2_sequence) end
    end
end)

-- â”€â”€ Progress bar update loop â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
task.spawn(function()
    while task.wait(0.02) do
        local prog = math.clamp(StealProgress, 0, 1)
        barFill.Size = UDim2.new(prog, 0, 1, 0)
        -- Gradient purple â†’ bright as progress fills
        barFill.BackgroundColor3 = Color3.fromRGB(
            math.floor(80  + prog * 80),
            math.floor(20  + prog * 20),
            math.floor(180 + prog * 40)
        )
    end
end)

-- â”€â”€ Button press visual feedback â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local function addPressEffect(btn)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.07), {BackgroundTransparency = 0.35}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.07), {BackgroundTransparency = 0}):Play()
    end)
end

addPressEffect(stealLeftBtn)
addPressEffect(stealRightBtn)
addPressEffect(boostBtn)