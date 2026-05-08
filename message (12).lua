setfpscap(4)
task.spawn(function()
	local pg = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	local sg = Instance.new("ScreenGui")
	sg.Name = "SabWatermark"
	sg.ResetOnSpawn = false
	sg.DisplayOrder = 9999
	sg.IgnoreGuiInset = true
	sg.Parent = pg
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 340, 0, 72)
	frame.Position = UDim2.new(0.5, -170, 0.5, -36)
	frame.BackgroundColor3 = Color3.fromRGB(110, 60, 200)
	frame.BackgroundTransparency = 0.08
	frame.BorderSizePixel = 0
	frame.Parent = sg
	local corner = Instance.new("UICorner", frame)
	corner.CornerRadius = UDim.new(0, 22)
	local stroke = Instance.new("UIStroke", frame)
	stroke.Color = Color3.fromRGB(255, 180, 80)
	stroke.Thickness = 3
	stroke.Transparency = 0
	local link = Instance.new("TextLabel")
	link.Size = UDim2.new(1, 0, 0.55, 0)
	link.Position = UDim2.new(0, 0, 0, 0)
	link.BackgroundTransparency = 1
	link.Text = "✦ discord.gg/sabscripts ✦"
	link.TextColor3 = Color3.fromRGB(255, 240, 100)
	link.TextSize = 21
	link.Font = Enum.Font.GothamBold
	link.TextStrokeColor3 = Color3.fromRGB(80, 0, 160)
	link.TextStrokeTransparency = 0.1
	link.Parent = frame
	local sub = Instance.new("TextLabel")
	sub.Size = UDim2.new(1, 0, 0.45, 0)
	sub.Position = UDim2.new(0, 0, 0.55, 0)
	sub.BackgroundTransparency = 1
	sub.Text = "this script is free"
	sub.TextColor3 = Color3.fromRGB(0, 0, 0)
	sub.TextSize = 15
	sub.Font = Enum.Font.Gotham
	sub.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	sub.TextStrokeTransparency = 0.6
	sub.Parent = frame
end)
pcall(function()
    game:GetService("Players").RespawnTime = 0
end)

if not game:IsLoaded() then
    game.Loaded:Wait()
end
do
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    local Sync = require(game.ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Synchronizer"))
    local patched = 0

    for name, fn in pairs(Sync) do
        if typeof(fn) ~= "function" then continue end
        if isexecutorclosure(fn) then continue end

        local ok, ups = pcall(debug.getupvalues, fn)
        if not ok then continue end

        for idx, val in pairs(ups) do
            if typeof(val) == "function" and not isexecutorclosure(val) then
                local ok2, innerUps = pcall(debug.getupvalues, val)
                if ok2 then
                    local hasBoolean = false
                    for _, v in pairs(innerUps) do
                        if typeof(v) == "boolean" then
                            hasBoolean = true
                            break
                        end
                    end
                    if hasBoolean then
                        debug.setupvalue(fn, idx, newcclosure(function() end))
                        patched += 1
                    end
                end
            end
        end
    end
end
getgenv().SCANNER_CONFIG = {
    WS_URL = "",
    NOTIFIER_API_URL = "",
    SERVER_FETCH_URL = "",
    SCAN_TIMEOUT = 1140,
    MIN_GEN_FILTER = 10000000,
    INSTANT_HOP_THRESHOLD = 4000000000,
    XOR_KEY = "",
    SCAN_TIME_PER_SERVER = 1140,
    FORCE_REJOIN_TIMEOUT = 1200,
    SAVE_RESULTS_LOCALLY = false,
    SCAN_INTERVAL = 2,
    BOT_NAME = game:GetService("Players").LocalPlayer.Name,
}

local function get_service(name)
    return cloneref(game:GetService(name))
end
local Players = get_service("Players")
local HttpService = get_service("HttpService")
local ReplicatedStorage = get_service("ReplicatedStorage")
local TeleportService = get_service("TeleportService")
local GuiService = get_service("GuiService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
   
repeat task.wait() until LocalPlayer
repeat task.wait() until LocalPlayer.Character
repeat task.wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

task.spawn(function()
    while true do
        pcall(function() GuiService:ClearError() end)
        task.wait(0.1)
    end
end)

local ScannerWS = {
    socket = nil,
    connected = false,
    shouldReconnect = true,
    reconnectDelay = 2,
    maxReconnectDelay = 30,
    forceHopRequested = false,
}

local botMode = "starting"

function ScannerWS:send(data)
    if not self.socket or not self.connected then return false end
    local ok = pcall(function()
        self.socket:Send(HttpService:JSONEncode(data))
    end)
    return ok
end

function ScannerWS:connect()
    if not WebSocket or not WebSocket.connect then
        return false
    end
    
    local ok, ws = pcall(function()
        return WebSocket.connect(getgenv().SCANNER_CONFIG.WS_URL)
    end)
    
    if not ok or not ws then
        if self.shouldReconnect then
            task.spawn(function()
                task.wait(self.reconnectDelay)
                self.reconnectDelay = math.min(self.reconnectDelay * 1.5, self.maxReconnectDelay)
                self:connect()
            end)
        end
        return false
    end
    
    self.socket = ws
    self.connected = true
    self.reconnectDelay = 2
    
    ws.OnMessage:Connect(function(raw)
        local s, msg = pcall(function()
            return HttpService:JSONDecode(raw)
        end)
        if not s or not msg or not msg.type then return end
        
        if msg.type == "pong" then
        end
        
        if msg.type == "connected" then
            self:send({
                type = "identify",
                isScanner = true,
                botId = getgenv().SCANNER_CONFIG.BOT_NAME,
                username = LocalPlayer.Name,
                userId = LocalPlayer.UserId,
                jobId = game.JobId,
                botMode = botMode,
            })
        end
        
        if msg.type == "identified" then
        end
        
        if msg.type == "force-hop" then
            self.forceHopRequested = true
        end
        
        if msg.type == "add-server-ack" then
        end
    end)
    
    ws.OnClose:Connect(function()
        self.connected = false
        self.socket = nil
        
        if self.shouldReconnect then
            task.spawn(function()
                task.wait(self.reconnectDelay)
                self.reconnectDelay = math.min(self.reconnectDelay * 1.5, self.maxReconnectDelay)
                self:connect()
            end)
        end
    end)
    
    return true
end

function ScannerWS:disconnect()
    self.shouldReconnect = false
    if self.socket then
        pcall(function() self.socket:Close() end)
    end
    self.connected = false
    self.socket = nil
end

function ScannerWS:addServer(jobId, players, brainrots, botId, cashData, rebirthData)
    return self:send({
        type = "add-server",
        jobId = jobId,
        players = players,
        brainrots = brainrots,
        botId = botId or getgenv().SCANNER_CONFIG.BOT_NAME,
        cash = cashData,
        rebirths = rebirthData,
    })
end

function ScannerWS:reportDead(jobId)
    return self:send({
        type = "report-dead",
        jobId = jobId,
        botId = getgenv().SCANNER_CONFIG.BOT_NAME,
        reason = "no_brainrots",
    })
end

function ScannerWS:ping()
    return self:send({
        type = "ping",
        botId = getgenv().SCANNER_CONFIG.BOT_NAME,
        username = LocalPlayer.Name,
        timestamp = os.time(),
        botMode = botMode,
    })
end

task.spawn(function()
    task.wait(1)
    ScannerWS:connect()
    
    local lastPing = 0
    while true do
        if ScannerWS.connected then
            local now = tick()
            if now - lastPing >= 15 then
                ScannerWS:ping()
                lastPing = now
            end
        end
        task.wait(5)
    end
end)

task.spawn(function()
    while task.wait(5) do
        pcall(function()
            firesignal(game:GetService("Players").LocalPlayer.PlayerGui.DivineWheel.DivineWheel.Buttons.Spin.Activated)
        end)
    end
end)

task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            ReplicatedStorage.Packages.Net["RE/YinYangEventService/Spin"]:FireServer()
        end)
    end
end)

local Modules = {}

local function loadModules()
    local Packages = ReplicatedStorage:WaitForChild("Packages", 10)
    local Datas = ReplicatedStorage:WaitForChild("Datas", 10)
    local Shared = ReplicatedStorage:WaitForChild("Shared", 10)
    local Utils = ReplicatedStorage:WaitForChild("Utils", 10)
   
    if not Packages or not Datas then return false end
   
    local ok = pcall(function()
        Modules.Synchronizer = require(Packages:WaitForChild("Synchronizer"))
        Modules.AnimalsData = require(Datas:WaitForChild("Animals"))
        Modules.RaritiesData = require(Datas:WaitForChild("Rarities"))
        Modules.AnimalsShared = require(Shared:WaitForChild("Animals"))
        Modules.NumberUtils = require(Utils:WaitForChild("NumberUtils"))
    end)
   
    return ok
end

local Scanner = {
    channels = {},
    cache = {},
    sentItems = {},
    ready = false,
}

local function getGenValue(animalName, mutation, traits)
    local ok, val = pcall(function()
        return Modules.AnimalsShared:GetGeneration(animalName, mutation, traits, nil)
    end)
    return ok and val or 0
end

local function makeSlotKey(plotName, slot)
    return plotName .. "|" .. tostring(slot)
end

local function makeItemFingerprint(slotData)
    if not slotData or not slotData.Index then return nil end
    local parts = {slotData.Index, slotData.Mutation or "None"}
    if slotData.Traits then
        local sorted = {}
        for _, t in ipairs(slotData.Traits) do table.insert(sorted, t) end
        table.sort(sorted)
        for _, t in ipairs(sorted) do table.insert(parts, t) end
    end
    return table.concat(parts, ":")
end

local function processSlot(plotName, slot, slotData, ownerName)
    if not slotData or not slotData.Index then return nil end
    if slotData.Machine and slotData.Machine.Active then return nil end
   
    local animalInfo = Modules.AnimalsData[slotData.Index]
    if not animalInfo then return nil end
   
    local rarityData = Modules.RaritiesData[animalInfo.Rarity]
    local genValue = getGenValue(slotData.Index, slotData.Mutation, slotData.Traits)
   
    if genValue < getgenv().SCANNER_CONFIG.MIN_GEN_FILTER then return nil end
   
    return {
        name = animalInfo.DisplayName or slotData.Index,
        index = slotData.Index,
        genValue = genValue,
        genText = "$" .. Modules.NumberUtils:ToString(genValue) .. "/s",
        rarity = animalInfo.Rarity,
        rarityColor = rarityData and rarityData.Color or Color3.new(1, 1, 1),
        mutation = slotData.Mutation or "None",
        traits = slotData.Traits or {},
        traitCount = slotData.Traits and #slotData.Traits or 0,
        owner = ownerName,
        plot = plotName,
        slot = tostring(slot),
        slotKey = makeSlotKey(plotName, slot),
        fingerprint = makeItemFingerprint(slotData),
    }
end

local function scanPlot(plotName)
    local channel = Scanner.channels[plotName]
    if not channel then return {} end
   
    local ok, owner = pcall(function() return channel:Get("Owner") end)
    if not ok or not owner then return {} end
   
    local ownerName = owner.Name
    if ownerName == LocalPlayer.Name then return {} end
    if not Players:FindFirstChild(ownerName) then return {} end
   
    local ok2, animalList = pcall(function() return channel:Get("AnimalList") end)
    if not ok2 or not animalList then return {} end
   
    local results = {}
    for slot, slotData in pairs(animalList) do
        local processed = processSlot(plotName, slot, slotData, ownerName)
        if processed then
            table.insert(results, processed)
        end
    end
    return results
end

local function rebuildCache()
    local newCache = {}
    for plotName in pairs(Scanner.channels) do
        for _, animal in ipairs(scanPlot(plotName)) do
            table.insert(newCache, animal)
        end
    end
    table.sort(newCache, function(a, b) return a.genValue > b.genValue end)
    Scanner.cache = newCache
end

local function getNewItems()
    local newItems = {}
    local currentKeys = {}

    for _, item in ipairs(Scanner.cache) do
        local key = item.slotKey
        local fp = item.fingerprint
        currentKeys[key] = fp

        local prevFp = Scanner.sentItems[key]
        if prevFp ~= fp then
            table.insert(newItems, item)
        end
    end

    for key in pairs(Scanner.sentItems) do
        if not currentKeys[key] then
            Scanner.sentItems[key] = nil
        end
    end

    return newItems, currentKeys
end

local function setupPlot(plot)
    local plotName = plot.Name
    if Scanner.channels[plotName] then return end
    local ok, channel = pcall(function()
        return Modules.Synchronizer:Wait(plotName)
    end)
    if ok and channel then
        Scanner.channels[plotName] = channel
    end
end

function Scanner:init()
    local plots = workspace:WaitForChild("Plots", 10)
    if not plots then return false end
    for _, plot in ipairs(plots:GetChildren()) do
        if plot:IsA("Model") then
            task.spawn(setupPlot, plot)
        end
    end
    task.wait(1)
    rebuildCache()
    self.ready = true
    return true
end

function Scanner:rescan()
    rebuildCache()
end

local function formatNumber(n)
    if n >= 1e15 then return string.format("%.1fq", n / 1e15)
    elseif n >= 1e12 then return string.format("%.1ft", n / 1e12)
    elseif n >= 1e9 then return string.format("%.1fb", n / 1e9)
    elseif n >= 1e6 then return string.format("%.1fm", n / 1e6)
    elseif n >= 1e3 then return string.format("%.1fk", n / 1e3)
    end
    return tostring(math.floor(n))
end

local function isPlayerInDuel(player)
    if player:GetAttribute("__duels_block_steal") == true then return true end
    for _, child in ipairs(player:GetChildren()) do
        local nameLower = child.Name:lower()
        if nameLower:find("duel") or nameLower:find("returned") then return true end
    end
    local attrOk, attrs = pcall(function() return player:GetAttributes() end)
    if attrOk and attrs then
        for key, val in pairs(attrs) do
            local keyLower = key:lower()
            if (keyLower:find("duel") or keyLower:find("returned")) and (val == true or val == 1) then
                return true
            end
        end
    end
    return false
end

local function getCashAndRebirthData()
    local cashData = {}
    local rebirthData = {}

    for _, player in ipairs(Players:GetPlayers()) do
        local ls = player:FindFirstChild("leaderstats")
        if not ls then continue end

        local cashVal = ls:FindFirstChild("Cash")
            or ls:FindFirstChild("Coins")
            or ls:FindFirstChild("Money")
            or ls:FindFirstChild("$")
            or ls:FindFirstChild("Gold")
            or ls:FindFirstChild("Currency")

        if not cashVal then
            for _, child in ipairs(ls:GetChildren()) do
                if (child:IsA("IntValue") or child:IsA("NumberValue")) and child.Name ~= "Rebirths" then
                    cashVal = child
                    break
                end
            end
        end

        local rebirthVal = ls:FindFirstChild("Rebirths")

        if cashVal then
            local ok, v = pcall(function() return cashVal.Value end)
            if ok then
                cashData[player.Name] = v
            end
        end

        if rebirthVal then
            local ok, v = pcall(function() return rebirthVal.Value end)
            if ok then
                rebirthData[player.Name] = v
            end
        end
    end

    return cashData, rebirthData
end

local function sendToNotifierAPI(items)
    pcall(function()
        local config = getgenv().SCANNER_CONFIG
        if #items == 0 then return end
        
        local brainrots = {}
        for _, a in ipairs(items) do
            local ownerInDuel = false
            pcall(function()
                local ownerPlayer = Players:FindFirstChild(a.owner)
                if ownerPlayer then ownerInDuel = isPlayerInDuel(ownerPlayer) end
            end)
            table.insert(brainrots, {
                name = a.name,
                gen = a.genText or formatNumber(a.genValue),
                value = a.genValue,
                traits = a.traits or {},
                traitMultiplier = 1,
                mutations = (a.mutation and a.mutation ~= "None") and {a.mutation} or {},
                duelActive = ownerInDuel,
                plotOwner = a.owner,
                slot = a.slot,
                plot = a.plot,
            })
        end

        local cashData, rebirthData = getCashAndRebirthData()
        
        if ScannerWS.connected then
            ScannerWS:addServer(game.JobId, #Players:GetPlayers(), brainrots, config.BOT_NAME, cashData, rebirthData)
        else
            local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request
            if httpRequest and config.NOTIFIER_API_URL ~= "" then
                httpRequest({
                    Url = config.NOTIFIER_API_URL .. "/add-server",
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = HttpService:JSONEncode({
                        jobId = game.JobId,
                        players = #Players:GetPlayers(),
                        botId = config.BOT_NAME,
                        brainrots = brainrots,
                        cash = cashData,
                        rebirths = rebirthData,
                    })
                })
            end
        end
    end)
end

local function reportServerStatus(cache)
    pcall(function()
        if #cache == 0 then
            if ScannerWS.connected then
                ScannerWS:reportDead(game.JobId)
            end
        end
    end)
end

local ServerHopper = {}

function ServerHopper:fetchServers()
    local config = getgenv().SCANNER_CONFIG
    local httpRequest = (syn and syn.request) or (http and http.request) or http_request or request

    local success, res = pcall(function()
        return httpRequest({ 
            Url = config.SERVER_FETCH_URL .. "/get-batch?count=1", 
            Method = "GET",
            Headers = { ["Content-Type"] = "application/json" }
        })
    end)

    if success and res and res.StatusCode == 200 then
        local ok, data = pcall(function() return HttpService:JSONDecode(res.Body) end)
        if ok and data and data.servers then
            local converted = {}
            for _, s in ipairs(data.servers) do
                table.insert(converted, {id = s.job_id})
            end
            return {data = converted}
        end
    end
    return nil
end

function ServerHopper:hop()
    local config = getgenv().SCANNER_CONFIG
    
    while true do
        if ScannerWS.forceHopRequested then
            ScannerWS.forceHopRequested = false
        end
        
        local data = self:fetchServers()
        
        if data and data.data and #data.data > 0 then
            for _, server in ipairs(data.data) do
                if server.id and server.id ~= game.JobId then
                    pcall(function() ScannerWS:disconnect() end)
                    
                    pcall(function()
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    end)
                    
                    task.wait(0.1)
                end
            end
        end
        
        task.wait(3)
    end
end

local function waitForDebris()
    local DebrisFolder = Workspace:WaitForChild("Debris", 300)
    if not DebrisFolder then return false end
    local timeout = tick() + 300
    while tick() < timeout do
        if #DebrisFolder:GetChildren() > 0 then return true end
        task.wait(0.5)
    end
    return true
end

local function runScannerMode()
    botMode = "scanning"
    
    local scannerGui = Instance.new("ScreenGui")
    scannerGui.Name = "ScannerOverlay"
    scannerGui.ResetOnSpawn = false
    scannerGui.DisplayOrder = 999
    scannerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    scannerGui.IgnoreGuiInset = true
    pcall(function()
        local old = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("ScannerOverlay")
        if old then old:Destroy() end
    end)
    scannerGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    overlay.BackgroundTransparency = 0.15
    overlay.BorderSizePixel = 0
    overlay.Parent = scannerGui
    
    local topLabel = Instance.new("TextLabel")
    topLabel.Size = UDim2.new(1, 0, 0, 40)
    topLabel.Position = UDim2.new(0, 0, 0, 10)
    topLabel.BackgroundTransparency = 1
    topLabel.Text = "IN MAIN GAME"
    topLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    topLabel.TextSize = 24
    topLabel.Font = Enum.Font.GothamBold
    topLabel.TextStrokeTransparency = 0.3
    topLabel.Parent = overlay
    
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 0, 30)
    statusLabel.Position = UDim2.new(0, 0, 0, 50)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "SCANNING"
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    statusLabel.TextSize = 20
    statusLabel.Font = Enum.Font.GothamBold
    statusLabel.TextStrokeTransparency = 0.5
    statusLabel.Parent = overlay
    
    local timerLabel = Instance.new("TextLabel")
    timerLabel.Size = UDim2.new(1, 0, 1, 0)
    timerLabel.BackgroundTransparency = 1
    timerLabel.Text = "0"
    timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    timerLabel.TextSize = 120
    timerLabel.Font = Enum.Font.GothamBold
    timerLabel.TextStrokeTransparency = 0.3
    timerLabel.Parent = overlay
    
    local infoLabel = Instance.new("TextLabel")
    infoLabel.Size = UDim2.new(1, 0, 0, 30)
    infoLabel.Position = UDim2.new(0, 0, 1, -50)
    infoLabel.BackgroundTransparency = 1
    infoLabel.Text = "Items: 0 | WS: ..."
    infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    infoLabel.TextSize = 16
    infoLabel.Font = Enum.Font.GothamBold
    infoLabel.TextStrokeTransparency = 0.5
    infoLabel.Parent = overlay
    
    local scanStartTick = tick()
    local scannerOverlayAlive = true
    
    task.spawn(function()
        while scannerOverlayAlive do
            local elapsed = tick() - scanStartTick
            pcall(function()
                timerLabel.Text = tostring(math.floor(elapsed))
                infoLabel.Text = "Items: " .. #Scanner.cache .. " | Sent: " .. (function()
                    local c = 0
                    for _ in pairs(Scanner.sentItems) do c += 1 end
                    return c
                end)() .. " | WS: " .. (ScannerWS.connected and "Connected" or "Disconnected")
            end)
            task.wait(0.5)
        end
    end)
    
    local function destroyOverlay()
        scannerOverlayAlive = false
        pcall(function() scannerGui:Destroy() end)
    end
    
    pcall(function() statusLabel.Text = "WAITING FOR DEBRIS" end)
    if not waitForDebris() then destroyOverlay() return end
    
    local currentJobId = game.JobId
    local config = getgenv().SCANNER_CONFIG
    
    task.spawn(function()
        task.wait(config.FORCE_REJOIN_TIMEOUT)
        while true do
            pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, currentJobId, LocalPlayer) end)
            task.wait(1)
        end
    end)
    
    task.spawn(function()
        while true do
            if ScannerWS.forceHopRequested then
                ScannerWS.forceHopRequested = false
                pcall(function() statusLabel.Text = "FORCE HOP" end)
                task.wait(1)
                ServerHopper:hop()
                return
            end
            task.wait(0.5)
        end
    end)
    
    pcall(function() statusLabel.Text = "LOADING MODULES" end)
    if not loadModules() then return end
   
    pcall(function() statusLabel.Text = "INITIALIZING" end)
    Scanner:init()
    
    scanStartTick = tick()
    
    pcall(function() statusLabel.Text = "SCANNING" end)
    local reportedDead = false

    while true do
        if ScannerWS.forceHopRequested then
            break
        end

        Scanner:rescan()

        local newItems, currentKeys = getNewItems()

        if #newItems > 0 then
            sendToNotifierAPI(newItems)
            for key, fp in pairs(currentKeys) do
                Scanner.sentItems[key] = fp
            end
            reportedDead = false
        elseif #Scanner.cache == 0 and not reportedDead then
            reportServerStatus(Scanner.cache)
            reportedDead = true
        end

        if config.SAVE_RESULTS_LOCALLY and #Scanner.cache > 0 then
            pcall(function()
                writefile("Scan_" .. os.time() .. ".json", HttpService:JSONEncode(Scanner.cache))
            end)
        end

        task.wait(config.SCAN_INTERVAL)
    end

    destroyOverlay()
    ServerHopper:hop()
end

local function runRebirthMode()
    botMode = "rebirthing"
    pcall(function() setfpscap(7) end)

    local _rebirthDone = false
    local player = LocalPlayer
local Settings = {
	Get_Rebirths = 1,
	Auto_On      = true,
}

local Workspace         = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VIM               = game:GetService("VirtualInputManager")
local PathfindingService = game:GetService("PathfindingService")

local oldGui = player:WaitForChild("PlayerGui"):FindFirstChild("AutoRebirthUI")
if oldGui then oldGui:Destroy() end

local running        = false
local baseLockPending = false
local isLockingBase  = false
local walkAbort      = false
local loopId         = 0

local CFG = {
	REBIRTH_CASH    = math.huge,
	MAX_PODIUMS     = 10,
	PROMPT_RETRIES  = 3,
	SELL_BAILOUT    = 30,
	REBIRTH_RETRIES = 5,
	LOCK_COOLDOWN   = 60,
	LOCK_CONFIRM_TIME = 20,
	WALK_TIMEOUT    = 15,
}

local FLOOR_THRESHOLD = 10
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Name = "AutoRebirthUI"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 145)
frame.Position = UDim2.new(0, 30, 0, 30)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
frame.BackgroundTransparency = 0.25
frame.BorderSizePixel = 0
frame.Active = true; frame.Draggable = true
frame.Parent = gui
Instance.new("UIStroke", frame).Thickness = 1
frame:FindFirstChild("UIStroke").Color = Color3.fromRGB(80, 80, 80)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

local function mkLabel(text, y, color)
	local l = Instance.new("TextLabel")
	l.Size = UDim2.new(1, -20, 0, 14)
	l.Position = UDim2.new(0, 10, 0, y)
	l.BackgroundTransparency = 1
	l.Text = text
	l.TextColor3 = color or Color3.fromRGB(200, 200, 200)
	l.TextSize = 10; l.Font = Enum.Font.Code
	l.TextXAlignment = Enum.TextXAlignment.Left
	l.Parent = frame
	return l
end

local titleLbl = mkLabel("AUTO REBIRTH", 6, Color3.fromRGB(255, 255, 255))
titleLbl.Font = Enum.Font.GothamBold; titleLbl.TextSize = 13
local statusLbl = mkLabel("> loading", 24)
local cashLbl   = mkLabel("$ ---", 39, Color3.fromRGB(120, 255, 120))
local rbLbl     = mkLabel("R: ---", 54, Color3.fromRGB(255, 200, 100))
local petsLbl   = mkLabel("PETS: ---", 69, Color3.fromRGB(180, 180, 255))
local timerLbl  = mkLabel("BASE: scanning", 84, Color3.fromRGB(255, 200, 0))

local function mkBtn(text, y, col, scol)
	col  = col  or Color3.fromRGB(255, 255, 255)
	scol = scol or Color3.fromRGB(60, 60, 60)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, -20, 0, 24)
	b.Position = UDim2.new(0, 10, 0, y)
	b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	b.BackgroundTransparency = 0.3
	b.Text = text; b.TextColor3 = col; b.TextSize = 10
	b.Font = Enum.Font.GothamBold; b.Parent = frame
	local s = Instance.new("UIStroke", b)
	s.Thickness = 1; s.Color = scol; s.Transparency = 0.3
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
	b.MouseEnter:Connect(function() b.BackgroundTransparency = 0.15 end)
	b.MouseLeave:Connect(function() b.BackgroundTransparency = 0.3 end)
	return b
end

local toggleBtn  = mkBtn("START", 104)
mkLabel("v7.0", 132, Color3.fromRGB(60, 60, 60)).TextXAlignment = Enum.TextXAlignment.Center
local function setStatus(t) statusLbl.Text = "> " .. t end
local function isBase(x) return typeof(x) == "Instance" and x:IsA("BasePart") end
local function normalizeName(name)
	if not name then return "" end
	return tostring(name):gsub("^%s+", ""):gsub("%s+$", ""):lower()
end

local function parsePrice(txt)
	if not txt then return math.huge end
	local s = tostring(txt):upper():gsub("[%$,]", ""):gsub("/S", "")
	local n = tonumber((s:match("[%d%.]+"))) or 0
	if s:find("K") then n = n * 1e3 end
	if s:find("M") then n = n * 1e6 end
	if s:find("B") then n = n * 1e9 end
	return n
end

local function isValidPetName(txt)
	return txt and txt ~= "" and txt ~= "DisplayName" and txt ~= "Label" and #txt > 1
end

local function ensureChar(timeout)
	timeout = timeout or 10
	local c = player.Character
	if not c or not c.Parent then c = player.CharacterAdded:Wait() end
	local h = c:WaitForChild("Humanoid", timeout)
	if not h then return nil, nil, nil end
	local hrp = c:FindFirstChild("HumanoidRootPart") or c.PrimaryPart
	if not hrp then return nil, nil, nil end
	if h.Health <= 0 then
		c = player.CharacterAdded:Wait()
		h = c and c:WaitForChild("Humanoid", timeout)
		hrp = c and (c:FindFirstChild("HumanoidRootPart") or c.PrimaryPart)
		if not h or not hrp then return nil, nil, nil end
	end
	return c, h, hrp
end

local function spamJump(times)
	local _, hum = ensureChar(2)
	if not hum then return end
	for _ = 1, (times or 3) do
		pcall(function() hum.Jump = true end)
		task.wait(0.03)
	end
end

local function getCharY()
	local _, _, hrp = ensureChar(2)
	return hrp and hrp.Position.Y or 0
end

do
	local antiRagConns = {}

	local function cleanRagdoll(char)
		if not char then return end
		for _, d in ipairs(char:GetDescendants()) do
			if d:IsA("BallSocketConstraint") or d:IsA("NoCollisionConstraint")
				or d:IsA("HingeConstraint")
				or (d:IsA("Attachment") and (d.Name == "A" or d.Name == "B")) then
				d:Destroy()
			elseif d:IsA("BodyVelocity") or d:IsA("BodyPosition") or d:IsA("BodyGyro") then
				d:Destroy()
			end
		end
		for _, d in ipairs(char:GetDescendants()) do
			if d:IsA("Motor6D") then d.Enabled = true end
		end
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			local animator = hum:FindFirstChild("Animator")
			if animator then
				for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
					local n = track.Animation and track.Animation.Name:lower() or ""
					if n:find("rag") or n:find("fall") or n:find("hurt") or n:find("down") then
						track:Stop(0)
					end
				end
			end
		end
		pcall(function()
			local pm = player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
			require(pm):GetControls():Enable()
		end)
	end

	local function hookAntiRag(char)
		for _, c in ipairs(antiRagConns) do pcall(function() c:Disconnect() end) end
		antiRagConns = {}

		local hum = char:WaitForChild("Humanoid", 10)
		local hrp = char:WaitForChild("HumanoidRootPart", 10)
		if not hum or not hrp then return end

		local lastVel = Vector3.new(0, 0, 0)

		antiRagConns[#antiRagConns+1] = hum.StateChanged:Connect(function()
			local st = hum:GetState()
			if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll
				or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.GettingUp then
				hum:ChangeState(Enum.HumanoidStateType.Running)
				cleanRagdoll(char)
				pcall(function() Workspace.CurrentCamera.CameraSubject = hum end)
			end
		end)

		antiRagConns[#antiRagConns+1] = char.DescendantAdded:Connect(function()
			cleanRagdoll(char)
		end)

		pcall(function()
			antiRagConns[#antiRagConns+1] = ReplicatedStorage.Packages.Net["RE/CombatService/ApplyImpulse"].OnClientEvent:Connect(function()
				pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)
			end)
		end)

		antiRagConns[#antiRagConns+1] = game:GetService("RunService").Heartbeat:Connect(function()
			local vel = hrp.AssemblyLinearVelocity
			if (vel - lastVel).Magnitude > 40 and vel.Magnitude > 25 then
				hrp.AssemblyLinearVelocity = vel.Unit * math.min(vel.Magnitude, 15)
			end
			lastVel = vel
		end)

		cleanRagdoll(char)
	end

	local char = player.Character
	if char then task.spawn(function() hookAntiRag(char) end) end
	player.CharacterAdded:Connect(function(c) task.spawn(function() hookAntiRag(c) end) end)
end

local function flatDist(a, b)
	return math.sqrt((a.X - b.X)^2 + (a.Z - b.Z)^2)
end

local function computePath(startPos, endPos)
	local path = PathfindingService:CreatePath({
		AgentRadius   = 2,
		AgentHeight   = 5,
		AgentCanJump  = true,
		AgentCanClimb = false,
		WaypointSpacing = 4,
	})
	local ok = pcall(function() path:ComputeAsync(startPos, endPos) end)
	if ok and path.Status == Enum.PathStatus.Success then
		return path:GetWaypoints()
	end
	path = PathfindingService:CreatePath({
		AgentRadius   = 1,
		AgentHeight   = 5,
		AgentCanJump  = true,
		AgentCanClimb = false,
		WaypointSpacing = 3,
	})
	ok = pcall(function() path:ComputeAsync(startPos, endPos) end)
	if ok and path.Status == Enum.PathStatus.Success then
		return path:GetWaypoints()
	end
	return nil
end

local function filterWaypoints(wps, charY)
	if not wps then return nil end
	local maxY = charY + FLOOR_THRESHOLD
	local out = {}
	for i, wp in ipairs(wps) do
		if wp.Position.Y <= maxY then
			out[#out + 1] = wp
		end
	end
	return #out >= 2 and out or nil
end

local function resolvePos(target)
	if typeof(target) == "Vector3" then return target end
	if not target or not target.Parent then return nil end
	if target:IsA("ProximityPrompt") then
		local p = target.Parent
		if p and p:IsA("Attachment") then return p.WorldPosition end
		if p and isBase(p) then return p.Position end
	elseif isBase(target) then
		return target.Position
	elseif target:IsA("Model") then
		local pri = target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
		if pri then return pri.Position end
	end
	return nil
end

local function walkTo(target, reach, timeout, ignoreLock)
	reach   = reach or 4
	timeout = timeout or CFG.WALK_TIMEOUT
	walkAbort = false
	local char, hum, hrp = ensureChar(5)
	if not hum or not hrp then return false end
	local goal = resolvePos(target)
	if not goal then return false end
	local charY = hrp.Position.Y
	if goal.Y - charY > FLOOR_THRESHOLD then return false end
	if flatDist(hrp.Position, goal) <= reach then return true end
	local t0 = tick()
	local myCharY = charY
	local waypoints = filterWaypoints(computePath(hrp.Position, goal), myCharY)
	local wpIndex = 2
	local needsRecompute = false
	local conn

	local function advanceWaypoint()
		if walkAbort then return end
		if waypoints and wpIndex < #waypoints then
			wpIndex += 1
			local wp = waypoints[wpIndex]
			if wp.Position.Y > myCharY + FLOOR_THRESHOLD then
				advanceWaypoint()
				return
			end
			if wp.Action == Enum.PathWaypointAction.Jump then
				pcall(function() hum.Jump = true end)
			end
			pcall(function() hum:MoveTo(wp.Position) end)
		else
			needsRecompute = true
		end
	end

	conn = hum.MoveToFinished:Connect(function()
		advanceWaypoint()
	end)

	if waypoints and #waypoints >= 2 then
		if waypoints[2].Action == Enum.PathWaypointAction.Jump then
			pcall(function() hum.Jump = true end)
		end
		pcall(function() hum:MoveTo(waypoints[2].Position) end)
	else
		pcall(function() hum:MoveTo(goal) end)
		waypoints = nil
	end

	local lastPos = hrp.Position
	local lastStuckCheck = tick()
	local stuckCount = 0

	while tick() - t0 < timeout do
		if walkAbort then
			pcall(function() conn:Disconnect() end)
			return false
		end
		if not ignoreLock then
			if not running then pcall(function() conn:Disconnect() end); return false end
			if baseLockPending then pcall(function() conn:Disconnect() end); return false end
		end
		if not hrp or not hrp.Parent or not hum or hum.Health <= 0 then
			pcall(function() conn:Disconnect() end)
			char, hum, hrp = ensureChar(5)
			if not hum or not hrp then return false end
			conn = hum.MoveToFinished:Connect(function() advanceWaypoint() end)
			goal = resolvePos(target) or goal
			waypoints = filterWaypoints(computePath(hrp.Position, goal), myCharY)
			wpIndex = 2; needsRecompute = false
			lastPos = hrp.Position; lastStuckCheck = tick(); stuckCount = 0
			if waypoints and #waypoints >= 2 then
				pcall(function() hum:MoveTo(waypoints[2].Position) end)
			else
				pcall(function() hum:MoveTo(goal) end)
			end
		end
		local newRaw = resolvePos(target)
		if newRaw then goal = newRaw end
		if not goal then pcall(function() conn:Disconnect() end); return false end
		local d = flatDist(hrp.Position, goal)
		if d <= reach then
			pcall(function() conn:Disconnect() end)
			return true
		end
		if needsRecompute then
			needsRecompute = false
			local newWp = filterWaypoints(computePath(hrp.Position, goal), myCharY)
			if newWp and #newWp >= 2 then
				waypoints = newWp; wpIndex = 2
				pcall(function() hum:MoveTo(newWp[2].Position) end)
			else
				waypoints = nil
				pcall(function() hum:MoveTo(goal) end)
			end
		end
		if tick() - lastStuckCheck >= 1.5 then
			local moved = (hrp.Position - lastPos).Magnitude
			if moved < 1.5 then
				stuckCount += 1
				if stuckCount >= 4 then
					pcall(function() conn:Disconnect() end)
					pcall(function() hum.Health = 0 end)
					task.wait(0.3)
					char, hum, hrp = ensureChar(8)
					if not hum or not hrp then return false end
					conn = hum.MoveToFinished:Connect(function() advanceWaypoint() end)
					waypoints = filterWaypoints(computePath(hrp.Position, goal), myCharY)
					wpIndex = 2; needsRecompute = false; stuckCount = 0
					if waypoints and #waypoints >= 2 then
						pcall(function() hum:MoveTo(waypoints[2].Position) end)
					else
						pcall(function() hum:MoveTo(goal) end)
					end
				elseif stuckCount >= 2 then
					pcall(function()
						local dir = (goal - hrp.Position)
						if dir.Magnitude > 0 then
							local perp = Vector3.new(-dir.Z, 0, dir.X).Unit
							local side = (stuckCount % 2 == 0) and 1 or -1
							hum:MoveTo(hrp.Position + perp * side * 8)
						end
					end)
					task.wait(0.3)
					local newWp = filterWaypoints(computePath(hrp.Position, goal), myCharY)
					if newWp and #newWp >= 2 then
						waypoints = newWp; wpIndex = 2; needsRecompute = false
						pcall(function() hum:MoveTo(newWp[2].Position) end)
					else
						pcall(function() hum:MoveTo(goal) end)
					end
				else
					pcall(function() hum.Jump = true end)
				end
			else
				stuckCount = 0
			end
			lastPos = hrp.Position
			lastStuckCheck = tick()
		end
		task.wait(0.15)
	end
	pcall(function() conn:Disconnect() end)
	local d = flatDist(hrp.Position, goal)
	return d <= reach + 2
end

local function chaseTo(target, reach, timeout)
	reach   = reach or 6
	timeout = timeout or 12
	walkAbort = false
	local char, hum, hrp = ensureChar(3)
	if not hum or not hrp then return false end
	local goal = resolvePos(target)
	if not goal then return false end
	if flatDist(hrp.Position, goal) <= reach then return true end
	local t0 = tick()
	local lastPathTime = 0
	local waypoints = nil
	local wpIndex = 2
	local DIRECT_DIST = 18
	local REPATH_INTERVAL = 1.0
	local needsRecompute = false
	local conn
	conn = hum.MoveToFinished:Connect(function()
		if waypoints and wpIndex < #waypoints then
			wpIndex += 1
			pcall(function() hum:MoveTo(waypoints[wpIndex].Position) end)
		else
			needsRecompute = true
		end
	end)
	while tick() - t0 < timeout do
		if walkAbort or not running or baseLockPending then
			pcall(function() conn:Disconnect() end)
			return false
		end
		if not hrp or not hrp.Parent or not hum or hum.Health <= 0 then
			char, hum, hrp = ensureChar(3)
			if not hum or not hrp then
				pcall(function() conn:Disconnect() end)
				return false
			end
			conn = hum.MoveToFinished:Connect(function()
				if waypoints and wpIndex < #waypoints then
					wpIndex += 1
					pcall(function() hum:MoveTo(waypoints[wpIndex].Position) end)
				else
					needsRecompute = true
				end
			end)
		end
		goal = resolvePos(target)
		if not goal then pcall(function() conn:Disconnect() end); return false end
		local d = flatDist(hrp.Position, goal)
		if d <= reach then
			pcall(function() conn:Disconnect() end)
			return true
		end
		if d <= DIRECT_DIST then
			pcall(function() hum:MoveTo(goal) end)
		elseif tick() - lastPathTime >= REPATH_INTERVAL or needsRecompute then
			needsRecompute = false
			lastPathTime = tick()
			local charY = hrp.Position.Y
			local newWp = filterWaypoints(computePath(hrp.Position, goal), charY)
			if newWp and #newWp >= 2 then
				waypoints = newWp
				wpIndex = 2
				pcall(function() hum:MoveTo(newWp[2].Position) end)
			else
				pcall(function() hum:MoveTo(goal) end)
			end
		end
		task.wait(0.12)
	end
	pcall(function() conn:Disconnect() end)
	return flatDist(hrp.Position, goal) <= reach + 2
end

local function stopMovement()
	pcall(function()
		local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if hum and hrp then hum:MoveTo(hrp.Position) end
	end)
end

local function needsMoreRoom()
	local pg = player:FindFirstChild("PlayerGui")
	if not pg then return false end
	for _, d in ipairs(pg:GetDescendants()) do
		if d:IsA("TextLabel") then
			local t = (d.Text or ""):lower()
			if t:find("need more room") or t:find("no room") or t:find("not enough room") then
				return true
			end
		end
	end
	return false
end

local function clickGuiButton(btn)
	pcall(function() firesignal(btn.MouseButton1Click) end)
	pcall(function() fireclick(btn) end)
	pcall(function() fireclickevent(btn) end)
	pcall(function() btn.MouseButton1Click:Fire() end)
	pcall(function() firesignal(btn.Activated) end)
	pcall(function() btn.Activated:Fire() end)
	pcall(function()
		local VIM = game:GetService("VirtualInputManager")
		local p = btn.AbsolutePosition + btn.AbsoluteSize / 2
		VIM:SendMouseButtonEvent(p.X, p.Y, 0, true, game, 1)
		task.wait(0.05)
		VIM:SendMouseButtonEvent(p.X, p.Y, 0, false, game, 1)
	end)
	pcall(function()
		local VIM = game:GetService("VirtualInputManager")
		local p = btn.AbsolutePosition + btn.AbsoluteSize / 2
		VIM:SendMouseButtonEvent(p.X, p.Y, 0, true, game, 0)
		task.wait(0.05)
		VIM:SendMouseButtonEvent(p.X, p.Y, 0, false, game, 0)
	end)
end

local function confirmSellDialog(timeout)
	timeout = timeout or 5
	local t0 = tick()
	while tick() - t0 < timeout do
		local pg = player:FindFirstChild("PlayerGui")
		if not pg then task.wait(0.05); continue end
		local yesBtn = nil
		pcall(function()
			local cf = pg:FindFirstChild("Confirmation")
			if cf then
				local inner = cf:FindFirstChild("Confirmation")
				if inner then yesBtn = inner:FindFirstChild("Yes") end
			end
		end)
		if yesBtn and yesBtn:IsA("ImageButton") then
			for _ = 1, 5 do clickGuiButton(yesBtn); task.wait(0.05) end
			return true
		end
		for _, btn in ipairs(pg:GetDescendants()) do
			if (btn:IsA("TextButton") or btn:IsA("ImageButton")) and btn.Name == "Yes" then
				local par = btn.Parent
				if par and (par.Name == "Confirmation" or (par.Parent and par.Parent.Name == "Confirmation")) then
					if btn.Visible and btn.AbsoluteSize.X > 10 then
						for _ = 1, 5 do clickGuiButton(btn); task.wait(0.05) end
						return true
					end
				end
			end
		end
		task.wait(0.05)
	end
	return false
end

local function firePrompt(prompt, tries, key, hold)
	if not prompt or not prompt.Parent then return false end
	tries = tries or CFG.PROMPT_RETRIES
	key = key or Enum.KeyCode.E
	for i = 1, tries do
		pcall(function()
			prompt.RequiresLineOfSight = false
			prompt.MaxActivationDistance = math.max(prompt.MaxActivationDistance or 8, 30)
		end)
		local ok = pcall(function() fireproximityprompt(prompt) end)
		if ok then task.wait(0.15); return true end
		local holdTime = hold or tonumber(prompt.HoldDuration) or 0
		if holdTime < 0.2 then holdTime = 0.2 end
		pcall(function() VIM:SendKeyEvent(true, key, false, game) end)
		task.wait(holdTime)
		pcall(function() VIM:SendKeyEvent(false, key, false, game) end)
		task.wait(0.1)
	end
	return true
end

local function waitForChild(parent, ...)
	local cur = parent
	for _, name in ipairs({...}) do
		cur = cur:WaitForChild(name, 15)
		if not cur then return nil end
	end
	return cur
end

local leaderstats   = waitForChild(player, "leaderstats")
local cashValue     = nil
local rebirthsValue = nil
if leaderstats then
	cashValue = leaderstats:FindFirstChild("Cash")
		or leaderstats:FindFirstChild("Coins")
		or leaderstats:FindFirstChild("Money")
		or leaderstats:FindFirstChild("$")
		or leaderstats:FindFirstChild("Gold")
		or leaderstats:FindFirstChild("Currency")
	if not cashValue then
		for _, child in ipairs(leaderstats:GetChildren()) do
			if (child:IsA("IntValue") or child:IsA("NumberValue")) and child.Name ~= "Rebirths" then
				cashValue = child
				break
			end
		end
	end
	rebirthsValue = leaderstats:FindFirstChild("Rebirths")
end
local plots         = waitForChild(Workspace, "Plots")

local function getCash()
	if not cashValue then return 0 end
	local ok, v = pcall(function() return cashValue.Value end)
	if not ok then return 0 end
	if type(v) == "number" then return v end
	return parsePrice(tostring(v))
end

local function checkRebirthTarget()
	if Settings.Get_Rebirths <= 0 then return false end
	local current = rebirthsValue and rebirthsValue.Value or 0
	if type(current) == "string" then current = tonumber(parsePrice(current)) or 0 end
	return current >= Settings.Get_Rebirths
end

if checkRebirthTarget() then
	running = false
	_rebirthDone = true
	return
end

local function findMyPlot()
	if not plots then plots = Workspace:FindFirstChild("Plots") end
	if not plots then return nil end
	local target = player.Name .. "'s Base"
	for _, plot in ipairs(plots:GetChildren()) do
		local ok, text = pcall(function()
			return plot.PlotSign.SurfaceGui.Frame.TextLabel.Text
		end)
		if ok and text == target then return plot end
	end
	return nil
end

local function ensureMyPlot()
	local p = findMyPlot()
	local tries = 0
	while not p and tries < 60 do
		task.wait(1); p = findMyPlot(); tries += 1
	end
	return p
end

local function getTemplateInfo(part)
	local dn, gen, pr, rar
	for _, d in ipairs(part:GetDescendants()) do
		if d:IsA("TextLabel") then
			local n = d.Name
			if     n == "DisplayName" then dn  = d
			elseif n == "Generation"  then gen = d
			elseif n == "Price"       then pr  = d
			elseif n == "Rarity"      then rar = d end
		end
	end
	if not dn or not pr then return nil end
	return {
		name      = normalizeName(dn.Text),
		price     = tonumber(parsePrice(pr.Text)) or 0,
		priceText = pr.Text,
		genText   = gen and gen.Text or "?",
		rarity    = rar and rar.Text or "?",
		part      = part,
		position  = part.Position,
	}
end

local _animalCache = {}
local _animalCacheTime = 0

local function getAnimals(forceRefresh)
	if not forceRefresh and tick() - _animalCacheTime < 1.5 and #_animalCache > 0 then
		return _animalCache
	end
	local list = {}
	local prompts = {}
	for _, obj in ipairs(Workspace:GetChildren()) do
		if obj:IsA("Model") then
			for _, d in ipairs(obj:GetDescendants()) do
				if d:IsA("ProximityPrompt") then
					local act = (d.ActionText or ""):lower()
					if act:find("purchase") or act:find("buy") or act:find("kauf") then
						local pos, par = nil, d.Parent
						if par and par:IsA("Attachment") then pos = par.WorldPosition
						elseif par and isBase(par) then pos = par.Position end
						if pos then prompts[#prompts+1] = {prompt = d, pos = pos} end
					end
				end
			end
		end
	end
	local function nearest(tpos)
		local best, bd = nil, 20
		for _, e in ipairs(prompts) do
			local d = (e.pos - tpos).Magnitude
			if d < bd then best = e.prompt; bd = d end
		end
		return best
	end
	local debris = Workspace:FindFirstChild("Debris")
	local source = debris and debris:GetChildren() or Workspace:GetDescendants()
	for _, child in ipairs(source) do
		if child.Name == "FastOverheadTemplate" and child:IsA("BasePart") then
			local info = getTemplateInfo(child)
			if info and (tonumber(info.price) or math.huge) < math.huge then
				local prompt = nearest(info.position)
				if prompt then
					info.prompt = prompt
					list[#list+1] = info
				end
			end
		end
	end
	_animalCache = list
	_animalCacheTime = tick()
	return list
end

local function bestAffordable()
	local best, bp = nil, -1
	local cash = getCash()
	local charY = getCharY()
	for _, e in ipairs(getAnimals()) do
		local ep = tonumber(e.price) or 0
		if ep > 0 and ep <= cash and ep > bp then
			local animalY = e.position and e.position.Y or charY
			if math.abs(animalY - charY) <= FLOOR_THRESHOLD then
				best = e; bp = ep
			end
		end
	end
	return best
end

local function podiumPetName(pod)
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			local a = (d.ActionText or ""):lower()
			if a:find("grab") or a:find("pick") or d.KeyboardKeyCode == Enum.KeyCode.E then
				local obj = d.ObjectText or ""
				if isValidPetName(obj) then return normalizeName(obj) end
			end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			local a = (d.ActionText or ""):lower()
			if a:find("sell") or d.KeyboardKeyCode == Enum.KeyCode.F then
				local obj = d.ObjectText or ""
				if isValidPetName(obj) and not obj:find("%$") then return normalizeName(obj) end
			end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("TextLabel") and d.Name == "DisplayName" and isValidPetName(d.Text) then
			return normalizeName(d.Text)
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("TextLabel") then
			local n = d.Name:lower()
			if (n == "charactername" or n == "petname" or n == "name" or n == "nametag")
				and isValidPetName(d.Text) then
				return normalizeName(d.Text)
			end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("BillboardGui") then
			for _, c in ipairs(d:GetDescendants()) do
				if c:IsA("TextLabel") and isValidPetName(c.Text) then
					local t = c.Text
					if not t:find("%$") and not t:find("/s") and not t:match("^%d+$")
						and not t:match("^%d+s$") and not t:match("^%d+:%d+")
						and not t:find("Lock") and not t:find("Collect") then
						return normalizeName(t)
					end
				end
			end
		end
	end
	for _, d in ipairs(pod:GetChildren()) do
		if d:IsA("Model") and isValidPetName(d.Name) then
			local n = d.Name:lower()
			if n ~= "base" and n ~= "spawn" and n ~= "claim" and n ~= "hitbox"
				and n ~= "overhead" and n ~= "animalpodium" and n ~= "podium"
				and not n:find("template") and not n:find("prompt") then
				return normalizeName(d.Name)
			end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("Model") and d:FindFirstChildOfClass("Humanoid") then
			if isValidPetName(d.Name) then
				local n = d.Name:lower()
				if n ~= "base" and n ~= "spawn" then return normalizeName(d.Name) end
			end
		end
	end
	return nil
end

local function podiumHasPet(pod)
	for _, d in ipairs(pod:GetChildren()) do
		if d:IsA("Model") then
			local n = d.Name:lower()
			if n ~= "base" and n ~= "spawn" and n ~= "claim"
				and n ~= "overhead" and not n:find("template") then
				return true
			end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("Humanoid") and d.Parent and d.Parent ~= pod then return true end
	end
	return false
end

local function podiumPrice(pod)
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			local a = d.ActionText or ""
			if a:lower():find("sell") and a:find("%$") then
				local val = tonumber(parsePrice(a)) or 0
				if val > 0 and val < math.huge then return val end
			end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d.Name == "AnimalOverhead" or d.Name == "FastOverheadTemplate" then
			local p = d:FindFirstChild("Price")
			if p and p:IsA("TextLabel") then return tonumber(parsePrice(p.Text)) or 0 end
			local g = d:FindFirstChild("GUI")
			if g then
				local pg = g:FindFirstChild("Price")
				if pg and pg:IsA("TextLabel") then return tonumber(parsePrice(pg.Text)) or 0 end
			end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d.Name == "Price" and d:IsA("TextLabel") then return tonumber(parsePrice(d.Text)) or 0 end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("TextLabel") then
			local t = d.Text or ""
			if t:find("%$") and not t:find("/s") and not t:find("/sec") then
				local val = tonumber(parsePrice(t)) or 0
				if val > 0 and val < math.huge then return val end
			end
		end
	end
	return math.huge
end

local function podiumSellPrompt(pod)
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			local a = (d.ActionText or ""):lower()
			if a:find("sell") then return d end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			local o = (d.ObjectText or ""):lower()
			if o:find("sell") then return d end
		end
	end
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			if d.KeyboardKeyCode == Enum.KeyCode.F then return d end
		end
	end
	local sp = pod:FindFirstChild("Base")
	sp = sp and sp:FindFirstChild("Spawn")
	sp = sp and sp:FindFirstChild("PromptAttachment")
	if sp then
		for _, p in ipairs(sp:GetChildren()) do
			if p:IsA("ProximityPrompt") then
				local a = (p.ActionText or ""):lower()
				if a:find("sell") or p.KeyboardKeyCode == Enum.KeyCode.F then return p end
			end
		end
	end
	return nil
end

local function podiumIncome(pod)
	for _, d in ipairs(pod:GetDescendants()) do
		if d:IsA("TextLabel") then
			local t = (d.Text or "")
			local num = t:match("%$([%d%.%,]+%s*[kKmMbB]?)%s*/")
			if num then return tonumber(parsePrice(num)) or 0 end
		end
	end
	return 0
end

local function countOwned(plot)
	local pods = plot and plot:FindFirstChild("AnimalPodiums")
	if not pods then return 0 end
	local c = 0
	for _, pod in ipairs(pods:GetChildren()) do
		if podiumPetName(pod) or podiumHasPet(pod) then
			c += 1
		else
			local sp = podiumSellPrompt(pod)
			if sp and sp.Enabled then c += 1 end
		end
	end
	return c
end

local function getOwnedNames(plot)
	local names = {}
	local pods = plot and plot:FindFirstChild("AnimalPodiums")
	if not pods then return names end
	local unk = 0
	for _, pod in ipairs(pods:GetChildren()) do
		local name = podiumPetName(pod)
		if name then
			names[#names+1] = name
		elseif podiumHasPet(pod) then
			unk += 1
			names[#names+1] = "unknown_" .. unk
		else
			local sp = podiumSellPrompt(pod)
			if sp and sp.Enabled then
				unk += 1
				names[#names+1] = "unknown_" .. unk
			end
		end
	end
	return names
end

local function collectCoins(plot)
	spamJump(3)
	task.wait(0.1)
	local pods = plot and plot:FindFirstChild("AnimalPodiums")
	if not pods then return end
	for _, pod in ipairs(pods:GetChildren()) do
		if not running or baseLockPending then return end
		local hit
		local claim = pod:FindFirstChild("Claim")
		hit = claim and claim:FindFirstChild("Hitbox")
		if not hit then
			for _, d in ipairs(pod:GetDescendants()) do
				if d.Name == "Hitbox" and isBase(d) then hit = d; break end
			end
		end
		if isBase(hit) then walkTo(hit, 5, 6) end
	end
end

local getRequiredPetNames

local function findReqContainer()
	local pg = player:FindFirstChild("PlayerGui")
	if not pg then return nil end
	local rg = pg:FindFirstChild("Rebirth")
	local rf = rg and rg:FindFirstChild("Rebirth")
	local co = rf and rf:FindFirstChild("Content")
	local ho = co and co:FindFirstChild("Holder")
	local hi = ho and ho:FindFirstChild("HolderImage")
	local rc = hi and hi:FindFirstChild("RequiredCharacters")
	if not rc and rf then rc = rf:FindFirstChild("RequiredCharacters", true) end
	return rc
end

local function entryHasCheck(entry)
	for _, d in ipairs(entry:GetDescendants()) do
		if d:IsA("ImageLabel") and d.Name == "CheckImage" then
			if d.Visible == true and (d.Image or "") ~= "" then return true end
		end
	end
	for _, d in ipairs(entry:GetDescendants()) do
		if d:IsA("ImageLabel") and d.Visible == true then
			local img = (d.Image or ""):lower()
			if img:find("check") or img:find("tick") or img:find("complete") then return true end
		end
	end
	return false
end

getRequiredPetNames = function()
	local names = {}
	local rc = findReqContainer()
	if not rc then return names end
	for _, child in ipairs(rc:GetChildren()) do
		if child.Name ~= "Template" and child.Name ~= "UIListLayout" then
			local nl = child:FindFirstChild("CharacterName")
			if nl and nl:IsA("TextLabel") then
				local txt = nl.Text or ""
				if txt ~= "" and txt ~= "Item" then names[#names+1] = normalizeName(txt) end
			end
		end
	end
	return names
end

local function getNeededPets()
	local needed = {}
	local rc = findReqContainer()
	if not rc then return needed end
	for _, child in ipairs(rc:GetChildren()) do
		if child.Name ~= "Template" and child.Name ~= "UIListLayout" then
			local nl = child:FindFirstChild("CharacterName")
			if nl and nl:IsA("TextLabel") then
				local txt = nl.Text or ""
				if txt ~= "" and txt ~= "Item" then
					if not entryHasCheck(child) then needed[#needed+1] = normalizeName(txt) end
				end
			end
		end
	end
	return needed
end

local function getRebirthCost()
	local pg = player:FindFirstChild("PlayerGui")
	if not pg then return CFG.REBIRTH_CASH end
	local rg = pg:FindFirstChild("Rebirth")
	if not rg then return CFG.REBIRTH_CASH end
	for _, d in ipairs(rg:GetDescendants()) do
		if d:IsA("TextLabel") then
			local t = d.Text or ""
			local _, req = t:match("[%$%s]*([%d%.%,]+%s*[KMBkmb]?)%s*/[%$%s]*([%d%.%,]+%s*[KMBkmb]?)")
			if req then
				local cost = tonumber(parsePrice(req)) or 0
				if cost > 0 then return cost end
			end
		end
	end
	return CFG.REBIRTH_CASH
end

local function isRebirthReady()
	local cost = tonumber(getRebirthCost()) or math.huge
	local currentCash = getCash()
	if currentCash < cost then return false end
	local rc = findReqContainer()
	if not rc then return false end
	local total, checked = 0, 0
	for _, child in ipairs(rc:GetChildren()) do
		if child.Name ~= "Template" and child.Name ~= "UIListLayout" then
			local nl = child:FindFirstChild("CharacterName")
			if nl and nl:IsA("TextLabel") then
				local txt = nl.Text or ""
				if txt ~= "" and txt ~= "Item" then
					total += 1
					if entryHasCheck(child) then checked += 1 end
				end
			end
		end
	end
	if total > 0 and checked >= total then return true end
	local pg = player:FindFirstChild("PlayerGui")
	if pg then
		local rg = pg:FindFirstChild("Rebirth")
		if rg then
			for _, d in ipairs(rg:GetDescendants()) do
				if d:IsA("TextButton") then
					local t = (d.Text or ""):lower()
					if t:find("rebirth") and d.Active and d.Visible then return true end
				end
			end
		end
	end
	return false
end

local function hasRequired(plot)
	if isRebirthReady() then return true end
	local req = getRequiredPetNames()
	if #req == 0 then return false end
	local need = {}
	for _, n in ipairs(req) do need[n] = (need[n] or 0) + 1 end
	for _, n in ipairs(getOwnedNames(plot)) do
		if need[n] and need[n] > 0 then need[n] -= 1 end
	end
	for _, c in pairs(need) do if c > 0 then return false end end
	return true
end

local function sellCheapest(plot, extraProtect)
	local pods = plot and plot:FindFirstChild("AnimalPodiums")
	local protect = {}
	for _, name in ipairs(getRequiredPetNames()) do
		protect[name] = (protect[name] or 0) + 1
	end
	if extraProtect then
		for name, count in pairs(extraProtect) do
			local norm = normalizeName(name)
			protect[norm] = math.max(protect[norm] or 0, count)
		end
	end
	local entries = {}
	local skipped = 0
	local unknownIdx = 0
	for _, pod in ipairs(pods:GetChildren()) do
		local prompt = podiumSellPrompt(pod)
		if not prompt or not prompt.Enabled then
			skipped += 1
		else
			local name   = podiumPetName(pod)
			local pr     = podiumPrice(pod)
			local income = podiumIncome(pod)
			if not name then
				local podPos = nil
				local base = pod:FindFirstChild("Base")
				if base then
					local bp = base:FindFirstChildWhichIsA("BasePart")
					if bp then podPos = bp.Position end
				end
				if podPos then
					for _, obj in ipairs(workspace:GetChildren()) do
						if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
							local root = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart
								or obj:FindFirstChildWhichIsA("BasePart")
							if root then
								local dist = (root.Position - podPos).Magnitude
								if dist < 10 and isValidPetName(obj.Name) then
									name = normalizeName(obj.Name)
									for _, d in ipairs(obj:GetDescendants()) do
										if d:IsA("TextLabel") then
											local t = d.Text or ""
											if t:find("%$") and t:find("/s") and income == 0 then
												local num = t:match("%$([%d%.%,]+%s*[kKmMbB]?)%s*/")
												if num then income = tonumber(parsePrice(num)) or 0 end
											elseif t:find("%$") and not t:find("/") and pr == math.huge then
												pr = tonumber(parsePrice(t)) or math.huge
											end
										end
									end
									break
								end
							end
						end
					end
				end
			end
			if not name then unknownIdx += 1; name = "unknown_" .. unknownIdx end
			entries[#entries+1] = { price = pr, income = income, prompt = prompt, name = name }
		end
	end
	if #entries == 0 then
		skipped = 0; unknownIdx = 0
		for _, pod in ipairs(pods:GetChildren()) do
			local prompt = podiumSellPrompt(pod)
			if not prompt then skipped += 1
			else
				local name = podiumPetName(pod)
				local pr = podiumPrice(pod)
				local income = podiumIncome(pod)
				if not name then
					local podPos = nil
					local base = pod:FindFirstChild("Base")
					if base then local bp = base:FindFirstChildWhichIsA("BasePart"); if bp then podPos = bp.Position end end
					if podPos then
						for _, obj in ipairs(workspace:GetChildren()) do
							if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
								local root = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
								if root then
									local dist = (root.Position - podPos).Magnitude
									if dist < 10 and isValidPetName(obj.Name) then name = normalizeName(obj.Name); break end
								end
							end
						end
					end
				end
				if not name then unknownIdx += 1; name = "unknown_" .. unknownIdx end
				entries[#entries+1] = { price = pr, income = income, prompt = prompt, name = name }
			end
		end
	end
	if #entries == 0 then return end
	table.sort(entries, function(a, b)
		local ai, bi = tonumber(a.income) or 0, tonumber(b.income) or 0
		local ap, bp = tonumber(a.price) or 0, tonumber(b.price) or 0
		if ai ~= bi then return ai < bi end
		return ap < bp
	end)
	local remain = {}
	for k, v in pairs(protect) do remain[k] = v end
	for i = #entries, 1, -1 do
		local e = entries[i]
		if remain[e.name] and remain[e.name] > 0 then
			e.protected = true
			remain[e.name] -= 1
		end
	end
	for _, e in ipairs(entries) do
		if not running or baseLockPending then return end
		if not e.protected then
			setStatus("SELLING: " .. e.name:sub(1, 14))
			if walkTo(e.prompt, 5, 10) then
				task.wait(0.1)
				firePrompt(e.prompt, 2, Enum.KeyCode.F, 3.5)
				task.wait(0.1)
				confirmSellDialog(5)
				task.wait(0.1)
			end
			return
		end
	end
end

local function doRebirth()
	local netFolder = ReplicatedStorage:FindFirstChild("Packages")
	netFolder = netFolder and netFolder:FindFirstChild("Net")
	if not netFolder then return end
	local labelIndex = nil
	local children = netFolder:GetChildren()
	for i, child in ipairs(children) do
		if child.Name == "RF/Rebirth/RequestRebirth" then labelIndex = i; break end
	end
	if not labelIndex then return end
	for _, offset in ipairs({1, -1, 2}) do
		local idx = labelIndex + offset
		if idx >= 1 and idx <= #children then
			local candidate = children[idx]
			if candidate and candidate:IsA("RemoteFunction") and candidate.Name ~= "RF/Rebirth/RequestRebirth" then
				pcall(function() candidate:InvokeServer() end)
				return
			end
		end
	end
	local node = netFolder:FindFirstChild("RF/Rebirth/RequestRebirth")
	if node and node.InvokeServer then pcall(function() node:InvokeServer() end) end
end

local myTimers = {}
local lockCooldowns = {}

local function scanMyPlotTimers(myPlot)
	if not myPlot then return end
	local function reg(bb)
		if not bb or not bb.Parent or myTimers[bb] then return end
		local mp = bb.Parent
		if not mp or not mp:IsA("BasePart") then return end
		local rt = bb:FindFirstChild("RemainingTime", true)
		if not rt then return end
		myTimers[bb] = { sourceLabel = rt, mainPart = mp }
	end
	local purchases = myPlot:FindFirstChild("Purchases")
	if purchases then
		for _, pu in ipairs(purchases:GetChildren()) do
			local pb = pu:FindFirstChild("PlotBlock")
			if pb then
				local main = pb:FindFirstChild("Main")
				if main and main:IsA("BasePart") then
					for _, c in ipairs(main:GetChildren()) do
						if c:IsA("BillboardGui") then reg(c) end
					end
				end
			end
			for _, c in ipairs(pu:GetDescendants()) do
				if c:IsA("BillboardGui") then reg(c) end
			end
		end
	end
	local floor = myPlot:FindFirstChild("Floor")
	if floor then
		for _, c in ipairs(floor:GetDescendants()) do
			if c:IsA("BillboardGui") then reg(c) end
		end
	end
end

local function isTimerUnlocked(data)
	if not data or not data.sourceLabel then return false end
	local ok, t = pcall(function() return (data.sourceLabel.Text or ""):gsub("%s+", "") end)
	return ok and (t == "" or t == "0" or t == "0s")
end

local function isAlreadyLocked()
	local pg = player:FindFirstChild("PlayerGui")
	if not pg then return false end
	for _, d in ipairs(pg:GetDescendants()) do
		if d:IsA("TextLabel") then
			local t = (d.Text or ""):lower()
			if t:find("already locked") then return true end
		end
	end
	return false
end

task.spawn(function()
	task.wait(2)
	while true do
		task.wait(2)
		local ok, err = pcall(function()
			if not running then return end
			if isLockingBase then return end
			local myPlot = findMyPlot()
			if not myPlot then return end
			scanMyPlotTimers(myPlot)
			local total, unlockCount = 0, 0
			local tolock = {}
			local charY = getCharY()
			for gui, data in pairs(myTimers) do
				if not gui or not gui.Parent then
					myTimers[gui] = nil
				else
					total += 1
					if isTimerUnlocked(data) then
						local bp = data.mainPart
						if bp and bp.Parent and math.abs(bp.Position.Y - charY) <= FLOOR_THRESHOLD then
							if lockCooldowns[gui] and tick() - lockCooldowns[gui] < CFG.LOCK_COOLDOWN then
							else
								unlockCount += 1
								tolock[#tolock+1] = {gui = gui, data = data}
							end
						end
					end
				end
			end
			local totalUnlocked = 0
			for _, data in pairs(myTimers) do
				if isTimerUnlocked(data) then totalUnlocked += 1 end
			end
			if totalUnlocked > 0 then
				timerLbl.Text = string.format("BASE: %d UNLOCKED", totalUnlocked)
				timerLbl.TextColor3 = Color3.fromRGB(255, 80, 80)
			else
				timerLbl.Text = string.format("BASE: %d locked", total)
				timerLbl.TextColor3 = Color3.fromRGB(100, 255, 100)
			end
			if #tolock > 0 and running then
				baseLockPending = true
				task.wait(0.2)
				isLockingBase = true
				local savedStatus = statusLbl.Text
				for _, entry in ipairs(tolock) do
					if not running then break end
					local bp = entry.data.mainPart
					if not bp or not bp.Parent then continue end
					setStatus("LOCKING BASE")
					local lockTarget = bp.Position
					walkTo(lockTarget, 4, 20, true)
					local t0 = tick()
					local locked = false
					local moveIdx = 0
					local LOCK_WALK_TIME = 30
					local offsets = {
						Vector3.new( 5, 0,  0), Vector3.new(-5, 0,  0),
						Vector3.new( 0, 0,  5), Vector3.new( 0, 0, -5),
						Vector3.new( 5, 0,  5), Vector3.new(-5, 0, -5),
						Vector3.new( 5, 0, -5), Vector3.new(-5, 0,  5),
						Vector3.new( 0, 0,  0), Vector3.new( 3, 0,  0),
						Vector3.new(-3, 0,  0), Vector3.new( 0, 0,  3),
						Vector3.new( 0, 0, -3),
					}
					while tick() - t0 < LOCK_WALK_TIME do
						if not running then break end
						moveIdx = (moveIdx % #offsets) + 1
						local moveTarget = lockTarget + offsets[moveIdx]
						local _, humHold = ensureChar(2)
						if humHold then pcall(function() humHold:MoveTo(moveTarget) end) end
						task.wait(0.25)
						if isAlreadyLocked() then locked = true; break end
						if not isTimerUnlocked(entry.data) then locked = true; break end
					end
					lockCooldowns[entry.gui] = tick()
				end
				isLockingBase = false
				baseLockPending = false
				setStatus(savedStatus:gsub("^> ", ""))
			end
		end)
		if not ok then
			isLockingBase = false
			baseLockPending = false
		end
	end
end)

local function mainLoop(myLoopId)
	local myPlot = ensureMyPlot()
	if not myPlot then setStatus("NO PLOT"); return end
	while running and loopId == myLoopId do
		local ok, err = pcall(function()
			if baseLockPending or isLockingBase then
				while (baseLockPending or isLockingBase) and running do task.wait(0.1) end
				if not running then return end
			end
			if not running or loopId ~= myLoopId then return end
			if not myPlot or not myPlot.Parent then
				myPlot = ensureMyPlot()
				if not myPlot then setStatus("PLOT LOST"); task.wait(2); return end
			end
			local rebirthCost = tonumber(getRebirthCost()) or math.huge
			if getCash() >= rebirthCost then
				setStatus("REBIRTH PHASE")
				local skipBuy = false
				if isRebirthReady() then skipBuy = true end
				if not skipBuy then
					do
						local reqNames = getRequiredPetNames()
						local reqCounts = {}
						for _, n in ipairs(reqNames) do reqCounts[n] = (reqCounts[n] or 0) + 1 end
						local sellFails = 0
						local function countSellable()
							local cur = getOwnedNames(myPlot)
							local pr = {}
							for n, c in pairs(reqCounts) do pr[n] = c end
							local s = 0
							for _, n in ipairs(cur) do
								if pr[n] and pr[n] > 0 then pr[n] -= 1
								else s += 1 end
							end
							return s
						end
						local sellable = countSellable()
						while running and loopId == myLoopId and sellable > 0
							  and sellFails < CFG.SELL_BAILOUT do
							while (baseLockPending or isLockingBase) and running do task.wait(0.1) end
							if not running then return end
							setStatus("SELLING (" .. sellable .. " left)")
							sellCheapest(myPlot, reqCounts)
							task.wait(0.2)
							local ns = countSellable()
							if ns >= sellable then sellFails += 1 else sellFails = 0 end
							sellable = ns
						end
					end
					do
						local buyIter = 0
						while running and loopId == myLoopId do
							while (baseLockPending or isLockingBase) and running do task.wait(0.1) end
							if not running then return end
							local needed = getNeededPets()
							if #needed == 0 then break end
							if isRebirthReady() then break end
							local needMap = {}
							for _, n in ipairs(needed) do needMap[n] = true end
							local animals = getAnimals()
							local foundAny = false
							for _, entry in ipairs(animals) do
								if not running or baseLockPending or loopId ~= myLoopId then break end
								if needMap[entry.name] then
									local entryY = entry.position and entry.position.Y or 0
									local buyCharY = getCharY()
									if math.abs(entryY - buyCharY) > FLOOR_THRESHOLD then continue end
									foundAny = true
									if getCash() >= (tonumber(entry.price) or 0) and entry.prompt then
										setStatus("BUYING: " .. entry.name:sub(1, 16))
										if chaseTo(entry.part, 6, 12) then
											firePrompt(entry.prompt, CFG.PROMPT_RETRIES, Enum.KeyCode.E)
											task.wait(0.15)
											if needsMoreRoom() then
												collectCoins(myPlot)
												sellCheapest(myPlot, reqCounts)
												task.wait(0.15)
											end
										end
									end
								end
							end
							if not foundAny then
								buyIter += 1
								local w = table.concat(needed, ", "):sub(1, 30)
								setStatus("WAITING: " .. w)
							end
							task.wait(0.3)
						end
					end
				end
				if not running or loopId ~= myLoopId then return end
				local before = rebirthsValue and rebirthsValue.Value or 0
				local success = false
				for try = 1, CFG.REBIRTH_RETRIES do
					if not running or loopId ~= myLoopId then break end
					setStatus("REBIRTHING (" .. try .. ")")
					doRebirth()
					task.wait(0.5)
					if (rebirthsValue and rebirthsValue.Value or 0) > before then
						success = true
						break
					end
				end
				if rebirthsValue then rbLbl.Text = "R: " .. tostring(rebirthsValue.Value) end
				setStatus(success and "REBIRTH DONE" or "REBIRTH FAILED")
					if success and checkRebirthTarget() then
						setStatus("REBIRTH DONE -> SCANNER MODE")
						pcall(function() gui:Destroy() end)
						running = false
						_rebirthDone = true
						return
					end
				task.wait(0.3)
			else
				local owned = countOwned(myPlot)
				if owned >= CFG.MAX_PODIUMS then
					setStatus("COLLECTING")
					collectCoins(myPlot)
					if not baseLockPending then sellCheapest(myPlot) end
					task.wait(0.3)
				else
					local best = bestAffordable()
					if best then
						setStatus("BUYING: " .. best.name:sub(1, 14))
						if chaseTo(best.part, 6, 12) then
							firePrompt(best.prompt, CFG.PROMPT_RETRIES, Enum.KeyCode.E)
							task.wait(0.15)
							if needsMoreRoom() then
								setStatus("COLLECTING (full)")
								collectCoins(myPlot)
								if not baseLockPending then sellCheapest(myPlot) end
								task.wait(0.15)
							end
						elseif getCash() <= 25 and not baseLockPending then
							setStatus("COLLECTING")
							spamJump(3); task.wait(0.3)
							collectCoins(myPlot)
						end
					else
						if getCash() <= 25 then
							setStatus("COLLECTING")
							spamJump(3); task.wait(0.3)
							collectCoins(myPlot)
						else
							setStatus("NO PET")
							task.wait(0.15)
						end
					end
				end
			end
		end)
		if not ok then task.wait(0.5) end
		task.wait(0.1)
	end
end

task.spawn(function()
	while task.wait(1) do
		if cashValue then cashLbl.Text = "$ " .. tostring(cashValue.Value) end
		if rebirthsValue then rbLbl.Text = "R: " .. tostring(rebirthsValue.Value) end
	end
end)

toggleBtn.MouseButton1Click:Connect(function()
	running = not running
	if running then
		loopId += 1
		local myId = loopId
		toggleBtn.Text = "STOP"
		toggleBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
		setStatus("RUNNING")
		task.spawn(function() mainLoop(myId) end)
	else
		walkAbort = true
		baseLockPending = false
		isLockingBase = false
		toggleBtn.Text = "START"
		toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		setStatus("STOPPED")
		stopMovement()
	end
end)

task.spawn(function()
	while task.wait(0.15) do
		if not running then continue end
		pcall(function()
			local pg = player:FindFirstChild("PlayerGui")
			if not pg then return end
			local cf = pg:FindFirstChild("Confirmation")
			if not cf then return end
			local inner = cf:FindFirstChild("Confirmation")
			if not inner then return end
			local content = inner:FindFirstChild("Content")
			if content then
				local desc = content:FindFirstChild("Description")
				if desc and desc:IsA("TextLabel") then
					local t = (desc.Text or ""):lower()
					if not (t:find("sell") or t:find("want to sell")) then return end
				end
			end
			local yesBtn = inner:FindFirstChild("Yes")
			if yesBtn and yesBtn:IsA("ImageButton") then clickGuiButton(yesBtn) end
		end)
	end
end)

task.spawn(function()
	while task.wait(0.3) do
		pcall(function()
			ReplicatedStorage.Packages.Net["RE/YinYangEventService/Spin"]:FireServer()
		end)
	end
end)

setStatus("READY")

if Settings.Auto_On then
	task.wait(1)
	running = true
	loopId += 1
	local myId = loopId
	toggleBtn.Text = "STOP"
	toggleBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
	setStatus("RUNNING")
	task.spawn(function() mainLoop(myId) end)
end

    while not _rebirthDone do task.wait(1) end
end

local function main()
    if not game:IsLoaded() then game.Loaded:Wait() end
    repeat task.wait() until LocalPlayer and LocalPlayer.Character and workspace:FindFirstChild("Plots")

    local _modeCheck = LocalPlayer:WaitForChild("leaderstats", 15)
    local _rebirthCheck = _modeCheck and _modeCheck:FindFirstChild("Rebirths")
    local _currentRebirths = _rebirthCheck and _rebirthCheck.Value or 0

    if _currentRebirths >= 1 then
        runScannerMode()
    else
        runRebirthMode()
        runScannerMode()
    end
end

task.spawn(main)