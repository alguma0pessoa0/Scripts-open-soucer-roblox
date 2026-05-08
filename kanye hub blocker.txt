-- KANYEHUB BLOCKER
-- logged by @fwexternet reconstructed by @fwexternet logger by casual discord.gg/freesources
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local blockDelay = 0.7 -- Customizable delay for stability

-- ==================== CORE BLOCKING LOGIC ====================
-- This matches the specific clicking logic from your original source
local function FastClick()
    task.wait(blockDelay)
    local cam = workspace.CurrentCamera.ViewportSize
    local x = cam.X / 2
    local y = (cam.Y / 2) + 23 -- Precise offset for the Roblox 'Block' button

    for _ = 1, 8 do
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
        task.wait(0.008)
    end
end

local function blockPlayer(plr)
    if not plr or plr == player then return end
    pcall(function()
        StarterGui:SetCore("PromptBlockPlayer", plr) -- Opens the Roblox prompt
        FastClick() -- Clicks the confirmation button automatically
    end)
end

local function blockAllPlayers()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            blockPlayer(p)
            task.wait(1.5) -- Delay to allow the auto-click to process per player
        end
    end
end

-- ==================== GUI CREATION (MATCHING IMAGE) ====================
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "KanyeInstantBlock"
mainGui.ResetOnSpawn = false
pcall(function() mainGui.Parent = (gethui and gethui()) or player.PlayerGui end)

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 400)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Active = true
mainFrame.Draggable = true -- Allows moving the GUI
mainFrame.Parent = mainGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", mainFrame).Color = Color3.fromRGB(255, 255, 255)

-- Header Text
local header = Instance.new("TextLabel")
header.Text = "INSTANT BLOCK — .GG/KANYEHUB"
header.Font = Enum.Font.LuckiestGuy
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 18
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundTransparency = 1
header.Parent = mainFrame

-- Player List Container
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(0.9, 0, 0.5, 0)
scroll.Position = UDim2.new(0.05, 0, 0.15, 0)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 0
scroll.Parent = mainFrame
local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 8)

-- ==================== DYNAMIC PLAYER LIST ====================
local function updateList()
    for _, v in ipairs(scroll:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            local pFrame = Instance.new("Frame")
            pFrame.Size = UDim2.new(1, 0, 0, 60)
            pFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            pFrame.Parent = scroll
            Instance.new("UICorner", pFrame).CornerRadius = UDim.new(0, 10)
            
            local name = Instance.new("TextLabel")
            name.Text = p.DisplayName:upper() .. "\n<font color='#888888'>@" .. p.Name .. "</font>"
            name.RichText = true
            name.Font = Enum.Font.LuckiestGuy
            name.TextColor3 = Color3.fromRGB(255, 255, 255)
            name.TextSize = 15
            name.Size = UDim2.new(0.65, 0, 1, 0)
            name.Position = UDim2.new(0.05, 0, 0, 0)
            name.BackgroundTransparency = 1
            name.TextXAlignment = "Left"
            name.Parent = pFrame
            
            local btn = Instance.new("TextButton")
            btn.Text = "BLOCK"
            btn.Font = Enum.Font.LuckiestGuy
            btn.Size = UDim2.new(0, 80, 0, 35)
            btn.Position = UDim2.new(0.7, 0, 0.2, 0)
            btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextColor3 = Color3.fromRGB(0, 0, 0)
            btn.Parent = pFrame
            Instance.new("UICorner", btn)
            
            btn.MouseButton1Click:Connect(function() blockPlayer(p) end)
        end
    end
    scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end

-- ==================== FOOTER BUTTONS ====================
local autoStealEnabled = true
local stealBtn = Instance.new("TextButton")
stealBtn.Text = "AUTO BLOCK STEAL: ON"
stealBtn.Size = UDim2.new(0.9, 0, 0, 45)
stealBtn.Position = UDim2.new(0.05, 0, 0.68, 0)
stealBtn.Font = Enum.Font.LuckiestGuy
stealBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
stealBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
stealBtn.Parent = mainFrame
Instance.new("UICorner", stealBtn).CornerRadius = UDim.new(0, 12)

local blockAllBtn = Instance.new("TextButton")
blockAllBtn.Text = "BLOCK ALL"
blockAllBtn.Size = UDim2.new(0.65, 0, 0, 45)
blockAllBtn.Position = UDim2.new(0.05, 0, 0.82, 0)
blockAllBtn.Font = Enum.Font.LuckiestGuy
blockAllBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
blockAllBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
blockAllBtn.Parent = mainFrame
Instance.new("UICorner", blockAllBtn).CornerRadius = UDim.new(0, 12)

local pKeyLabel = Instance.new("TextLabel")
pKeyLabel.Text = "[P]"
pKeyLabel.Size = UDim2.new(0, 65, 0, 45)
pKeyLabel.Position = UDim2.new(0.74, 0, 0.82, 0)
pKeyLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
pKeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pKeyLabel.Font = Enum.Font.LuckiestGuy
pKeyLabel.Parent = mainFrame
Instance.new("UICorner", pKeyLabel).CornerRadius = UDim.new(0, 12)

-- ==================== FUNCTIONALITY & BRAINROT DETECTION ====================
stealBtn.MouseButton1Click:Connect(function()
    autoStealEnabled = not autoStealEnabled
    stealBtn.Text = "AUTO BLOCK STEAL: " .. (autoStealEnabled and "ON" or "OFF")
end)

blockAllBtn.MouseButton1Click:Connect(blockAllPlayers)

-- BRAINROT DETECTION logic from source
task.spawn(function()
    while task.wait(1.5) do
        if not autoStealEnabled then continue end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character then
                for _, item in ipairs(p.Character:GetChildren()) do
                    if item:IsA("Tool") then
                        local name = item.Name:lower()
                        if name:find("animal") or name:find("monkey") or name:find("brainrot") then
                            blockPlayer(p)
                        end
                    end
                end
            end
        end
    end
end)

-- KEYBIND LOGIC: P = BLOCK ALL
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.P then
        blockAllPlayers()
    end
end)

-- Initialize Player List
updateList()
Players.PlayerAdded:Connect(updateList)
Players.PlayerRemoving:Connect(updateList)
print("leaked at discord.gg/freesources")
print("leaked at discord.gg/freesources")
print("leaked at discord.gg/freesources")
print("leaked at discord.gg/freesources")
print("leaked at discord.gg/freesources")
print("leaked at discord.gg/freesources")
print("leaked at discord.gg/freesources")