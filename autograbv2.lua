print("made by ylzk on dc")

local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")

local player = Players.LocalPlayer

--love yall (syko + light = best couple uwu)
local sykoandlight = true
local bestcouple = 2 -- seconds

--avoids dups
local activeHolds = {}

ProximityPromptService.PromptShown:Connect(function(prompt)
	if not sykoandlight then return end
	if not prompt:IsA("ProximityPrompt") then return end
	if activeHolds[prompt] then return end

	activeHolds[prompt] = true

	--forces hold dur
	prompt.HoldDuration = bestcouple

	task.spawn(function()
		--small delay so roblox registers the prompt
		task.wait(0.05)

		--start
		pcall(function()
			prompt:InputHoldBegin()
		end)

		local startTime = tick()

		--waits for the full hold duration
		while tick() - startTime < bestcouple do
			--stop if prompt disappears
			if not activeHolds[prompt] then
				return
			end
			task.wait(0.1)
		end

		--ends hold
		pcall(function()
			prompt:InputHoldEnd()
		end)

		activeHolds[prompt] = nil
	end)
end)

ProximityPromptService.PromptHidden:Connect(function(prompt)
	--cancels hold 
	activeHolds[prompt] = nil
end)

print("made by @ylzk on dc")
