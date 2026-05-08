--vibecoded
--leak by sync
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local Workspace = game:GetService('Workspace')
local LocalPlayer = game:GetService('Players').LocalPlayer
 
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild('Humanoid')
local HumanoidRootPart = Character:WaitForChild('HumanoidRootPart')
local CurrentCamera = Workspace.CurrentCamera
 
local bgColor = Color3.fromRGB(25, 25, 35)
local frameColor = Color3.fromRGB(35, 40, 55)
local accentColor = Color3.fromRGB(200, 160, 100)
local accentDark = Color3.fromRGB(180, 140, 80)
local textColor = Color3.fromRGB(240, 240, 230)
local textDim = Color3.fromRGB(180, 180, 170)
local successColor = Color3.fromRGB(100, 200, 100)
 
local ScreenGui = Instance.new('ScreenGui')
ScreenGui.Name = 'sjxwmuahvvhk'
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService('CoreGui').RobloxGui
 
local MainFrame = Instance.new('Frame')
MainFrame.Name = 'iwuduyjvon'
MainFrame.BackgroundColor3 = bgColor
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
MainFrame.Size = UDim2.new(0, 450, 0, 400)
MainFrame.ZIndex = 9000
MainFrame.Parent = ScreenGui
 
local MainCorner = Instance.new('UICorner')
MainCorner.Name = 'bhjkpq'
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame
 
local MainStroke = Instance.new('UIStroke')
MainStroke.Name = 'syncware'
MainStroke.Color = accentColor
MainStroke.Thickness = 2
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame
 
local GlowImage = Instance.new('ImageLabel')
GlowImage.Name = 'baaiuk'
GlowImage.BackgroundTransparency = 1
GlowImage.Position = UDim2.new(0.5, 0, 0.5, 0)
GlowImage.Size = UDim2.new(1, 40, 1, 40)
GlowImage.AnchorPoint = Vector2.new(0.5, 0.5)
GlowImage.Image = 'rbxasset://textures/ui/Glow.png'
GlowImage.ImageColor3 = accentColor
GlowImage.ImageTransparency = 0.8
GlowImage.ZIndex = MainFrame.ZIndex - 1
GlowImage.Parent = MainFrame
 
local HeaderFrame = Instance.new('Frame')
HeaderFrame.Name = 'qupfgshpo'
HeaderFrame.BackgroundColor3 = frameColor
HeaderFrame.BorderSizePixel = 0
HeaderFrame.Size = UDim2.new(1, 0, 0, 60)
HeaderFrame.ZIndex = 9001
HeaderFrame.Parent = MainFrame
 
local HeaderCorner = Instance.new('UICorner')
HeaderCorner.Name = 'wskfe'
HeaderCorner.CornerRadius = UDim.new(0, 16)
HeaderCorner.Parent = HeaderFrame
 
local LogoFrame = Instance.new('Frame')
LogoFrame.Name = 'gerxqciv'
LogoFrame.BackgroundColor3 = accentColor
LogoFrame.Position = UDim2.new(0, 15, 0.5, -18)
LogoFrame.Size = UDim2.new(0, 36, 0, 36)
LogoFrame.BorderSizePixel = 0
LogoFrame.ZIndex = 9002
LogoFrame.Parent = HeaderFrame
 
local LogoCorner = Instance.new('UICorner')
LogoCorner.Name = 'scxrps'
LogoCorner.CornerRadius = UDim.new(0, 8)
LogoCorner.Parent = LogoFrame
 
local LogoGlow = Instance.new('ImageLabel')
LogoGlow.Name = 'hbdksm'
LogoGlow.BackgroundTransparency = 1
LogoGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
LogoGlow.Size = UDim2.new(1, 40, 1, 40)
LogoGlow.AnchorPoint = Vector2.new(0.5, 0.5)
LogoGlow.Image = 'rbxasset://textures/ui/Glow.png'
LogoGlow.ImageColor3 = accentColor
LogoGlow.ImageTransparency = 0.6
LogoGlow.ZIndex = LogoFrame.ZIndex - 1
LogoGlow.Parent = LogoFrame
 
local LogoImage = Instance.new('ImageLabel')
LogoImage.Name = 'tebiemwta'
LogoImage.Image = 'rbxassetid://99495807378456'  
 
LogoImage.BackgroundTransparency = 1
LogoImage.Size = UDim2.new(1, 0, 1, 0)
LogoImage.Position = UDim2.new(0, 0, 0, 0)
LogoImage.ScaleType = Enum.ScaleType.Fit
LogoImage.ZIndex = 9003
LogoImage.Parent = LogoFrame
 
local TitleLabel = Instance.new('TextLabel')
TitleLabel.Name = 'omcejvz'
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 58, 0, 10)
TitleLabel.Size = UDim2.new(0, 200, 0, 24)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = 'ZENSTED DESYNC'
TitleLabel.TextColor3 = accentColor
TitleLabel.TextSize = 18
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.ZIndex = 9002
TitleLabel.Parent = HeaderFrame
 
local VersionLabel = Instance.new('TextLabel')
VersionLabel.Name = 'ggctsqkr'
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(0, 58, 0, 36)
VersionLabel.Size = UDim2.new(0, 200, 0, 16)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.Text = 'v1.0.3 | Zensted Edition'
VersionLabel.TextColor3 = textDim
VersionLabel.TextSize = 10
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
VersionLabel.ZIndex = 9002
VersionLabel.Parent = HeaderFrame
 
local SyncStatusFrame = Instance.new('Frame')
SyncStatusFrame.Name = 'qsyubwurw'
SyncStatusFrame.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
SyncStatusFrame.BorderSizePixel = 0
SyncStatusFrame.Position = UDim2.new(1, -155, 0.5, -16)
SyncStatusFrame.Size = UDim2.new(0, 95, 0, 32)
SyncStatusFrame.ZIndex = 9002
SyncStatusFrame.Parent = HeaderFrame
 
local SyncCorner = Instance.new('UICorner')
SyncCorner.CornerRadius = UDim.new(0, 10)
SyncCorner.Parent = SyncStatusFrame
 
local SyncStroke = Instance.new('UIStroke')
SyncStroke.Name = 'cywjlym'
SyncStroke.Color = accentDark
SyncStroke.Thickness = 1.5
SyncStroke.Transparency = 0.5
SyncStroke.Parent = SyncStatusFrame
 
local ToggleIndicator = Instance.new('Frame')
ToggleIndicator.Name = 'ojowep'
ToggleIndicator.BackgroundColor3 = accentDark
ToggleIndicator.BorderSizePixel = 0
ToggleIndicator.Position = UDim2.new(0, 10, 0.5, -5)
ToggleIndicator.Size = UDim2.new(0, 10, 0, 10)
ToggleIndicator.ZIndex = 9003
ToggleIndicator.Parent = SyncStatusFrame
 
local IndicatorCorner = Instance.new('UICorner')
IndicatorCorner.CornerRadius = UDim.new(1, 0)
IndicatorCorner.Parent = ToggleIndicator
 
local StatusLabel = Instance.new('TextLabel')
StatusLabel.Name = 'jshhzibsa'
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 24, 0, 0)
StatusLabel.Size = UDim2.new(1, -28, 1, 0)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.Text = 'SYNCED'
StatusLabel.TextColor3 = textColor
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.ZIndex = 9003
StatusLabel.Parent = SyncStatusFrame
 
local CloseButton = Instance.new('TextButton')
CloseButton.Name = 'ipxnpn'
CloseButton.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -45, 0.5, -16)
CloseButton.Size = UDim2.new(0, 32, 0, 32)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = 'X'
CloseButton.TextColor3 = textColor
CloseButton.TextSize = 16
CloseButton.ZIndex = 9003
CloseButton.AutoButtonColor = false
CloseButton.Parent = HeaderFrame
 
local CloseCorner = Instance.new('UICorner')
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseButton
 
CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = accentColor}):Play()
end)
 
CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(45, 50, 70)}):Play()
end)
 
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)
 
local ContentFrame = Instance.new('Frame')
ContentFrame.Name = 'ywmlczldjrb'
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 15, 0, 75)
ContentFrame.Size = UDim2.new(1, -30, 1, -90)
ContentFrame.ZIndex = 9001
ContentFrame.Parent = MainFrame
 
local SectionLabel = Instance.new('TextLabel')
SectionLabel.Name = 'lqtbytcvxq'
SectionLabel.BackgroundTransparency = 1
SectionLabel.Size = UDim2.new(1, 0, 0, 25)
SectionLabel.Font = Enum.Font.GothamBold
SectionLabel.Text = 'DESYNC CONTROLS'
SectionLabel.TextColor3 = accentColor
SectionLabel.TextSize = 14
SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
SectionLabel.ZIndex = 9002
SectionLabel.Parent = ContentFrame
 
local Underline = Instance.new('Frame')
Underline.Name = 'wsoafri'
Underline.BackgroundColor3 = accentColor
Underline.BorderSizePixel = 0
Underline.Position = UDim2.new(0, 0, 1, -2)
Underline.Size = UDim2.new(0.3, 0, 0, 2)
Underline.ZIndex = 9002
Underline.Parent = SectionLabel
 
local DesyncToggleFrame = Instance.new('Frame')
DesyncToggleFrame.Name = 'dwcpsjtgwa'
DesyncToggleFrame.BackgroundColor3 = frameColor
DesyncToggleFrame.BorderSizePixel = 0
DesyncToggleFrame.Position = UDim2.new(0, 0, 0, 30)
DesyncToggleFrame.Size = UDim2.new(1, 0, 0, 55)
DesyncToggleFrame.ZIndex = 9002
DesyncToggleFrame.Parent = ContentFrame
 
local DesyncCorner = Instance.new('UICorner')
DesyncCorner.CornerRadius = UDim.new(0, 12)
DesyncCorner.Parent = DesyncToggleFrame
 
local DesyncStroke = Instance.new('UIStroke')
DesyncStroke.Name = 'fpjkrv'
DesyncStroke.Color = accentColor
DesyncStroke.Thickness = 1
DesyncStroke.Transparency = 0.8
DesyncStroke.Parent = DesyncToggleFrame
 
local DesyncTitle = Instance.new('TextLabel')
DesyncTitle.Name = 'zexmmnd'
DesyncTitle.BackgroundTransparency = 1
DesyncTitle.Position = UDim2.new(0, 14, 0, 8)
DesyncTitle.Size = UDim2.new(1, -100, 0, 18)
DesyncTitle.Font = Enum.Font.GothamBold
DesyncTitle.Text = 'Enable Desync'
DesyncTitle.TextColor3 = textColor
DesyncTitle.TextSize = 13
DesyncTitle.TextXAlignment = Enum.TextXAlignment.Left
DesyncTitle.ZIndex = 9003
DesyncTitle.Parent = DesyncToggleFrame
 
local DesyncDesc = Instance.new('TextLabel')
DesyncDesc.Name = 'emmcivwe'
DesyncDesc.BackgroundTransparency = 1
DesyncDesc.Position = UDim2.new(0, 14, 0, 28)
DesyncDesc.Size = UDim2.new(1, -100, 0, 20)
DesyncDesc.Font = Enum.Font.Gotham
DesyncDesc.Text = 'Freezes character position on server, allows client control'
DesyncDesc.TextColor3 = textDim
DesyncDesc.TextSize = 9
DesyncDesc.TextXAlignment = Enum.TextXAlignment.Left
DesyncDesc.TextWrapped = true
DesyncDesc.ZIndex = 9003
DesyncDesc.Parent = DesyncToggleFrame
 
local DesyncSwitchFrame = Instance.new('Frame')
DesyncSwitchFrame.Name = 'ynmvocjhu'
DesyncSwitchFrame.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
DesyncSwitchFrame.BorderSizePixel = 0
DesyncSwitchFrame.Position = UDim2.new(1, -62, 0.5, -14)
DesyncSwitchFrame.Size = UDim2.new(0, 52, 0, 28)
DesyncSwitchFrame.ZIndex = 9003
DesyncSwitchFrame.Parent = DesyncToggleFrame
 
local SwitchCorner = Instance.new('UICorner')
SwitchCorner.CornerRadius = UDim.new(1, 0)
SwitchCorner.Parent = DesyncSwitchFrame
 
local SwitchKnob = Instance.new('Frame')
SwitchKnob.Name = 'gyouhlkp'
SwitchKnob.BackgroundColor3 = textColor
SwitchKnob.BorderSizePixel = 0
SwitchKnob.Position = UDim2.new(0, 3, 0.5, -11)
SwitchKnob.Size = UDim2.new(0, 22, 0, 22)
SwitchKnob.ZIndex = 9004
SwitchKnob.Parent = DesyncSwitchFrame
 
local KnobCorner = Instance.new('UICorner')
KnobCorner.CornerRadius = UDim.new(1, 0)
KnobCorner.Parent = SwitchKnob
 
local KnobGlow = Instance.new('ImageLabel')
KnobGlow.Name = 'cztsnx'
KnobGlow.BackgroundTransparency = 1
KnobGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
KnobGlow.Size = UDim2.new(1, 40, 1, 40)
KnobGlow.AnchorPoint = Vector2.new(0.5, 0.5)
KnobGlow.Image = 'rbxasset://textures/ui/Glow.png'
KnobGlow.ImageColor3 = textColor
KnobGlow.ImageTransparency = 0.7
KnobGlow.ZIndex = SwitchKnob.ZIndex - 1
KnobGlow.Parent = SwitchKnob
 
local DesyncButton = Instance.new('TextButton')
DesyncButton.Name = 'ffysyz'
DesyncButton.BackgroundTransparency = 1
DesyncButton.Size = UDim2.new(1, 0, 1, 0)
DesyncButton.Text = ''
DesyncButton.ZIndex = 9005
DesyncButton.Parent = DesyncToggleFrame
 
DesyncButton.MouseButton1Click:Connect(function()
 
    local originalCFrame = HumanoidRootPart.CFrame
 
    local dummyPart = Instance.new('Part')
    dummyPart.Name = 'blhlpvvbcu'
    dummyPart.Size = Vector3.new(2, 2, 2)
    dummyPart.Transparency = 1
    dummyPart.CanCollide = false
    dummyPart.Anchored = true
    dummyPart.CFrame = HumanoidRootPart.CFrame
    dummyPart.Parent = Workspace
 
    RunService.RenderStepped:Connect(function()
        dummyPart.CFrame = HumanoidRootPart.CFrame
    end)
 
    CurrentCamera.CameraSubject = dummyPart
 
    RunService.RenderStepped:Connect(function()
        if CurrentCamera.CameraSubject ~= dummyPart then
            CurrentCamera.CameraSubject = dummyPart
        end
    end)
 
    HumanoidRootPart:SetNetworkOwner(nil)
 
    RunService.Heartbeat:Connect(function()
        HumanoidRootPart.CFrame = originalCFrame
        HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
 
        RunService.RenderStepped:Wait()
 
        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame
        HumanoidRootPart.AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
    end)
 
    local Notification = Instance.new('Frame')
    Notification.Name = 'kwwpflz'
    Notification.BackgroundColor3 = bgColor
    Notification.BorderSizePixel = 0
    Notification.Position = UDim2.new(1, 20, 0.95, 0)
    Notification.Size = UDim2.new(0, 300, 0, 80)
    Notification.AnchorPoint = Vector2.new(0, 1)
    Notification.ZIndex = 10000
    Notification.Parent = ScreenGui
 
    local NotifCorner = Instance.new('UICorner')
    NotifCorner.Name = 'ijhwq'
    NotifCorner.CornerRadius = UDim.new(0, 12)
    NotifCorner.Parent = Notification
 
    local NotifStroke = Instance.new('UIStroke')
    NotifStroke.Name = 'smlcuk'
    NotifStroke.Color = successColor
    NotifStroke.Thickness = 2
    NotifStroke.Parent = Notification
 
    local NotifGlow = Instance.new('ImageLabel')
    NotifGlow.Name = 'nxhwij'
    NotifGlow.BackgroundTransparency = 1
    NotifGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    NotifGlow.Size = UDim2.new(1, 40, 1, 40)
    NotifGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    NotifGlow.Image = 'rbxasset://textures/ui/Glow.png'
    NotifGlow.ImageColor3 = successColor
    NotifGlow.ImageTransparency = 0.7
    NotifGlow.ZIndex = Notification.ZIndex - 1
    NotifGlow.Parent = Notification
 
    local NotifTitle = Instance.new('TextLabel')
    NotifTitle.Name = 'rmhmwlgq'
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Position = UDim2.new(0, 15, 0, 10)
    NotifTitle.Size = UDim2.new(1, -30, 0, 22)
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.Text = 'DESYNC ACTIVE'
    NotifTitle.TextColor3 = successColor
    NotifTitle.TextSize = 14
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotifTitle.ZIndex = 10001
    NotifTitle.Parent = Notification
 
    local NotifDesc = Instance.new('TextLabel')
    NotifDesc.Name = 'aqfudcxek'
    NotifDesc.BackgroundTransparency = 1
    NotifDesc.Position = UDim2.new(0, 15, 0, 35)
    NotifDesc.Size = UDim2.new(1, -30, 0, 35)
    NotifDesc.Font = Enum.Font.Gotham
    NotifDesc.Text = 'Server frozen! Camera following your real position!'
    NotifDesc.TextColor3 = textDim
    NotifDesc.TextSize = 11
    NotifDesc.TextWrapped = true
    NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
    NotifDesc.TextYAlignment = Enum.TextYAlignment.Top
    NotifDesc.ZIndex = 10001
    NotifDesc.Parent = Notification
 
    TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(1, -320, 0.95, 0)}):Play()
    task.delay(3, function()
        TweenService:Create(Notification, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Position = UDim2.new(1, 20, 0.95, 0)}):Play()
        task.wait(0.4)
        Notification:Destroy()
    end)
 
    ToggleIndicator.BackgroundColor3 = successColor
    StatusLabel.Text = 'DESYNCED'
    TweenService:Create(SyncStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Color = successColor, Transparency = 0.2}):Play()
    TweenService:Create(SwitchKnob, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = UDim2.new(1, -25, 0.5, -11)}):Play()
    TweenService:Create(DesyncSwitchFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = accentColor}):Play()
    TweenService:Create(DesyncStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Transparency = 0.3}):Play()
end)
 
DesyncButton.MouseEnter:Connect(function()
    TweenService:Create(DesyncToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(45, 50, 70)}):Play()
end)
 
DesyncButton.MouseLeave:Connect(function()
    TweenService:Create(DesyncToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = frameColor}):Play()
end)
 
local ServerPosToggleFrame = Instance.new('Frame')
ServerPosToggleFrame.Name = 'gieurbtdcg'
ServerPosToggleFrame.BackgroundColor3 = frameColor
ServerPosToggleFrame.BorderSizePixel = 0
ServerPosToggleFrame.Position = UDim2.new(0, 0, 0, 90)
ServerPosToggleFrame.Size = UDim2.new(1, 0, 0, 55)
ServerPosToggleFrame.ZIndex = 9002
ServerPosToggleFrame.Parent = ContentFrame
 
local ServerPosCorner = Instance.new('UICorner')
ServerPosCorner.CornerRadius = UDim.new(0, 12)
ServerPosCorner.Parent = ServerPosToggleFrame
 
local ServerPosStroke = Instance.new('UIStroke')
ServerPosStroke.Name = 'fglurh'
ServerPosStroke.Color = accentColor
ServerPosStroke.Thickness = 1
ServerPosStroke.Transparency = 0.8
ServerPosStroke.Parent = ServerPosToggleFrame
 
local ServerPosTitle = Instance.new('TextLabel')
ServerPosTitle.Name = 'ocvygww'
ServerPosTitle.BackgroundTransparency = 1
ServerPosTitle.Position = UDim2.new(0, 14, 0, 8)
ServerPosTitle.Size = UDim2.new(1, -100, 0, 18)
ServerPosTitle.Font = Enum.Font.GothamBold
ServerPosTitle.Text = 'Show Server Position'
ServerPosTitle.TextColor3 = textColor
ServerPosTitle.TextSize = 13
ServerPosTitle.TextXAlignment = Enum.TextXAlignment.Left
ServerPosTitle.ZIndex = 9003
ServerPosTitle.Parent = ServerPosToggleFrame
 
local ServerPosDesc = Instance.new('TextLabel')
ServerPosDesc.Name = 'akjmirkq'
ServerPosDesc.BackgroundTransparency = 1
ServerPosDesc.Position = UDim2.new(0, 14, 0, 28)
ServerPosDesc.Size = UDim2.new(1, -100, 0, 20)
ServerPosDesc.Font = Enum.Font.Gotham
ServerPosDesc.Text = 'Visualize where players see your character'
ServerPosDesc.TextColor3 = textDim
ServerPosDesc.TextSize = 9
ServerPosDesc.TextXAlignment = Enum.TextXAlignment.Left
ServerPosDesc.TextWrapped = true
ServerPosDesc.ZIndex = 9003
ServerPosDesc.Parent = ServerPosToggleFrame
 
local ServerPosSwitchFrame = Instance.new('Frame')
ServerPosSwitchFrame.Name = 'svfjjruwf'
ServerPosSwitchFrame.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
ServerPosSwitchFrame.BorderSizePixel = 0
ServerPosSwitchFrame.Position = UDim2.new(1, -62, 0.5, -14)
ServerPosSwitchFrame.Size = UDim2.new(0, 52, 0, 28)
ServerPosSwitchFrame.ZIndex = 9003
ServerPosSwitchFrame.Parent = ServerPosToggleFrame
 
local ServerSwitchCorner = Instance.new('UICorner')
ServerSwitchCorner.CornerRadius = UDim.new(1, 0)
ServerSwitchCorner.Parent = ServerPosSwitchFrame
 
local ServerSwitchKnob = Instance.new('Frame')
ServerSwitchKnob.Name = 'ucejkvnf'
ServerSwitchKnob.BackgroundColor3 = textColor
ServerSwitchKnob.BorderSizePixel = 0
ServerSwitchKnob.Position = UDim2.new(0, 3, 0.5, -11)
ServerSwitchKnob.Size = UDim2.new(0, 22, 0, 22)
ServerSwitchKnob.ZIndex = 9004
ServerSwitchKnob.Parent = ServerPosSwitchFrame
 
local ServerKnobCorner = Instance.new('UICorner')
ServerKnobCorner.CornerRadius = UDim.new(1, 0)
ServerKnobCorner.Parent = ServerSwitchKnob
 
local ServerKnobGlow = Instance.new('ImageLabel')
ServerKnobGlow.Name = 'mqotqb'
ServerKnobGlow.BackgroundTransparency = 1
ServerKnobGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
ServerKnobGlow.Size = UDim2.new(1, 40, 1, 40)
ServerKnobGlow.AnchorPoint = Vector2.new(0.5, 0.5)
ServerKnobGlow.Image = 'rbxasset://textures/ui/Glow.png'
ServerKnobGlow.ImageColor3 = textColor
ServerKnobGlow.ImageTransparency = 0.7
ServerKnobGlow.ZIndex = ServerSwitchKnob.ZIndex - 1
ServerKnobGlow.Parent = ServerSwitchKnob
 
local ServerPosButton = Instance.new('TextButton')
ServerPosButton.Name = 'mylakd'
ServerPosButton.BackgroundTransparency = 1
ServerPosButton.Size = UDim2.new(1, 0, 1, 0)
ServerPosButton.Text = ''
ServerPosButton.ZIndex = 9005
ServerPosButton.Parent = ServerPosToggleFrame
 
ServerPosButton.MouseButton1Click:Connect(function()
 
    local VisModel = Instance.new('Model')
    VisModel.Name = 'ServerPosition_nqcbs'
 
    local FloorPart = Instance.new('Part')
    FloorPart.Name = 'kmqpaxpp'
    FloorPart.Size = Vector3.new(4, 0.2, 4)
    FloorPart.CFrame = originalCFrame * CFrame.new(0, -3, 0)
    FloorPart.Anchored = true
    FloorPart.CanCollide = false
    FloorPart.Transparency = 0.3
    FloorPart.Material = Enum.Material.Neon
    FloorPart.Color = accentColor
    FloorPart.Parent = VisModel
 
    Instance.new('CylinderMesh').Parent = FloorPart
 
    local BeamPart = Instance.new('Part')
    BeamPart.Name = 'pojamtw'
    BeamPart.Size = Vector3.new(0.3, 50, 0.3)
    BeamPart.CFrame = originalCFrame * CFrame.new(0, 25, 0)
    BeamPart.Anchored = true
    BeamPart.CanCollide = false
    BeamPart.Transparency = 0.5
    BeamPart.Material = Enum.Material.Neon
    BeamPart.Color = accentColor
    BeamPart.Parent = VisModel
 
    local GhostPart = Instance.new('Part')
    GhostPart.Name = 'lslpskku'
    GhostPart.Size = Character.PrimaryPart.Size
    GhostPart.CFrame = originalCFrame
    GhostPart.Anchored = true
    GhostPart.CanCollide = false
    GhostPart.Transparency = 0.7
    GhostPart.Material = Enum.Material.ForceField
    GhostPart.Color = accentColor
    GhostPart.CastShadow = false
    GhostPart.Parent = VisModel
 
    VisModel.Parent = Workspace
 
    spawn(function()
        while VisModel.Parent do
            for i = 1, 360 do
                FloorPart.CFrame = (originalCFrame * CFrame.new(0, -3, 0)) * CFrame.Angles(0, math.rad(i), 0)
                RunService.Heartbeat:Wait()
            end
        end
    end)
 
    TweenService:Create(ServerSwitchKnob, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = UDim2.new(1, -25, 0.5, -11)}):Play()
    TweenService:Create(ServerPosSwitchFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = accentColor}):Play()
    TweenService:Create(ServerPosStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Transparency = 0.3}):Play()
end)
 
ServerPosButton.MouseEnter:Connect(function()
    TweenService:Create(ServerPosToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(45, 50, 70)}):Play()
end)
 
ServerPosButton.MouseLeave:Connect(function()
    TweenService:Create(ServerPosToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = frameColor}):Play()
end)
 
local NoclipToggleFrame = Instance.new('Frame')
NoclipToggleFrame.Name = 'bqtznytlqi'
NoclipToggleFrame.BackgroundColor3 = frameColor
NoclipToggleFrame.BorderSizePixel = 0
NoclipToggleFrame.Position = UDim2.new(0, 0, 0, 150)
NoclipToggleFrame.Size = UDim2.new(1, 0, 0, 55)
NoclipToggleFrame.ZIndex = 9002
NoclipToggleFrame.Parent = ContentFrame
 
local NoclipCorner = Instance.new('UICorner')
NoclipCorner.CornerRadius = UDim.new(0, 12)
NoclipCorner.Parent = NoclipToggleFrame
 
local NoclipStroke = Instance.new('UIStroke')
NoclipStroke.Name = 'erugzw'
NoclipStroke.Color = accentColor
NoclipStroke.Thickness = 1
NoclipStroke.Transparency = 0.8
NoclipStroke.Parent = NoclipToggleFrame
 
local NoclipTitle = Instance.new('TextLabel')
NoclipTitle.Name = 'kzepmyu'
NoclipTitle.BackgroundTransparency = 1
NoclipTitle.Position = UDim2.new(0, 14, 0, 8)
NoclipTitle.Size = UDim2.new(1, -100, 0, 18)
NoclipTitle.Font = Enum.Font.GothamBold
NoclipTitle.Text = 'Noclip'
NoclipTitle.TextColor3 = textColor
NoclipTitle.TextSize = 13
NoclipTitle.TextXAlignment = Enum.TextXAlignment.Left
NoclipTitle.ZIndex = 9003
NoclipTitle.Parent = NoclipToggleFrame
 
local NoclipDesc = Instance.new('TextLabel')
NoclipDesc.Name = 'yjdprmdg'
NoclipDesc.BackgroundTransparency = 1
NoclipDesc.Position = UDim2.new(0, 14, 0, 28)
NoclipDesc.Size = UDim2.new(1, -100, 0, 20)
NoclipDesc.Font = Enum.Font.Gotham
NoclipDesc.Text = 'Walk through walls while desync is active'
NoclipDesc.TextColor3 = textDim
NoclipDesc.TextSize = 9
NoclipDesc.TextXAlignment = Enum.TextXAlignment.Left
NoclipDesc.TextWrapped = true
NoclipDesc.ZIndex = 9003
NoclipDesc.Parent = NoclipToggleFrame
 
local NoclipSwitchFrame = Instance.new('Frame')
NoclipSwitchFrame.Name = 'exkwdsihn'
NoclipSwitchFrame.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
NoclipSwitchFrame.BorderSizePixel = 0
NoclipSwitchFrame.Position = UDim2.new(1, -62, 0.5, -14)
NoclipSwitchFrame.Size = UDim2.new(0, 52, 0, 28)
NoclipSwitchFrame.ZIndex = 9003
NoclipSwitchFrame.Parent = NoclipToggleFrame
 
local NoclipSwitchCorner = Instance.new('UICorner')
NoclipSwitchCorner.CornerRadius = UDim.new(1, 0)
NoclipSwitchCorner.Parent = NoclipSwitchFrame
 
local NoclipSwitchKnob = Instance.new('Frame')
NoclipSwitchKnob.Name = 'udlhjpex'
NoclipSwitchKnob.BackgroundColor3 = textColor
NoclipSwitchKnob.BorderSizePixel = 0
NoclipSwitchKnob.Position = UDim2.new(0, 3, 0.5, -11)
NoclipSwitchKnob.Size = UDim2.new(0, 22, 0, 22)
NoclipSwitchKnob.ZIndex = 9004
NoclipSwitchKnob.Parent = NoclipSwitchFrame
 
local NoclipKnobCorner = Instance.new('UICorner')
NoclipKnobCorner.CornerRadius = UDim.new(1, 0)
NoclipKnobCorner.Parent = NoclipSwitchKnob
 
local NoclipKnobGlow = Instance.new('ImageLabel')
NoclipKnobGlow.Name = 'kvujli'
NoclipKnobGlow.BackgroundTransparency = 1
NoclipKnobGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
NoclipKnobGlow.Size = UDim2.new(1, 40, 1, 40)
NoclipKnobGlow.AnchorPoint = Vector2.new(0.5, 0.5)
NoclipKnobGlow.Image = 'rbxasset://textures/ui/Glow.png'
NoclipKnobGlow.ImageColor3 = textColor
NoclipKnobGlow.ImageTransparency = 0.7
NoclipKnobGlow.ZIndex = NoclipSwitchKnob.ZIndex - 1
NoclipKnobGlow.Parent = NoclipSwitchKnob
 
local NoclipButton = Instance.new('TextButton')
NoclipButton.Name = 'wllcva'
NoclipButton.BackgroundTransparency = 1
NoclipButton.Size = UDim2.new(1, 0, 1, 0)
NoclipButton.Text = ''
NoclipButton.ZIndex = 9005
NoclipButton.Parent = NoclipToggleFrame
 
NoclipButton.MouseButton1Click:Connect(function()
 
    RunService.Stepped:Connect(function()
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA('BasePart') then
                part.CanCollide = false
            end
        end
    end)
 
    local NoclipNotif = Instance.new('Frame')
    NoclipNotif.Name = 'afsopss'
    NoclipNotif.BackgroundColor3 = bgColor
    NoclipNotif.BorderSizePixel = 0
    NoclipNotif.Position = UDim2.new(1, 20, 0.95, 0)
    NoclipNotif.Size = UDim2.new(0, 300, 0, 80)
    NoclipNotif.AnchorPoint = Vector2.new(0, 1)
    NoclipNotif.ZIndex = 10000
    NoclipNotif.Parent = ScreenGui
 
    local NoclipNotifCorner = Instance.new('UICorner')
    NoclipNotifCorner.Name = 'hawmj'
    NoclipNotifCorner.CornerRadius = UDim.new(0, 12)
    NoclipNotifCorner.Parent = NoclipNotif
 
    local NoclipNotifStroke = Instance.new('UIStroke')
    NoclipNotifStroke.Name = 'xzguwn'
    NoclipNotifStroke.Color = successColor
    NoclipNotifStroke.Thickness = 2
    NoclipNotifStroke.Parent = NoclipNotif
 
    local NoclipNotifGlow = Instance.new('ImageLabel')
    NoclipNotifGlow.Name = 'opcvid'
    NoclipNotifGlow.BackgroundTransparency = 1
    NoclipNotifGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    NoclipNotifGlow.Size = UDim2.new(1, 40, 1, 40)
    NoclipNotifGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    NoclipNotifGlow.Image = 'rbxasset://textures/ui/Glow.png'
    NoclipNotifGlow.ImageColor3 = successColor
    NoclipNotifGlow.ImageTransparency = 0.7
    NoclipNotifGlow.ZIndex = NoclipNotif.ZIndex - 1
    NoclipNotifGlow.Parent = NoclipNotif
 
    local NoclipNotifTitle = Instance.new('TextLabel')
    NoclipNotifTitle.Name = 'pxerhfcq'
    NoclipNotifTitle.BackgroundTransparency = 1
    NoclipNotifTitle.Position = UDim2.new(0, 15, 0, 10)
    NoclipNotifTitle.Size = UDim2.new(1, -30, 0, 22)
    NoclipNotifTitle.Font = Enum.Font.GothamBold
    NoclipNotifTitle.Text = 'NOCLIP ENABLED'
    NoclipNotifTitle.TextColor3 = successColor
    NoclipNotifTitle.TextSize = 14
    NoclipNotifTitle.TextXAlignment = Enum.TextXAlignment.Left
    NoclipNotifTitle.ZIndex = 10001
    NoclipNotifTitle.Parent = NoclipNotif
 
    local NoclipNotifDesc = Instance.new('TextLabel')
    NoclipNotifDesc.Name = 'nikjhvpao'
    NoclipNotifDesc.BackgroundTransparency = 1
    NoclipNotifDesc.Position = UDim2.new(0, 15, 0, 35)
    NoclipNotifDesc.Size = UDim2.new(1, -30, 0, 35)
    NoclipNotifDesc.Font = Enum.Font.Gotham
    NoclipNotifDesc.Text = 'You can now walk through walls!'
    NoclipNotifDesc.TextColor3 = textDim
    NoclipNotifDesc.TextSize = 11
    NoclipNotifDesc.TextWrapped = true
    NoclipNotifDesc.TextXAlignment = Enum.TextXAlignment.Left
    NoclipNotifDesc.TextYAlignment = Enum.TextYAlignment.Top
    NoclipNotifDesc.ZIndex = 10001
    NoclipNotifDesc.Parent = NoclipNotif
 
    TweenService:Create(NoclipNotif, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(1, -320, 0.95, 0)}):Play()
    task.delay(2, function()
        TweenService:Create(NoclipNotif, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Position = UDim2.new(1, 20, 0.95, 0)}):Play()
        task.wait(0.4)
        NoclipNotif:Destroy()
    end)
 
    TweenService:Create(NoclipSwitchKnob, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Position = UDim2.new(1, -25, 0.5, -11)}):Play()
    TweenService:Create(NoclipSwitchFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = accentColor}):Play()
    TweenService:Create(NoclipStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Transparency = 0.3}):Play()
end)
 
NoclipButton.MouseEnter:Connect(function()
    TweenService:Create(NoclipToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(45, 50, 70)}):Play()
end)
 
NoclipButton.MouseLeave:Connect(function()
    TweenService:Create(NoclipToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = frameColor}):Play()
end)
 
local MonitoringFrame = Instance.new('Frame')
MonitoringFrame.Name = 'pymgfhka'
MonitoringFrame.BackgroundColor3 = frameColor
MonitoringFrame.BorderSizePixel = 0
MonitoringFrame.Position = UDim2.new(0, 0, 0, 215)
MonitoringFrame.Size = UDim2.new(1, 0, 0, 95)
MonitoringFrame.ZIndex = 9002
MonitoringFrame.Parent = ContentFrame
 
local MonitoringCorner = Instance.new('UICorner')
MonitoringCorner.CornerRadius = UDim.new(0, 12)
MonitoringCorner.Parent = MonitoringFrame
 
local MonitoringTitle = Instance.new('TextLabel')
MonitoringTitle.Name = 'aebwqljlx'
MonitoringTitle.BackgroundTransparency = 1
MonitoringTitle.Position = UDim2.new(0, 14, 0, 8)
MonitoringTitle.Size = UDim2.new(1, -28, 0, 18)
MonitoringTitle.Font = Enum.Font.GothamBold
MonitoringTitle.Text = 'position monitoring for goobers'
MonitoringTitle.TextColor3 = accentColor
MonitoringTitle.TextSize = 12
MonitoringTitle.TextXAlignment = Enum.TextXAlignment.Left
MonitoringTitle.ZIndex = 9003
MonitoringTitle.Parent = MonitoringFrame
 
local MonitoringInfo = Instance.new('TextLabel')
MonitoringInfo.Name = 'cqkoxpmpzi'
MonitoringInfo.BackgroundTransparency = 1
MonitoringInfo.Position = UDim2.new(0, 14, 0, 30)
MonitoringInfo.Size = UDim2.new(1, -28, 1, -38)
MonitoringInfo.Font = Enum.Font.Code
MonitoringInfo.Text = [[Enable desync to monitor...
 
Client: N/A | Server: N/A
Distance: N/A]]
MonitoringInfo.TextColor3 = textDim
MonitoringInfo.TextSize = 10
MonitoringInfo.TextWrapped = true
MonitoringInfo.TextXAlignment = Enum.TextXAlignment.Left
MonitoringInfo.TextYAlignment = Enum.TextYAlignment.Top
MonitoringInfo.ZIndex = 9003
MonitoringInfo.Parent = MonitoringFrame
 
RunService.RenderStepped:Connect(function()
 
end)
 
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
 
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = newChar:WaitForChild('Humanoid')
    HumanoidRootPart = newChar:WaitForChild('HumanoidRootPart')
end)
 
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
task.wait(0.1)
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back), {
    Position = UDim2.new(0.5, -225, 0.5, -200),
    Size = UDim2.new(0, 450, 0, 400)
}):Play()
 
local LoadedNotif = Instance.new('Frame')
LoadedNotif.Name = 'atylkqg'
LoadedNotif.BackgroundColor3 = bgColor
LoadedNotif.BorderSizePixel = 0
LoadedNotif.Position = UDim2.new(1, 20, 0.95, 0)
LoadedNotif.Size = UDim2.new(0, 300, 0, 80)
LoadedNotif.AnchorPoint = Vector2.new(0, 1)
LoadedNotif.ZIndex = 10000
LoadedNotif.Parent = ScreenGui
 
local LoadedCorner = Instance.new('UICorner')
LoadedCorner.Name = 'pqywn'
LoadedCorner.CornerRadius = UDim.new(0, 12)
LoadedCorner.Parent = LoadedNotif
 
local LoadedStroke = Instance.new('UIStroke')
LoadedStroke.Name = 'phqscv'
LoadedStroke.Color = successColor
LoadedStroke.Thickness = 2
LoadedStroke.Parent = LoadedNotif
 
local LoadedGlow = Instance.new('ImageLabel')
LoadedGlow.Name = 'jjpjzq'
LoadedGlow.BackgroundTransparency = 1
LoadedGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadedGlow.Size = UDim2.new(1, 40, 1, 40)
LoadedGlow.AnchorPoint = Vector2.new(0.5, 0.5)
LoadedGlow.Image = 'rbxasset://textures/ui/Glow.png'
LoadedGlow.ImageColor3 = successColor
LoadedGlow.ImageTransparency = 0.7
LoadedGlow.ZIndex = LoadedNotif.ZIndex - 1
LoadedGlow.Parent = LoadedNotif
 
local LoadedTitle = Instance.new('TextLabel')
LoadedTitle.Name = 'iocnzawk'
LoadedTitle.BackgroundTransparency = 1
LoadedTitle.Position = UDim2.new(0, 15, 0, 10)
LoadedTitle.Size = UDim2.new(1, -30, 0, 22)
LoadedTitle.Font = Enum.Font.GothamBold
LoadedTitle.Text = 'ZENSTED DESYNC'
LoadedTitle.TextColor3 = successColor
LoadedTitle.TextSize = 14
LoadedTitle.TextXAlignment = Enum.TextXAlignment.Left
LoadedTitle.ZIndex = 10001
LoadedTitle.Parent = LoadedNotif
 
local LoadedDesc = Instance.new('TextLabel')
LoadedDesc.Name = 'yvmivtjoz'
LoadedDesc.BackgroundTransparency = 1
LoadedDesc.Position = UDim2.new(0, 15, 0, 35)
LoadedDesc.Size = UDim2.new(1, -30, 0, 35)
LoadedDesc.Font = Enum.Font.Gotham
LoadedDesc.Text = 'Loaded! Press ' .. Enum.KeyCode.RightControl.Name .. ' to toggle'
LoadedDesc.TextColor3 = textDim
LoadedDesc.TextSize = 11
LoadedDesc.TextWrapped = true
LoadedDesc.TextXAlignment = Enum.TextXAlignment.Left
LoadedDesc.TextYAlignment = Enum.TextYAlignment.Top
LoadedDesc.ZIndex = 10001
LoadedDesc.Parent = LoadedNotif
 
TweenService:Create(LoadedNotif, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(1, -320, 0.95, 0)}):Play()
task.delay(4, function()
    TweenService:Create(LoadedNotif, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Position = UDim2.new(1, 20, 0.95, 0)}):Play()
    task.wait(0.4)
    LoadedNotif:Destroy()
end)