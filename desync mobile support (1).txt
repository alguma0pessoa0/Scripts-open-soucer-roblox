local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local enabled = false
local didReset = false


local gui = Instance.new("ScreenGui")
gui.Name = "skyr0Scripts"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,240,0,130)
frame.Position = UDim2.new(0,40,0,200)
frame.BackgroundColor3 = Color3.fromRGB(18,18,22)
frame.BorderSizePixel = 0
frame.Parent = gui
Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(120,120,255)
stroke.Thickness = 1
stroke.Parent = frame


local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1,0,0,32)
titleBar.BackgroundColor3 = Color3.fromRGB(28,28,35)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame
Instance.new("UICorner",titleBar).CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-40,1,0)
title.Position = UDim2.new(0,10,0,0)
title.BackgroundTransparency = 1
title.Text = "desync by smiley"
title.TextColor3 = Color3.fromRGB(230,230,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar


local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0,24,0,24)
minimize.Position = UDim2.new(1,-30,0,4)
minimize.Text = "-"
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 16
minimize.BackgroundColor3 = Color3.fromRGB(45,45,55)
minimize.TextColor3 = Color3.new(1,1,1)
minimize.Parent = titleBar
Instance.new("UICorner",minimize).CornerRadius = UDim.new(0,6)


local reopen = Instance.new("TextButton")
reopen.Size = UDim2.new(0,120,0,32)
reopen.Position = UDim2.new(0,20,0,200)
reopen.Text = "desync:3"
reopen.Visible = false
reopen.Font = Enum.Font.GothamBold
reopen.TextSize = 14
reopen.BackgroundColor3 = Color3.fromRGB(35,35,45)
reopen.TextColor3 = Color3.new(1,1,1)
reopen.Parent = gui
Instance.new("UICorner",reopen).CornerRadius = UDim.new(0,8)

minimize.MouseButton1Click:Connect(function()
	frame.Visible = false
	reopen.Visible = true
end)

reopen.MouseButton1Click:Connect(function()
	frame.Visible = true
	reopen.Visible = false
end)


local status = Instance.new("TextLabel")
status.Position = UDim2.new(0,0,0,42)
status.Size = UDim2.new(1,0,0,20)
status.BackgroundTransparency = 1
status.Text = "RakNet Desync: OFF"
status.TextColor3 = Color3.fromRGB(200,200,200)
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.Parent = frame


local button = Instance.new("TextButton")
button.Size = UDim2.new(0.85,0,0,36)
button.Position = UDim2.new(0.075,0,0,72)
button.Text = "Enable"
button.BackgroundColor3 = Color3.fromRGB(170,50,50)
button.TextColor3 = Color3.new(1,1,1)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.BorderSizePixel = 0
button.Parent = frame
Instance.new("UICorner",button).CornerRadius = UDim.new(0,8)


local function resetCharacter()
	local char = player.Character
	if not char then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.Health = 0
	end
end


button.MouseButton1Click:Connect(function()
	enabled = not enabled
	
	if enabled then
		button.Text = "Disable"
		button.BackgroundColor3 = Color3.fromRGB(60,170,90)
		status.Text = "RakNet Desync: ON"

		raknet.desync(true)

		if not didReset then
			didReset = true
			resetCharacter()
		end
	else
		button.Text = "Enable"
		button.BackgroundColor3 = Color3.fromRGB(170,50,50)
		status.Text = "RakNet Desync: OFF"

		raknet.desync(false)
	end
end)


local dragging
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

titleBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (
		input.UserInputType == Enum.UserInputType.MouseMovement or
		input.UserInputType == Enum.UserInputType.Touch
	) then
		
		local delta = input.Position - dragStart
		
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)