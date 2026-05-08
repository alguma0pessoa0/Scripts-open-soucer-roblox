local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local lp = Players.LocalPlayer
local lagEnabled = false
local speedEnabled = false
local lagAmount = 0.1
local speedAmount = 30
local lagKeybind = nil
local speedKeybind = nil
local waitingLag = false
local waitingSpeed = false
local minimized = false
local sliderDragging = false

local COL_BG = Color3.fromRGB(12, 16, 35)
local COL_ROW = Color3.fromRGB(20, 25, 50)
local COL_TOGGLE = Color3.fromRGB(30, 40, 70)
local COL_BLUE = Color3.fromRGB(0, 120, 255)

local STROKE_COLORS = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 30, 80)),
	ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 120, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
	ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 120, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 30, 80)),
})

local allStrokeGrads = {}

local function addAnimatedStroke(parent, thickness)
	local s = Instance.new("UIStroke")
	s.Thickness = thickness or 1
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Color = Color3.new(1, 1, 1)
	s.Parent = parent

	local g = Instance.new("UIGradient")
	g.Color = STROKE_COLORS
	g.Rotation = 45
	g.Parent = s

	table.insert(allStrokeGrads, g)
	return s, g
end

if not CoreGui:FindFirstChild("HiddenUI") then
	local f = Instance.new("Folder")
	f.Name = "HiddenUI"
	f.Parent = CoreGui
end
if CoreGui.HiddenUI:FindFirstChild("IceHub_SpeedBypass") then
	CoreGui.HiddenUI.IceHub_SpeedBypass:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "IceHub_SpeedBypass"
gui.ResetOnSpawn = false
gui.Parent = CoreGui.HiddenUI

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 200, 0, 210)
main.Position = UDim2.new(0.5, -100, 0.5, -105)
main.BackgroundColor3 = COL_BG
main.BackgroundTransparency = 0.4
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Active = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
addAnimatedStroke(main, 2)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 20)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Ice Hub"
title.Font = Enum.Font.GothamBlack
title.TextSize = 15
title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local titleGrad = Instance.new("UIGradient")
titleGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 120, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 255)),
})
titleGrad.Parent = title

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -40, 0, 15)
subtitle.Position = UDim2.new(0, 10, 0, 23)
subtitle.BackgroundTransparency = 1
subtitle.Text = "speed bypass"
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 11
subtitle.TextColor3 = Color3.new(1, 1, 1)
subtitle.TextTransparency = 0.5
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = main

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 24, 0, 24)
minBtn.Position = UDim2.new(1, -32, 0, 8)
minBtn.BackgroundColor3 = COL_TOGGLE
minBtn.Text = "-"
minBtn.TextColor3 = Color3.new(1, 1, 1)
minBtn.Font = Enum.Font.GothamBlack
minBtn.TextSize = 14
minBtn.BorderSizePixel = 0
minBtn.AutoButtonColor = false
minBtn.Parent = main

Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)
addAnimatedStroke(minBtn, 1)

minBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
		Size = minimized and UDim2.new(0, 200, 0, 40) or UDim2.new(0, 200, 0, 210)
	}):Play()
	minBtn.Text = minimized and "+" or "-"
end)

local function makeRow(yPos, labelText)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, -20, 0, 34)
	row.Position = UDim2.new(0, 10, 0, yPos)
	row.BackgroundColor3 = COL_ROW
	row.BorderSizePixel = 0
	row.Parent = main
	Instance.new("UICorner", row)
	addAnimatedStroke(row, 1)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -100, 1, 0)
	lbl.Position = UDim2.new(0, 10, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = labelText
	lbl.Font = Enum.Font.GothamBlack
	lbl.TextSize = 13
	lbl.TextColor3 = Color3.new(1, 1, 1)
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = row

	local kbBtn = Instance.new("TextButton")
	kbBtn.Size = UDim2.new(0, 35, 0, 18)
	kbBtn.Position = UDim2.new(1, -86, 0.5, -9)
	kbBtn.BackgroundColor3 = COL_TOGGLE
	kbBtn.Text = "[...]"
	kbBtn.TextColor3 = Color3.new(1, 1, 1)
	kbBtn.Font = Enum.Font.GothamBold
	kbBtn.TextSize = 10
	kbBtn.BorderSizePixel = 0
	kbBtn.AutoButtonColor = false
	kbBtn.Parent = row
	Instance.new("UICorner", kbBtn).CornerRadius = UDim.new(0, 4)

	local track = Instance.new("Frame")
	track.Size = UDim2.new(0, 36, 0, 18)
	track.Position = UDim2.new(1, -46, 0.5, -9)
	track.BackgroundColor3 = COL_TOGGLE
	track.BorderSizePixel = 0
	track.Parent = row
	Instance.new("UICorner", track).CornerRadius = UDim.new(0, 9)
	addAnimatedStroke(track, 1)

	local knob = Instance.new("Frame")
	knob.Size = UDim2.new(0, 14, 0, 14)
	knob.Position = UDim2.new(0, 2, 0.5, -7)
	knob.BackgroundColor3 = Color3.new(1, 1, 1)
	knob.BorderSizePixel = 0
	knob.Parent = track
	Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 7)

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 46, 1, 0)
	btn.Position = UDim2.new(1, -46, 0, 0)
	btn.BackgroundTransparency = 1
	btn.Text = ""
	btn.Parent = row

	return row, btn, knob, track, kbBtn
end

local function makeSlider(yPos, labelText, min, max, default, formatFn, onChange)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, -20, 0, 30)
	container.Position = UDim2.new(0, 10, 0, yPos)
	container.BackgroundTransparency = 1
	container.Parent = main

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 0, 14)
	lbl.Position = UDim2.new(0, 0, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = formatFn(default)
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 10
	lbl.TextColor3 = Color3.new(1, 1, 1)
	lbl.TextTransparency = 0.3
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = container

	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(1, 0, 0, 5)
	bar.Position = UDim2.new(0, 0, 0, 18)
	bar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	bar.BorderSizePixel = 0
	bar.Parent = container
	Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

	local startRel = (default - min) / (max - min)

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new(startRel, 0, 1, 0)
	fill.BackgroundColor3 = COL_BLUE
	fill.BorderSizePixel = 0
	fill.Parent = bar
	Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

	local knobS = Instance.new("Frame")
	knobS.Size = UDim2.new(0, 10, 0, 10)
	knobS.AnchorPoint = Vector2.new(0.5, 0.5)
	knobS.Position = UDim2.new(startRel, 0, 0.5, 0)
	knobS.BackgroundColor3 = Color3.new(1, 1, 1)
	knobS.BorderSizePixel = 0
	knobS.Parent = bar
	Instance.new("UICorner", knobS).CornerRadius = UDim.new(1, 0)

	local thisSliderDragging = false

	bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			thisSliderDragging = true
			sliderDragging = true
		end
	end)

	knobS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			thisSliderDragging = true
			sliderDragging = true
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if thisSliderDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local rel = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
			rel = math.floor(rel * 180) / 180
			fill.Size = UDim2.new(rel, 0, 1, 0)
			knobS.Position = UDim2.new(rel, 0, 0.5, 0)
			local val = min + rel * (max - min)
			lbl.Text = formatFn(val)
			onChange(val)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			if thisSliderDragging then
				thisSliderDragging = false
				sliderDragging = false
			end
		end
	end)

	return container
end

local _, lagBtn, lagKnob, lagTrack, lagKbBtn = makeRow(48, "Lag")

lagBtn.MouseButton1Click:Connect(function()
	lagEnabled = not lagEnabled
	TweenService:Create(lagKnob, TweenInfo.new(0.15), {
		Position = lagEnabled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
	}):Play()
	TweenService:Create(lagTrack, TweenInfo.new(0.15), {
		BackgroundColor3 = lagEnabled and COL_BLUE or COL_TOGGLE
	}):Play()
end)

lagKbBtn.MouseButton1Click:Connect(function()
	waitingLag = true
	lagKbBtn.Text = "[...]"
end)

local _, speedBtn, speedKnob, speedTrack, speedKbBtn = makeRow(88, "Speed")

speedBtn.MouseButton1Click:Connect(function()
	speedEnabled = not speedEnabled
	TweenService:Create(speedKnob, TweenInfo.new(0.15), {
		Position = speedEnabled and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
	}):Play()
	TweenService:Create(speedTrack, TweenInfo.new(0.15), {
		BackgroundColor3 = speedEnabled and COL_BLUE or COL_TOGGLE
	}):Play()
end)

speedKbBtn.MouseButton1Click:Connect(function()
	waitingSpeed = true
	speedKbBtn.Text = "[...]"
end)

makeSlider(128, "Lag Power", 0, 0.2, lagAmount, function(v)
	return string.format("Lag Power: %d%%", math.floor(v / 0.2 * 150))
end, function(v)
	lagAmount = v
end)

makeSlider(162, "Speed", 16, 70, speedAmount, function(v)
	return string.format("Speed: %d", math.floor(v))
end, function(v)
	speedAmount = v
end)

UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if waitingLag then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			lagKeybind = input.KeyCode
			lagKbBtn.Text = "[" .. lagKeybind.Name .. "]"
			waitingLag = false
		end
		return
	end
	if waitingSpeed then
		if input.UserInputType == Enum.UserInputType.Keyboard then
			speedKeybind = input.KeyCode
			speedKbBtn.Text = "[" .. speedKeybind.Name .. "]"
			waitingSpeed = false
		end
		return
	end
	if lagKeybind and input.KeyCode == lagKeybind then
		lagBtn.MouseButton1Click:Fire()
	end
	if speedKeybind and input.KeyCode == speedKeybind then
		speedBtn.MouseButton1Click:Fire()
	end
end)

do
	local dragging = false
	local dragStart = nil
	local startPos = nil

	main.InputBegan:Connect(function(input)
		if sliderDragging then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if sliderDragging then dragging = false return end
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			local viewport = workspace.CurrentCamera.ViewportSize
			local newX = math.clamp(startPos.X.Offset + delta.X, 0, viewport.X - main.AbsoluteSize.X)
			local newY = math.clamp(startPos.Y.Offset + delta.Y, 0, viewport.Y - main.AbsoluteSize.Y)
			main.Position = UDim2.new(0, newX, 0, newY)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

RunService.RenderStepped:Connect(function()
	local offset = Vector2.new(math.sin(tick() * 1.5), 0)
	for _, g in ipairs(allStrokeGrads) do
		g.Offset = offset
	end
end)

RunService.RenderStepped:Connect(function()
	if not speedEnabled then return end
	local char = lp.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then return end

	if hum.MoveDirection.Magnitude > 0 then
		local dir = hum.MoveDirection.Unit
		hrp.AssemblyLinearVelocity = Vector3.new(
			dir.X * speedAmount,
			hrp.AssemblyLinearVelocity.Y,
			dir.Z * speedAmount
		)
	end
end)

RunService.RenderStepped:Connect(function()
	if lagEnabled and lagAmount > 0 then
		local t = tick()
		while tick() - t < lagAmount do end
	end
end)