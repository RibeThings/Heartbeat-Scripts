--
-- Hearbeat Inject Animation
--

-- Create ScreenGui
local SG = Instance.new("ScreenGui")
SG.Parent = game:GetService("CoreGui") -- Of course Heartbeat supports CoreGui!
SG.Name = "_Heartbeat_Injection"

--
local BG = Instance.new("Frame")
BG.Parent = SG
BG.Position = UDim2.fromScale(0.5, 0.5) -- No gui2lua :fearful:
BG.AnchorPoint = Vector2.new(0.5, 0.5)
BG.Size = UDim2.fromOffset(300, 150)
BG.BackgroundTransparency = 1

-- Create the Frame that has the dark color, yk
local BGFrame = Instance.new("Frame")
BGFrame.Parent = BG
BGFrame.Size = UDim2.fromScale(1, 1)
BGFrame.BorderSizePixel = 0
BGFrame.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	-- Add round
local BGFrameRound = Instance.new("UICorner")
BGFrameRound.Parent = BGFrame
BGFrameRound.CornerRadius = UDim.new(0, 10)

-- Create the "Heartbeat Injected" Title
local Title = Instance.new("TextLabel")
Title.Parent = BG
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "[ Heartbeat Injected ]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Position = UDim2.fromOffset(0, 10)

-- Create the icon
local Icon = Instance.new("ImageLabel")
--Icon.ImageTransparency = 1
Icon.BackgroundTransparency = 1
Icon.Size = UDim2.fromOffset(80, 80)
Icon.Image = "rbxassetid://6445118527"
Icon.BorderSizePixel = 0
Icon.Position = UDim2.fromScale(0.5, 0.5)
Icon.AnchorPoint = Vector2.new(0.5, 0.5)
Icon.Parent = BG -- Parent at last cuz this is an ImageLabel

-- Animate
	-- Setup BGFrame
BGFrame.Rotation = -5
BGFrame.Position = BGFrame.Position + UDim2.fromOffset(0, 40)
BGFrame.BackgroundTransparency = 1
	-- Setup icon
Icon.Position = Icon.Position - UDim2.fromOffset(0, 80)
Icon.ImageTransparency = 1
Icon.Size = UDim2.new()
	-- Setup title
Title.TextTransparency = 1
Title.Position = Title.Position - UDim2.fromOffset(0, 100)

	-- Create tweens
		--
local ts = game:GetService("TweenService")

local create = function(...)
	return ts:Create(...)
end
		--
local info1 = TweenInfo.new(0.5)
local info2 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 1, true, 0.2)

local bgFrameInTween = create(BGFrame, info1, { -- BGFrame
	Position = UDim2.new(),
	Rotation = 0,
	BackgroundTransparency = 0,
	})

local iconInTween = create(Icon, info1, { -- Icon
	Position = UDim2.fromScale(0.5, 0.5),
	ImageTransparency = 0,
	Size = UDim2.fromOffset(80, 80),
})

local titleInTween = create(Title, info1, { -- Title
	TextTransparency = 0,
	Position = UDim2.fromOffset(0, 10),
})

local bgFrameOutTween = create(BGFrame, info1, { -- BGFrame Fade Out
	Position = UDim2.fromOffset(0, -80),
	Rotation = 5,
	BackgroundTransparency = 1,
	})

local iconOutTween = create(Icon, info1, { -- Icon Fade Out
	Position = UDim2.new(0.5, 0, 0.5, 80),
	ImageTransparency = 1,
	Size = UDim2.fromOffset(0, 0),
})

local titleOutTween = create(Title, info1, { -- Title Fade Out
	TextTransparency = 1,
	Position = UDim2.fromOffset(0, 180),
})

local iconHeartbeatTween = create(Icon, info2, { -- Icon Heartbeat Effect
	Size = UDim2.fromOffset(120, 120),
})

	-- Play tweens
wait(0.1) -- Extra seconds for Icon's image to load

bgFrameInTween:Play()
iconInTween:Play()
titleInTween:Play()

iconInTween.Completed:Wait()
iconHeartbeatTween:Play()

wait(2)

bgFrameOutTween:Play()
iconOutTween:Play()
titleOutTween:Play()

bgFrameOutTween.Completed:Wait()
SG:Destroy()
