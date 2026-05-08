local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SilentHubDesync"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if gethui then
    ScreenGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
else
    ScreenGui.Parent = game:GetService("CoreGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 150)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.BorderSizePixel = 0
Title.Text = "Silent Hub Desync"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

local DesyncButton = Instance.new("TextButton")
DesyncButton.Name = "DesyncButton"
DesyncButton.Size = UDim2.new(0, 250, 0, 50)
DesyncButton.Position = UDim2.new(0.5, -125, 0.5, 10)
DesyncButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DesyncButton.BorderSizePixel = 0
DesyncButton.Text = "DESYNC"
DesyncButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DesyncButton.TextSize = 16
DesyncButton.Font = Enum.Font.GothamBold
DesyncButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = DesyncButton

local ButtonStroke = Instance.new("UIStroke")
ButtonStroke.Color = Color3.fromRGB(255, 0, 0)
ButtonStroke.Thickness = 1
ButtonStroke.Parent = DesyncButton

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(MainFrame, tweenInfo, {Position = newPosition})
    tween:Play()
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

local function ApplyDesync()
    local flags = {
        LargeReplicatorEnabled9 = true,
        GameNetDontSendRedundantNumTimes = 1,
        MaxTimestepMultiplierAcceleration = 2147483647,
        InterpolationFrameVelocityThresholdMillionth = 5,
        CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth = 1,
        TimestepArbiterVelocityCriteriaThresholdTwoDt = 2147483646,
        GameNetPVHeaderLinearVelocityZeroCutoffExponent = -5000,
        TimestepArbiterHumanoidTurningVelThreshold = 1,
        LargeReplicatorSerializeWrite4 = true,
        SimExplicitlyCappedTimestepMultiplier = 2147483646,
        InterpolationFrameRotVelocityThresholdMillionth = 5,
        ServerMaxBandwith = 52,
        LargeReplicatorSerializeRead3 = true,
        GameNetDontSendRedundantDeltaPositionMillionth = 1,
        PhysicsSenderMaxBandwidthBps = 20000,
        CheckPVCachedVelThresholdPercent = 10,
        NextGenReplicatorEnabledWrite4 = true,
        LargeReplicatorWrite5 = true,
        MaxMissedWorldStepsRemembered = -2147483648,
        StreamJobNOUVolumeCap = 2147483647,
        CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent = 1,
        DisableDPIScale = true,
        WorldStepMax = 30,
        InterpolationFramePositionThresholdMillionth = 5,
        MaxAcceptableUpdateDelay = 1,
        TimestepArbiterOmegaThou = 1073741823,
        CheckPVCachedRotVelThresholdPercent = 10,
        StreamJobNOUVolumeLengthCap = 2147483647,
        S2PhysicsSenderRate = 15000,
        MaxTimestepMultiplierBuoyancy = 2147483647,
        SimOwnedNOUCountThresholdMillionth = 2147483647,
        ReplicationFocusNouExtentsSizeCutoffForPauseStuds = 2147483647,
        LargeReplicatorRead5 = true,
        CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth = 1,
        MaxDataPacketPerSend = 2147483647,
        MaxTimestepMultiplierContstraint = 2147483647,
        DebugSendDistInSteps = -2147483648,
        GameNetPVHeaderRotationalVelocityZeroCutoffExponent = -5000,
        AngularVelociryLimit = 360
    }
    
    for flag, value in pairs(flags) do
        pcall(function()
            setfflag(flag, value)
        end)
    end
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    pcall(function()
        hrp:SetNetworkOwner(nil)
    end)
    
    local emptyModel = Instance.new("Model")
    emptyModel.Name = "DesyncModel"
    emptyModel.Parent = workspace
    
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        pcall(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Dead)
        end)
    end
    
    DesyncButton.Text = "DESYNC ENABLED!"
    wait(1)
    DesyncButton.Text = "DESYNC"
end

DesyncButton.MouseButton1Click:Connect(ApplyDesync)

DesyncButton.MouseEnter:Connect(function()
    TweenService:Create(DesyncButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
end)

DesyncButton.MouseLeave:Connect(function()
    TweenService:Create(DesyncButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
end)