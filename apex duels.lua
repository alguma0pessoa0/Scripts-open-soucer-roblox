local p = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local ls = game:GetService("Lighting")
local stats = game:GetService("Stats")
local cam = workspace.CurrentCamera

-- COLORS
local a = Color3.fromRGB(138,43,226)
local a2 = Color3.fromRGB(255,69,0)
local w = Color3.fromRGB(255,255,255)
local b = Color3.fromRGB(8,8,12)

-- SETTINGS
local ns = 60
local ss = 29
local hopP = 35
local stealR = 20
local stealD = 0.35
local aimS = 60
local batR = 5
local fovV = 70
local COUNTER_RANGE = 15

-- POSITIONS
local pL1 = Vector3.new(-476.48,-6.28,92.73)
local pL2 = Vector3.new(-483.12,-4.95,94.80)
local pR1 = Vector3.new(-476.16,-6.52,25.62)
local pR2 = Vector3.new(-483.04,-5.09,23.14)
local lf = Vector3.new(-473.38,-8.40,22.34)
local rf = Vector3.new(-476.17,-7.91,97.91)

-- STATES
local aL = false
local aR = false
local aLp = 1
local aRp = 1
local aLc = nil
local aRc = nil
local stealE = false
local stealing = false
local antiR = false
local unwalkE = false
local batE = false
local hopE = false
local espE = true
local optE = false
local slowE = false
local tauntA = false
local infJ = true
local ragTP = false
local counterMedusaEnabled = false
local batCounterEnabled = false

local tauntMsg = "Apex on top!"

-- BAT AIMBOT VARIABLES
local aimHighlight = nil
local aimConnection = nil
local lockedTarget = nil

-- COUNTER MEDUSA VARIABLES
local counterConn = nil
local counterCircle = nil

-- BAT COUNTER VARIABLES
local batCounterConn = nil
local lastHitTime = 0
local BAT_COUNTER_COOLDOWN = 0.5

local gC = nil
local gH = nil
local gHrp = nil
local spaceH = false
local lastH = 0
local posLock = false
local changingKey = nil
local savedT = {}

local savedPos = {drop=nil,aL=nil,aR=nil,bat=nil,slow=nil,tp=nil,tauntcircle=nil,medusa=nil,batcounter=nil}

local sg = nil
local mf = nil
local pingFill = nil
local pingVal = nil
local progFill = nil
local progLabel = nil
local progPct = nil
local radIn = nil

local tpPre = Vector3.new(-452.5,-6.6,57.7)
local tpSteps = {Left={Vector3.new(-475.0,-6.6,94.7),Vector3.new(-482.6,-4.7,94.6)},Right={Vector3.new(-475.2,-6.6,23.5),Vector3.new(-482.2,-4.7,23.4)}}

local keys = {aL=Enum.KeyCode.Q,aR=Enum.KeyCode.E,steal=Enum.KeyCode.V,bat=Enum.KeyCode.Z,anti=Enum.KeyCode.X,unwalk=Enum.KeyCode.N,slow=Enum.KeyCode.F7,rag=Enum.KeyCode.F8,drop=Enum.KeyCode.F3,taunt=Enum.KeyCode.F4,tp=Enum.KeyCode.G,medusa=Enum.KeyCode.M,batcounter=Enum.KeyCode.B}
local keyBtns = {}

local function getHrp() local c = p.Character return c and c:FindFirstChild("HumanoidRootPart") end
local function getHum() local c = p.Character return c and c:FindFirstChildOfClass("Humanoid") end

local cfgKey = "ApexHub_Config"

local function saveCfg()
    pcall(function()
        if writefile then
            local d = {ns=ns,ss=ss,stealR=stealR,stealD=stealD,hopP=hopP,fovV=fovV,aimS=aimS,batR=batR}
            for k,v in pairs(savedT) do d["T_"..k]=v end
            for k,v in pairs(keys) do d["K_"..k]=v.Name end
            for k,pos in pairs(savedPos) do if pos then d[k.."_X"]=pos.X.Scale d[k.."_OX"]=pos.X.Offset d[k.."_Y"]=pos.Y.Scale d[k.."_OY"]=pos.Y.Offset end end
            writefile(cfgKey..".json", game:GetService("HttpService"):JSONEncode(d))
        end
    end)
end

local function loadCfg()
    pcall(function()
        if readfile and isfile and isfile(cfgKey..".json") then
            local ok,d = pcall(function() return game:GetService("HttpService"):JSONDecode(readfile(cfgKey..".json")) end)
            if ok and d then
                if d.ns then ns=d.ns end if d.ss then ss=d.ss end if d.stealR then stealR=d.stealR end
                if d.stealD then stealD=d.stealD end if d.hopP then hopP=d.hopP end if d.fovV then fovV=d.fovV end
                if d.aimS then aimS=d.aimS end if d.batR then batR=d.batR end
                for k,_ in pairs(keys) do if d["K_"..k] then pcall(function() keys[k]=Enum.KeyCode[d["K_"..k]] end) end end
                local btns = {"drop","aL","aR","bat","slow","tp","tauntcircle","medusa","batcounter"}
                for _,k in ipairs(btns) do if d[k.."_X"] then savedPos[k]=UDim2.new(d[k.."_X"],d[k.."_OX"] or 0,d[k.."_Y"],d[k.."_OY"] or 0) end end
                for k,v in pairs(d) do if k:sub(1,2)=="T_" then savedT[k:sub(3)]=v end end
            end
        end
    end)
end
loadCfg()

local function doHop()
    if not hopE then return end
    local h = getHrp()
    local hh = getHum()
    if not h or not hh then return end
    if tick()-lastH<0.08 then return end
    lastH = tick()
    if hh.FloorMaterial == Enum.Material.Air then h.AssemblyLinearVelocity = Vector3.new(h.AssemblyLinearVelocity.X, hopP, h.AssemblyLinearVelocity.Z) end
end

-- ============ ECLIPSEX ANTI-RAGDOLL ============
local antiConns = {}

local function startAnti()
    if #antiConns > 0 then return end
    local c = p.Character or p.CharacterAdded:Wait()
    local hum = c:WaitForChild("Humanoid")
    local root = c:WaitForChild("HumanoidRootPart")
    local anim = hum:FindFirstChild("Animator") or Instance.new("Animator", hum)
    local maxVel = 40
    local clampVel = 25
    local maxClamp = 15
    local lastVel = Vector3.new(0,0,0)
    
    local function isRagdoll()
        local s = hum:GetState()
        return s == Enum.HumanoidStateType.Physics or 
               s == Enum.HumanoidStateType.Ragdoll or
               s == Enum.HumanoidStateType.FallingDown or 
               s == Enum.HumanoidStateType.GettingUp
    end
    
    local function cleanEffects()
        for _, obj in pairs(c:GetDescendants()) do
            if obj:IsA("BallSocketConstraint") or obj:IsA("NoCollisionConstraint") or obj:IsA("HingeConstraint") or
               (obj:IsA("Attachment") and (obj.Name == "A" or obj.Name == "B")) then 
                obj:Destroy()
            elseif obj:IsA("BodyVelocity") or obj:IsA("BodyPosition") or obj:IsA("BodyGyro") then 
                obj:Destroy()
            elseif obj:IsA("Motor6D") then 
                obj.Enabled = true 
            end
        end
        for _, track in pairs(anim:GetPlayingAnimationTracks()) do
            local anName = track.Animation and track.Animation.Name:lower() or ""
            if anName:find("rag") or anName:find("fall") or anName:find("hurt") or anName:find("down") then 
                track:Stop(0) 
            end
        end
    end
    
    local function reEnable()
        pcall(function() 
            require(p:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls():Enable() 
        end)
    end
    
    table.insert(antiConns, hum.StateChanged:Connect(function()
        if isRagdoll() then 
            hum:ChangeState(Enum.HumanoidStateType.Running) 
            cleanEffects() 
            cam.CameraSubject = hum 
            reEnable() 
        end
    end))
    
    table.insert(antiConns, rs.Heartbeat:Connect(function()
        if not antiR then return end
        if isRagdoll() then
            cleanEffects()
            local vel = root.AssemblyLinearVelocity
            if (vel - lastVel).Magnitude > maxVel and vel.Magnitude > clampVel then
                root.AssemblyLinearVelocity = vel.Unit * math.min(vel.Magnitude, maxClamp) 
            end
            lastVel = vel
        end
    end))
    
    table.insert(antiConns, c.DescendantAdded:Connect(function() 
        if isRagdoll() then cleanEffects() end 
    end))
    
    table.insert(antiConns, p.CharacterAdded:Connect(function(newChar)
        c = newChar 
        hum = newChar:WaitForChild("Humanoid") 
        root = newChar:WaitForChild("HumanoidRootPart")
        anim = hum:FindFirstChild("Animator") or Instance.new("Animator", hum)
        lastVel = Vector3.new(0,0,0)
        reEnable() 
        cleanEffects()
    end))
    
    reEnable() 
    cleanEffects()
    print("✅ Anti-Ragdoll (EclipseX) ON")
end

local function stopAnti()
    for _, conn in ipairs(antiConns) do conn:Disconnect() end
    antiConns = {}
    print("❌ Anti-Ragdoll OFF")
end
-- ===================================================

-- ============ COUNTER MEDUSA ============
local function makeCounterCircle()
    if counterCircle then counterCircle:Destroy() end
    counterCircle = Instance.new("Part")
    counterCircle.Name = "CounterCircle"
    counterCircle.Shape = Enum.PartType.Cylinder
    counterCircle.Size = Vector3.new(0.2, COUNTER_RANGE * 2, COUNTER_RANGE * 2)
    counterCircle.Color = Color3.fromRGB(255, 0, 0)
    counterCircle.Material = Enum.Material.Neon
    counterCircle.Transparency = 0.5
    counterCircle.Anchored = true
    counterCircle.CanCollide = false
    counterCircle.Parent = workspace
end

local function updateCounterCircle()
    local root = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
    if counterCircle and root then
        counterCircle.CFrame = CFrame.new(root.Position - Vector3.new(0, 2.6, 0)) * CFrame.Angles(0, 0, math.rad(90))
    end
end

local function findMedusaTool()
    local char = p.Character
    local bp = p:FindFirstChildOfClass("Backpack")
    
    if char then
        for _, tool in ipairs(char:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("medusa") or tool.Name:lower():find("medusa's head")) then
                return tool
            end
        end
    end
    if bp then
        for _, tool in ipairs(bp:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("medusa") or tool.Name:lower():find("medusa's head")) then
                return tool
            end
        end
    end
    return nil
end

local function enemyHasMedusa()
    local root = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    
    for _, other in ipairs(game.Players:GetPlayers()) do
        if other ~= p and other.Character then
            local otherRoot = other.Character:FindFirstChild("HumanoidRootPart")
            local otherHum = other.Character:FindFirstChildOfClass("Humanoid")
            if otherRoot and otherHum and otherHum.Health > 0 then
                local dist = (root.Position - otherRoot.Position).Magnitude
                if dist <= COUNTER_RANGE then
                    for _, tool in ipairs(other.Character:GetChildren()) do
                        if tool:IsA("Tool") and (tool.Name:lower():find("medusa") or tool.Name:lower():find("medusa's head")) then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

local function startCounterMedusa()
    if counterConn then return end
    counterMedusaEnabled = true
    makeCounterCircle()
    
    rs:BindToRenderStep("CounterCircleUpdate", 1, function()
        if counterMedusaEnabled then updateCounterCircle() end
    end)
    
    counterConn = rs.Heartbeat:Connect(function()
        if counterMedusaEnabled then
            if enemyHasMedusa() then
                if counterCircle then
                    counterCircle.Color = Color3.fromRGB(255, 0, 0)
                    counterCircle.Transparency = 0.2
                end
                
                local medusa = findMedusaTool()
                if medusa then
                    local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
                    if hum then
                        if medusa.Parent ~= p.Character then
                            pcall(function() hum:EquipTool(medusa) end)
                        end
                        pcall(function() medusa:Activate() end)
                    end
                end
            else
                if counterCircle then
                    counterCircle.Color = Color3.fromRGB(255, 100, 100)
                    counterCircle.Transparency = 0.5
                end
            end
        end
    end)
    
    print("✅ Counter Medusa ON")
end

local function stopCounterMedusa()
    counterMedusaEnabled = false
    if counterConn then
        counterConn:Disconnect()
        counterConn = nil
    end
    if counterCircle then
        counterCircle:Destroy()
        counterCircle = nil
    end
    rs:UnbindFromRenderStep("CounterCircleUpdate")
    print("❌ Counter Medusa OFF")
end
-- =============================================

-- ============ BAT COUNTER (HIT BACK) ============
local function findBatToolForCounter()
    local char = p.Character
    local bp = p:FindFirstChildOfClass("Backpack")
    
    if char then
        for _, tool in ipairs(char:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then
                return tool
            end
        end
    end
    if bp then
        for _, tool in ipairs(bp:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then
                return tool
            end
        end
    end
    return nil
end

local function onHit()
    local now = tick()
    if now - lastHitTime < BAT_COUNTER_COOLDOWN then return end
    lastHitTime = now
    
    if batCounterEnabled then
        local myBat = findBatToolForCounter()
        if myBat then
            local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                if myBat.Parent ~= p.Character then
                    pcall(function() hum:EquipTool(myBat) end)
                end
                task.wait(0.05)
                pcall(function() myBat:Activate() end)
                print("⚡ BAT COUNTER: Hit back!")
            end
        end
    end
end

local function startBatCounter()
    if batCounterConn then return end
    batCounterEnabled = true
    
    local function setupHitDetection(char)
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            local healthConn = hum:GetPropertyChangedSignal("Health"):Connect(function()
                if batCounterEnabled then
                    onHit()
                end
            end)
            table.insert(batCounterConn or {}, healthConn)
        end
    end
    
    batCounterConn = {}
    setupHitDetection(p.Character)
    
    local charConn = p.CharacterAdded:Connect(function(newChar)
        task.wait(0.5)
        setupHitDetection(newChar)
    end)
    table.insert(batCounterConn, charConn)
    
    print("✅ BAT COUNTER ON - Will hit back when attacked!")
end

local function stopBatCounter()
    batCounterEnabled = false
    if batCounterConn then
        for _, conn in ipairs(batCounterConn) do
            pcall(function() conn:Disconnect() end)
        end
        batCounterConn = nil
    end
    print("❌ Bat Counter OFF")
end
-- =============================================

-- TAUNT FUNCTIONS
local tauntL = nil
local function startTaunt()
    if tauntL then return end
    tauntA = true
    tauntL = task.spawn(function()
        while tauntA do
            pcall(function()
                local t = game:GetService("TextChatService")
                local ch = t.TextChannels:FindFirstChild("RBXGeneral")
                if ch then 
                    ch:SendAsync(tauntMsg)
                else 
                    local rs = game:GetService("ReplicatedStorage")
                    local chatEvent = rs:FindFirstChild("DefaultChatSystemChatEvents")
                    if chatEvent then
                        local sayRequest = chatEvent:FindFirstChild("SayMessageRequest")
                        if sayRequest then
                            sayRequest:FireServer(tauntMsg, "All")
                        end
                    end
                end
            end)
            task.wait(0.8)
        end
    end)
end

local function stopTaunt()
    tauntA = false
    if tauntL then 
        task.cancel(tauntL) 
        tauntL = nil 
    end
end

-- ============ CONTINUOUS BAT AIMBOT ============
local function isValidTarget(targetChar)
    if not targetChar then return false end
    local hum = targetChar:FindFirstChildOfClass("Humanoid")
    local hrp = targetChar:FindFirstChild("HumanoidRootPart")
    local ff = targetChar:FindFirstChildOfClass("ForceField")
    return hum and hrp and hum.Health > 0 and not ff
end

local function getBestTarget(myHrp)
    if lockedTarget and isValidTarget(lockedTarget) then
        return lockedTarget:FindFirstChild("HumanoidRootPart"), lockedTarget
    end
    local shortest = math.huge
    local newTarget = nil
    local newHrp = nil
    for _, pl in ipairs(game.Players:GetPlayers()) do
        if pl ~= p and isValidTarget(pl.Character) then
            local hrp = pl.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local dist = (hrp.Position - myHrp.Position).Magnitude
                if dist < shortest then
                    shortest = dist
                    newHrp = hrp
                    newTarget = pl.Character
                end
            end
        end
    end
    lockedTarget = newTarget
    return newHrp, newTarget
end

local function findBatTool()
    local c = p.Character
    if not c then return nil end
    for _, tool in ipairs(c:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then
            return tool
        end
    end
    local bp = p:FindFirstChildOfClass("Backpack")
    if bp then
        for _, tool in ipairs(bp:GetChildren()) do
            if tool:IsA("Tool") and (tool.Name:lower():find("bat") or tool.Name:lower():find("slap")) then
                return tool
            end
        end
    end
    return nil
end

local function startBatAimbot()
    if aimConnection then return end
    
    aimHighlight = Instance.new("Highlight")
    aimHighlight.Name = "ApexBatAimbot"
    aimHighlight.FillColor = Color3.fromRGB(255, 50, 100)
    aimHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    aimHighlight.FillTransparency = 0.4
    aimHighlight.OutlineTransparency = 0.2
    pcall(function() aimHighlight.Parent = p:WaitForChild("PlayerGui") end)
    
    local c = p.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local hum = c:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    
    hum.AutoRotate = false
    
    local align = hrp:FindFirstChild("ApexAimbotAlign") or Instance.new("AlignOrientation", hrp)
    align.Name = "ApexAimbotAlign"
    align.Mode = Enum.OrientationAlignmentMode.OneAttachment
    align.MaxTorque = math.huge
    align.Responsiveness = 250
    
    local attachment = hrp:FindFirstChild("ApexAimbotAttach") or Instance.new("Attachment", hrp)
    attachment.Name = "ApexAimbotAttach"
    align.Attachment0 = attachment
    
    batE = true
    
    aimConnection = rs.Heartbeat:Connect(function()
        if not batE then return end
        if not p.Character or not p.Character:FindFirstChild("HumanoidRootPart") then return end
        
        local currentHrp = p.Character.HumanoidRootPart
        local currentHum = p.Character:FindFirstChildOfClass("Humanoid")
        if not currentHrp or not currentHum then return end
        
        local bat = findBatTool()
        if bat and bat.Parent ~= p.Character then
            pcall(function() currentHum:EquipTool(bat) end)
        end
        
        local targetHrp, targetChar = getBestTarget(currentHrp)
        
        if targetHrp and targetChar then
            aimHighlight.Adornee = targetChar
            
            local targetVel = targetHrp.AssemblyLinearVelocity
            local speed = targetVel.Magnitude
            local predictTime = math.clamp(speed / 160, 0.05, 0.25)
            local predictedPos = targetHrp.Position + (targetVel * predictTime)
            
            local dirToTarget = (predictedPos - currentHrp.Position)
            local distance = dirToTarget.Magnitude
            
            align.CFrame = CFrame.lookAt(currentHrp.Position, predictedPos)
            
            local targetPos = predictedPos
            if distance > 0 then
                targetPos = predictedPos - (dirToTarget.Unit * 3.5)
            end
            
            local moveDir = (targetPos - currentHrp.Position)
            local moveDist = moveDir.Magnitude
            
            if moveDist > 1.5 then
                currentHrp.AssemblyLinearVelocity = moveDir.Unit * aimS
            else
                currentHrp.AssemblyLinearVelocity = targetVel
            end
            
            if distance <= batR then
                if bat and bat.Parent == p.Character then
                    pcall(function() bat:Activate() end)
                end
            end
        else
            aimHighlight.Adornee = nil
            lockedTarget = nil
            
            local moveDir = currentHum.MoveDirection
            if moveDir.Magnitude > 0.1 then
                currentHrp.AssemblyLinearVelocity = moveDir.Unit * aimS
            end
        end
    end)
end

local function stopBatAimbot()
    batE = false
    if aimConnection then
        aimConnection:Disconnect()
        aimConnection = nil
    end
    if aimHighlight then
        aimHighlight:Destroy()
        aimHighlight = nil
    end
    local c = p.Character
    local h = c and c:FindFirstChild("HumanoidRootPart")
    local hum = c and c:FindFirstChildOfClass("Humanoid")
    if h then
        local align = h:FindFirstChild("ApexAimbotAlign")
        if align then align:Destroy() end
        local attach = h:FindFirstChild("ApexAimbotAttach")
        if attach then attach:Destroy() end
    end
    if hum then hum.AutoRotate = true end
    lockedTarget = nil
end
-- ====================================================

local function startAutoL()
    if aLc then aLc:Disconnect() end
    aLp = 1
    aLc = rs.Heartbeat:Connect(function()
        if not aL or not gHrp or not gH then return end
        if aLp == 1 then
            local d = Vector3.new(pL1.X - gHrp.Position.X, 0, pL1.Z - gHrp.Position.Z)
            if d.Magnitude<1 then aLp=2 return end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ns, gHrp.AssemblyLinearVelocity.Y, md.Z*ns)
        elseif aLp == 2 then
            local d = Vector3.new(pL2.X - gHrp.Position.X, 0, pL2.Z - gHrp.Position.Z)
            if d.Magnitude<1 then
                aLp=0
                gH:Move(Vector3.zero, false)
                gHrp.AssemblyLinearVelocity = Vector3.zero
                task.delay(0.1, function() if aL then aLp=3 end end)
                return
            end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ns, gHrp.AssemblyLinearVelocity.Y, md.Z*ns)
        elseif aLp == 3 then
            local d = Vector3.new(pL1.X - gHrp.Position.X, 0, pL1.Z - gHrp.Position.Z)
            if d.Magnitude<1 then aLp=4 return end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ss, gHrp.AssemblyLinearVelocity.Y, md.Z*ss)
        elseif aLp == 4 then
            local d = Vector3.new(lf.X - gHrp.Position.X, 0, lf.Z - gHrp.Position.Z)
            if d.Magnitude<1 then
                gH:Move(Vector3.zero, false)
                gHrp.AssemblyLinearVelocity = Vector3.zero
                aL = false
                return
            end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ss, gHrp.AssemblyLinearVelocity.Y, md.Z*ss)
        end
    end)
end

local function stopAutoL()
    aL = false
    if aLc then aLc:Disconnect() aLc=nil end
    aLp = 1
    local hh = getHum()
    if hh then hh:Move(Vector3.zero, false) end
end

local function startAutoR()
    if aRc then aRc:Disconnect() end
    aRp = 1
    aRc = rs.Heartbeat:Connect(function()
        if not aR or not gHrp or not gH then return end
        if aRp == 1 then
            local d = Vector3.new(pR1.X - gHrp.Position.X, 0, pR1.Z - gHrp.Position.Z)
            if d.Magnitude<1 then aRp=2 return end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ns, gHrp.AssemblyLinearVelocity.Y, md.Z*ns)
        elseif aRp == 2 then
            local d = Vector3.new(pR2.X - gHrp.Position.X, 0, pR2.Z - gHrp.Position.Z)
            if d.Magnitude<1 then
                aRp=0
                gH:Move(Vector3.zero, false)
                gHrp.AssemblyLinearVelocity = Vector3.zero
                task.delay(0.1, function() if aR then aRp=3 end end)
                return
            end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ns, gHrp.AssemblyLinearVelocity.Y, md.Z*ns)
        elseif aRp == 3 then
            local d = Vector3.new(pR1.X - gHrp.Position.X, 0, pR1.Z - gHrp.Position.Z)
            if d.Magnitude<1 then aRp=4 return end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ss, gHrp.AssemblyLinearVelocity.Y, md.Z*ss)
        elseif aRp == 4 then
            local d = Vector3.new(rf.X - gHrp.Position.X, 0, rf.Z - gHrp.Position.Z)
            if d.Magnitude<1 then
                gH:Move(Vector3.zero, false)
                gHrp.AssemblyLinearVelocity = Vector3.zero
                aR = false
                return
            end
            local md = d.Unit
            gH:Move(md, false)
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*ss, gHrp.AssemblyLinearVelocity.Y, md.Z*ss)
        end
    end)
end

local function stopAutoR()
    aR = false
    if aRc then aRc:Disconnect() aRc=nil end
    aRp = 1
    local hh = getHum()
    if hh then hh:Move(Vector3.zero, false) end
end

local function doTpDown()
    local r = getHrp()
    if not r then return end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {p.Character}
    local res = workspace:Raycast(r.Position, Vector3.new(0,-500,0), params)
    if res then r.CFrame = CFrame.new(Vector3.new(r.Position.X, res.Position.Y+3, r.Position.Z))
    else r.CFrame = r.CFrame * CFrame.new(0,-20,0) end
    r.AssemblyLinearVelocity = Vector3.zero
end

local wfConns = {}
local wfActive = false
local function startWf()
    wfActive = true
    table.insert(wfConns, rs.Stepped:Connect(function()
        if not wfActive then return end
        for _,pl in ipairs(game.Players:GetPlayers()) do
            if pl~=p and pl.Character then
                for _,part in ipairs(pl.Character:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end
    end))
    local co = coroutine.create(function()
        while wfActive do
            rs.Heartbeat:Wait()
            local root = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
            if not root then rs.Heartbeat:Wait() end
            local vel = root.Velocity
            root.Velocity = vel*10000 + Vector3.new(0,10000,0)
            rs.RenderStepped:Wait()
            if root and root.Parent then root.Velocity = vel end
            rs.Stepped:Wait()
            if root and root.Parent then root.Velocity = vel + Vector3.new(0,0.1,0) end
        end
    end)
    coroutine.resume(co)
    table.insert(wfConns, co)
end
local function stopWf()
    wfActive = false
    for _,c in ipairs(wfConns) do
        if typeof(c)=="RBXScriptConnection" then c:Disconnect()
        elseif typeof(c)=="thread" then pcall(task.cancel,c) end
    end
    wfConns = {}
end
local function doDrop() startWf() task.delay(0.4, stopWf) end

uis.JumpRequest:Connect(function()
    if not infJ then return end
    local h = getHrp()
    if h then h.AssemblyLinearVelocity = Vector3.new(h.AssemblyLinearVelocity.X, 54, h.AssemblyLinearVelocity.Z) end
end)
rs.Heartbeat:Connect(function()
    if not infJ then return end
    local h = getHrp()
    if h and h.AssemblyLinearVelocity.Y < -80 then h.AssemblyLinearVelocity = Vector3.new(h.AssemblyLinearVelocity.X, -80, h.AssemblyLinearVelocity.Z) end
end)

local unwalkC = nil
local function startUnwalk()
    if unwalkC then return end
    unwalkC = rs.Heartbeat:Connect(function()
        if not unwalkE then if unwalkC then unwalkC:Disconnect() unwalkC=nil end return end
        local c = p.Character
        if not c then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then
            local anim = hum:FindFirstChild("Animator")
            if anim then for _,t in ipairs(anim:GetPlayingAnimationTracks()) do t:Stop(0) end end
        end
    end)
end
local function stopUnwalk() if unwalkC then unwalkC:Disconnect() unwalkC=nil end end

local espConns = {}
local function createEsp(pl)
    if pl==p or not pl.Character then return end
    local c = pl.Character
    local r = c:FindFirstChild("HumanoidRootPart")
    local h = c:FindFirstChild("Head")
    if not r or not h then return end
    if c:FindFirstChild("ApexESP") then return end
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ApexESP"
    box.Adornee = r
    box.Size = Vector3.new(4,6,2)
    box.Color3 = a
    box.Transparency = 0.45
    box.AlwaysOnTop = true
    box.Parent = c
    local bb = Instance.new("BillboardGui")
    bb.Name = "ApexESP_Name"
    bb.Adornee = h
    bb.Size = UDim2.new(0,150,0,30)
    bb.StudsOffset = Vector3.new(0,2.5,0)
    bb.AlwaysOnTop = true
    bb.Parent = c
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,0,1,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = pl.DisplayName
    lbl.TextColor3 = w
    lbl.Font = Enum.Font.GothamBold
    lbl.TextScaled = true
    lbl.Parent = bb
end
local function enableEsp()
    for _,pl in ipairs(game.Players:GetPlayers()) do
        if pl~=p then
            if pl.Character then pcall(function() createEsp(pl) end) end
            table.insert(espConns, pl.CharacterAdded:Connect(function() task.wait(0.1) if espE then pcall(function() createEsp(pl) end) end end))
        end
    end
    table.insert(espConns, game.Players.PlayerAdded:Connect(function(pl)
        if pl==p then return end
        table.insert(espConns, pl.CharacterAdded:Connect(function() task.wait(0.1) if espE then pcall(function() createEsp(pl) end) end end))
    end))
end
local function disableEsp()
    for _,pl in ipairs(game.Players:GetPlayers()) do
        if pl.Character then
            local b = pl.Character:FindFirstChild("ApexESP")
            local n = pl.Character:FindFirstChild("ApexESP_Name")
            if b then b:Destroy() end if n then n:Destroy() end
        end
    end
    for _,c in ipairs(espConns) do if c and c.Connected then c:Disconnect() end end
    espConns = {}
end

local xrayO = {}
local function enableOpt()
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        ls.GlobalShadows = false
        ls.Brightness = 2
        for _,o in ipairs(workspace:GetDescendants()) do
            pcall(function()
                if o:IsA("ParticleEmitter") or o:IsA("Trail") or o:IsA("Smoke") or o:IsA("Fire") or o:IsA("Sparkles") then o.Enabled=false o:Destroy()
                elseif o:IsA("BasePart") then
                    o.CastShadow = false
                    o.Material = Enum.Material.Plastic
                    if o.Anchored and (o.Name:lower():find("base") or (o.Parent and o.Parent.Name:lower():find("base"))) then
                        xrayO[o] = o.LocalTransparencyModifier
                        o.LocalTransparencyModifier = 0.88
                    end
                elseif o:IsA("Sky") then o:Destroy() end
            end)
        end
    end)
end
local function disableOpt()
    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        ls.GlobalShadows = true
    end)
    for part,val in pairs(xrayO) do if part and part.Parent then part.LocalTransparencyModifier = val end end
    xrayO = {}
end

local fovC = nil
local function applyFov()
    if fovC then fovC:Disconnect() end
    fovC = rs.RenderStepped:Connect(function() cam.FieldOfView = fovV end)
end

local animalC = {}
local promptC = {}
local stealC = {}
local stealConn = nil
local progConn = nil
local stealStart = nil

local function isMyBase(name)
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return false end
    local plot = plots:FindFirstChild(name)
    if not plot then return false end
    local sign = plot:FindFirstChild("PlotSign")
    if not sign then return false end
    local yb = sign:FindFirstChild("YourBase")
    return yb and yb:IsA("BillboardGui") and yb.Enabled == true
end

local function scanPlot(plot)
    if not plot or not plot:IsA("Model") then return end
    if isMyBase(plot.Name) then return end
    local pods = plot:FindFirstChild("AnimalPodiums")
    if not pods then return end
    for _,pod in ipairs(pods:GetChildren()) do
        if pod:IsA("Model") and pod:FindFirstChild("Base") then
            table.insert(animalC, {plot=plot.Name,slot=pod.Name,pos=pod:GetPivot().Position,uid=plot.Name.."_"..pod.Name})
        end
    end
end

local function findPrompt(ad)
    if not ad then return nil end
    local cp = promptC[ad.uid]
    if cp and cp.Parent then return cp end
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return nil end
    local plot = plots:FindFirstChild(ad.plot)
    if not plot then return nil end
    local pods = plot:FindFirstChild("AnimalPodiums")
    if not pods then return nil end
    local pod = pods:FindFirstChild(ad.slot)
    if not pod then return nil end
    local base = pod:FindFirstChild("Base")
    if not base then return nil end
    local sp = base:FindFirstChild("Spawn")
    if not sp then return nil end
    local att = sp:FindFirstChild("PromptAttachment")
    if not att then return nil end
    for _,p in ipairs(att:GetChildren()) do if p:IsA("ProximityPrompt") then promptC[ad.uid]=p return p end end
end

local function buildCb(prompt)
    if stealC[prompt] then return end
    local data = {hold={},trigger={},ready=true}
    pcall(function()
        if getconnections then
            for _,c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do if type(c.Function)=="function" then table.insert(data.hold,c.Function) end end
            for _,c in ipairs(getconnections(prompt.Triggered)) do if type(c.Function)=="function" then table.insert(data.trigger,c.Function) end end
        end
    end)
    if #data.hold>0 or #data.trigger>0 then stealC[prompt]=data end
end

local function execSteal(prompt)
    local data = stealC[prompt]
    if not data or not data.ready then return false end
    data.ready = false
    stealing = true
    stealStart = tick()
    if progLabel then progLabel.Text = "STEALING..." end
    if progConn then progConn:Disconnect() end
    progConn = rs.Heartbeat:Connect(function()
        if not stealing then progConn:Disconnect() return end
        local prog = math.clamp((tick()-stealStart)/stealD,0,1)
        if progFill then progFill.Size = UDim2.new(prog,0,1,0) end
        if progPct then progPct.Text = math.floor(prog*100).."%" end
    end)
    task.spawn(function()
        for _,f in ipairs(data.hold) do task.spawn(f) end
        task.wait(stealD)
        for _,f in ipairs(data.trigger) do task.spawn(f) end
        if progConn then progConn:Disconnect() end
        if progLabel then progLabel.Text = "READY" end
        if progPct then progPct.Text = "" end
        if progFill then progFill.Size = UDim2.new(0,0,1,0) end
        data.ready = true
        stealing = false
    end)
    return true
end

local function nearestAnimal()
    local h = getHrp()
    if not h then return nil end
    local best,bestD = nil,math.huge
    for _,ad in ipairs(animalC) do
        if not isMyBase(ad.plot) and ad.pos then
            local d = (h.Position - ad.pos).Magnitude
            if d<bestD then bestD=d best=ad end
        end
    end
    return best
end

local function startAutoSteal()
    if stealConn then return end
    stealConn = rs.Heartbeat:Connect(function()
        if not stealE or stealing then return end
        local target = nearestAnimal()
        if not target then return end
        local h = getHrp()
        if not h then return end
        if (h.Position - target.pos).Magnitude > stealR then return end
        local prompt = promptC[target.uid]
        if not prompt or not prompt.Parent then prompt = findPrompt(target) end
        if prompt then buildCb(prompt) execSteal(prompt) end
    end)
end
local function stopAutoSteal()
    if stealConn then stealConn:Disconnect() stealConn=nil end
    stealing = false
    if progConn then progConn:Disconnect() progConn=nil end
    if progFill then progFill.Size = UDim2.new(0,0,1,0) end
    if progLabel then progLabel.Text = "READY" end
    if progPct then progPct.Text = "" end
end

local tpCd = false
local function detectSide()
    local plots = workspace:FindFirstChild("Plots")
    if not plots then return "Left" end
    for _,plot in ipairs(plots:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        if sign then
            local yb = sign:FindFirstChild("YourBase")
            if yb and yb:IsA("BillboardGui") and yb.Enabled then
                local center = plot:FindFirstChildWhichIsA("BasePart")
                local z = center and center.Position.Z or 0
                return z>60 and "Right" or "Left"
            end
        end
    end
    return "Left"
end
local function tpMove(pos)
    local r = getHrp()
    if not r then return end
    r.CFrame = CFrame.new(pos)
    r.AssemblyLinearVelocity = Vector3.zero
end
local function doRagTp()
    if tpCd then return end
    tpCd = true
    local side = detectSide()
    local steps = tpSteps[side]
    tpMove(tpPre)
    task.delay(0.1, function()
        tpMove(steps[1])
        task.delay(0.1, function()
            tpMove(steps[2])
            task.delay(1.2, function() tpCd = false end)
        end)
    end)
end
local ragConn = nil
local function startRagTp()
    if ragConn then return end
    local c = p.Character
    if not c then return end
    local hum = c:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    ragConn = hum.StateChanged:Connect(function(_,ns)
        if not ragTP then return end
        if ns == Enum.HumanoidStateType.Physics or ns == Enum.HumanoidStateType.Ragdoll or ns == Enum.HumanoidStateType.FallingDown then
            task.defer(doRagTp)
        end
    end)
end
local function stopRagTp()
    if ragConn then ragConn:Disconnect() ragConn=nil end
end

local speedBb = nil
local function makeSpeedBb()
    local c = p.Character
    if not c then return end
    local head = c:FindFirstChild("Head")
    if not head then return end
    if speedBb then pcall(function() speedBb:Destroy() end) end
    speedBb = Instance.new("BillboardGui")
    speedBb.Name = "ApexSpeed"
    speedBb.Adornee = head
    speedBb.Size = UDim2.new(0,130,0,30)
    speedBb.StudsOffset = Vector3.new(0,3.2,0)
    speedBb.AlwaysOnTop = true
    speedBb.Parent = head
    local lbl = Instance.new("TextLabel")
    lbl.Name = "SpeedLbl"
    lbl.Size = UDim2.new(1,0,1,0)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = w
    lbl.TextStrokeColor3 = a
    lbl.TextStrokeTransparency = 0.3
    lbl.Font = Enum.Font.GothamBold
    lbl.TextScaled = true
    lbl.Text = "Speed: 0"
    lbl.Parent = speedBb
end

rs.RenderStepped:Connect(function()
    if not speedBb or not speedBb.Parent then return end
    local h = getHrp()
    if not h then return end
    local lbl = speedBb:FindFirstChild("SpeedLbl")
    if not lbl then return end
    local v = h.AssemblyLinearVelocity
    lbl.Text = "Speed: " .. math.floor(Vector3.new(v.X,0,v.Z).Magnitude)
end)

rs.Heartbeat:Connect(function()
    if not gC or not gH or not gHrp then return end
    if hopE and spaceH then doHop() end
    if not batE and not aL and not aR then
        local md = gH.MoveDirection
        if md.Magnitude > 0.1 then
            local spd = slowE and ss or ns
            gHrp.AssemblyLinearVelocity = Vector3.new(md.X*spd, gHrp.AssemblyLinearVelocity.Y, md.Z*spd)
        end
    end
end)

uis.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then spaceH = true end
end)
uis.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then spaceH = false end
end)

local function setupChar(c)
    gC = c
    gH = c:WaitForChild("Humanoid",5)
    gHrp = c:WaitForChild("HumanoidRootPart",5)
    if not gH or not gHrp then return end
    task.wait(0.5)
    makeSpeedBb()
    if antiR then startAnti() end
    if espE then enableEsp() end
    if batE then startBatAimbot() end
    if unwalkE then startUnwalk() end
    if ragTP then startRagTp() end
    if counterMedusaEnabled then
        stopCounterMedusa()
        startCounterMedusa()
    end
    if batCounterEnabled then
        stopBatCounter()
        startBatCounter()
    end
end

if p.Character then setupChar(p.Character) end
p.CharacterAdded:Connect(function(c) task.wait(0.5) setupChar(c) end)

task.spawn(function()
    task.wait(2)
    local plots = workspace:WaitForChild("Plots",10)
    if not plots then return end
    for _,plot in ipairs(plots:GetChildren()) do if plot:IsA("Model") then scanPlot(plot) end end
    plots.ChildAdded:Connect(function(plot) if plot:IsA("Model") then task.wait(0.5) scanPlot(plot) end end)
    task.spawn(function() while task.wait(5) do animalC={} for _,plot in ipairs(plots:GetChildren()) do if plot:IsA("Model") then scanPlot(plot) end end end end)
end)

-- CREATE GUI (simplified - same as before but without desync)
sg = Instance.new("ScreenGui")
sg.Name = "ApexHub"
sg.ResetOnSpawn = false
sg.Parent = p:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect", ls)
blur.Size = 0

-- MAIN FRAME
mf = Instance.new("Frame", sg)
mf.Size = UDim2.new(0,300,0,480)
mf.Position = UDim2.new(0.5,-150,0.5,-240)
mf.BackgroundColor3 = b
mf.BackgroundTransparency = 0.15
mf.BorderSizePixel = 0
mf.Visible = false
mf.Active = true
Instance.new("UICorner", mf).CornerRadius = UDim.new(0,20)
local glassStroke = Instance.new("UIStroke", mf)
glassStroke.Color = Color3.fromRGB(255,255,255)
glassStroke.Transparency = 0.3
glassStroke.Thickness = 1
local borderGlow = Instance.new("UIGradient", glassStroke)
borderGlow.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,a),ColorSequenceKeypoint.new(0.5,a2),ColorSequenceKeypoint.new(1,a)})

-- TITLE BAR
local titleBar = Instance.new("Frame", mf)
titleBar.Size = UDim2.new(1,0,0,50)
titleBar.BackgroundColor3 = Color3.fromRGB(10,10,18)
titleBar.BackgroundTransparency = 0.3
titleBar.BorderSizePixel = 0
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0,20)

local titleLbl = Instance.new("TextLabel", titleBar)
titleLbl.Size = UDim2.new(1,0,1,0)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "APEX HUB"
titleLbl.Font = Enum.Font.GothamBlack
titleLbl.TextSize = 22
titleLbl.TextColor3 = w
local titleGrad = Instance.new("UIGradient", titleLbl)
titleGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,a),ColorSequenceKeypoint.new(1,a2)})

-- PING BAR
local pingFrame = Instance.new("Frame", sg)
pingFrame.Size = UDim2.new(0,220,0,32)
pingFrame.Position = UDim2.new(0.5,-110,0,10)
pingFrame.BackgroundColor3 = Color3.fromRGB(15,15,25)
pingFrame.BackgroundTransparency = 0.2
pingFrame.BorderSizePixel = 0
Instance.new("UICorner", pingFrame).CornerRadius = UDim.new(0,16)
Instance.new("UIStroke", pingFrame).Color = a

local hubName = Instance.new("TextLabel", pingFrame)
hubName.Size = UDim2.new(0,60,1,0)
hubName.Position = UDim2.new(0,8,0,0)
hubName.BackgroundTransparency = 1
hubName.Text = "APEX"
hubName.TextColor3 = a
hubName.Font = Enum.Font.GothamBold
hubName.TextSize = 12

local pingIcon = Instance.new("TextLabel", pingFrame)
pingIcon.Size = UDim2.new(0,25,1,0)
pingIcon.Position = UDim2.new(0,75,0,0)
pingIcon.BackgroundTransparency = 1
pingIcon.Text = "📶"
pingIcon.TextColor3 = w
pingIcon.Font = Enum.Font.GothamBold
pingIcon.TextSize = 14

pingVal = Instance.new("TextLabel", pingFrame)
pingVal.Size = UDim2.new(0,40,1,0)
pingVal.Position = UDim2.new(0,105,0,0)
pingVal.BackgroundTransparency = 1
pingVal.Text = "0"
pingVal.TextColor3 = w
pingVal.Font = Enum.Font.GothamBold
pingVal.TextSize = 13

local barBg = Instance.new("Frame", pingFrame)
barBg.Size = UDim2.new(0,70,0,10)
barBg.Position = UDim2.new(0,148,0.5,-5)
barBg.BackgroundColor3 = Color3.fromRGB(30,30,40)
barBg.BorderSizePixel = 0
Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)

pingFill = Instance.new("Frame", barBg)
pingFill.Size = UDim2.new(1,0,1,0)
pingFill.BorderSizePixel = 0
Instance.new("UICorner", pingFill).CornerRadius = UDim.new(1,0)

local msLabel = Instance.new("TextLabel", pingFrame)
msLabel.Size = UDim2.new(0,20,1,0)
msLabel.Position = UDim2.new(1,-25,0,0)
msLabel.BackgroundTransparency = 1
msLabel.Text = "ms"
msLabel.TextColor3 = a
msLabel.Font = Enum.Font.GothamBold
msLabel.TextSize = 10

-- PROGRESS BAR
progFrame = Instance.new("Frame", sg)
progFrame.Size = UDim2.new(0,220,0,36)
progFrame.Position = UDim2.new(0.5,-110,1,-85)
progFrame.BackgroundColor3 = Color3.fromRGB(15,15,25)
progFrame.BackgroundTransparency = 0.2
progFrame.BorderSizePixel = 0
Instance.new("UICorner", progFrame).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", progFrame).Color = a

progLabel = Instance.new("TextLabel", progFrame)
progLabel.Size = UDim2.new(0.4,0,0.5,0)
progLabel.Position = UDim2.new(0,10,0,2)
progLabel.BackgroundTransparency = 1
progLabel.Text = "READY"
progLabel.TextColor3 = w
progLabel.Font = Enum.Font.GothamBold
progLabel.TextSize = 10

progPct = Instance.new("TextLabel", progFrame)
progPct.Size = UDim2.new(0.3,0,0.5,0)
progPct.Position = UDim2.new(0.4,0,0,2)
progPct.BackgroundTransparency = 1
progPct.Text = ""
progPct.TextColor3 = a
progPct.Font = Enum.Font.GothamBold
progPct.TextSize = 11

radLabel = Instance.new("TextLabel", progFrame)
radLabel.Size = UDim2.new(0,35,0,12)
radLabel.Position = UDim2.new(1,-70,0,4)
radLabel.BackgroundTransparency = 1
radLabel.Text = "Rad:"
radLabel.TextColor3 = Color3.fromRGB(180,180,200)
radLabel.Font = Enum.Font.GothamBold
radLabel.TextSize = 9

radIn = Instance.new("TextBox", progFrame)
radIn.Size = UDim2.new(0,35,0,12)
radIn.Position = UDim2.new(1,-33,0,4)
radIn.BackgroundTransparency = 1
radIn.Text = tostring(stealR)
radIn.TextColor3 = a
radIn.Font = Enum.Font.GothamBold
radIn.TextSize = 9
radIn.BorderSizePixel = 0
radIn.FocusLost:Connect(function()
    local n = tonumber(radIn.Text)
    if n then stealR = math.clamp(math.floor(n),5,200) radIn.Text = tostring(stealR) end
end)

local progBarBg = Instance.new("Frame", progFrame)
progBarBg.Size = UDim2.new(0.9,0,0,6)
progBarBg.Position = UDim2.new(0.05,0,1,-12)
progBarBg.BackgroundColor3 = Color3.fromRGB(25,25,35)
progBarBg.BorderSizePixel = 0
Instance.new("UICorner", progBarBg).CornerRadius = UDim.new(1,0)

progFill = Instance.new("Frame", progBarBg)
progFill.Size = UDim2.new(0,0,1,0)
progFill.BackgroundColor3 = a
progFill.BorderSizePixel = 0
Instance.new("UICorner", progFill).CornerRadius = UDim.new(1,0)

-- UPDATE PING
task.spawn(function()
    while true do
        task.wait(0.5)
        pcall(function()
            local ping = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            if pingVal then pingVal.Text = ping end
            if pingFill then
                local pct = math.clamp(ping/300,0,1)
                pingFill.Size = UDim2.new(pct,0,1,0)
                if ping<100 then pingFill.BackgroundColor3 = Color3.fromRGB(0,255,100)
                elseif ping<200 then pingFill.BackgroundColor3 = Color3.fromRGB(255,200,0)
                elseif ping<300 then pingFill.BackgroundColor3 = Color3.fromRGB(255,100,0)
                else pingFill.BackgroundColor3 = Color3.fromRGB(255,50,50) end
            end
        end)
    end
end)

-- POSITION LOCK BUTTON
posLockBtn = Instance.new("TextButton", titleBar)
posLockBtn.Size = UDim2.new(0,70,0,28)
posLockBtn.Position = UDim2.new(1,-80,0.5,-14)
posLockBtn.BackgroundColor3 = Color3.fromRGB(40,45,55)
posLockBtn.Text = "🔓 UNLOCK"
posLockBtn.Font = Enum.Font.GothamBold
posLockBtn.TextSize = 9
posLockBtn.TextColor3 = w
posLockBtn.BorderSizePixel = 0
Instance.new("UICorner", posLockBtn).CornerRadius = UDim.new(0,8)

-- SCALING BUTTONS
plusBtn = Instance.new("TextButton", titleBar)
plusBtn.Size = UDim2.new(0,24,0,24)
plusBtn.Position = UDim2.new(1,-52,0.5,-12)
plusBtn.BackgroundColor3 = Color3.fromRGB(30,35,45)
plusBtn.Text = "+"
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextSize = 14
plusBtn.TextColor3 = a
plusBtn.BorderSizePixel = 0
Instance.new("UICorner", plusBtn).CornerRadius = UDim.new(0,6)

minusBtn = Instance.new("TextButton", titleBar)
minusBtn.Size = UDim2.new(0,24,0,24)
minusBtn.Position = UDim2.new(1,-26,0.5,-12)
minusBtn.BackgroundColor3 = Color3.fromRGB(30,35,45)
minusBtn.Text = "-"
minusBtn.Font = Enum.Font.GothamBold
minusBtn.TextSize = 14
minusBtn.TextColor3 = a
minusBtn.BorderSizePixel = 0
Instance.new("UICorner", minusBtn).CornerRadius = UDim.new(0,6)

local gScale = 1.0
local baseW, baseH = 300, 480
plusBtn.MouseButton1Click:Connect(function()
    gScale = math.min(gScale+0.1,2.0)
    mf.Size = UDim2.new(0,baseW*gScale,0,baseH*gScale)
    mf.Position = UDim2.new(0.5,-(baseW*gScale)/2,0.5,-(baseH*gScale)/2)
end)
minusBtn.MouseButton1Click:Connect(function()
    gScale = math.max(gScale-0.1,0.4)
    mf.Size = UDim2.new(0,baseW*gScale,0,baseH*gScale)
    mf.Position = UDim2.new(0.5,-(baseW*gScale)/2,0.5,-(baseH*gScale)/2)
end)

-- DISCORD LINK
discordLbl = Instance.new("TextLabel", mf)
discordLbl.Size = UDim2.new(1,0,0,18)
discordLbl.Position = UDim2.new(0,0,1,-22)
discordLbl.BackgroundTransparency = 1
discordLbl.Text = "discord.gg/5FaWfEvmJ"
discordLbl.Font = Enum.Font.GothamBold
discordLbl.TextSize = 9
discordLbl.TextColor3 = a

-- TAB MENU
tabContainer = Instance.new("Frame", mf)
tabContainer.Size = UDim2.new(1,-20,0,32)
tabContainer.Position = UDim2.new(0,10,0,58)
tabContainer.BackgroundTransparency = 1

local function makeTab(text, xPos)
    local tab = Instance.new("TextButton", tabContainer)
    tab.Size = UDim2.new(0.2,-4,1,0)
    tab.Position = UDim2.new(xPos,2,0,0)
    tab.BackgroundColor3 = Color3.fromRGB(30,30,40)
    tab.Text = text
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 10
    tab.TextColor3 = Color3.fromRGB(160,160,160)
    tab.BorderSizePixel = 0
    Instance.new("UICorner", tab).CornerRadius = UDim.new(0,8)
    return tab
end

featTab = makeTab("FEATURES", 0)
movTab = makeTab("MOVEMENT", 0.2)
visTab = makeTab("VISUALS", 0.4)
setTab = makeTab("SETTINGS", 0.6)
bindTab = makeTab("BINDS", 0.8)

local function makeScrollFrame()
    local sf = Instance.new("ScrollingFrame", mf)
    sf.Size = UDim2.new(1,-20,1,-122)
    sf.Position = UDim2.new(0,10,0,98)
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.ScrollBarThickness = 3
    sf.ScrollBarImageColor3 = a
    sf.CanvasSize = UDim2.new(0,0,0,0)
    sf.AutomaticCanvasSize = Enum.AutomaticSize.Y
    sf.Visible = false
    local layout = Instance.new("UIListLayout", sf)
    layout.Padding = UDim.new(0,6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    return sf
end

featFrame = makeScrollFrame()
movFrame = makeScrollFrame()
visFrame = makeScrollFrame()
setFrame = makeScrollFrame()
bindFrame = makeScrollFrame()
featFrame.Visible = true

frames = {featFrame, movFrame, visFrame, setFrame, bindFrame}
tabs = {featTab, movTab, visTab, setTab, bindTab}

for i, tab in ipairs(tabs) do
    tab.MouseButton1Click:Connect(function()
        for j, f in ipairs(frames) do f.Visible = (i==j) end
        for j, t in ipairs(tabs) do
            t.BackgroundColor3 = (i==j) and a or Color3.fromRGB(30,30,40)
            t.TextColor3 = (i==j) and w or Color3.fromRGB(160,160,160)
        end
    end)
end

-- TOGGLE FUNCTIONS
toggleStates = {}
mobBtnRefs = {}

local function updateToggle(name, state)
    local t = toggleStates[name]
    if t then
        t.state = state
        t.track.BackgroundColor3 = state and a or Color3.fromRGB(30,30,40)
        t.dot.Position = state and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
    end
    if mobBtnRefs[name] then
        ts:Create(mobBtnRefs[name], TweenInfo.new(0.15), {BackgroundColor3 = state and Color3.fromRGB(138,43,226) or Color3.fromRGB(20,20,30)}):Play()
    end
end

local function makeToggle(parent, name, order, callback, defaultOn)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1,0,0,36)
    row.BackgroundColor3 = Color3.fromRGB(18,18,25)
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    Instance.new("UICorner", row).CornerRadius = UDim.new(0,10)
    
    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1,-70,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = w
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local track = Instance.new("Frame", row)
    track.Size = UDim2.new(0,40,0,20)
    track.Position = UDim2.new(1,-52,0.5,-10)
    local initState = (savedT[name] ~= nil) and savedT[name] or (defaultOn or false)
    track.BackgroundColor3 = initState and a or Color3.fromRGB(30,30,40)
    track.BorderSizePixel = 0
    Instance.new("UICorner", track).CornerRadius = UDim.new(1,0)
    
    local dot = Instance.new("Frame", track)
    dot.Size = UDim2.new(0,16,0,16)
    dot.Position = initState and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
    dot.BackgroundColor3 = w
    dot.BorderSizePixel = 0
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
    
    toggleStates[name] = {track=track,dot=dot,state=initState,dotSz=16}
    if initState and callback then task.defer(function() callback(true) end) end
    
    local btn = Instance.new("TextButton", row)
    btn.Size = UDim2.new(1,0,1,0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.MouseButton1Click:Connect(function()
        local ns = not toggleStates[name].state
        toggleStates[name].state = ns
        track.BackgroundColor3 = ns and a or Color3.fromRGB(30,30,40)
        dot.Position = ns and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)
        if callback then callback(ns) end
        savedT[name] = ns
        task.defer(saveCfg)
    end)
    return row
end

local function makeSection(parent, text, order)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(1,0,0,24)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = a
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 10
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = order
end

local function makeNumInput(parent, labelText, defaultVal, order, onChanged)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1,0,0,36)
    row.BackgroundColor3 = Color3.fromRGB(18,18,25)
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    Instance.new("UICorner", row).CornerRadius = UDim.new(0,10)
    
    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1,-90,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = w
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local box = Instance.new("TextBox", row)
    box.Size = UDim2.new(0,60,0,24)
    box.Position = UDim2.new(1,-72,0.5,-12)
    box.BackgroundColor3 = Color3.fromRGB(25,25,35)
    box.Text = tostring(defaultVal)
    box.TextColor3 = a
    box.Font = Enum.Font.GothamBold
    box.TextSize = 11
    box.TextXAlignment = Enum.TextXAlignment.Center
    box.BorderSizePixel = 0
    box.ClearTextOnFocus = false
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)
    box.FocusLost:Connect(function()
        local n = tonumber(box.Text)
        if n then
            if onChanged then onChanged(n) end
            task.defer(saveCfg)
        else
            box.Text = tostring(defaultVal)
        end
    end)
    return row, box
end

-- FEATURES TAB
makeSection(featFrame, "  COMBAT", 1)
makeToggle(featFrame, "Bat Aimbot", 2, function(v)
    if v then
        if aL then stopAutoL() updateToggle("Auto Play Left", false) end
        if aR then stopAutoR() updateToggle("Auto Play Right", false) end
        startBatAimbot()
    else
        stopBatAimbot()
    end
end)
makeToggle(featFrame, "Anti Ragdoll (EclipseX)", 3, function(v) 
    antiR = v 
    if v then 
        startAnti() 
    else 
        stopAnti() 
    end 
end)
makeToggle(featFrame, "Counter Medusa", 4, function(v)
    counterMedusaEnabled = v
    if v then 
        startCounterMedusa()
        local circleBtn = mobBtnRefs["MedusaCircle"]
        if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(255,50,50) end
    else 
        stopCounterMedusa()
        local circleBtn = mobBtnRefs["MedusaCircle"]
        if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(20,20,30) end
    end
end)
makeToggle(featFrame, "Bat Counter (Hit Back)", 5, function(v)
    batCounterEnabled = v
    if v then 
        startBatCounter()
        local circleBtn = mobBtnRefs["BatCounterCircle"]
        if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(255,50,50) end
    else 
        stopBatCounter()
        local circleBtn = mobBtnRefs["BatCounterCircle"]
        if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(20,20,30) end
    end
end)
makeToggle(featFrame, "Ragdoll TP", 6, function(v) ragTP = v if v then startRagTp() else stopRagTp() end end)
makeToggle(featFrame, "Unwalk", 7, function(v) unwalkE = v if v then startUnwalk() else stopUnwalk() end end)
makeSection(featFrame, "  STEAL", 8)
makeToggle(featFrame, "Auto Steal", 9, function(v) stealE = v if v then startAutoSteal() else stopAutoSteal() end end)
makeSection(featFrame, "  SPEED", 10)
makeToggle(featFrame, "Slow Down", 11, function(v) slowE = v end)
makeSection(featFrame, "  DROP", 12)

local dropBtn2 = Instance.new("TextButton", featFrame)
dropBtn2.Size = UDim2.new(1,0,0,36)
dropBtn2.BackgroundColor3 = Color3.fromRGB(25,30,40)
dropBtn2.Text = "▼  DO DROP"
dropBtn2.Font = Enum.Font.GothamBold
dropBtn2.TextSize = 12
dropBtn2.TextColor3 = a
dropBtn2.BorderSizePixel = 0
dropBtn2.LayoutOrder = 13
Instance.new("UICorner", dropBtn2).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", dropBtn2).Color = a
dropBtn2.MouseButton1Click:Connect(function() task.spawn(doDrop) end)

local tpDownBtn = Instance.new("TextButton", featFrame)
tpDownBtn.Size = UDim2.new(1,0,0,36)
tpDownBtn.BackgroundColor3 = Color3.fromRGB(25,30,40)
tpDownBtn.Text = "⬇  TP DOWN"
tpDownBtn.Font = Enum.Font.GothamBold
tpDownBtn.TextSize = 12
tpDownBtn.TextColor3 = a
tpDownBtn.BorderSizePixel = 0
tpDownBtn.LayoutOrder = 14
Instance.new("UICorner", tpDownBtn).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", tpDownBtn).Color = a
tpDownBtn.MouseButton1Click:Connect(function() task.spawn(doTpDown) end)

-- TAUNT SPAM SECTION
makeSection(featFrame, "  TAUNT SPAM", 15)

local tauntRow = Instance.new("Frame", featFrame)
tauntRow.Size = UDim2.new(1,0,0,55)
tauntRow.BackgroundColor3 = Color3.fromRGB(25,30,45)
tauntRow.BorderSizePixel = 0
tauntRow.LayoutOrder = 16
Instance.new("UICorner", tauntRow).CornerRadius = UDim.new(0,12)

local tauntBigBtn = Instance.new("TextButton", tauntRow)
tauntBigBtn.Size = UDim2.new(1,-20,0,40)
tauntBigBtn.Position = UDim2.new(0,10,0.5,-20)
tauntBigBtn.BackgroundColor3 = Color3.fromRGB(138,43,226)
tauntBigBtn.Text = "💬 START TAUNT SPAM"
tauntBigBtn.Font = Enum.Font.GothamBold
tauntBigBtn.TextSize = 13
tauntBigBtn.TextColor3 = w
tauntBigBtn.BorderSizePixel = 0
Instance.new("UICorner", tauntBigBtn).CornerRadius = UDim.new(0,8)

local tauntStatusLabel = Instance.new("TextLabel", tauntRow)
tauntStatusLabel.Size = UDim2.new(0,100,0,20)
tauntStatusLabel.Position = UDim2.new(1,-110,0.5,-10)
tauntStatusLabel.BackgroundTransparency = 1
tauntStatusLabel.Text = "● OFF"
tauntStatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
tauntStatusLabel.Font = Enum.Font.GothamBold
tauntStatusLabel.TextSize = 11

tauntBigBtn.MouseButton1Click:Connect(function()
    if not tauntA then
        startTaunt()
        tauntBigBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
        tauntBigBtn.Text = "🔴 STOP TAUNT SPAM"
        tauntStatusLabel.Text = "● ON"
        tauntStatusLabel.TextColor3 = Color3.fromRGB(100,255,100)
        local circleBtn = mobBtnRefs["TauntCircle"]
        if circleBtn then
            circleBtn.BackgroundColor3 = Color3.fromRGB(138,43,226)
        end
    else
        stopTaunt()
        tauntBigBtn.BackgroundColor3 = Color3.fromRGB(138,43,226)
        tauntBigBtn.Text = "💬 START TAUNT SPAM"
        tauntStatusLabel.Text = "● OFF"
        tauntStatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
        local circleBtn = mobBtnRefs["TauntCircle"]
        if circleBtn then
            circleBtn.BackgroundColor3 = Color3.fromRGB(20,20,30)
        end
    end
end)

-- MOVEMENT TAB
makeSection(movFrame, "  AUTO PLAY", 1)
makeToggle(movFrame, "Auto Play Left", 2, function(v)
    if v then
        if batE then stopBatAimbot() updateToggle("Bat Aimbot", false) end
        if aR then stopAutoR() updateToggle("Auto Play Right", false) end
        aL = true
        startAutoL()
    else
        stopAutoL()
    end
end)
makeToggle(movFrame, "Auto Play Right", 3, function(v)
    if v then
        if batE then stopBatAimbot() updateToggle("Bat Aimbot", false) end
        if aL then stopAutoL() updateToggle("Auto Play Left", false) end
        aR = true
        startAutoR()
    else
        stopAutoR()
    end
end)
makeSection(movFrame, "  HOP", 4)
makeToggle(movFrame, "Hop Mode", 5, function(v) hopE = v end)

-- VISUALS TAB
makeSection(visFrame, "  PLAYER", 1)
makeToggle(visFrame, "Player ESP", 2, function(v) espE = v if v then enableEsp() else disableEsp() end end, true)
makeSection(visFrame, "  PERFORMANCE", 3)
makeToggle(visFrame, "Optimizer + XRay", 4, function(v) optE = v if v then enableOpt() else disableOpt() end end)

-- SETTINGS TAB
makeSection(setFrame, "  SPEEDS", 1)
makeNumInput(setFrame, "Normal Speed", ns, 2, function(v) ns = v end)
makeNumInput(setFrame, "Slow Speed", ss, 3, function(v) ss = v end)
makeSection(setFrame, "  STEAL", 4)
makeNumInput(setFrame, "Steal Radius", stealR, 5, function(v) stealR = math.clamp(v,5,200) end)
makeNumInput(setFrame, "Steal Duration", stealD, 6, function(v) stealD = math.max(0.05,v) end)
makeSection(setFrame, "  HOP", 7)
makeNumInput(setFrame, "Hop Power", hopP, 8, function(v) hopP = v end)
makeSection(setFrame, "  CAMERA / BAT", 9)
makeNumInput(setFrame, "FOV", fovV, 10, function(v) fovV = v applyFov() end)
makeNumInput(setFrame, "Aimbot Speed", aimS, 11, function(v) aimS = v end)
makeNumInput(setFrame, "Engage Range", batR, 12, function(v) batR = v end)
makeSection(setFrame, "  CONFIG", 13)

local saveBtn = Instance.new("TextButton", setFrame)
saveBtn.Size = UDim2.new(1,0,0,36)
saveBtn.BackgroundColor3 = Color3.fromRGB(35,45,35)
saveBtn.Text = "💾  SAVE CONFIG"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 12
saveBtn.TextColor3 = w
saveBtn.BorderSizePixel = 0
saveBtn.LayoutOrder = 14
Instance.new("UICorner", saveBtn).CornerRadius = UDim.new(0,10)
saveBtn.MouseButton1Click:Connect(function()
    saveCfg()
    saveBtn.Text = "✔ SAVED!"
    task.delay(1.5, function() saveBtn.Text = "💾  SAVE CONFIG" end)
end)

-- BINDS TAB
makeSection(bindFrame, "  KEYBINDS (click to rebind)", 1)
local bindHint = Instance.new("TextLabel", bindFrame)
bindHint.Size = UDim2.new(1,0,0,32)
bindHint.BackgroundColor3 = Color3.fromRGB(25,20,35)
bindHint.BackgroundTransparency = 0
bindHint.BorderSizePixel = 0
bindHint.Text = "Click a key button then press\nany key to rebind. CTRL = clear."
bindHint.TextColor3 = Color3.fromRGB(180,170,220)
bindHint.Font = Enum.Font.GothamBold
bindHint.TextSize = 9
bindHint.TextWrapped = true
bindHint.LayoutOrder = 2
Instance.new("UICorner", bindHint).CornerRadius = UDim.new(0,8)

local bindList = {
    {"Auto L", "aL"}, {"Auto R", "aR"}, {"Steal", "steal"},
    {"Bat", "bat"}, {"AntiRD", "anti"}, {"Unwalk", "unwalk"},
    {"Slow", "slow"}, {"RTP", "rag"}, {"Drop", "drop"},
    {"Taunt", "taunt"}, {"TPD", "tp"}, {"Medusa", "medusa"}, {"BatCounter", "batcounter"},
}

for idx, entry in ipairs(bindList) do
    local displayName, keyName = entry[1], entry[2]
    local row = Instance.new("Frame", bindFrame)
    row.Size = UDim2.new(1,0,0,36)
    row.BackgroundColor3 = Color3.fromRGB(18,18,25)
    row.BorderSizePixel = 0
    row.LayoutOrder = idx + 2
    Instance.new("UICorner", row).CornerRadius = UDim.new(0,10)
    
    local nameLbl = Instance.new("TextLabel", row)
    nameLbl.Size = UDim2.new(1,-90,1,0)
    nameLbl.Position = UDim2.new(0,12,0,0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = displayName
    nameLbl.TextColor3 = w
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextSize = 11
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    
    local keyBtn = Instance.new("TextButton", row)
    keyBtn.Size = UDim2.new(0,65,0,24)
    keyBtn.Position = UDim2.new(1,-75,0.5,-12)
    keyBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
    keyBtn.Text = keys[keyName] and tostring(keys[keyName]):gsub("Enum.KeyCode.", "") or "NONE"
    keyBtn.Font = Enum.Font.GothamBold
    keyBtn.TextSize = 10
    keyBtn.TextColor3 = a
    keyBtn.BorderSizePixel = 0
    Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0,6)
    keyBtns[keyName] = keyBtn
    
    keyBtn.MouseButton1Click:Connect(function()
        if changingKey then return end
        changingKey = keyName
        keyBtn.Text = "..."
        keyBtn.TextColor3 = Color3.fromRGB(255,200,50)
        local conn
        conn = uis.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
                    keys[keyName] = nil
                    keyBtn.Text = "NONE"
                else
                    keys[keyName] = input.KeyCode
                    keyBtn.Text = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
                end
                keyBtn.TextColor3 = a
                changingKey = nil
                conn:Disconnect()
                task.defer(saveCfg)
            end
        end)
    end)
end

-- DRAG MAIN FRAME
local mainDrag = false
local mainDragStart = nil
local mainStartPos = nil
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainDragStart = input.Position
        mainStartPos = mf.Position
    end
end)
uis.InputChanged:Connect(function(input)
    if mainDrag and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local d = input.Position - mainDragStart
        mf.Position = UDim2.new(mainStartPos.X.Scale, mainStartPos.X.Offset + d.X, mainStartPos.Y.Scale, mainStartPos.Y.Offset + d.Y)
    end
end)
uis.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        mainDrag = false
    end
end)

-- CIRCLE BUTTONS
local function makeCircleButton(label, row, col, saveKey, action, toggleName)
    local btn = Instance.new("TextButton", sg)
    btn.Size = UDim2.new(0, 85, 0, 40)
    
    local gap = 80
    local startY = -185
    local col1 = -160
    local col2 = -70
    
    if savedPos[saveKey] then
        btn.Position = savedPos[saveKey]
    else
        if col == "left" then
            btn.Position = UDim2.new(1, col1, 0.5, startY + (row * gap))
        else
            btn.Position = UDim2.new(1, col2, 0.5, startY + (row * gap))
        end
    end
    
    btn.Text = label
    btn.BackgroundColor3 = Color3.fromRGB(20,20,30)
    btn.BackgroundTransparency = 0.15
    btn.TextColor3 = w
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextWrapped = true
    btn.BorderSizePixel = 0
    btn.ZIndex = 20
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = a
    stroke.Thickness = 2.5
    stroke.Transparency = 0.2
    
    local glow = Instance.new("UIGradient", stroke)
    glow.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,a),ColorSequenceKeypoint.new(0.5,a2),ColorSequenceKeypoint.new(1,a)})
    
    if toggleName then
        mobBtnRefs[toggleName] = btn
    end
    
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    btn.InputBegan:Connect(function(input)
        if posLock then return end
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = btn.Position
        end
    end)
    
    uis.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            if posLock then
                dragging = false
                return
            end
            local d = input.Position - dragStart
            local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
            btn.Position = newPos
            savedPos[saveKey] = newPos
            task.defer(saveCfg)
        end
    end)
    
    uis.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    btn.MouseButton1Click:Connect(action)
    return btn
end

-- CREATE CIRCLE BUTTONS
makeCircleButton("DROP", 0, "left", "drop", function() task.spawn(doDrop) end, nil)
makeCircleButton("A L", 0, "right", "aL", function()
    local ns = not aL
    if ns then
        if batE then stopBatAimbot() updateToggle("Bat Aimbot", false) end
        if aR then stopAutoR() updateToggle("Auto Play Right", false) end
        aL = true
        startAutoL()
    else
        stopAutoL()
    end
    updateToggle("Auto Play Left", ns)
end, "Auto Play Left")

makeCircleButton("BAT", 1, "left", "bat", function()
    local ns = not batE
    if ns then
        if aL then stopAutoL() updateToggle("Auto Play Left", false) end
        if aR then stopAutoR() updateToggle("Auto Play Right", false) end
        startBatAimbot()
    else
        stopBatAimbot()
    end
    updateToggle("Bat Aimbot", ns)
end, "Bat Aimbot")

makeCircleButton("A R", 1, "right", "aR", function()
    local ns = not aR
    if ns then
        if batE then stopBatAimbot() updateToggle("Bat Aimbot", false) end
        if aL then stopAutoL() updateToggle("Auto Play Left", false) end
        aR = true
        startAutoR()
    else
        stopAutoR()
    end
    updateToggle("Auto Play Right", ns)
end, "Auto Play Right")

makeCircleButton("SLOW", 2, "left", "slow", function()
    local ns = not slowE
    slowE = ns
    updateToggle("Slow Down", ns)
end, "Slow Down")

makeCircleButton("TP", 2, "right", "tp", function() task.spawn(doTpDown) end, nil)

-- TAUNT CIRCLE BUTTON
makeCircleButton("TNT", 3, "right", "tauntcircle", function()
    if not tauntA then 
        startTaunt()
        local btn = mobBtnRefs["TauntCircle"]
        if btn then
            btn.BackgroundColor3 = Color3.fromRGB(138,43,226)
        end
        if tauntBigBtn then
            tauntBigBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
            tauntBigBtn.Text = "🔴 STOP TAUNT SPAM"
            tauntStatusLabel.Text = "● ON"
            tauntStatusLabel.TextColor3 = Color3.fromRGB(100,255,100)
        end
    else 
        stopTaunt()
        local btn = mobBtnRefs["TauntCircle"]
        if btn then
            btn.BackgroundColor3 = Color3.fromRGB(20,20,30)
        end
        if tauntBigBtn then
            tauntBigBtn.BackgroundColor3 = Color3.fromRGB(138,43,226)
            tauntBigBtn.Text = "💬 START TAUNT SPAM"
            tauntStatusLabel.Text = "● OFF"
            tauntStatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
        end
    end
end, "TauntCircle")

-- COUNTER MEDUSA CIRCLE BUTTON
makeCircleButton("MED", 3, "left", "medusa", function()
    counterMedusaEnabled = not counterMedusaEnabled
    if counterMedusaEnabled then 
        startCounterMedusa()
        local btn = mobBtnRefs["MedusaCircle"]
        if btn then
            btn.BackgroundColor3 = Color3.fromRGB(255,50,50)
            btn.Text = "MED"
        end
        updateToggle("Counter Medusa", true)
    else 
        stopCounterMedusa()
        local btn = mobBtnRefs["MedusaCircle"]
        if btn then
            btn.BackgroundColor3 = Color3.fromRGB(20,20,30)
            btn.Text = "MED"
        end
        updateToggle("Counter Medusa", false)
    end
end, "MedusaCircle")

-- BAT COUNTER CIRCLE BUTTON
makeCircleButton("BCTR", 4, "left", "batcounter", function()
    batCounterEnabled = not batCounterEnabled
    if batCounterEnabled then 
        startBatCounter()
        local btn = mobBtnRefs["BatCounterCircle"]
        if btn then
            btn.BackgroundColor3 = Color3.fromRGB(255,50,50)
            btn.Text = "BCTR"
        end
        updateToggle("Bat Counter (Hit Back)", true)
    else 
        stopBatCounter()
        local btn = mobBtnRefs["BatCounterCircle"]
        if btn then
            btn.BackgroundColor3 = Color3.fromRGB(20,20,30)
            btn.Text = "BCTR"
        end
        updateToggle("Bat Counter (Hit Back)", false)
    end
end, "BatCounterCircle")

-- POSITION LOCK FUNCTION
posLockBtn.MouseButton1Click:Connect(function()
    posLock = not posLock
    if posLock then
        posLockBtn.Text = "🔒 LOCK"
        posLockBtn.BackgroundColor3 = Color3.fromRGB(60,45,45)
    else
        posLockBtn.Text = "🔓 UNLOCK"
        posLockBtn.BackgroundColor3 = Color3.fromRGB(40,50,55)
    end
end)

-- APEX BUTTON
local apexBtn = Instance.new("TextButton", sg)
apexBtn.Size = UDim2.new(0, 85, 0, 40)
apexBtn.Position = UDim2.new(0, 15, 0.5, -22)
apexBtn.BackgroundColor3 = Color3.fromRGB(10,10,18)
apexBtn.BackgroundTransparency = 0.2
apexBtn.Text = "APEX"
apexBtn.TextSize = 14
apexBtn.Font = Enum.Font.GothamBold
apexBtn.TextColor3 = w
apexBtn.BorderSizePixel = 0
Instance.new("UICorner", apexBtn).CornerRadius = UDim.new(0, 10)

local apexStroke = Instance.new("UIStroke", apexBtn)
apexStroke.Color = a
apexStroke.Thickness = 2.5
apexStroke.Transparency = 0.2

local apexGlow = Instance.new("UIGradient", apexStroke)
apexGlow.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,a),ColorSequenceKeypoint.new(0.5,a2),ColorSequenceKeypoint.new(1,a)})

task.spawn(function()
    while apexBtn and apexBtn.Parent do
        for i=0,20 do apexStroke.Thickness = 2.5 + i*0.05 task.wait(0.04) end
        for i=0,20 do apexStroke.Thickness = 3.5 - i*0.05 task.wait(0.04) end
    end
end)

local apexDrag = false
local apexDragStart = nil
local apexStartPos = nil
apexBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        apexDrag = true
        apexDragStart = input.Position
        apexStartPos = apexBtn.Position
    end
end)
uis.InputChanged:Connect(function(input)
    if apexDrag and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local d = input.Position - apexDragStart
        apexBtn.Position = UDim2.new(apexStartPos.X.Scale, apexStartPos.X.Offset + d.X, apexStartPos.Y.Scale, apexStartPos.Y.Offset + d.Y)
    end
end)
uis.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        apexDrag = false
    end
end)
apexBtn.MouseButton1Click:Connect(function()
    mf.Visible = not mf.Visible
    if mf.Visible then blur.Size = 12 else blur.Size = 0 end
end)

-- FPS AND PING
local fpsLbl = Instance.new("TextLabel", titleBar)
fpsLbl.Size = UDim2.new(0,55,0,14)
fpsLbl.Position = UDim2.new(0,12,0,4)
fpsLbl.BackgroundTransparency = 1
fpsLbl.Text = "0 FPS"
fpsLbl.Font = Enum.Font.GothamBold
fpsLbl.TextSize = 10
fpsLbl.TextColor3 = a
fpsLbl.TextXAlignment = Enum.TextXAlignment.Left

local pingLbl2 = Instance.new("TextLabel", titleBar)
pingLbl2.Size = UDim2.new(0,55,0,14)
pingLbl2.Position = UDim2.new(1,-67,0,4)
pingLbl2.BackgroundTransparency = 1
pingLbl2.Text = "0ms"
pingLbl2.Font = Enum.Font.GothamBold
pingLbl2.TextSize = 10
pingLbl2.TextColor3 = a
pingLbl2.TextXAlignment = Enum.TextXAlignment.Right

local fc, lft = 0, tick()
rs.RenderStepped:Connect(function()
    fc = fc + 1
    local ct = tick()
    if ct - lft >= 1 then
        fpsLbl.Text = fc .. " FPS"
        fc = 0
        lft = ct
    end
    pcall(function()
        pingLbl2.Text = math.floor(stats.Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms"
    end)
end)

-- KEYBIND HANDLER
uis.InputBegan:Connect(function(input, processed)
    if processed then return end
    if changingKey then return end
    if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
    
    if keys.aL and input.KeyCode == keys.aL then
        local ns = not aL
        if ns then
            if batE then stopBatAimbot() updateToggle("Bat Aimbot", false) end
            if aR then stopAutoR() updateToggle("Auto Play Right", false) end
            aL = true
            startAutoL()
        else
            stopAutoL()
        end
        updateToggle("Auto Play Left", ns)
    elseif keys.aR and input.KeyCode == keys.aR then
        local ns = not aR
        if ns then
            if batE then stopBatAimbot() updateToggle("Bat Aimbot", false) end
            if aL then stopAutoL() updateToggle("Auto Play Left", false) end
            aR = true
            startAutoR()
        else
            stopAutoR()
        end
        updateToggle("Auto Play Right", ns)
    elseif keys.steal and input.KeyCode == keys.steal then
        local ns = not stealE
        stealE = ns
        if ns then startAutoSteal() else stopAutoSteal() end
        updateToggle("Auto Steal", ns)
    elseif keys.bat and input.KeyCode == keys.bat then
        local ns = not batE
        if ns then
            if aL then stopAutoL() updateToggle("Auto Play Left", false) end
            if aR then stopAutoR() updateToggle("Auto Play Right", false) end
            startBatAimbot()
        else
            stopBatAimbot()
        end
        updateToggle("Bat Aimbot", ns)
    elseif keys.anti and input.KeyCode == keys.anti then
        local ns = not antiR
        antiR = ns
        if ns then startAnti() else stopAnti() end
        updateToggle("Anti Ragdoll (EclipseX)", ns)
    elseif keys.medusa and input.KeyCode == keys.medusa then
        counterMedusaEnabled = not counterMedusaEnabled
        if counterMedusaEnabled then 
            startCounterMedusa()
            local circleBtn = mobBtnRefs["MedusaCircle"]
            if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(255,50,50) end
        else 
            stopCounterMedusa()
            local circleBtn = mobBtnRefs["MedusaCircle"]
            if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(20,20,30) end
        end
        updateToggle("Counter Medusa", counterMedusaEnabled)
    elseif keys.batcounter and input.KeyCode == keys.batcounter then
        batCounterEnabled = not batCounterEnabled
        if batCounterEnabled then 
            startBatCounter()
            local circleBtn = mobBtnRefs["BatCounterCircle"]
            if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(255,50,50) end
        else 
            stopBatCounter()
            local circleBtn = mobBtnRefs["BatCounterCircle"]
            if circleBtn then circleBtn.BackgroundColor3 = Color3.fromRGB(20,20,30) end
        end
        updateToggle("Bat Counter (Hit Back)", batCounterEnabled)
    elseif keys.unwalk and input.KeyCode == keys.unwalk then
        local ns = not unwalkE
        unwalkE = ns
        if ns then startUnwalk() else stopUnwalk() end
        updateToggle("Unwalk", ns)
    elseif keys.slow and input.KeyCode == keys.slow then
        local ns = not slowE
        slowE = ns
        updateToggle("Slow Down", ns)
    elseif keys.rag and input.KeyCode == keys.rag then
        local ns = not ragTP
        ragTP = ns
        if ns then startRagTp() else stopRagTp() end
        updateToggle("Ragdoll TP", ns)
    elseif keys.drop and input.KeyCode == keys.drop then
        task.spawn(doDrop)
    elseif keys.taunt and input.KeyCode == keys.taunt then
        if not tauntA then 
            startTaunt()
            if tauntBigBtn then
                tauntBigBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
                tauntBigBtn.Text = "🔴 STOP TAUNT SPAM"
                tauntStatusLabel.Text = "● ON"
                tauntStatusLabel.TextColor3 = Color3.fromRGB(100,255,100)
            end
            local circleBtn = mobBtnRefs["TauntCircle"]
            if circleBtn then
                circleBtn.BackgroundColor3 = Color3.fromRGB(138,43,226)
            end
        else 
            stopTaunt()
            if tauntBigBtn then
                tauntBigBtn.BackgroundColor3 = Color3.fromRGB(138,43,226)
                tauntBigBtn.Text = "💬 START TAUNT SPAM"
                tauntStatusLabel.Text = "● OFF"
                tauntStatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
            end
            local circleBtn = mobBtnRefs["TauntCircle"]
            if circleBtn then
                circleBtn.BackgroundColor3 = Color3.fromRGB(20,20,30)
            end
        end
    elseif keys.tp and input.KeyCode == keys.tp then
        task.spawn(doTpDown)
    end
end)

-- FINAL SETUP
if espE then enableEsp() end
if antiR then startAnti() end
if counterMedusaEnabled then startCounterMedusa() end
if batCounterEnabled then startBatCounter() end
applyFov()
print("=== APEX HUB LOADED! ===")
print("✅ EclipseX Anti-Ragdoll - Original version")
print("✅ Counter Medusa - Press M or click MED button")
print("✅ Bat Counter - Press B or click BCTR button (hit back when attacked)")
print("✅ Bat Aimbot - Continuous")
print("Circle buttons: DROP, A L, BAT, A R, SLOW, TP, TNT, MED, BCTR")
