_G.AutoStoreFruit = _G.AutoStoreFruit ~= false

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local PLACE_ID = game.PlaceId

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.38, 0.13)
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.Position = UDim2.fromScale(0.5, -0.3)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Visible = false

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.4)
title.BackgroundTransparency = 1
title.Text = "AkunDisco Continued"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true

local desc = Instance.new("TextLabel", frame)
desc.Position = UDim2.fromScale(0,0.45)
desc.Size = UDim2.fromScale(1,0.5)
desc.BackgroundTransparency = 1
desc.Font = Enum.Font.Gotham
desc.TextColor3 = Color3.fromRGB(220,220,220)
desc.TextScaled = true
desc.TextWrapped = true

local function notify(text, time)
	time = time or 2.5
	desc.Text = text
	frame.Visible = true
	frame.Position = UDim2.fromScale(0.5, -0.3)

	TweenService:Create(frame, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {
		Position = UDim2.fromScale(0.5, 0.05)
	}):Play()

	task.delay(time, function()
		local t = TweenService:Create(frame, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {
			Position = UDim2.fromScale(0.5, -0.3)
		})
		t:Play()
		t.Completed:Wait()
		frame.Visible = false
	end)
end

local function serverHop()
	local servers = {}
	pcall(function()
		local url = "https://games.roblox.com/v1/games/"..PLACE_ID.."/servers/Public?sortOrder=Asc&limit=100"
		local data = HttpService:JSONDecode(game:HttpGet(url))
		for _,v in pairs(data.data or {}) do
			if v.playing < v.maxPlayers then
				table.insert(servers, v.id)
			end
		end
	end)
	if #servers > 0 then
		TeleportService:TeleportToPlaceInstance(PLACE_ID, servers[math.random(#servers)], player)
	end
end

local function findFruit()
	for _,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Model") and (v.Name == "Fruit" or v.Name == "fruit") then
			local p = v:FindFirstChildWhichIsA("BasePart")
			if p then return p end
		end
	end
end

local function moveToFruit(part)
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	for _,v in ipairs(char:GetDescendants()) do
		if v:IsA("BasePart") then v.CanCollide = false end
	end

	local att = Instance.new("Attachment", hrp)
	local lv = Instance.new("LinearVelocity", hrp)
	lv.Attachment0 = att
	lv.MaxForce = math.huge
	lv.RelativeTo = Enum.ActuatorRelativeTo.World

	lv.VectorVelocity = Vector3.new(0,45,0)
	task.wait(0.4)
	lv.VectorVelocity = (part.Position - hrp.Position).Unit * 65

	RunService.RenderStepped:Connect(function()
		lv.VectorVelocity = Vector3.new(lv.VectorVelocity.X,0,lv.VectorVelocity.Z)
		for _,v in ipairs(char:GetDescendants()) do
			if v:IsA("BasePart") then v.CanCollide = false end
		end
	end)
end

task.spawn(function()
	while task.wait(0.2) do
		if _G.AutoStoreFruit then
			pcall(function()
				local char = player.Character
				if not char then return end
				local hum = char:FindFirstChildOfClass("Humanoid")
				for _,tool in ipairs(player.Backpack:GetChildren()) do
					if tool:IsA("Tool") then
						local n = tool.Name:lower()
						if n:find("fruit") or n:find("fruot") then
							hum:EquipTool(tool)
							break
						end
					end
				end
			end)
		end
	end
end)

task.spawn(function()
	task.wait(3)
	while true do
		local fruit = findFruit()
		if fruit then
			notify("Fruit Found! Auto getting fruit....")
			moveToFruit(fruit)
		else
			notify("Fruit not found! Serverhopping in 3 seconds...", 3)
			task.wait(3)
			serverHop()
		end
		task.wait(2)
	end
end)