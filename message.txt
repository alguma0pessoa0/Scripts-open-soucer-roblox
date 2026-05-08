-- [[ DEOBFUSCATED BY LUA BEAUTIFIER ]] --
-- Source: logged.txt execution trace
-- Script identity: BK's Admin Panel v3.0 (LuArmor-protected loader)
-- Game context: Pet/Animal simulator with Plots, AnimalPodiums, Stealer detection

-- ============================================================
-- // [1] GLOBAL SERVICES WITH ERROR HANDLING // --
-- ============================================================

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService      = game:GetService("HttpService")
local TweenService     = game:GetService("TweenService")
local CoreGui          = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- ============================================================
-- // [2] BASIC SETUP WITH ERROR PROTECTION // --
-- ============================================================

-- Anti-duplicate guard (IntValue injected by loader)
local dejavuTag = Instance.new("IntValue")
dejavuTag.Name  = "dejavu"
dejavuTag.Value = 3049573119
dejavuTag.Parent = CoreGui  -- loader stores this somewhere accessible

-- Load the remote LuArmor payload safely
local loaderUrl = "https://api.luarmor.net/files/v3/loaders/812039ba812f917497773f1aa0636c61.lua"
local ok, err = pcall(function()
    loadstring(game:HttpGet(loaderUrl))()
end)
if not ok then
    warn("[BKAdminPanel] Loader failed: " .. tostring(err))
end

-- Runtime environment checks (loader uses these to branch)
local isStudio = RunService:IsStudio()
local isClient = RunService:IsClient()
local isServer = RunService:IsServer()

-- ============================================================
-- // [3] CORE GUI CREATION // --
-- ============================================================

-- ── Root ScreenGui ──────────────────────────────────────────
local BKAdminPanelV3 = Instance.new("ScreenGui")
BKAdminPanelV3.Name            = "BKAdminPanelV3"
BKAdminPanelV3.ResetOnSpawn    = false
BKAdminPanelV3.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
BKAdminPanelV3.Parent          = CoreGui

-- ── Main panel frame ────────────────────────────────────────
local MainFrame = Instance.new("Frame")
MainFrame.Name                 = "Frame"
MainFrame.Position             = UDim2.new(0.791525424, 0, 0.33292684, 0)
MainFrame.Size                 = UDim2.new(0, 195, 0, 360)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Active               = true
MainFrame.Parent               = BKAdminPanelV3

local MainFrameCorner = Instance.new("UICorner")
MainFrameCorner.CornerRadius   = UDim.new(0, 8)
MainFrameCorner.Parent         = MainFrame

local MainFrameStroke = Instance.new("UIStroke")
MainFrameStroke.Transparency   = 0
MainFrameStroke.Parent         = MainFrame

local MainFrameStrokeGradient = Instance.new("UIGradient")
MainFrameStrokeGradient.Color  = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(120, 255, 200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 255, 150)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(120, 255, 200)),
})
MainFrameStrokeGradient.Parent = MainFrameStroke

-- ── Drag header ─────────────────────────────────────────────
local DragHeader = Instance.new("Frame")
DragHeader.Name                = "DragHeader"
DragHeader.Size                = UDim2.new(1, 0, 0, 38)
DragHeader.BackgroundTransparency = 1
DragHeader.Active              = true
DragHeader.Parent              = MainFrame

local DragHeaderLabel = Instance.new("TextLabel")
DragHeaderLabel.Text           = "BK's Admin Panel v3.0 Loaded!"
DragHeaderLabel.Position       = UDim2.new(0, 58, 0, 8)
DragHeaderLabel.Size           = UDim2.new(1, -70, 1, -16)
DragHeaderLabel.TextYAlignment = Enum.TextYAlignment.Center
DragHeaderLabel.Font           = Enum.Font.GothamBold
DragHeaderLabel.TextScaled     = true
DragHeaderLabel.BackgroundTransparency = 1
DragHeaderLabel.Parent         = MainFrame

local DragHeaderGradient = Instance.new("UIGradient")
DragHeaderGradient.Parent      = DragHeaderLabel

-- Drag icon (small emoji or indicator left of title)
local DragIconLabel = Instance.new("TextLabel")
DragIconLabel.Position         = UDim2.new(0, 12, 0, 10)
DragIconLabel.Size             = UDim2.new(0, 22, 0, 22)
DragIconLabel.Text             = "⚡"
DragIconLabel.TextScaled       = true
DragIconLabel.BackgroundTransparency = 1
DragIconLabel.Parent           = MainFrame

-- Progress bar at bottom of header
local HeaderBar = Instance.new("Frame")
HeaderBar.Position             = UDim2.new(0, 6, 1, -8)
HeaderBar.Size                 = UDim2.new(1, -12, 0, 4)
HeaderBar.BackgroundTransparency = 0
HeaderBar.Parent               = MainFrame

local HeaderBarCorner = Instance.new("UICorner")
HeaderBarCorner.Parent         = HeaderBar

local HeaderBarGradient = Instance.new("UIGradient")
HeaderBarGradient.Color        = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 255, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 255, 200)),
})
HeaderBarGradient.Parent       = HeaderBar

-- ── Inner content frame (holds tabs) ────────────────────────
local ContentFrame = Instance.new("Frame")
ContentFrame.Name              = "Frame"
ContentFrame.Position          = UDim2.new(0, 0, 0, 38)
ContentFrame.Size              = UDim2.new(1, 0, 1, -38)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent            = MainFrame

-- ── Tab bar ─────────────────────────────────────────────────
local CommandsTab = Instance.new("Frame")
CommandsTab.Name               = "CommandsTab"
CommandsTab.Size               = UDim2.new(1, 0, 1, 0)
CommandsTab.BackgroundTransparency = 1
CommandsTab.Parent             = ContentFrame

local TabBarFrame = Instance.new("Frame")
TabBarFrame.Position           = UDim2.new(0, 10, 0, 6)
TabBarFrame.Size               = UDim2.new(1, -20, 0, 40)
TabBarFrame.BackgroundTransparency = 1
TabBarFrame.Parent             = CommandsTab

local TabBarLayout = Instance.new("UIListLayout")
TabBarLayout.FillDirection     = Enum.FillDirection.Horizontal
TabBarLayout.SortOrder         = Enum.SortOrder.LayoutOrder
TabBarLayout.Padding           = UDim.new(0, 4)
TabBarLayout.Parent            = TabBarFrame

-- Tab: Main (Players)
local MainTabBtn = Instance.new("TextButton")
MainTabBtn.Size                = UDim2.new(0.333333343, -4, 0, 36)
MainTabBtn.BackgroundTransparency = 0.12
MainTabBtn.Text                = ""
MainTabBtn.Parent              = TabBarFrame

local MainTabIcon = Instance.new("TextLabel")
MainTabIcon.Name               = "TabIcon"
MainTabIcon.Position           = UDim2.new(0, 8, 0.5, -9)
MainTabIcon.Size               = UDim2.new(0, 18, 0, 18)
MainTabIcon.Text               = "⚡"
MainTabIcon.TextSize           = 13
MainTabIcon.BackgroundTransparency = 1
MainTabIcon.Parent             = MainTabBtn

local MainTabName = Instance.new("TextLabel")
MainTabName.Name               = "TabName"
MainTabName.Position           = UDim2.new(0, 26, 0, 0)
MainTabName.Size               = UDim2.new(0, 46, 1, 0)
MainTabName.Text               = "Main"
MainTabName.BackgroundTransparency = 1
MainTabName.Parent             = MainTabBtn

local CountBadge = Instance.new("TextLabel")
CountBadge.Name                = "CountBadge"
CountBadge.Position            = UDim2.new(1, -34, 0.5, -8)
CountBadge.Size                = UDim2.new(0, 28, 0, 16)
CountBadge.Text                = "0/0"
CountBadge.TextSize            = 9
CountBadge.BackgroundTransparency = 0.4
CountBadge.BackgroundColor3    = Color3.fromRGB(120, 240, 255)
CountBadge.BorderSizePixel     = 0
CountBadge.Parent              = MainTabBtn

local CountBadgeCorner = Instance.new("UICorner")
CountBadgeCorner.CornerRadius  = UDim.new(0, 5)
CountBadgeCorner.Parent        = CountBadge

local ActiveDot = Instance.new("Frame")
ActiveDot.Name                 = "ActiveDot"
ActiveDot.Position             = UDim2.new(0.5, -2, 1, -6)
ActiveDot.Size                 = UDim2.new(0, 4, 0, 4)
ActiveDot.Parent               = MainTabBtn

local ActiveDotCorner = Instance.new("UICorner")
ActiveDotCorner.CornerRadius   = UDim.new(1, 0)
ActiveDotCorner.Parent         = ActiveDot

local MainTabCorner = Instance.new("UICorner")
MainTabCorner.Parent           = MainTabBtn

local MainTabStroke = Instance.new("UIStroke")
MainTabStroke.Name             = "TabStroke"
MainTabStroke.Thickness        = 1
MainTabStroke.Transparency     = 0.6
MainTabStroke.Parent           = MainTabBtn

-- ── Players tab scrolling frame ─────────────────────────────
local PlayersTabFrame = Instance.new("Frame")
PlayersTabFrame.Name           = "PlayersTab"
PlayersTabFrame.Position       = UDim2.new(0, 0, 0, 50)
PlayersTabFrame.Size           = UDim2.new(1, 0, 1, -52)
PlayersTabFrame.BackgroundTransparency = 1
PlayersTabFrame.Parent         = ContentFrame

local PlayersScrollFrame = Instance.new("ScrollingFrame")
PlayersScrollFrame.Position    = UDim2.new(0, 0, 0, 0)
PlayersScrollFrame.Size        = UDim2.new(1, 0, 1, 0)
PlayersScrollFrame.ScrollBarThickness = 4
PlayersScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 240, 255)
PlayersScrollFrame.BackgroundTransparency = 1
PlayersScrollFrame.Parent      = PlayersTabFrame

local PlayersLayout = Instance.new("UIListLayout")
PlayersLayout.SortOrder        = Enum.SortOrder.LayoutOrder
PlayersLayout.Padding          = UDim.new(0, 4)
PlayersLayout.Parent           = PlayersScrollFrame

local PlayersPadding = Instance.new("UIPadding")
PlayersPadding.PaddingTop      = UDim.new(0, 4)
PlayersPadding.PaddingBottom   = UDim.new(0, 12)
PlayersPadding.PaddingLeft     = UDim.new(0, 6)
PlayersPadding.PaddingRight    = UDim.new(0, 6)
PlayersPadding.Parent          = PlayersScrollFrame

-- ── Commands tab scrolling frame ────────────────────────────
local CmdsScrollFrame = Instance.new("ScrollingFrame")
CmdsScrollFrame.Position       = UDim2.new(0, 0, 0, 50)
CmdsScrollFrame.Size           = UDim2.new(1, 0, 1, -52)
CmdsScrollFrame.Visible        = false
CmdsScrollFrame.ScrollBarThickness = 4
CmdsScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 240, 255)
CmdsScrollFrame.BackgroundTransparency = 1
CmdsScrollFrame.Parent         = CommandsTab

local CmdsLayout = Instance.new("UIListLayout")
CmdsLayout.SortOrder           = Enum.SortOrder.LayoutOrder
CmdsLayout.Padding             = UDim.new(0, 4)
CmdsLayout.Parent              = CmdsScrollFrame

local CmdsPadding = Instance.new("UIPadding")
CmdsPadding.PaddingTop         = UDim.new(0, 4)
CmdsPadding.PaddingBottom      = UDim.new(0, 12)
CmdsPadding.PaddingLeft        = UDim.new(0, 10)
CmdsPadding.PaddingRight       = UDim.new(0, 10)
CmdsPadding.Parent             = CmdsScrollFrame

-- ── Settings tab scrolling frame ────────────────────────────
local SettingsTabFrame = Instance.new("Frame")
SettingsTabFrame.Name          = "SettingsTab"
SettingsTabFrame.Size          = UDim2.new(1, 0, 1, 0)
SettingsTabFrame.BackgroundTransparency = 1
SettingsTabFrame.Visible       = false
SettingsTabFrame.Parent        = ContentFrame

local SettingsScrollFrame = Instance.new("ScrollingFrame")
SettingsScrollFrame.Position   = UDim2.new(0, 0, 0, 50)
SettingsScrollFrame.Size       = UDim2.new(1, 0, 1, -52)
SettingsScrollFrame.ScrollBarThickness = 4
SettingsScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 240, 255)
SettingsScrollFrame.BackgroundTransparency = 1
SettingsScrollFrame.Parent     = SettingsTabFrame

local SettingsLayout = Instance.new("UIListLayout")
SettingsLayout.SortOrder       = Enum.SortOrder.LayoutOrder
SettingsLayout.Padding         = UDim.new(0, 4)
SettingsLayout.Parent          = SettingsScrollFrame

-- ============================================================
-- // [4] SECONDARY PANELS (Cooldown / Stealer / Quick) // --
-- ============================================================

-- ── Cooldown panel ──────────────────────────────────────────
local CooldownPanel = Instance.new("Frame")
CooldownPanel.Name             = "Frame"  -- referenced as MainFrame.ScrollingFrame parent in log
CooldownPanel.Position         = UDim2.new(0, -200, 0, 100)
CooldownPanel.Size             = UDim2.new(0, 195, 0, 360)
CooldownPanel.BackgroundTransparency = 0.15
CooldownPanel.Parent           = BKAdminPanelV3

local CooldownCorner = Instance.new("UICorner")
CooldownCorner.CornerRadius    = UDim.new(0, 8)
CooldownCorner.Parent          = CooldownPanel

local CooldownStroke = Instance.new("UIStroke")
CooldownStroke.Parent          = CooldownPanel

local CooldownHeader = Instance.new("TextLabel")
CooldownHeader.Text            = "Cooldowns"
CooldownHeader.Position        = UDim2.new(0, 32, 0, 8)
CooldownHeader.Size            = UDim2.new(1, -40, 0, 22)
CooldownHeader.BackgroundTransparency = 1
CooldownHeader.Font            = Enum.Font.GothamBold
CooldownHeader.TextScaled      = true
CooldownHeader.Parent          = CooldownPanel

local CooldownDivider = Instance.new("Frame")
CooldownDivider.Position       = UDim2.new(0, 10, 0, 37)
CooldownDivider.Size           = UDim2.new(1, -20, 0, 1)
CooldownDivider.BackgroundTransparency = 0.5
CooldownDivider.Parent         = CooldownPanel

local CooldownScrollFrame = Instance.new("ScrollingFrame")
CooldownScrollFrame.Position   = UDim2.new(0, 7, 0, 42)
CooldownScrollFrame.Size       = UDim2.new(1, -14, 1, -46)
CooldownScrollFrame.ScrollBarThickness = 4
CooldownScrollFrame.BackgroundTransparency = 1
CooldownScrollFrame.Parent     = CooldownPanel

local CooldownListLayout = Instance.new("UIListLayout")
CooldownListLayout.SortOrder   = Enum.SortOrder.LayoutOrder
CooldownListLayout.Padding     = UDim.new(0, 3)
CooldownListLayout.Parent      = CooldownScrollFrame

-- ── Stealer panel ───────────────────────────────────────────
local StealerPanel = Instance.new("Frame")
StealerPanel.Name              = "StealerPanel"
StealerPanel.Position          = UDim2.new(0, 15, 0.5, -150)
StealerPanel.Size              = UDim2.new(0, 260, 0, 250)
StealerPanel.BackgroundTransparency = 0.15
StealerPanel.Parent            = BKAdminPanelV3

local StealerCorner = Instance.new("UICorner")
StealerCorner.CornerRadius     = UDim.new(0, 8)
StealerCorner.Parent           = StealerPanel

local StealerStroke = Instance.new("UIStroke")
StealerStroke.Parent           = StealerPanel

local StealerStrokeGradient = Instance.new("UIGradient")
StealerStrokeGradient.Color    = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 160)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 235, 120)),
})
StealerStrokeGradient.Parent   = StealerStroke

local StealerHeaderFrame = Instance.new("Frame")
StealerHeaderFrame.BackgroundTransparency = 1
StealerHeaderFrame.Size        = UDim2.new(1, 0, 0, 40)
StealerHeaderFrame.Parent      = StealerPanel

local StealerHeaderGradient = Instance.new("UIGradient")
StealerHeaderGradient.Color    = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 160)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 235, 120)),
})
StealerHeaderGradient.Parent   = StealerHeaderFrame

local StealerIconLabel = Instance.new("TextLabel")
StealerIconLabel.Position      = UDim2.new(0, 12, 0, 11)
StealerIconLabel.Size          = UDim2.new(0, 20, 0, 20)
StealerIconLabel.Text          = "🔴"
StealerIconLabel.TextScaled    = true
StealerIconLabel.BackgroundTransparency = 1
StealerIconLabel.Parent        = StealerHeaderFrame

local StealerTitleLabel = Instance.new("TextLabel")
StealerTitleLabel.Text         = "Active Stealers"
StealerTitleLabel.Position     = UDim2.new(0, 34, 0, 10)
StealerTitleLabel.Size         = UDim2.new(1, -75, 0, 22)
StealerTitleLabel.TextSize     = 15
StealerTitleLabel.TextColor3   = Color3.fromRGB(255, 120, 160)
StealerTitleLabel.BackgroundTransparency = 1
StealerTitleLabel.Font         = Enum.Font.GothamBold
StealerTitleLabel.Parent       = StealerHeaderFrame

local StealerCountFrame = Instance.new("Frame")
StealerCountFrame.Position     = UDim2.new(1, -46, 0, 11)
StealerCountFrame.Size         = UDim2.new(0, 34, 0, 22)
StealerCountFrame.BackgroundTransparency = 0.5
StealerCountFrame.Parent       = StealerHeaderFrame

local StealerCountCorner = Instance.new("UICorner")
StealerCountCorner.CornerRadius = UDim.new(0, 6)
StealerCountCorner.Parent      = StealerCountFrame

local StealerCountLabel = Instance.new("TextLabel")
StealerCountLabel.Name         = "CountLabel"
StealerCountLabel.Text         = "0"
StealerCountLabel.Size         = UDim2.new(1, 0, 1, 0)
StealerCountLabel.TextScaled   = true
StealerCountLabel.BackgroundTransparency = 1
StealerCountLabel.Parent       = StealerCountFrame

local StealerScrollFrame = Instance.new("ScrollingFrame")
StealerScrollFrame.Position    = UDim2.new(0, 7, 0, 48)
StealerScrollFrame.Size        = UDim2.new(1, -14, 1, -54)
StealerScrollFrame.ScrollBarThickness = 4
StealerScrollFrame.BackgroundTransparency = 1
StealerScrollFrame.Parent      = StealerPanel

local StealerListLayout = Instance.new("UIListLayout")
StealerListLayout.SortOrder    = Enum.SortOrder.LayoutOrder
StealerListLayout.Padding      = UDim.new(0, 3)
StealerListLayout.Parent       = StealerScrollFrame

local EmptyLabel = Instance.new("TextLabel")
EmptyLabel.Name                = "EmptyLabel"
EmptyLabel.Text                = "No active stealers ✓ All clear"
EmptyLabel.Size                = UDim2.new(1, 0, 0, 60)
EmptyLabel.TextScaled          = true
EmptyLabel.BackgroundTransparency = 1
EmptyLabel.Parent              = StealerScrollFrame

-- ── Quick Controls panel ────────────────────────────────────
local QuickPanel = Instance.new("Frame")
QuickPanel.Name                = "QuickPanel"
QuickPanel.Position            = UDim2.new(1, -200, 0, 15)
QuickPanel.Size                = UDim2.new(0, 190, 0, 255)
QuickPanel.BackgroundTransparency = 0.15
QuickPanel.Parent              = BKAdminPanelV3

local QuickCorner = Instance.new("UICorner")
QuickCorner.CornerRadius       = UDim.new(0, 8)
QuickCorner.Parent             = QuickPanel

local QuickStroke = Instance.new("UIStroke")
QuickStroke.Parent             = QuickPanel

local QuickDragHeader = Instance.new("TextLabel")
QuickDragHeader.Name           = "DragHeader"
QuickDragHeader.Text           = "⚡ Quick Controls"
QuickDragHeader.Position       = UDim2.new(0, 8, 0, 8)
QuickDragHeader.Size           = UDim2.new(1, -16, 0, 28)
QuickDragHeader.BackgroundTransparency = 1
QuickDragHeader.Font           = Enum.Font.GothamBold
QuickDragHeader.TextScaled     = true
QuickDragHeader.Active         = true
QuickDragHeader.Parent         = QuickPanel

local QuickDivider = Instance.new("Frame")
QuickDivider.Position          = UDim2.new(0, 8, 0, 34)
QuickDivider.Size              = UDim2.new(1, -16, 0, 1)
QuickDivider.BackgroundTransparency = 0.5
QuickDivider.Parent            = QuickPanel

local QuickInnerFrame = Instance.new("Frame")
QuickInnerFrame.Position       = UDim2.new(0, 7, 0, 40)
QuickInnerFrame.Size           = UDim2.new(1, -14, 1, -44)
QuickInnerFrame.BackgroundTransparency = 1
QuickInnerFrame.Parent         = QuickPanel

local QuickListLayout = Instance.new("UIListLayout")
QuickListLayout.SortOrder      = Enum.SortOrder.LayoutOrder
QuickListLayout.Padding        = UDim.new(0, 4)
QuickListLayout.Parent         = QuickInnerFrame

-- ── Toggle button (AP button, top-right) ────────────────────
local ToggleButton = Instance.new("TextButton")
ToggleButton.Text              = "AP"
ToggleButton.Position          = UDim2.new(1, -70, 0, 15)
ToggleButton.Size              = UDim2.new(0, 55, 0, 55)
ToggleButton.ZIndex            = 50
ToggleButton.TextSize          = 18
ToggleButton.Font              = Enum.Font.GothamBold
ToggleButton.BackgroundTransparency = 0.1
ToggleButton.Parent            = BKAdminPanelV3

local ToggleBtnCorner = Instance.new("UICorner")
ToggleBtnCorner.CornerRadius   = UDim.new(0, 10)
ToggleBtnCorner.Parent         = ToggleButton

local ToggleBtnStroke = Instance.new("UIStroke")
ToggleBtnStroke.Parent         = ToggleButton

local ToggleBtnGradient = Instance.new("UIGradient")
ToggleBtnGradient.Parent       = ToggleButton

local ToggleBtnScale = Instance.new("UIScale")
ToggleBtnScale.Parent          = ToggleButton

-- ============================================================
-- // [5] FUNCTIONALITY // --
-- ============================================================

-- ── Helper: build a player row in the Players tab ───────────
local function BuildPlayerRow(player, layoutOrder)
    local userId = player.UserId
    local username = player.Name

    local rowFrame = Instance.new("Frame")
    rowFrame.Name              = username
    rowFrame.LayoutOrder       = layoutOrder
    rowFrame.Size              = UDim2.new(1, 0, 0, 60)
    rowFrame.BackgroundTransparency = 0.6
    rowFrame.Parent            = PlayersScrollFrame

    local rowCorner = Instance.new("UICorner")
    rowCorner.CornerRadius     = UDim.new(0, 6)
    rowCorner.Parent           = rowFrame

    local rowStroke = Instance.new("UIStroke")
    rowStroke.Parent           = rowFrame

    -- Avatar thumbnail
    local innerFrame = Instance.new("Frame")
    innerFrame.BackgroundTransparency = 1
    innerFrame.Size            = UDim2.new(1, 0, 1, 0)
    innerFrame.Parent          = rowFrame

    local innerCorner = Instance.new("UICorner")
    innerCorner.Parent         = innerFrame

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Parent         = innerFrame

    local avatarImg = Instance.new("ImageLabel")
    avatarImg.Image            = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=48&height=48&format=png"
    avatarImg.Size             = UDim2.new(0, 48, 0, 48)
    avatarImg.Position         = UDim2.new(0, 6, 0.5, -24)
    avatarImg.BackgroundTransparency = 1
    avatarImg.Parent           = innerFrame

    local avatarCorner = Instance.new("UICorner")
    avatarCorner.CornerRadius  = UDim.new(0, 6)
    avatarCorner.Parent        = avatarImg

    -- Name label
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name             = "NameLabel"
    nameLabel.Text             = username
    nameLabel.Position         = UDim2.new(0, 66, 0, 10)
    nameLabel.Size             = UDim2.new(0, 110, 0, 18)
    nameLabel.TextSize         = 14
    nameLabel.Font             = Enum.Font.GothamBold
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextXAlignment   = Enum.TextXAlignment.Left
    nameLabel.Parent           = rowFrame

    -- Badges + buttons inner layout
    local badgeFrame = Instance.new("Frame")
    badgeFrame.Position        = UDim2.new(0, 66, 0, 29)
    badgeFrame.Size            = UDim2.new(0, 140, 0, 14)
    badgeFrame.BackgroundTransparency = 1
    badgeFrame.Parent          = rowFrame

    local badgeLayout = Instance.new("UIListLayout")
    badgeLayout.FillDirection  = Enum.FillDirection.Horizontal
    badgeLayout.SortOrder      = Enum.SortOrder.LayoutOrder
    badgeLayout.Padding        = UDim.new(0, 3)
    badgeLayout.Parent         = badgeFrame

    local handleLabel = Instance.new("TextLabel")
    handleLabel.Text           = "@" .. username
    handleLabel.Font           = Enum.Font.Gotham
    handleLabel.Size           = UDim2.new(0, 70, 0, 12)
    handleLabel.BackgroundTransparency = 1
    handleLabel.TextXAlignment = Enum.TextXAlignment.Left
    handleLabel.TextSize       = 9
    handleLabel.Parent         = badgeFrame

    local ownerBadge = Instance.new("Frame")
    ownerBadge.Name            = "OwnerBadge"
    ownerBadge.LayoutOrder     = 2
    ownerBadge.Size            = UDim2.new(0, 42, 0, 12)
    ownerBadge.BackgroundColor3 = Color3.fromRGB(255, 120, 160)
    ownerBadge.Visible         = false
    ownerBadge.Parent          = badgeFrame

    local ownerCorner = Instance.new("UICorner")
    ownerCorner.CornerRadius   = UDim.new(0, 4)
    ownerCorner.Parent         = ownerBadge

    local ownerText = Instance.new("TextLabel")
    ownerText.Text             = "OWNER"
    ownerText.TextSize         = 8
    ownerText.Size             = UDim2.new(1, 0, 1, 0)
    ownerText.TextScaled       = false
    ownerText.BackgroundTransparency = 1
    ownerText.Parent           = ownerBadge

    local stealerBadge = Instance.new("Frame")
    stealerBadge.Name          = "StealerBadge"
    stealerBadge.Size          = UDim2.new(0, 52, 0, 12)
    stealerBadge.BackgroundColor3 = Color3.fromRGB(255, 235, 120)
    stealerBadge.BackgroundTransparency = 0.4
    stealerBadge.Parent        = badgeFrame

    local stealerCorner = Instance.new("UICorner")
    stealerCorner.Parent       = stealerBadge

    local stealerText = Instance.new("TextLabel")
    stealerText.Text           = "⚠ STEALER"
    stealerText.TextColor3     = Color3.fromRGB(255, 235, 120)
    stealerText.Size           = UDim2.new(1, 0, 1, 0)
    stealerText.TextSize       = 8
    stealerText.BackgroundTransparency = 1
    stealerText.Parent         = stealerBadge

    -- Action buttons row
    local btnFrame = Instance.new("Frame")
    btnFrame.Position          = UDim2.new(1, -292, 0.5, -17)
    btnFrame.Size              = UDim2.new(0, 284, 0, 34)
    btnFrame.BackgroundTransparency = 1
    btnFrame.Parent            = rowFrame

    local btnLayout = Instance.new("UIListLayout")
    btnLayout.FillDirection    = Enum.FillDirection.Horizontal
    btnLayout.SortOrder        = Enum.SortOrder.LayoutOrder
    btnLayout.Padding          = UDim.new(0, 3)
    btnLayout.Parent           = btnFrame

    local cmdDefs = {
        { name = "rocket",       text = "🚀", color = Color3.fromRGB(255, 235, 120) },
        { name = "ragdoll",      text = "🤸", color = Color3.fromRGB(140, 200, 255) },
        { name = "balloon",      text = "🎈", color = Color3.fromRGB(100, 255, 150) },
        { name = "inverse",      text = "🔄", color = Color3.fromRGB(200, 200, 200) },
        { name = "jail",         text = "⛓",  color = Color3.fromRGB(180, 180, 180) },
        { name = "morph",        text = "🎭", color = Color3.fromRGB(180, 180, 180) },
    }

    for _, def in ipairs(cmdDefs) do
        local btn = Instance.new("TextButton")
        btn.Name               = def.name
        btn.Text               = def.text
        btn.Size               = UDim2.new(0, 32, 0, 32)
        btn.BackgroundColor3   = def.color
        btn.BackgroundTransparency = 0.65
        btn.Font               = Enum.Font.Gotham
        btn.TextScaled         = true
        btn.Parent             = btnFrame

        local c = Instance.new("UICorner")
        c.CornerRadius         = UDim.new(0, 7)
        c.Parent               = btn

        local s = Instance.new("UIStroke")
        s.Parent               = btn

        btn.MouseButton1Click:Connect(function()
            -- Placeholder: fire server RemoteEvent or FireServer for the chosen command
            -- Replace with actual remote call for the target game
            warn("[BKAdminPanel] Command '" .. def.name .. "' triggered on player: " .. username)
        end)
    end

    -- Attack button (gradient border variant)
    local attackBtn = Instance.new("TextButton")
    attackBtn.Name             = "AttackButton"
    attackBtn.Text             = "⚔"
    attackBtn.Size             = UDim2.new(0, 32, 0, 32)
    attackBtn.BackgroundTransparency = 0.65
    attackBtn.Parent           = btnFrame

    local attackCorner = Instance.new("UICorner")
    attackCorner.CornerRadius  = UDim.new(0, 7)
    attackCorner.Parent        = attackBtn

    local attackStroke = Instance.new("UIStroke")
    attackStroke.Parent        = attackBtn

    local attackGradient = Instance.new("UIGradient")
    attackGradient.Parent      = attackBtn

    attackBtn.MouseButton1Click:Connect(function()
        warn("[BKAdminPanel] Attack triggered on: " .. username)
    end)

    -- Block button
    local blockBtn = Instance.new("TextButton")
    blockBtn.Name              = "BlockBtn"
    blockBtn.Text              = "🚫"
    blockBtn.Size              = UDim2.new(0, 32, 0, 32)
    blockBtn.BackgroundTransparency = 0.65
    blockBtn.Parent            = btnFrame

    local blockCorner = Instance.new("UICorner")
    blockCorner.CornerRadius   = UDim.new(0, 7)
    blockCorner.Parent         = blockBtn

    local blockStroke = Instance.new("UIStroke")
    blockStroke.Parent         = blockBtn

    blockBtn.MouseButton1Click:Connect(function()
        warn("[BKAdminPanel] Block triggered on: " .. username)
    end)

    return rowFrame
end

-- ── Helper: build a command row in the Commands tab ─────────
local function BuildCmdRow(index, cmdName, cmdIcon, accentColor)
    local rowFrame = Instance.new("Frame")
    rowFrame.Name              = "CmdRow_" .. cmdName
    rowFrame.Size              = UDim2.new(1, 0, 0, 42)
    rowFrame.BackgroundTransparency = 0.82
    rowFrame.BackgroundColor3  = accentColor
    rowFrame.Parent            = CmdsScrollFrame

    local rowCorner = Instance.new("UICorner")
    rowCorner.Parent           = rowFrame

    local rowStroke = Instance.new("UIStroke")
    rowStroke.Color            = accentColor
    rowStroke.Transparency     = 0.4
    rowStroke.Parent           = rowFrame

    -- Priority/order bubble
    local priorityBubble = Instance.new("Frame")
    priorityBubble.BackgroundTransparency = 0.3
    priorityBubble.Position    = UDim2.new(0, 6, 0.5, -10)
    priorityBubble.Size        = UDim2.new(0, 20, 0, 20)
    priorityBubble.Parent      = rowFrame

    local priorityBubbleCorner = Instance.new("UICorner")
    priorityBubbleCorner.CornerRadius = UDim.new(1, 0)
    priorityBubbleCorner.Parent = priorityBubble

    local priorityLabel = Instance.new("TextLabel")
    priorityLabel.Text         = tostring(index)
    priorityLabel.Size         = UDim2.new(1, 0, 1, 0)
    priorityLabel.BackgroundTransparency = 1
    priorityLabel.TextScaled   = true
    priorityLabel.Parent       = priorityBubble

    -- Up/down order buttons
    local arrowFrame = Instance.new("Frame")
    arrowFrame.Position        = UDim2.new(0, 30, 0.5, -17)
    arrowFrame.Size            = UDim2.new(0, 16, 0, 34)
    arrowFrame.BackgroundTransparency = 1
    arrowFrame.Parent          = rowFrame

    local upBtn = Instance.new("TextButton")
    upBtn.Text                 = "▲"
    upBtn.Position             = UDim2.new(0, 0, 0, 0)
    upBtn.Size                 = UDim2.new(1, 0, 0, 15)
    upBtn.TextSize             = 8
    upBtn.BackgroundTransparency = 0.6
    upBtn.Parent               = arrowFrame

    local upCorner = Instance.new("UICorner")
    upCorner.Parent            = upBtn

    local downBtn = Instance.new("TextButton")
    downBtn.Text               = "▼"
    downBtn.Position           = UDim2.new(0, 0, 0, 19)
    downBtn.Size               = UDim2.new(1, 0, 0, 15)
    downBtn.TextSize           = 8
    downBtn.BackgroundTransparency = 0.6
    downBtn.Parent             = arrowFrame

    -- Command icon
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Text             = cmdIcon
    iconLabel.Position         = UDim2.new(0, 52, 0.5, -12)
    iconLabel.Size             = UDim2.new(0, 24, 0, 24)
    iconLabel.BackgroundTransparency = 1
    iconLabel.TextScaled       = true
    iconLabel.Parent           = rowFrame

    -- Command name label
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Text             = cmdName:sub(1, 1):upper() .. cmdName:sub(2)
    nameLabel.Position         = UDim2.new(0, 78, 0, 0)
    nameLabel.Size             = UDim2.new(0, 90, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextXAlignment   = Enum.TextXAlignment.Left
    nameLabel.Parent           = rowFrame

    -- Toggle/fire button (right side)
    local fireBtn = Instance.new("TextButton")
    fireBtn.Text               = "FIRE"
    fireBtn.Position           = UDim2.new(1, -52, 0, 0)
    fireBtn.Size               = UDim2.new(0, 52, 1, 0)
    fireBtn.BackgroundTransparency = 0.5
    fireBtn.Parent             = rowFrame

    fireBtn.MouseButton1Click:Connect(function()
        warn("[BKAdminPanel] Command fired: " .. cmdName)
    end)

    return rowFrame
end

-- Build all 9 command rows present in the log
BuildCmdRow(1, "rocket",      "🚀", Color3.fromRGB(255, 235, 120))
BuildCmdRow(2, "ragdoll",     "🤸", Color3.fromRGB(140, 200, 255))
BuildCmdRow(3, "balloon",     "🎈", Color3.fromRGB(100, 255, 150))
BuildCmdRow(4, "inverse",     "🔄", Color3.fromRGB(200, 200, 200))
BuildCmdRow(5, "nightvision", "👁",  Color3.fromRGB(203, 81, 248))
BuildCmdRow(6, "jail",        "⛓",  Color3.fromRGB(255, 120, 160))
BuildCmdRow(7, "morph",       "🎭", Color3.fromRGB(200, 200, 200))
BuildCmdRow(8, "click",       "🖱",  Color3.fromRGB(203, 81, 248))
BuildCmdRow(9, "steal",       "🔴", Color3.fromRGB(255, 235, 120))

-- ── Quick panel toggle rows ─────────────────────────────────
local function BuildQuickRow(labelText, defaultColor)
    local quickRow = Instance.new("Frame")
    quickRow.Size              = UDim2.new(1, 0, 0, 32)
    quickRow.BackgroundTransparency = 0.75
    quickRow.BackgroundColor3  = defaultColor
    quickRow.Parent            = QuickInnerFrame

    local rowCorner = Instance.new("UICorner")
    rowCorner.Parent           = quickRow

    local rowStroke = Instance.new("UIStroke")
    rowStroke.Parent           = quickRow

    local rowGradient = Instance.new("UIGradient")
    rowGradient.Parent         = quickRow

    local rowLabel = Instance.new("TextLabel")
    rowLabel.Text              = labelText
    rowLabel.Position          = UDim2.new(0, 10, 0, 0)
    rowLabel.Size              = UDim2.new(0.62, 0, 1, 0)
    rowLabel.BackgroundTransparency = 1
    rowLabel.TextXAlignment    = Enum.TextXAlignment.Left
    rowLabel.TextScaled        = true
    rowLabel.Parent            = quickRow

    -- Toggle track
    local track = Instance.new("Frame")
    track.Position             = UDim2.new(1, -44, 0.5, -9)
    track.Size                 = UDim2.new(0, 36, 0, 18)
    track.BackgroundColor3     = Color3.fromRGB(48, 80, 96)
    track.Parent               = quickRow

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius   = UDim.new(1, 0)
    trackCorner.Parent         = track

    local trackStroke = Instance.new("UIStroke")
    trackStroke.Parent         = track

    local knob = Instance.new("Frame")
    knob.Position              = UDim2.new(0, 3, 0.5, -6)
    knob.Size                  = UDim2.new(0, 12, 0, 12)
    knob.BackgroundColor3      = Color3.fromRGB(200, 200, 220)
    knob.Parent                = track

    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius    = UDim.new(1, 0)
    knobCorner.Parent          = knob

    -- Toggle button overlaid on the track
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Text             = ""
    toggleBtn.BackgroundTransparency = 1
    toggleBtn.Size             = UDim2.new(1, 0, 1, 0)
    toggleBtn.Parent           = track

    local isOn = false
    toggleBtn.MouseButton1Click:Connect(function()
        isOn = not isOn
        local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad)
        if isOn then
            TweenService:Create(knob, tweenInfo, { Position = UDim2.new(1, -15, 0.5, -6) }):Play()
        else
            TweenService:Create(knob, tweenInfo, { Position = UDim2.new(0, 3, 0.5, -6) }):Play()
        end
        warn("[BKAdminPanel] Quick toggle '" .. labelText .. "' = " .. tostring(isOn))
    end)

    return quickRow
end

BuildQuickRow("Click to AP",   Color3.fromRGB(47, 89, 99))
BuildQuickRow("Random Cmd",    Color3.fromRGB(89, 79, 56))
BuildQuickRow("Range Circle",  Color3.fromRGB(43, 85, 65))

-- ── Settings rows ────────────────────────────────────────────
local function BuildSettingsSlider(labelText, defaultValue, layoutOrder)
    local settingsRow = Instance.new("Frame")
    settingsRow.LayoutOrder    = layoutOrder
    settingsRow.Size           = UDim2.new(1, 0, 0, 60)
    settingsRow.BackgroundTransparency = 0.75
    settingsRow.Parent         = SettingsScrollFrame

    local rowCorner = Instance.new("UICorner")
    rowCorner.Parent           = settingsRow

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Text              = labelText .. ": " .. tostring(defaultValue) .. "cs"
    titleLbl.Position          = UDim2.new(0, 12, 0, 8)
    titleLbl.Size              = UDim2.new(1, -20, 0, 18)
    titleLbl.BackgroundTransparency = 1
    titleLbl.TextXAlignment    = Enum.TextXAlignment.Left
    titleLbl.TextScaled        = true
    titleLbl.Parent            = settingsRow

    local trackBg = Instance.new("Frame")
    trackBg.Position           = UDim2.new(0, 12, 0, 38)
    trackBg.Size               = UDim2.new(1, -24, 0, 12)
    trackBg.BackgroundTransparency = 0.5
    trackBg.Parent             = settingsRow

    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius   = UDim.new(1, 0)
    trackCorner.Parent         = trackBg

    local fill = Instance.new("Frame")
    fill.Size                  = UDim2.new(defaultValue / 100, 0, 1, 0)
    fill.BackgroundTransparency = 0.2
    fill.Parent                = trackBg

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius    = UDim.new(1, 0)
    fillCorner.Parent          = fill

    local fillGradient = Instance.new("UIGradient")
    fillGradient.Parent        = fill

    local handle = Instance.new("Frame")
    handle.Position            = UDim2.new(defaultValue / 100, -9, 0.5, -9)
    handle.Size                = UDim2.new(0, 18, 0, 18)
    handle.Parent              = trackBg

    local handleCorner = Instance.new("UICorner")
    handleCorner.CornerRadius  = UDim.new(1, 0)
    handleCorner.Parent        = handle

    local handleStroke = Instance.new("UIStroke")
    handleStroke.Parent        = handle

    -- Drag to adjust (simplified — InputBegan on track)
    trackBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            -- Value reading handled by UserInputService.InputChanged in full implementation
            warn("[BKAdminPanel] Slider drag begin: " .. labelText)
        end
    end)

    return settingsRow
end

BuildSettingsSlider("Main Delay",  30, 1)
BuildSettingsSlider("Click Delay", 30, 2)
BuildSettingsSlider("Steal Delay", 30, 3)

-- Keybind rows (from settings tab, entries 25–30)
local keybindDefs = {
    { label = "Toggle GUI",          key = "RightAlt", order = 25 },
    { label = "Click to AP Toggle",  key = "C",        order = 26 },
    { label = "Random Cmd Toggle",   key = "R",        order = 27 },
    { label = "Nearest Player",      key = "N",        order = 28 },
    { label = "Base Owner",          key = "B",        order = 29 },
    { label = "Proximity Toggle",    key = "M",        order = 30 },
}

for _, kb in ipairs(keybindDefs) do
    local kbRow = Instance.new("Frame")
    kbRow.LayoutOrder           = kb.order
    kbRow.Size                  = UDim2.new(1, 0, 0, 36)
    kbRow.BackgroundTransparency = 0.8
    kbRow.Parent                = SettingsScrollFrame

    local kbRowCorner = Instance.new("UICorner")
    kbRowCorner.Parent          = kbRow

    local kbLabel = Instance.new("TextLabel")
    kbLabel.Text                = kb.label
    kbLabel.Position            = UDim2.new(0, 10, 0, 0)
    kbLabel.Size                = UDim2.new(0.55, 0, 1, 0)
    kbLabel.BackgroundTransparency = 1
    kbLabel.TextXAlignment      = Enum.TextXAlignment.Left
    kbLabel.TextScaled          = true
    kbLabel.Parent              = kbRow

    local kbBtn = Instance.new("TextButton")
    kbBtn.Text                  = kb.key
    kbBtn.Position              = UDim2.new(1, -85, 0.5, -15)
    kbBtn.Size                  = UDim2.new(0, 75, 0, 30)
    kbBtn.BackgroundColor3      = Color3.fromRGB(34, 14, 51)
    kbBtn.BackgroundTransparency = 0.08
    kbBtn.Font                  = Enum.Font.Gotham
    kbBtn.TextScaled            = true
    kbBtn.Parent                = kbRow

    local kbBtnCorner = Instance.new("UICorner")
    kbBtnCorner.CornerRadius    = UDim.new(0, 6)
    kbBtnCorner.Parent          = kbBtn

    local kbBtnStroke = Instance.new("UIStroke")
    kbBtnStroke.Parent          = kbBtn

    kbBtn.MouseButton1Click:Connect(function()
        warn("[BKAdminPanel] Rebind pressed for: " .. kb.label)
        -- Full implementation would enter listening mode here
    end)
end

-- ============================================================
-- // [6] INITIAL STATE // --
-- ============================================================

-- Populate player list on load
local playerCount = 0
for _, player in ipairs(Players:GetPlayers()) do
    playerCount += 1
    BuildPlayerRow(player, playerCount)
end
CountBadge.Text = tostring(playerCount) .. "/" .. tostring(playerCount)

-- Player join/leave listeners
Players.PlayerAdded:Connect(function(player)
    playerCount += 1
    BuildPlayerRow(player, playerCount)
    CountBadge.Text = tostring(#Players:GetPlayers()) .. "/" .. tostring(playerCount)
end)

Players.PlayerRemoving:Connect(function(player)
    local row = PlayersScrollFrame:FindFirstChild(player.Name)
    if row then row:Destroy() end
    CountBadge.Text = tostring(#Players:GetPlayers() - 1) .. "/" .. tostring(playerCount)
end)

-- Toggle main panel visibility
local panelVisible = true
ToggleButton.MouseButton1Click:Connect(function()
    panelVisible = not panelVisible
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(MainFrame, tweenInfo, {
        GroupTransparency = panelVisible and 0 or 1
    }):Play()
    MainFrame.Visible = panelVisible
end)

-- Dragging logic for MainFrame
local dragging, dragInput, dragStart, startPos
DragHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging  = true
        dragStart = input.Position
        startPos  = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DragHeader.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta  = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Keybind handler (RightAlt toggles GUI by default)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightAlt then
        panelVisible = not panelVisible
        MainFrame.Visible = panelVisible
    end
end)

-- Rainbow / animated gradient loop on header labels (RenderStepped cycling)
-- The log shows continuous TextColor3 updates on several labels each frame.
-- This reconstructs that animation via a simple sine-wave hue cycle.
local gradientAngle = 0
RunService.Heartbeat:Connect(function(dt)
    gradientAngle = (gradientAngle + dt * 60) % 360  -- ~1 full cycle per 6 seconds

    local hue       = gradientAngle / 360
    local color1    = Color3.fromHSV(hue, 0.55, 1)
    local color2    = Color3.fromHSV((hue + 0.33) % 1, 0.55, 1)
    local color3    = Color3.fromHSV((hue + 0.66) % 1, 0.55, 1)

    -- Animate the main title gradient rotation
    if DragHeaderGradient and DragHeaderGradient.Parent then
        DragHeaderGradient.Rotation = math.floor(gradientAngle)
    end

    -- Animate toggle button colour cycling
    if ToggleButton and ToggleButton.Parent then
        ToggleButton.TextColor3 = color2
    end

    -- Animate stealer panel title
    if StealerTitleLabel and StealerTitleLabel.Parent then
        StealerTitleLabel.TextColor3 = color1
    end
end)

-- Track player positions (log shows per-Heartbeat HumanoidRootPart reads)
RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                -- Position data used internally by proximity/stealer detection
                local _pos = hrp.Position  -- consumed by detection logic
            end
        end
    end
end)

-- Plot ChildAdded/ChildRemoved (loader registers these to track the game world)
if workspace:FindFirstChild("Plots") then
    workspace.Plots.ChildAdded:Connect(function(child)
        warn("[BKAdminPanel] New plot added: " .. child.Name)
    end)
    workspace.Plots.ChildRemoved:Connect(function(child)
        warn("[BKAdminPanel] Plot removed: " .. child.Name)
    end)
end

-- Scale GUI to viewport size (loader reads Camera viewport each frame)
local function UpdateGuiScale()
    local vp   = workspace.CurrentCamera.ViewportSize
    local base = 1080
    local scale = math.clamp(vp.Y / base, 0.7, 1.4)
    local uiScale = BKAdminPanelV3:FindFirstChildOfClass("UIScale")
        or Instance.new("UIScale", BKAdminPanelV3)
    uiScale.Scale = scale
end
UpdateGuiScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateGuiScale)