-- ============================================================
-- UNHERE HUB  •  Anti Die
-- ============================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

--------------------------------------------------------------------------------
-- 1. HEAD WATERMARK
--------------------------------------------------------------------------------
local function setupWatermark(character)
	local head = character:WaitForChild("Head")
	if head:FindFirstChild("HeadWatermark") then
		head.HeadWatermark:Destroy()
	end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "HeadWatermark"
	billboard.Size = UDim2.new(0, 220, 0, 36)
	billboard.StudsOffset = Vector3.new(0, 2.6, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = head

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "UNHERE HUB"
	textLabel.TextColor3 = Color3.fromRGB(220, 30, 40)
	textLabel.TextSize = 16
	textLabel.Font = Enum.Font.GothamBlack
	textLabel.TextXAlignment = Enum.TextXAlignment.Center
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.Parent = billboard
end

local currentCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
setupWatermark(currentCharacter)
LocalPlayer.CharacterAdded:Connect(setupWatermark)

--------------------------------------------------------------------------------
-- 2. GUI
--------------------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UnhereHubAntiDie"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Floating Button (rectangular + full text)
local MobileButton = Instance.new("Frame")
MobileButton.Name = "MobileButton"
MobileButton.Active = true
MobileButton.AnchorPoint = Vector2.new(0.5, 0.5)
MobileButton.Position = UDim2.new(0.5, 0, 0.12, 0)
MobileButton.Size = UDim2.new(0, 210, 0, 36)
MobileButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MobileButton.BorderSizePixel = 0
MobileButton.ZIndex = 10
MobileButton.Parent = ScreenGui

Instance.new("UICorner", MobileButton).CornerRadius = UDim.new(0, 10)

local btnStroke = Instance.new("UIStroke", MobileButton)
btnStroke.Color = Color3.fromRGB(200, 25, 35)
btnStroke.Thickness = 1.6

local MobileLabel = Instance.new("TextLabel", MobileButton)
MobileLabel.Size = UDim2.new(1, 0, 1, 0)
MobileLabel.BackgroundTransparency = 1
MobileLabel.Text = "UNHERE HUB ANTI DIE"
MobileLabel.TextColor3 = Color3.fromRGB(245, 245, 245)
MobileLabel.TextSize = 13
MobileLabel.Font = Enum.Font.GothamBlack
MobileLabel.TextXAlignment = Enum.TextXAlignment.Center
MobileLabel.TextYAlignment = Enum.TextYAlignment.Center

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 178)
MainFrame.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 5
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

local mainStroke = Instance.new("UIStroke", MainFrame)
mainStroke.Color = Color3.fromRGB(180, 20, 30)
mainStroke.Thickness = 1.7

-- Background Image (kept)
local BgImage = Instance.new("ImageLabel", MainFrame)
BgImage.Name = "Background"
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.BackgroundTransparency = 1
BgImage.Image = "rbxassetid://74820171165941"
BgImage.ImageTransparency = 0.55
BgImage.ScaleType = Enum.ScaleType.Crop
BgImage.ZIndex = 1

-- Dark overlay
local Overlay = Instance.new("Frame", MainFrame)
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.42
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 2

-- Top Bar
local Topbar = Instance.new("Frame", MainFrame)
Topbar.Name = "Topbar"
Topbar.Size = UDim2.new(1, 0, 0, 42)
Topbar.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
Topbar.BackgroundTransparency = 0.2
Topbar.BorderSizePixel = 0
Topbar.ZIndex = 3

Instance.new("UICorner", Topbar).CornerRadius = UDim.new(0, 14)

local TopFix = Instance.new("Frame", Topbar)
TopFix.Position = UDim2.new(0, 0, 1, -14)
TopFix.Size = UDim2.new(1, 0, 0, 14)
TopFix.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
TopFix.BackgroundTransparency = 0.2
TopFix.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Topbar)
Title.Position = UDim2.new(0, 16, 0, 0)
Title.Size = UDim2.new(1, -60, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "UNHERE HUB  •  ANTI DIE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 4

local MinimizeButton = Instance.new("TextButton", Topbar)
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.Position = UDim2.new(1, -12, 0.5, 0)
MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
MinimizeButton.Text = "—"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 14
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.AutoButtonColor = false
MinimizeButton.ZIndex = 4

Instance.new("UICorner", MinimizeButton).CornerRadius = UDim.new(0, 8)

--------------------------------------------------------------------------------
-- Toggle Row Helper
--------------------------------------------------------------------------------
local function createToggleRow(parent, yPos, labelText)
	local frame = Instance.new("Frame", parent)
	frame.Position = UDim2.new(0, 16, 0, yPos)
	frame.Size = UDim2.new(1, -32, 0, 44)
	frame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	frame.BackgroundTransparency = 0.12
	frame.BorderSizePixel = 0
	frame.ZIndex = 3

	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

	local stroke = Instance.new("UIStroke", frame)
	stroke.Color = Color3.fromRGB(160, 20, 28)
	stroke.Thickness = 1.15
	stroke.Transparency = 0.25

	local text = Instance.new("TextLabel", frame)
	text.AnchorPoint = Vector2.new(0, 0.5)
	text.Position = UDim2.new(0, 16, 0.5, 0)
	text.Size = UDim2.new(0.65, 0, 1, 0)
	text.BackgroundTransparency = 1
	text.Text = labelText
	text.TextColor3 = Color3.fromRGB(245, 245, 245)
	text.TextSize = 13
	text.Font = Enum.Font.GothamBold
	text.TextXAlignment = Enum.TextXAlignment.Left
	text.ZIndex = 4

	local toggleBtn = Instance.new("TextButton", frame)
	toggleBtn.AnchorPoint = Vector2.new(1, 0.5)
	toggleBtn.Position = UDim2.new(1, -14, 0.5, 0)
	toggleBtn.Size = UDim2.new(0, 48, 0, 26)
	toggleBtn.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
	toggleBtn.Text = ""
	toggleBtn.AutoButtonColor = false
	toggleBtn.ZIndex = 4

	Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

	local knob = Instance.new("Frame", toggleBtn)
	knob.AnchorPoint = Vector2.new(0, 0.5)
	knob.Position = UDim2.new(0, 4, 0.5, 0)
	knob.Size = UDim2.new(0, 18, 0, 18)
	knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	knob.BorderSizePixel = 0
	knob.ZIndex = 5

	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

	return toggleBtn, knob
end

local AntiDieBtn, AntiDieKnob = createToggleRow(MainFrame, 56, "ANTI DIE PROTECTION")
local AntiFlingBtn, AntiFlingKnob = createToggleRow(MainFrame, 112, "ANTI-FLING SHIELD")

--------------------------------------------------------------------------------
-- 3. STATE & LOGIC
--------------------------------------------------------------------------------
local antiDieEnabled = true
local antiFlingEnabled = true
local FLING_THRESHOLD = 80

local function updateToggleUI(toggleBtn, knob, state, instant)
	local targetPos = state and 26 or 4
	local trackColor = state and Color3.fromRGB(200, 25, 35) or Color3.fromRGB(38, 38, 38)
	local knobColor = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(220, 220, 220)

	if instant then
		toggleBtn.BackgroundColor3 = trackColor
		knob.Position = UDim2.new(0, targetPos, 0.5, 0)
		knob.BackgroundColor3 = knobColor
	else
		local info = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService:Create(toggleBtn, info, {BackgroundColor3 = trackColor}):Play()
		TweenService:Create(knob, info, {Position = UDim2.new(0, targetPos, 0.5, 0)}):Play()
		TweenService:Create(knob, info, {BackgroundColor3 = knobColor}):Play()
	end
end

updateToggleUI(AntiDieBtn, AntiDieKnob, antiDieEnabled, true)
updateToggleUI(AntiFlingBtn, AntiFlingKnob, antiFlingEnabled, true)

AntiDieBtn.MouseButton1Click:Connect(function()
	antiDieEnabled = not antiDieEnabled
	updateToggleUI(AntiDieBtn, AntiDieKnob, antiDieEnabled, false)
end)

AntiFlingBtn.MouseButton1Click:Connect(function()
	antiFlingEnabled = not antiFlingEnabled
	updateToggleUI(AntiFlingBtn, AntiFlingKnob, antiFlingEnabled, false)
end)

MinimizeButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
end)

MobileButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		MainFrame.Visible = not MainFrame.Visible
	end
end)

-- Character + Anti-Die
local currentHumanoid, currentRootPart

local function setupCharacter(char)
	currentCharacter = char
	currentHumanoid = char:WaitForChild("Humanoid")
	currentRootPart = char:WaitForChild("HumanoidRootPart")

	currentHumanoid.HealthChanged:Connect(function(newHealth)
		if antiDieEnabled and newHealth <= 0 then
			currentHumanoid.Health = currentHumanoid.MaxHealth
		end
	end)
end

setupCharacter(currentCharacter)
LocalPlayer.CharacterAdded:Connect(setupCharacter)

-- Anti-Fling
local heartbeatConnection = RunService.Heartbeat:Connect(function()
	if not antiFlingEnabled or not currentRootPart then return end

	if currentRootPart.AssemblyLinearVelocity.Magnitude > FLING_THRESHOLD then
		currentRootPart.AssemblyLinearVelocity = Vector3.new(0, currentRootPart.AssemblyLinearVelocity.Y, 0)
		currentRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	end
end)

ScreenGui.AncestryChanged:Connect(function()
	if not ScreenGui.Parent then
		heartbeatConnection:Disconnect()
	end
end)

-- Dragging
local function makeDraggable(frame, handle)
	local dragging, dragStart, startPos

	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
		end
	end)

	handle.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end
	end)
end

makeDraggable(MainFrame, Topbar)
makeDraggable(MobileButton, MobileButton)

print("[Unhere Hub] Anti Die loaded")
