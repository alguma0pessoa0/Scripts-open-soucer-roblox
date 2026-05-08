local resizedBat = nil

local function getBat()
    if resizedBat and resizedBat.Parent then
        return resizedBat
    end

    -- Buscar en la mochila
    local Backpack = LP:FindFirstChild("Backpack")
    if Backpack then
        for _, tool in ipairs(Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.Name:lower() == "bat" then
                if tool:FindFirstChild("Handle") then
                    tool.Handle.Size = Vector3.new(1000,1000,1000)
                    resizedBat = tool
                    return tool
                end
            end
        end
    end

    -- Buscar en el personaje
    if LP.Character then
        for _, tool in ipairs(LP.Character:GetChildren()) do
            if tool:IsA("Tool") and tool.Name:lower() == "bat" then
                if tool:FindFirstChild("Handle") then
                    tool.Handle.Size = Vector3.new(1000,1000,1000)
                    resizedBat = tool
                    return tool
                end
            end
        end
    end
    return nil
end

local function attackSentry(sentry)
    task.wait(4)

    while sentry.Parent and autoSentryEnabled do
        local bat = getBat()
        if bat and LP.Character and LP.Character:FindFirstChild("Humanoid") then
            if LP.Character.Humanoid.Health > 0 then
                LP.Character.Humanoid:EquipTool(bat)
            end

            bat:Activate()
        end
        task.wait(0.1)
    end

    if LP.Character and LP.Character:FindFirstChild("Humanoid") then
        LP.Character.Humanoid:UnequipTools()
    end
end

local function toggleAutoSentry(Value)
    autoSentryEnabled = Value
    optAutoSentry.Text = autoSentryEnabled and "⚙️ Auto Sentry Destroy: ON" or "⚙️ Auto Sentry Destroy: OFF"

    if Value then
        task.spawn(function()
            while autoSentryEnabled do
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj.Name:sub(1,6):lower() == "sentry" then
                        -- Asegurarse de que no sea la torre del propio jugador
                        if not obj.Name:find(tostring(currentUserId)) then 
                            task.spawn(function()
                                attackSentry(obj)
                            end)
                        end
                    end
                end
                task.wait(1)
            end
        end)
    end
end

optAutoSentry.MouseButton1Click:Connect(function()
    toggleAutoSentry(not autoSentryEnabled)
end)

