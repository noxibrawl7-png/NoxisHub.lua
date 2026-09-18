--========================================================
-- NOXI'S HUB 1.2.2
-- MONSTER & PERFORMANCE REWORK
-- VISUAL RECONSTRUCTION
-- DEVELOPER EDITION
--
-- LocalScript -> StarterPlayerScripts
--========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local VERSION = "1.2.2"

--========================================================
-- DEVELOPER
--========================================================

local DEVELOPER_USERNAME = "Gop_4797"
local DEVELOPER_DISPLAY = "PAKETA"

local IsMainDeveloper =
	Player.Name == DEVELOPER_USERNAME

--========================================================
-- STATE
--========================================================

local State = {
	Theme = "Purple",

	PlayerESP = false,
	MonsterESP = false,
	MonsterAlert = true,
	MonsterTracker = true,

	GraphicsBoost = false,

	VisualReconstruction = false,
	VisualQuality = "Medium",

	AMOLED = false,

	Animations = true,
	Notifications = true,
	Debug = false,

	PerformanceProfile = "Balanced"
}

local Themes = {
	Purple = Color3.fromRGB(155,85,255),
	Blue = Color3.fromRGB(70,140,255),
	Pink = Color3.fromRGB(255,80,175),
	Cyan = Color3.fromRGB(55,215,255),
	Red = Color3.fromRGB(255,65,75),
	Green = Color3.fromRGB(70,225,120),
	Orange = Color3.fromRGB(255,150,55)
}

local function Accent()
	return Themes[State.Theme] or Themes.Purple
end

--========================================================
-- REMOVE OLD GUI
--========================================================

local Old = PlayerGui:FindFirstChild("NoxisHub")

if Old then
	Old:Destroy()
end

--========================================================
-- GUI
--========================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "NoxisHub"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

--========================================================
-- LOADING SCREEN
--========================================================

local Loading = Instance.new("Frame")
Loading.Name = "LoadingScreen"
Loading.Size = UDim2.fromScale(1,1)
Loading.Position = UDim2.fromScale(0,0)
Loading.BackgroundColor3 = Color3.fromRGB(2,2,5)
Loading.BorderSizePixel = 0
Loading.ZIndex = 1000
Loading.Parent = Gui

local LoadingGradient = Instance.new("UIGradient")
LoadingGradient.Rotation = 90
LoadingGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.fromRGB(2,2,5)),
	ColorSequenceKeypoint.new(.5,Color3.fromRGB(10,5,18)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(2,2,5))
})
LoadingGradient.Parent = Loading

local LoadingGlow = Instance.new("Frame")
LoadingGlow.AnchorPoint = Vector2.new(.5,.5)
LoadingGlow.Position = UDim2.fromScale(.5,.42)
LoadingGlow.Size = UDim2.new(0,340,0,160)
LoadingGlow.BackgroundColor3 = Accent()
LoadingGlow.BackgroundTransparency = .94
LoadingGlow.BorderSizePixel = 0
LoadingGlow.ZIndex = 1001
LoadingGlow.Parent = Loading

Instance.new("UICorner",LoadingGlow).CornerRadius =
	UDim.new(1,0)

local LoadingLogo = Instance.new("TextLabel")
LoadingLogo.AnchorPoint = Vector2.new(.5,.5)
LoadingLogo.Position = UDim2.fromScale(.5,.38)
LoadingLogo.Size = UDim2.new(.8,0,0,55)
LoadingLogo.BackgroundTransparency = 1
LoadingLogo.Text = "NOXI'S HUB"
LoadingLogo.TextColor3 = Accent()
LoadingLogo.Font = Enum.Font.GothamBlack
LoadingLogo.TextSize = 34
LoadingLogo.ZIndex = 1002
LoadingLogo.Parent = Loading

local LoadingVersion = Instance.new("TextLabel")
LoadingVersion.AnchorPoint = Vector2.new(.5,.5)
LoadingVersion.Position = UDim2.fromScale(.5,.46)
LoadingVersion.Size = UDim2.new(.8,0,0,22)
LoadingVersion.BackgroundTransparency = 1
LoadingVersion.Text =
	VERSION.." • DEVELOPER EDITION"
LoadingVersion.TextColor3 =
	Color3.fromRGB(115,115,125)
LoadingVersion.Font = Enum.Font.Gotham
LoadingVersion.TextSize = 10
LoadingVersion.ZIndex = 1002
LoadingVersion.Parent = Loading

local LoadingNotice = Instance.new("TextLabel")
LoadingNotice.AnchorPoint = Vector2.new(.5,.5)
LoadingNotice.Position = UDim2.fromScale(.5,.525)
LoadingNotice.Size = UDim2.new(.8,0,0,22)
LoadingNotice.BackgroundTransparency = 1
LoadingNotice.Text = "NOXI'S HUB LOADING..."
LoadingNotice.TextColor3 = Accent()
LoadingNotice.Font = Enum.Font.GothamBold
LoadingNotice.TextSize = 11
LoadingNotice.ZIndex = 1002
LoadingNotice.Parent = Loading

local LoadingStatus = Instance.new("TextLabel")
LoadingStatus.AnchorPoint = Vector2.new(.5,.5)
LoadingStatus.Position = UDim2.fromScale(.5,.58)
LoadingStatus.Size = UDim2.new(.8,0,0,25)
LoadingStatus.BackgroundTransparency = 1
LoadingStatus.Text = "Initializing interface..."
LoadingStatus.TextColor3 =
	Color3.fromRGB(205,205,215)
LoadingStatus.Font = Enum.Font.GothamMedium
LoadingStatus.TextSize = 11
LoadingStatus.ZIndex = 1002
LoadingStatus.Parent = Loading

local LoadingBarBack = Instance.new("Frame")
LoadingBarBack.AnchorPoint = Vector2.new(.5,.5)
LoadingBarBack.Position = UDim2.fromScale(.5,.65)
LoadingBarBack.Size = UDim2.new(0,280,0,5)
LoadingBarBack.BackgroundColor3 =
	Color3.fromRGB(25,25,31)
LoadingBarBack.BorderSizePixel = 0
LoadingBarBack.ZIndex = 1002
LoadingBarBack.Parent = Loading

Instance.new("UICorner",LoadingBarBack).CornerRadius =
	UDim.new(1,0)

local LoadingBar = Instance.new("Frame")
LoadingBar.Size = UDim2.new(0,0,1,0)
LoadingBar.BackgroundColor3 = Accent()
LoadingBar.BorderSizePixel = 0
LoadingBar.ZIndex = 1003
LoadingBar.Parent = LoadingBarBack

Instance.new("UICorner",LoadingBar).CornerRadius =
	UDim.new(1,0)

local LoadingPercent = Instance.new("TextLabel")
LoadingPercent.AnchorPoint = Vector2.new(.5,.5)
LoadingPercent.Position = UDim2.fromScale(.5,.70)
LoadingPercent.Size = UDim2.new(0,100,0,20)
LoadingPercent.BackgroundTransparency = 1
LoadingPercent.Text = "0%"
LoadingPercent.TextColor3 =
	Color3.fromRGB(120,120,130)
LoadingPercent.Font = Enum.Font.Gotham
LoadingPercent.TextSize = 9
LoadingPercent.ZIndex = 1002
LoadingPercent.Parent = Loading

local LoadingCreator = Instance.new("TextLabel")
LoadingCreator.AnchorPoint = Vector2.new(.5,1)
LoadingCreator.Position = UDim2.fromScale(.5,.96)
LoadingCreator.Size = UDim2.new(.8,0,0,20)
LoadingCreator.BackgroundTransparency = 1
LoadingCreator.Text = "Created by NOXI"
LoadingCreator.TextColor3 =
	Color3.fromRGB(75,75,85)
LoadingCreator.Font = Enum.Font.Gotham
LoadingCreator.TextSize = 9
LoadingCreator.ZIndex = 1002
LoadingCreator.Parent = Loading

local function SafeLoadStep(Text,Percent)

	if not Loading
		or not Loading.Parent then
		return
	end

	pcall(function()
		LoadingStatus.Text = Text
		LoadingPercent.Text = tostring(Percent).."%"

		TweenService:Create(
			LoadingBar,
			TweenInfo.new(
				.22,
				Enum.EasingStyle.Quad,
				Enum.EasingDirection.Out
			),
			{
				Size = UDim2.new(
					math.clamp(Percent,0,100)/100,
					0,
					1,
					0
				)
			}
		):Play()
	end)

	task.wait(.12)
end

--========================================================
-- MAIN WINDOW
--========================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(.5,.5)
Main.Position = UDim2.fromScale(.5,.5)
Main.Size = UDim2.new(.72,0,.72,0)
Main.BackgroundColor3 = Color3.fromRGB(9,9,13)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = Gui

local MainSize = Instance.new("UISizeConstraint")
MainSize.MinSize = Vector2.new(320,320)
MainSize.MaxSize = Vector2.new(820,570)
MainSize.Parent = Main

Instance.new("UICorner",Main).CornerRadius =
	UDim.new(0,14)

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Accent()
MainStroke.Transparency = .28
MainStroke.Thickness = 1
MainStroke.Parent = Main

--========================================================
-- HEADER
--========================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,55)
Header.BackgroundColor3 = Color3.fromRGB(12,12,17)
Header.BorderSizePixel = 0
Header.Parent = Main

Instance.new("UICorner",Header).CornerRadius =
	UDim.new(0,14)

local HeaderLine = Instance.new("Frame")
HeaderLine.Position = UDim2.new(0,0,1,-1)
HeaderLine.Size = UDim2.new(1,0,0,1)
HeaderLine.BackgroundColor3 = Accent()
HeaderLine.BackgroundTransparency = .55
HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = Header

local Logo = Instance.new("TextLabel")
Logo.Position = UDim2.new(0,15,0,7)
Logo.Size = UDim2.new(0,200,0,25)
Logo.BackgroundTransparency = 1
Logo.Text = "NOXI'S HUB"
Logo.TextColor3 = Accent()
Logo.Font = Enum.Font.GothamBlack
Logo.TextSize = 18
Logo.TextXAlignment = Enum.TextXAlignment.Left
Logo.Parent = Header

local Version = Instance.new("TextLabel")
Version.Position = UDim2.new(0,16,0,31)
Version.Size = UDim2.new(0,280,0,15)
Version.BackgroundTransparency = 1
Version.Text =
	VERSION.." • MONSTER + PERFORMANCE"
Version.TextColor3 =
	Color3.fromRGB(105,105,115)
Version.Font = Enum.Font.Gotham
Version.TextSize = 9
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.Parent = Header

local Minimize = Instance.new("TextButton")
Minimize.AnchorPoint = Vector2.new(1,.5)
Minimize.Position = UDim2.new(1,-10,.5,0)
Minimize.Size = UDim2.new(0,30,0,30)
Minimize.BackgroundColor3 =
	Color3.fromRGB(25,25,31)
Minimize.Text = "—"
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 14
Minimize.AutoButtonColor = false
Minimize.Parent = Header

Instance.new("UICorner",Minimize).CornerRadius =
	UDim.new(0,8)

--========================================================
-- BODY
--========================================================

local Body = Instance.new("Frame")
Body.Position = UDim2.new(0,0,0,55)
Body.Size = UDim2.new(1,0,1,-55)
Body.BackgroundTransparency = 1
Body.Parent = Main

local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Position = UDim2.new(0,8,0,8)
Sidebar.Size = UDim2.new(0,130,1,-16)
Sidebar.BackgroundColor3 = Color3.fromRGB(7,7,10)
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 2
Sidebar.ScrollBarImageColor3 = Accent()
Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
Sidebar.CanvasSize = UDim2.new()
Sidebar.Active = true
Sidebar.ScrollingDirection = Enum.ScrollingDirection.Y
Sidebar.Parent = Body

Instance.new("UICorner",Sidebar).CornerRadius =
	UDim.new(0,11)

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingTop = UDim.new(0,7)
SidePadding.PaddingLeft = UDim.new(0,6)
SidePadding.PaddingRight = UDim.new(0,6)
SidePadding.PaddingBottom = UDim.new(0,7)
SidePadding.Parent = Sidebar

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0,4)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Parent = Sidebar

local Content = Instance.new("Frame")
Content.Position = UDim2.new(0,146,0,8)
Content.Size = UDim2.new(1,-154,1,-16)
Content.BackgroundTransparency = 1
Content.Parent = Body

local Pages = {}
local NavButtons = {}

--========================================================
-- HELPERS
--========================================================

local function NewPage(Name)

	local Page = Instance.new("ScrollingFrame")
	Page.Name = Name
	Page.Size = UDim2.fromScale(1,1)
	Page.BackgroundTransparency = 1
	Page.BorderSizePixel = 0
	Page.ScrollBarThickness = 3
	Page.ScrollBarImageColor3 = Accent()
	Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Page.CanvasSize = UDim2.new()
	Page.Active = true
	Page.ScrollingDirection = Enum.ScrollingDirection.Y
	Page.Visible = false
	Page.Parent = Content

	local Padding = Instance.new("UIPadding")
	Padding.PaddingTop = UDim.new(0,2)
	Padding.PaddingBottom = UDim.new(0,12)
	Padding.PaddingRight = UDim.new(0,6)
	Padding.Parent = Page

	local Layout = Instance.new("UIListLayout")
	Layout.Padding = UDim.new(0,8)
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	Layout.Parent = Page

	Pages[Name] = Page

	return Page
end

local function Title(Page,Text,Sub)

	local Holder = Instance.new("Frame")
	Holder.Size = UDim2.new(1,-5,0,55)
	Holder.BackgroundTransparency = 1
	Holder.Parent = Page

	local A = Instance.new("TextLabel")
	A.Size = UDim2.new(1,0,0,28)
	A.BackgroundTransparency = 1
	A.Text = Text
	A.TextColor3 = Color3.new(1,1,1)
	A.Font = Enum.Font.GothamBold
	A.TextSize = 21
	A.TextXAlignment = Enum.TextXAlignment.Left
	A.Parent = Holder

	local B = Instance.new("TextLabel")
	B.Position = UDim2.new(0,0,0,30)
	B.Size = UDim2.new(1,0,0,18)
	B.BackgroundTransparency = 1
	B.Text = Sub
	B.TextColor3 =
		Color3.fromRGB(110,110,120)
	B.Font = Enum.Font.Gotham
	B.TextSize = 10
	B.TextXAlignment = Enum.TextXAlignment.Left
	B.Parent = Holder
end

local function Card(Page,Height)

	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(1,-5,0,Height)
	Frame.BackgroundColor3 =
		Color3.fromRGB(17,17,22)
	Frame.BorderSizePixel = 0
	Frame.Parent = Page

	Instance.new("UICorner",Frame).CornerRadius =
		UDim.new(0,10)

	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(35,35,43)
	Stroke.Transparency = .3
	Stroke.Parent = Frame

	return Frame
end

local function Label(
	Parent,
	Text,
	X,
	Y,
	W,
	H,
	TextSize,
	Color
)

	local L = Instance.new("TextLabel")
	L.Position = UDim2.new(0,X,0,Y)
	L.Size = UDim2.new(0,W,0,H)
	L.BackgroundTransparency = 1
	L.Text = Text
	L.TextColor3 =
		Color or Color3.new(1,1,1)
	L.Font = Enum.Font.Gotham
	L.TextSize = TextSize or 11
	L.TextXAlignment = Enum.TextXAlignment.Left
	L.TextYAlignment = Enum.TextYAlignment.Center
	L.Parent = Parent

	return L
end

local function Button(Parent,Text,Callback)

	local B = Instance.new("TextButton")
	B.Size = UDim2.new(1,0,0,34)
	B.BackgroundColor3 =
		Color3.fromRGB(25,25,31)
	B.BorderSizePixel = 0
	B.Text = Text
	B.TextColor3 =
		Color3.fromRGB(220,220,225)
	B.Font = Enum.Font.GothamMedium
	B.TextSize = 10
	B.AutoButtonColor = false
	B.Active = true
	B.Selectable = true
	B.ZIndex = 20
	B.Parent = Parent

	Instance.new("UICorner",B).CornerRadius =
		UDim.new(0,8)

	local Stroke = Instance.new("UIStroke")
	Stroke.Color =
		Color3.fromRGB(40,40,48)
	Stroke.Transparency = .5
	Stroke.Parent = B

	B.MouseEnter:Connect(function()

		if not B:GetAttribute("Selected") then

			B.BackgroundColor3 =
				Accent():Lerp(
					Color3.new(0,0,0),
					.48
				)

		end

	end)

	B.MouseLeave:Connect(function()

		if not B:GetAttribute("Selected") then

			B.BackgroundColor3 =
				Color3.fromRGB(25,25,31)

		end

	end)

	B.Activated:Connect(function()

		if Callback then

			local Success,Error =
				pcall(Callback)

			if not Success then

				warn(
					"[NOXI'S HUB] Button error:",
					Error
				)

			end

		end

	end)

	return B
end

local function Toggle(
	Page,
	Text,
	Default,
	Callback
)

	local Frame = Card(Page,52)

	Label(
		Frame,
		Text,
		12,
		4,
		190,
		40,
		11,
		Color3.fromRGB(225,225,230)
	)

	local Value = Default

	local Switch = Instance.new("TextButton")
	Switch.AnchorPoint =
		Vector2.new(1,.5)
	Switch.Position =
		UDim2.new(1,-12,.5,0)
	Switch.Size =
		UDim2.new(0,38,0,20)
	Switch.BackgroundColor3 =
		Value
		and Accent()
		or Color3.fromRGB(45,45,52)
	Switch.Text = ""
	Switch.AutoButtonColor = false
	Switch.ZIndex = 20
	Switch.Parent = Frame

	Instance.new("UICorner",Switch).CornerRadius =
		UDim.new(1,0)

	local Dot = Instance.new("Frame")
	Dot.AnchorPoint =
		Vector2.new(.5,.5)
	Dot.Position =
		Value
		and UDim2.new(1,-10,.5,0)
		or UDim2.new(0,10,.5,0)
	Dot.Size =
		UDim2.new(0,14,0,14)
	Dot.BackgroundColor3 =
		Color3.new(1,1,1)
	Dot.ZIndex = 21
	Dot.Parent = Switch

	Instance.new("UICorner",Dot).CornerRadius =
		UDim.new(1,0)

	local function Set(NewValue)

		Value = NewValue

		Switch.BackgroundColor3 =
			Value
			and Accent()
			or Color3.fromRGB(45,45,52)

		Dot.Position =
			Value
			and UDim2.new(1,-10,.5,0)
			or UDim2.new(0,10,.5,0)

		if Callback then
			local Success,Error =
				pcall(Callback,Value)

			if not Success then
				warn(
					"[NOXI'S HUB] Toggle error:",
					Error
				)
			end
		end
	end

	Switch.Activated:Connect(function()
		Set(not Value)
	end)

	return Set
end

local function Grid(Parent,Y,Height)

	local Holder = Instance.new("Frame")
	Holder.Position = UDim2.new(0,10,0,Y)
	Holder.Size =
		UDim2.new(1,-20,0,Height or 105)
	Holder.BackgroundTransparency = 1
	Holder.Parent = Parent

	local Layout = Instance.new("UIGridLayout")
	Layout.CellSize =
		UDim2.new(.31,0,0,30)
	Layout.CellPadding =
		UDim2.new(0,5,0,5)
	Layout.HorizontalAlignment =
		Enum.HorizontalAlignment.Center
	Layout.Parent = Holder

	return Holder
end

--========================================================
-- RUNTIME
--========================================================

local Monsters = {}
local PlayerHighlights = {}
local Activity = {}

local CurrentFPS = 0
local CurrentPing = 0
local CurrentMemory = 0
local CurrentInstances = 0
local CurrentParts = 0
local CurrentMonsterCount = 0

local FPSSamples = {}

--========================================================
-- ACTIVITY
--========================================================

local function AddActivity(Text)

	table.insert(
		Activity,
		1,
		os.date("%H:%M:%S").."  "..Text
	)

	while #Activity > 8 do
		table.remove(Activity)
	end
end

--========================================================
-- MONSTER SYSTEM
--========================================================

local function GetMonsterFolder()

	return workspace:FindFirstChild("Monsters")
end

local function IsMonster(Object)

	if not Object:IsA("Model") then
		return false
	end

	if Players:GetPlayerFromCharacter(Object) then
		return false
	end

	if not Object:FindFirstChildOfClass("Humanoid") then
		return false
	end

	local Folder =
		GetMonsterFolder()

	if Folder
		and Object:IsDescendantOf(Folder) then

		return true
	end

	return Object:GetAttribute("Monster") == true
		or Object:GetAttribute("IsMonster") == true
end

local function Root(Model)

	return Model.PrimaryPart
		or Model:FindFirstChild("HumanoidRootPart")
		or Model:FindFirstChildWhichIsA("BasePart")
end

local function PlayerRoot()

	local Character =
		Player.Character

	return Character
		and Character:FindFirstChild("HumanoidRootPart")
end

local function Distance(Monster)

	local P = PlayerRoot()
	local M = Root(Monster)

	if not P or not M then
		return nil
	end

	return (
		P.Position -
		M.Position
	).Magnitude
end

local function Danger(D)

	if not D then
		return "UNKNOWN",
			Color3.fromRGB(160,160,170)
	end

	if D <= 20 then

		return "CRITICAL",
			Color3.fromRGB(255,55,65)

	elseif D <= 50 then

		return "DANGER",
			Color3.fromRGB(255,120,55)

	elseif D <= 100 then

		return "WARNING",
			Color3.fromRGB(245,205,65)

	end

	return "SAFE",
		Color3.fromRGB(75,220,120)
end

local function AddMonsterESP(Monster)

	if not Monster
		or not Monster.Parent then
		return
	end

	local H =
		Monster:FindFirstChild(
			"NoxiMonsterESP"
		)

	if not H then

		H = Instance.new("Highlight")
		H.Name = "NoxiMonsterESP"
		H.Parent = Monster

	end

	H.Enabled =
		State.MonsterESP

	H.FillColor =
		Color3.fromRGB(255,55,65)

	H.OutlineColor =
		Accent()

	H.FillTransparency = .45
	H.OutlineTransparency = 0

	H.DepthMode =
		Enum.HighlightDepthMode.AlwaysOnTop
end

local function ClearMonsterESP()

	for Monster in pairs(Monsters) do

		if Monster
			and Monster.Parent then

			local H =
				Monster:FindFirstChild(
					"NoxiMonsterESP"
				)

			if H then
				H:Destroy()
			end
		end
	end
end

local function AddPlayerESP(Target)

	if not Target
		or Target == Player then
		return
	end

	local Character =
		Target.Character

	if not Character then
		return
	end

	local H =
		PlayerHighlights[Target]

	if not H
		or not H.Parent then

		H = Instance.new("Highlight")
		H.Name = "NoxiPlayerESP"
		H.FillTransparency = .6
		H.OutlineTransparency = .1
		H.DepthMode =
			Enum.HighlightDepthMode.AlwaysOnTop
		H.Parent = Character

		PlayerHighlights[Target] = H
	end

	H.Adornee = Character
	H.Enabled = State.PlayerESP
	H.FillColor = Accent()
	H.OutlineColor =
		Color3.new(1,1,1)
end

local function ClearPlayerESP()

	for Target,H in pairs(PlayerHighlights) do

		if H then
			H:Destroy()
		end

		PlayerHighlights[Target] = nil
	end
end

local function Scan(Silent)

	table.clear(Monsters)

	for _,Object in ipairs(
		workspace:GetDescendants()
	) do

		if IsMonster(Object) then

			Monsters[Object] = true

			AddMonsterESP(Object)

		end
	end

	if not Silent then
		AddActivity(
			"🔍 Monster scan completed"
		)
	end
end

--========================================================
-- PAGES
--========================================================

local Dashboard =
	NewPage("Dashboard")

Title(
	Dashboard,
	"Dashboard",
	"NOXI Developer Control Center"
)

local Overview =
	Card(Dashboard,170)

Label(
	Overview,
	"SYSTEM STATUS",
	12,9,220,20,11,Accent()
).Font = Enum.Font.GothamBold

local PerformanceStatus =
	Label(
		Overview,
		"● Performance: CHECKING",
		12,37,230,20,10,
		Color3.fromRGB(100,220,130)
	)

local MonsterStatus =
	Label(
		Overview,
		"● Monster System: RUNNING",
		12,61,250,20,10,
		Color3.fromRGB(100,220,130)
	)

local RoomStatus =
	Label(
		Overview,
		"● Room System: RUNNING",
		12,85,250,20,10,
		Color3.fromRGB(100,220,130)
	)

local EventStatus =
	Label(
		Overview,
		"● Event System: RUNNING",
		12,109,250,20,10,
		Color3.fromRGB(100,220,130)
	)

local SystemInfo =
	Label(
		Overview,
		"FPS: --   •   Ping: --   •   Monsters: 0",
		12,137,360,20,10,
		Color3.fromRGB(160,160,170)
	)

local Greeting =
	Label(
		Overview,
		"Доброй ночи 🌙",
		215,37,180,20,10,Accent()
	)

--========================================================
-- WHAT'S NEW
--========================================================

local UpdateCard =
	Card(Dashboard,185)

Label(
	UpdateCard,
	"🆕 WHAT'S NEW",
	12,9,250,20,11,Accent()
).Font = Enum.Font.GothamBold

Label(
	UpdateCard,
	"NOXI'S HUB "..VERSION,
	12,35,280,22,14,
	Color3.fromRGB(235,235,240)
).Font = Enum.Font.GothamBold

Label(
	UpdateCard,
	"MONSTER & PERFORMANCE REWORK",
	12,58,300,18,9,
	Color3.fromRGB(125,125,135)
)

local ChangelogText =
	Label(
		UpdateCard,
		"✨ Loading System rebuilt\n"
		.."🧠 Visual Reconstruction improved\n"
		.."⚡ Graphics Boost fixed\n"
		.."🐞 Debug protection improved\n"
		.."👾 Monster System optimized\n"
		.."📊 Performance Monitor improved\n"
		.."👑 Developer identity added",
		12,82,390,105,10,
		Color3.fromRGB(175,175,185)
	)

ChangelogText.TextYAlignment =
	Enum.TextYAlignment.Top

--========================================================
-- ACTIVITY
--========================================================

local ActivityCard =
	Card(Dashboard,155)

Label(
	ActivityCard,
	"LIVE ACTIVITY",
	12,8,220,20,11,Accent()
).Font = Enum.Font.GothamBold

local ActivityText =
	Label(
		ActivityCard,
		"No recent activity.",
		12,34,390,110,10,
		Color3.fromRGB(160,160,170)
	)

ActivityText.TextYAlignment =
	Enum.TextYAlignment.Top

--========================================================
-- QUICK ACTIONS
--========================================================

local Quick =
	Card(Dashboard,145)

Label(
	Quick,
	"QUICK ACTIONS",
	12,8,200,20,11,Accent()
).Font = Enum.Font.GothamBold

local QuickGrid =
	Grid(Quick,35)

--========================================================
-- PLAYER
--========================================================

local PlayerPage =
	NewPage("Player")

Title(
	PlayerPage,
	"Player",
	"Local player tools"
)

local Info =
	Card(
		PlayerPage,
		IsMainDeveloper and 165 or 125
	)

Label(
	Info,
	"Username: @"..Player.Name,
	12,12,300,20,11,
	Color3.fromRGB(210,210,215)
)

Label(
	Info,
	"Display Name: "..Player.DisplayName,
	12,37,300,20,11,
	Color3.fromRGB(160,160,170)
)

if IsMainDeveloper then

	local DeveloperBadge =
		Label(
			Info,
			"🛠️ ГЛАВНЫЙ РАЗРАБОТЧИК",
			12,62,320,22,11,
			Accent()
		)

	DeveloperBadge.Font =
		Enum.Font.GothamBold

	Label(
		Info,
		"Developer ID: @Gop_4797",
		12,86,300,18,9,
		Color3.fromRGB(115,115,125)
	)
end

local Respawn =
	Button(
		Info,
		"RESPAWN",
		function()

			if Player.Character then

				Player.Character:BreakJoints()

				AddActivity(
					"♻ Player respawn requested"
				)

			end
		end
	)

Respawn.Position =
	UDim2.new(0,12,1,-43)

Respawn.Size =
	UDim2.new(0,120,0,32)

--========================================================
-- MONSTERS PAGE
--========================================================

local MonsterPage =
	NewPage("Monsters")

Title(
	MonsterPage,
	"Monsters",
	"Advanced monster developer system"
)

Toggle(
	MonsterPage,
	"Monster ESP",
	false,
	function(Value)

		State.MonsterESP = Value

		if Value then
			Scan(true)
		else
			ClearMonsterESP()
		end
	end
)

Toggle(
	MonsterPage,
	"Monster Alert",
	true,
	function(Value)
		State.MonsterAlert = Value
	end
)

Toggle(
	MonsterPage,
	"Monster Tracker",
	true,
	function(Value)
		State.MonsterTracker = Value
	end
)

local MonsterInfo =
	Card(MonsterPage,195)

Label(
	MonsterInfo,
	"MONSTER MONITOR",
	12,9,250,20,11,Accent()
).Font = Enum.Font.GothamBold

local MonsterCountText =
	Label(
		MonsterInfo,
		"Detected: 0",
		12,37,280,20,12,
		Color3.fromRGB(220,220,225)
	)

local NearestText =
	Label(
		MonsterInfo,
		"Nearest: --",
		12,62,330,20,11,
		Color3.fromRGB(170,170,180)
	)

local DangerText =
	Label(
		MonsterInfo,
		"Danger: SAFE",
		12,87,300,20,11,
		Color3.fromRGB(75,220,120)
	)

local MonsterDistanceText =
	Label(
		MonsterInfo,
		"Distance: --",
		12,112,300,20,10,
		Color3.fromRGB(155,155,165)
	)

local ScanButton =
	Button(
		MonsterInfo,
		"SCAN MONSTERS",
		function()
			Scan()
		end
	)

ScanButton.Position =
	UDim2.new(0,12,1,-42)

ScanButton.Size =
	UDim2.new(0,140,0,30)

local MonsterLog =
	Card(MonsterPage,190)

Label(
	MonsterLog,
	"MONSTER EVENT LOG",
	12,9,250,20,11,Accent()
).Font = Enum.Font.GothamBold

local MonsterLogText =
	Label(
		MonsterLog,
		"No monster events.",
		12,34,390,145,10,
		Color3.fromRGB(160,160,170)
	)

MonsterLogText.TextYAlignment =
	Enum.TextYAlignment.Top

--========================================================
-- PERFORMANCE
--========================================================

local Performance =
	NewPage("Performance")

Title(
	Performance,
	"Performance",
	"Advanced live performance diagnostics"
)

local PerfCard =
	Card(Performance,220)

Label(
	PerfCard,
	"LIVE PERFORMANCE",
	12,9,250,20,11,Accent()
).Font = Enum.Font.GothamBold

local FPSText =
	Label(
		PerfCard,
		"FPS: --",
		12,37,180,23,15,Accent()
	)

FPSText.Font =
	Enum.Font.GothamBold

local LowFPSText =
	Label(
		PerfCard,
		"1% Low: --",
		12,65,180,20,11,
		Color3.fromRGB(180,180,190)
	)

local PingText =
	Label(
		PerfCard,
		"Ping: -- ms",
		12,91,180,20,11,
		Color3.fromRGB(180,180,190)
	)

local MemoryText =
	Label(
		PerfCard,
		"Memory: -- MB",
		12,117,180,20,11,
		Color3.fromRGB(180,180,190)
	)

local InstanceText =
	Label(
		PerfCard,
		"Instances: --",
		12,143,180,20,11,
		Color3.fromRGB(180,180,190)
	)

local PartsText =
	Label(
		PerfCard,
		"Parts: --",
		12,169,180,20,11,
		Color3.fromRGB(180,180,190)
	)

local PerfStatusText =
	Label(
		PerfCard,
		"Status: CHECKING",
		215,37,180,25,11,
		Color3.fromRGB(100,220,130)
	)

local PerfGreeting =
	Label(
		PerfCard,
		"Доброй ночи 🌙",
		215,70,180,20,10,Accent()
	)

Label(
	PerfCard,
	"Created by NOXI",
	215,98,180,18,10,
	Color3.fromRGB(110,110,120)
)

local BenchmarkResult =
	Label(
		PerfCard,
		"Benchmark: not tested",
		215,125,190,55,10,
		Color3.fromRGB(160,160,170)
	)

BenchmarkResult.TextYAlignment =
	Enum.TextYAlignment.Top

local BenchmarkRunning = false

local BenchmarkButton =
	Button(
		PerfCard,
		"RUN 10s BENCHMARK",
		function()

			if BenchmarkRunning then
				return
			end

			BenchmarkRunning = true

			BenchmarkResult.Text =
				"Benchmark running..."

			local Samples = {}

			for _ = 1,20 do

				table.insert(
					Samples,
					CurrentFPS
				)

				task.wait(.5)
			end

			table.sort(Samples)

			local Total = 0

			for _,Value in ipairs(Samples) do
				Total += Value
			end

			local Average =
				#Samples > 0
				and Total/#Samples
				or 0

			local Low =
				Samples[
					math.max(
						1,
						math.ceil(
							#Samples*.01
						)
					)
				]
				or 0

			local Grade

			if Average >= 100 then
				Grade = "EXCELLENT"
			elseif Average >= 60 then
				Grade = "GOOD"
			elseif Average >= 30 then
				Grade = "LOW"
			else
				Grade = "CRITICAL"
			end

			BenchmarkResult.Text =
				"Benchmark: "..Grade
				.."\nAverage: "
				..math.floor(Average)
				.." FPS"
				.."\nLow: "
				..math.floor(Low)
				.." FPS"

			AddActivity(
				"📊 Benchmark finished: "..Grade
			)

			BenchmarkRunning = false
		end
	)

BenchmarkButton.Position =
	UDim2.new(0,215,1,-42)

BenchmarkButton.Size =
	UDim2.new(0,170,0,30)

--========================================================
-- GRAPHICS
--========================================================

local SavedLighting = {
	GlobalShadows = Lighting.GlobalShadows,
	Brightness = Lighting.Brightness,
	EnvironmentDiffuseScale =
		Lighting.EnvironmentDiffuseScale,
	EnvironmentSpecularScale =
		Lighting.EnvironmentSpecularScale,
	Technology = Lighting.Technology
}

local function RemoveGraphicsEffects()

	for _,Name in ipairs({
		"NoxiBloom",
		"NoxiColorCorrection",
		"NoxiSunRays"
	}) do

		local Effect =
			Lighting:FindFirstChild(Name)

		if Effect then
			Effect:Destroy()
		end
	end
end

local function SetGraphicsBoost(Value)

	State.GraphicsBoost = Value

	if Value then

		RemoveGraphicsEffects()

		pcall(function()

			Lighting.GlobalShadows = true

			Lighting.Brightness =
				math.max(
					SavedLighting.Brightness,
					2
				)

			Lighting.EnvironmentDiffuseScale = 1
			Lighting.EnvironmentSpecularScale = 1

			Lighting.Technology =
				Enum.Technology.Future
		end)

		local Bloom =
			Instance.new("BloomEffect")

		Bloom.Name = "NoxiBloom"
		Bloom.Intensity = .12
		Bloom.Size = 18
		Bloom.Threshold = 1.1
		Bloom.Parent = Lighting

		local ColorCorrection =
			Instance.new(
				"ColorCorrectionEffect"
			)

		ColorCorrection.Name =
			"NoxiColorCorrection"

		ColorCorrection.Brightness = .02
		ColorCorrection.Contrast = .12
		ColorCorrection.Saturation = .08
		ColorCorrection.TintColor =
			Color3.fromRGB(245,240,255)

		ColorCorrection.Parent =
			Lighting

		local SunRays =
			Instance.new("SunRaysEffect")

		SunRays.Name =
			"NoxiSunRays"

		SunRays.Intensity = .035
		SunRays.Spread = .8
		SunRays.Parent = Lighting

		AddActivity(
			"✨ Graphics Boost enabled"
		)

	else

		RemoveGraphicsEffects()

		pcall(function()

			Lighting.GlobalShadows =
				SavedLighting.GlobalShadows

			Lighting.Brightness =
				SavedLighting.Brightness

			Lighting.EnvironmentDiffuseScale =
				SavedLighting.EnvironmentDiffuseScale

			Lighting.EnvironmentSpecularScale =
				SavedLighting.EnvironmentSpecularScale

			Lighting.Technology =
				SavedLighting.Technology

		end)

		AddActivity(
			"✨ Graphics Boost disabled"
		)
	end
end

--========================================================
-- VISUAL RECONSTRUCTION
--========================================================

local VisualEffects = {}

local VisualQualitySettings = {

	Low = {
		Brightness = .015,
		Contrast = .06,
		Saturation = .025,
		Bloom = .045,
		SunRays = .012,
		AtmosphereDensity = .12
	},

	Medium = {
		Brightness = .025,
		Contrast = .10,
		Saturation = .05,
		Bloom = .08,
		SunRays = .022,
		AtmosphereDensity = .18
	},

	Ultra = {
		Brightness = .035,
		Contrast = .15,
		Saturation = .075,
		Bloom = .12,
		SunRays = .035,
		AtmosphereDensity = .24
	}
}

local function RemoveVisualReconstruction()

	for _,Effect in pairs(
		VisualEffects
	) do

		if Effect
			and Effect.Parent then

			Effect:Destroy()

		end
	end

	table.clear(VisualEffects)

	local Atmosphere =
		Lighting:FindFirstChild(
			"NoxiVisualAtmosphere"
		)

	if Atmosphere then
		Atmosphere:Destroy()
	end
end

local function CreateVisualReconstruction()

	RemoveVisualReconstruction()

	local Settings =
		VisualQualitySettings[
			State.VisualQuality
		]
		or VisualQualitySettings.Medium

	local ColorCorrection =
		Instance.new(
			"ColorCorrectionEffect"
		)

	ColorCorrection.Name =
		"NoxiVisualReconstruction"

	ColorCorrection.Brightness =
		Settings.Brightness

	ColorCorrection.Contrast =
		Settings.Contrast

	ColorCorrection.Saturation =
		Settings.Saturation

	ColorCorrection.TintColor =
		Color3.fromRGB(250,248,255)

	ColorCorrection.Parent =
		Lighting

	VisualEffects.ColorCorrection =
		ColorCorrection

	local Bloom =
		Instance.new("BloomEffect")

	Bloom.Name =
		"NoxiVisualBloom"

	Bloom.Intensity =
		Settings.Bloom

	Bloom.Size =
		State.VisualQuality == "Ultra"
		and 24
		or 18

	Bloom.Threshold =
		State.VisualQuality == "Low"
		and 1.35
		or 1.15

	Bloom.Parent =
		Lighting

	VisualEffects.Bloom =
		Bloom

	local Atmosphere =
		Instance.new("Atmosphere")

	Atmosphere.Name =
		"NoxiVisualAtmosphere"

	Atmosphere.Density =
		Settings.AtmosphereDensity

	Atmosphere.Offset = .15

	Atmosphere.Color =
		Color3.fromRGB(185,190,205)

	Atmosphere.Decay =
		Color3.fromRGB(90,95,115)

	Atmosphere.Glare =
		State.VisualQuality == "Ultra"
		and .08
		or .035

	Atmosphere.Haze =
		State.VisualQuality == "Low"
		and .5
		or .8

	Atmosphere.Parent =
		Lighting

	VisualEffects.Atmosphere =
		Atmosphere

	local SunRays =
		Instance.new("SunRaysEffect")

	SunRays.Name =
		"NoxiVisualSunRays"

	SunRays.Intensity =
		Settings.SunRays

	SunRays.Spread = .8
	SunRays.Parent = Lighting

	VisualEffects.SunRays =
		SunRays

	local Depth =
		Instance.new("DepthOfFieldEffect")

	Depth.Name =
		"NoxiVisualDepth"

	Depth.FarIntensity =
		State.VisualQuality == "Ultra"
		and .10
		or .04

	Depth.NearIntensity =
		State.VisualQuality == "Ultra"
		and .035
		or .015

	Depth.FocusDistance = 70

	Depth.InFocusRadius =
		State.VisualQuality == "Ultra"
		and 45
		or 65

	Depth.Parent = Lighting

	VisualEffects.Depth =
		Depth

	AddActivity(
		"🧠 Visual Reconstruction: "
		..State.VisualQuality
	)
end

local function SetVisualReconstruction(Value)

	State.VisualReconstruction =
		Value

	if Value then
		CreateVisualReconstruction()
	else
		RemoveVisualReconstruction()
	end
end

--========================================================
-- VISUAL PAGE
--========================================================

local Visuals =
	NewPage("Visuals")

Title(
	Visuals,
	"Visuals",
	"Graphics and visual controls"
)

Toggle(
	Visuals,
	"Graphics Boost",
	false,
	function(Value)
		SetGraphicsBoost(Value)
	end
)

Toggle(
	Visuals,
	"Дорисовка недостатков",
	false,
	function(Value)
		SetVisualReconstruction(Value)
	end
)

local VisualQualityCard =
	Card(Visuals,180)

Label(
	VisualQualityCard,
	"VISUAL RECONSTRUCTION QUALITY",
	12,8,300,20,11,Accent()
).Font = Enum.Font.GothamBold

local VisualQualityStatus =
	Label(
		VisualQualityCard,
		"Current: Medium",
		12,32,300,20,10,
		Color3.fromRGB(160,160,170)
	)

local VisualQualityGrid =
	Grid(
		VisualQualityCard,
		58,
		105
	)

local function SetVisualQuality(Name)

	State.VisualQuality =
		Name

	VisualQualityStatus.Text =
		"Current: "..Name

	if State.VisualReconstruction then
		CreateVisualReconstruction()
	end

	AddActivity(
		"🎚️ Visual quality: "..Name
	)
end

for _,Name in ipairs({
	"Low",
	"Medium",
	"Ultra"
}) do

	local B =
		Button(
			VisualQualityGrid,
			Name,
			function()
				SetVisualQuality(Name)
			end
		)

	B.BackgroundColor3 =
		Themes[Name == "Ultra"
			and "Red"
			or State.Theme
		]:Lerp(
			Color3.new(0,0,0),
			.48
		)
end

local ReconstructionInfo =
	Card(Visuals,145)

Label(
	ReconstructionInfo,
	"VISUAL RECONSTRUCTION",
	12,9,280,20,11,Accent()
).Font = Enum.Font.GothamBold

local ReconstructionStatus =
	Label(
		ReconstructionInfo,
		"Status: OFF",
		12,38,300,20,11,
		Color3.fromRGB(145,145,155)
	)

local ReconstructionDetails =
	Label(
		ReconstructionInfo,
		"Procedural visual compensation\n"
		.."for lighting, depth, atmosphere and detail.\n\n"
		.."Independent from Graphics Boost.",
		12,65,400,70,10,
		Color3.fromRGB(160,160,170)
	)

ReconstructionDetails.TextYAlignment =
	Enum.TextYAlignment.Top

Toggle(
	Visuals,
	"AMOLED Mode",
	false,
	function(Value)

		State.AMOLED = Value

		Main.BackgroundColor3 =
			Value
			and Color3.fromRGB(0,0,0)
			or Color3.fromRGB(9,9,13)
	end
)

--========================================================
-- PERFORMANCE PROFILES
--========================================================

local ProfileCard =
	Card(Performance,165)

Label(
	ProfileCard,
	"PERFORMANCE PROFILES",
	12,9,250,20,11,Accent()
).Font = Enum.Font.GothamBold

local ProfileGrid =
	Grid(ProfileCard,35,110)

local function SetProfile(Name)

	State.PerformanceProfile =
		Name

	if Name == "Balanced" then

		pcall(function()
			Lighting.GlobalShadows = true
		end)

	elseif Name == "Performance" then

		pcall(function()
			Lighting.GlobalShadows = false
		end)

		if State.GraphicsBoost then
			SetGraphicsBoost(false)
		end

	elseif Name == "Ultra" then

		pcall(function()
			Lighting.GlobalShadows = false
		end)

		SetGraphicsBoost(true)
	end

	AddActivity(
		"⚡ Performance profile: "..Name
	)
end

for _,Name in ipairs({
	"Balanced",
	"Performance",
	"Ultra"
}) do

	Button(
		ProfileGrid,
		Name,
		function()
			SetProfile(Name)
		end
	)
end

--========================================================
-- SETTINGS
--========================================================

local Settings =
	NewPage("Settings")

Title(
	Settings,
	"Settings",
	"Hub customization"
)

Toggle(
	Settings,
	"Animations",
	true,
	function(Value)
		State.Animations = Value
	end
)

Toggle(
	Settings,
	"Notifications",
	true,
	function(Value)
		State.Notifications = Value
	end
)

local ThemeCard =
	Card(Settings,180)

Label(
	ThemeCard,
	"THEMES",
	12,8,200,20,11,Accent()
).Font = Enum.Font.GothamBold

local ThemeGrid =
	Grid(ThemeCard,35,110)

--========================================================
-- SERVER
--========================================================

local ServerPage =
	NewPage("Server")

Title(
	ServerPage,
	"Server",
	"Current session information"
)

local ServerCard =
	Card(ServerPage,175)

local ServerText =
	Label(
		ServerCard,
		"Loading...",
		12,12,400,145,11,
		Color3.fromRGB(170,170,180)
	)

ServerText.TextYAlignment =
	Enum.TextYAlignment.Top

--========================================================
-- DEBUG
--========================================================

local DebugPage =
	NewPage("Debug")

Title(
	DebugPage,
	"Debug",
	"Developer diagnostics"
)

Toggle(
	DebugPage,
	"Debug Mode",
	false,
	function(Value)

		State.Debug = Value

		AddActivity(
			Value
			and "🐞 Debug Mode enabled"
			or "🐞 Debug Mode disabled"
		)
	end
)

local DebugCard =
	Card(DebugPage,270)

Label(
	DebugCard,
	"DIAGNOSTICS",
	12,9,250,20,11,Accent()
).Font = Enum.Font.GothamBold

local DebugText =
	Label(
		DebugCard,
		"Debug disabled.",
		12,34,430,185,10,
		Color3.fromRGB(160,160,170)
	)

DebugText.TextYAlignment =
	Enum.TextYAlignment.Top

local RefreshDebug =
	Button(
		DebugCard,
		"REFRESH DIAGNOSTICS",
		function()

			DebugText.Text =
				"NOXI DEBUG\n\n"
				.."Version: "..VERSION
				.."\nPlayer: "..Player.Name
				.."\nDisplay: "..Player.DisplayName
				.."\nMain Developer: "
				..tostring(IsMainDeveloper)
				.."\nMonster Folder: "
				..(
					GetMonsterFolder()
					and "FOUND"
					or "NOT FOUND"
				)
				.."\nMonster Count: "
				..CurrentMonsterCount
				.."\nGraphics Boost: "
				..tostring(
					State.GraphicsBoost
				)
				.."\nVisual Reconstruction: "
				..tostring(
					State.VisualReconstruction
				)
				.."\nVisual Quality: "
				..State.VisualQuality
				.."\nProfile: "
				..State.PerformanceProfile
				.."\nFPS: "
				..math.floor(CurrentFPS)
				.."\nPing: "
				..math.floor(CurrentPing)
				.." ms"
				.."\nMemory: "
				..math.floor(CurrentMemory)
				.." MB"
				.."\nInstances: "
				..CurrentInstances
				.."\nParts: "
				..CurrentParts
				.."\nPlayers: "
				..#Players:GetPlayers()

			AddActivity(
				"🐞 Diagnostics refreshed"
			)
		end
	)

RefreshDebug.Position =
	UDim2.new(0,12,1,-43)

RefreshDebug.Size =
	UDim2.new(0,180,0,30)

--========================================================
-- ESP
--========================================================

local ESPPage =
	NewPage("ESP")

Title(
	ESPPage,
	"ESP",
	"Developer visual diagnostics"
)

Toggle(
	ESPPage,
	"Player ESP",
	false,
	function(Value)

		State.PlayerESP =
			Value

		if not Value then
			ClearPlayerESP()
		end
	end
)

Toggle(
	ESPPage,
	"Monster ESP",
	false,
	function(Value)

		State.MonsterESP =
			Value

		if Value then
			Scan(true)
		else
			ClearMonsterESP()
		end
	end
)

--========================================================
-- ABOUT
--========================================================

local AboutPage =
	NewPage("About")

Title(
	AboutPage,
	"About",
	"NOXI'S HUB developer information"
)

local AboutCard =
	Card(AboutPage,265)

local AboutLogo =
	Label(
		AboutCard,
		"NOXI'S HUB",
		12,12,300,28,20,Accent()
	)

AboutLogo.Font =
	Enum.Font.GothamBlack

Label(
	AboutCard,
	"Developer Edition",
	12,42,250,20,10,
	Color3.fromRGB(130,130,140)
)

Label(
	AboutCard,
	"Version: "..VERSION,
	12,72,300,20,11,
	Color3.fromRGB(210,210,215)
)

Label(
	AboutCard,
	"Monster & Performance Rework",
	12,98,350,20,11,
	Color3.fromRGB(175,175,185)
)

Label(
	AboutCard,
	"Главный разработчик:",
	12,127,250,20,10,
	Color3.fromRGB(125,125,135)
)

local AboutDeveloper =
	Label(
		AboutCard,
		DEVELOPER_DISPLAY,
		12,149,300,24,15,
		Accent()
	)

AboutDeveloper.Font =
	Enum.Font.GothamBold

Label(
	AboutCard,
	"@Gop_4797",
	12,174,300,20,10,
	Color3.fromRGB(160,160,170)
)

local AboutText =
	Label(
		AboutCard,
		"Developer control center for testing,\n"
		.."debugging and visual development.\n\n"
		.."• Monster System\n"
		.."• Performance Monitor\n"
		.."• Developer ESP\n"
		.."• Graphics Tools\n"
		.."• Visual Reconstruction\n"
		.."• Debug Diagnostics",
		210,127,210,110,9,
		Color3.fromRGB(160,160,170)
	)

AboutText.TextYAlignment =
	Enum.TextYAlignment.Top

local AboutFooter =
	Card(AboutPage,80)

Label(
	AboutFooter,
	"CREATED BY NOXI",
	12,12,250,20,11,Accent()
).Font = Enum.Font.GothamBold

Label(
	AboutFooter,
	"NOXI'S HUB • "..VERSION,
	12,37,300,18,9,
	Color3.fromRGB(105,105,115)
)

--========================================================
-- NAVIGATION
--========================================================

local OpenPage

local Navigation = {
	"Dashboard",
	"Player",
	"Monsters",
	"ESP",
	"Performance",
	"Visuals",
	"Server",
	"Debug",
	"Settings",
	"About"
}

OpenPage = function(Name)

	local Page =
		Pages[Name]

	if not Page then
		return
	end

	for PageName,PageObject in pairs(Pages) do

		PageObject.Visible =
			PageName == Name

	end

	for ButtonName,B in pairs(NavButtons) do

		if ButtonName == Name then

			B:SetAttribute(
				"Selected",
				true
			)

			B.BackgroundColor3 =
				Accent():Lerp(
					Color3.new(0,0,0),
					.5
				)

			B.TextColor3 =
				Color3.new(1,1,1)

		else

			B:SetAttribute(
				"Selected",
				false
			)

			B.BackgroundColor3 =
				Color3.fromRGB(15,15,20)

			B.TextColor3 =
				Color3.fromRGB(150,150,160)

		end
	end

	if State.Animations then

		Page.CanvasPosition =
			Vector2.new(0,0)

	end
end

for Index,Name in ipairs(Navigation) do

	local B =
		Button(
			Sidebar,
			Name,
			function()
				OpenPage(Name)
			end
		)

	B.LayoutOrder =
		Index

	local Padding =
		Instance.new("UIPadding")

	Padding.PaddingLeft =
		UDim.new(0,9)

	Padding.Parent =
		B

	NavButtons[Name] =
		B
end

--========================================================
-- THEME SYSTEM
--========================================================

local Restore

local AccentObjects = {
	Logo,
	MainStroke,
	HeaderLine,
	LoadingLogo,
	LoadingNotice,
	LoadingBar
}

local function UpdateTheme()

	local Color =
		Accent()

	for _,Object in ipairs(
		AccentObjects
	) do

		if Object
			and Object.Parent then

			if Object:IsA("UIStroke") then

				Object.Color =
					Color

			elseif Object:IsA("TextLabel")
				or Object:IsA("TextButton") then

				Object.TextColor3 =
					Color

			elseif Object:IsA("Frame") then

				Object.BackgroundColor3 =
					Color

			end
		end
	end

	Sidebar.ScrollBarImageColor3 =
		Color

	for _,Page in pairs(Pages) do

		Page.ScrollBarImageColor3 =
			Color

	end

	Greeting.TextColor3 =
		Color

	PerfGreeting.TextColor3 =
		Color

	AboutDeveloper.TextColor3 =
		Color

	AboutLogo.TextColor3 =
		Color

	ReconstructionStatus.TextColor3 =
		State.VisualReconstruction
		and Color
		or Color3.fromRGB(145,145,155)

	if Restore then
		Restore.TextColor3 =
			Color
	end

	for Name,B in pairs(NavButtons) do

		if B:GetAttribute("Selected") then

			B.BackgroundColor3 =
				Color:Lerp(
					Color3.new(0,0,0),
					.5
				)
		end
	end
end

for _,Name in ipairs({
	"Purple",
	"Blue",
	"Pink",
	"Cyan",
	"Red",
	"Green",
	"Orange"
}) do

	local B =
		Button(
			ThemeGrid,
			Name,
			function()

				State.Theme =
					Name

				UpdateTheme()

				AddActivity(
					"🎨 Theme changed to "..Name
				)
			end
		)

	B.BackgroundColor3 =
		Themes[Name]:Lerp(
			Color3.new(0,0,0),
			.45
		)
end

--========================================================
-- MINIMIZE / RESTORE
--========================================================

Restore =
	Instance.new("TextButton")

Restore.AnchorPoint =
	Vector2.new(1,.5)

Restore.Position =
	UDim2.new(1,-8,.5,0)

Restore.Size =
	UDim2.new(0,36,0,36)

Restore.BackgroundColor3 =
	Color3.fromRGB(10,10,14)

Restore.Text =
	"N"

Restore.TextColor3 =
	Accent()

Restore.Font =
	Enum.Font.GothamBlack

Restore.TextSize =
	15

Restore.Visible =
	false

Restore.AutoButtonColor =
	false

Restore.ZIndex =
	50

Restore.Parent =
	Gui

Instance.new(
	"UICorner",
	Restore
).CornerRadius =
	UDim.new(0,10)

local RestoreStroke =
	Instance.new("UIStroke")

RestoreStroke.Color =
	Accent()

RestoreStroke.Transparency =
	.3

RestoreStroke.Parent =
	Restore

Minimize.Activated:Connect(function()

	Main.Visible = false
	Restore.Visible = true

end)

Restore.Activated:Connect(function()

	Main.Visible = true
	Restore.Visible = false

end)

--========================================================
-- DRAG
--========================================================

local Dragging = false
local DragStart
local StartPos

Header.InputBegan:Connect(function(Input)

	if Input.UserInputType ==
		Enum.UserInputType.MouseButton1
		or Input.UserInputType ==
		Enum.UserInputType.Touch then

		Dragging = true
		DragStart = Input.Position
		StartPos = Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(Input)

	if not Dragging then
		return
	end

	if Input.UserInputType ==
		Enum.UserInputType.MouseMovement
		or Input.UserInputType ==
		Enum.UserInputType.Touch then

		local Delta =
			Input.Position -
			DragStart

		Main.Position =
			UDim2.new(
				StartPos.X.Scale,
				StartPos.X.Offset + Delta.X,
				StartPos.Y.Scale,
				StartPos.Y.Offset + Delta.Y
			)
	end
end)

UserInputService.InputEnded:Connect(function(Input)

	if Input.UserInputType ==
		Enum.UserInputType.MouseButton1
		or Input.UserInputType ==
		Enum.UserInputType.Touch then

		Dragging = false
	end
end)

--========================================================
-- MONSTER EVENTS
--========================================================

workspace.DescendantAdded:Connect(function(Object)

	task.defer(function()

		local Success,Result =
			pcall(function()

				return IsMonster(Object)

			end)

		if Success and Result then

			Monsters[Object] = true

			AddMonsterESP(Object)

			AddActivity(
				"👾 "..Object.Name.." spawned"
			)

			if State.MonsterAlert then

				MonsterCountText.TextColor3 =
					Color3.fromRGB(255,65,75)

			end
		end
	end)
end)

workspace.DescendantRemoving:Connect(function(Object)

	if Monsters[Object] then

		Monsters[Object] = nil

		AddActivity(
			"👾 "..Object.Name.." removed"
		)
	end
end)

--========================================================
-- PLAYER EVENTS
--========================================================

Players.PlayerAdded:Connect(function(NewPlayer)

	AddActivity(
		"👤 "..NewPlayer.Name.." joined"
	)

	NewPlayer.CharacterAdded:Connect(function()

		task.wait(.5)

		if State.PlayerESP then

			AddPlayerESP(
				NewPlayer
			)

		end
	end)
end)

Players.PlayerRemoving:Connect(function(Removing)

	if PlayerHighlights[Removing] then

		PlayerHighlights[Removing]:Destroy()

		PlayerHighlights[Removing] = nil
	end

	AddActivity(
		"👤 "..Removing.Name.." left"
	)
end)

--========================================================
-- QUICK ACTIONS
--========================================================

Button(
	QuickGrid,
	"MONSTERS",
	function()
		OpenPage("Monsters")
	end
)

Button(
	QuickGrid,
	"MONSTER ESP",
	function()

		State.MonsterESP =
			not State.MonsterESP

		if State.MonsterESP then
			Scan(true)
		else
			ClearMonsterESP()
		end

		AddActivity(
			State.MonsterESP
			and "👾 Monster ESP enabled"
			or "👾 Monster ESP disabled"
		)
	end
)

Button(
	QuickGrid,
	"SCAN",
	function()
		Scan()
	end
)

Button(
	QuickGrid,
	"PERFORMANCE",
	function()
		OpenPage("Performance")
	end
)

Button(
	QuickGrid,
	"OPTIMIZE",
	function()

		SetProfile("Performance")

		AddActivity(
			"⚡ Performance optimization applied"
		)
	end
)

Button(
	QuickGrid,
	"DEBUG",
	function()
		OpenPage("Debug")
	end
)

--========================================================
-- LIVE UPDATE
--========================================================

local Frames = 0
local Last = os.clock()
local LastInstanceUpdate = 0

RunService.RenderStepped:Connect(function()

	local Success,Error =
		pcall(function()

			Frames += 1

			local Now =
				os.clock()

			if Now - Last < .5 then
				return
			end

			local FPS =
				Frames /
				(Now - Last)

			Frames = 0
			Last = Now

			CurrentFPS = FPS

			table.insert(
				FPSSamples,
				FPS
			)

			while #FPSSamples > 100 do
				table.remove(
					FPSSamples,
					1
				)
			end

			local LowFPS = FPS

			if #FPSSamples > 0 then

				local Sorted =
					table.clone(FPSSamples)

				table.sort(Sorted)

				local Index =
					math.max(
						1,
						math.ceil(
							#Sorted*.01
						)
					)

				LowFPS =
					Sorted[Index]
					or FPS
			end

			local Ping = 0

			pcall(function()

				Ping =
					Stats.Network.ServerStatsItem[
						"Data Ping"
					]:GetValue()

			end)

			CurrentPing = Ping

			local Memory = 0

			pcall(function()

				Memory =
					Stats:GetTotalMemoryUsageMb()

			end)

			CurrentMemory = Memory

			if Now - LastInstanceUpdate >= 2 then

				LastInstanceUpdate = Now

				local Count = 0
				local Parts = 0

				for _,Object in ipairs(
					workspace:GetDescendants()
				) do

					Count += 1

					if Object:IsA("BasePart") then
						Parts += 1
					end
				end

				CurrentInstances = Count
				CurrentParts = Parts
			end

			local Count = 0
			local Nearest
			local NearestDistance = math.huge

			for Monster in pairs(Monsters) do

				local Valid = false

				if Monster
					and Monster.Parent then

					local CheckSuccess,
						CheckResult =
						pcall(function()
							return IsMonster(Monster)
						end)

					Valid =
						CheckSuccess
						and CheckResult
				end

				if Valid then

					Count += 1

					local D =
						Distance(Monster)

					if D
						and D < NearestDistance then

						NearestDistance = D
						Nearest = Monster
					end

					AddMonsterESP(Monster)

				else

					Monsters[Monster] = nil
				end
			end

			CurrentMonsterCount = Count

			if State.PlayerESP then

				for _,Target in ipairs(
					Players:GetPlayers()
				) do

					if Target ~= Player then
						AddPlayerESP(Target)
					end
				end
			end

			--================================================
			-- PERFORMANCE UI
			--================================================

			FPSText.Text =
				"FPS: "..math.floor(FPS)

			LowFPSText.Text =
				"1% Low: "..math.floor(LowFPS)

			PingText.Text =
				"Ping: "
				..math.floor(Ping)
				.." ms"

			MemoryText.Text =
				"Memory: "
				..string.format("%.0f",Memory)
				.." MB"

			InstanceText.Text =
				"Instances: "
				..CurrentInstances

			PartsText.Text =
				"Parts: "
				..CurrentParts

			MonsterCountText.Text =
				"Detected: "..Count

			--================================================
			-- PERFORMANCE STATUS
			--================================================

			if FPS >= 90 then

				PerfStatusText.Text =
					"Status: EXCELLENT"

				PerfStatusText.TextColor3 =
					Color3.fromRGB(75,220,120)

				PerformanceStatus.Text =
					"● Performance: EXCELLENT"

				PerformanceStatus.TextColor3 =
					Color3.fromRGB(75,220,120)

			elseif FPS >= 60 then

				PerfStatusText.Text =
					"Status: GOOD"

				PerfStatusText.TextColor3 =
					Color3.fromRGB(160,220,90)

				PerformanceStatus.Text =
					"● Performance: GOOD"

				PerformanceStatus.TextColor3 =
					Color3.fromRGB(160,220,90)

			elseif FPS >= 30 then

				PerfStatusText.Text =
					"Status: LOW"

				PerfStatusText.TextColor3 =
					Color3.fromRGB(245,205,65)

				PerformanceStatus.Text =
					"● Performance: LOW"

				PerformanceStatus.TextColor3 =
					Color3.fromRGB(245,205,65)

			else

				PerfStatusText.Text =
					"Status: CRITICAL"

				PerfStatusText.TextColor3 =
					Color3.fromRGB(255,65,75)

				PerformanceStatus.Text =
					"● Performance: CRITICAL"

				PerformanceStatus.TextColor3 =
					Color3.fromRGB(255,65,75)
			end

			--================================================
			-- MONSTER TRACKER
			--================================================

			if State.MonsterTracker
				and Nearest then

				local DangerName,
					DangerColor =
					Danger(
						NearestDistance
					)

				NearestText.Text =
					"Nearest: "
					..Nearest.Name
					.." • "
					..math.floor(
						NearestDistance
					)
					.." studs"

				DangerText.Text =
					"Danger: "..DangerName

				DangerText.TextColor3 =
					DangerColor

				MonsterDistanceText.Text =
					"Distance: "
					..math.floor(
						NearestDistance
					)
					.." studs"

				MonsterStatus.Text =
					"● Monster System: "
					..DangerName

				MonsterStatus.TextColor3 =
					(
						DangerName == "CRITICAL"
						or DangerName == "DANGER"
					)
					and Color3.fromRGB(255,100,80)
					or Color3.fromRGB(100,220,130)

			else

				NearestText.Text =
					"Nearest: --"

				DangerText.Text =
					"Danger: SAFE"

				DangerText.TextColor3 =
					Color3.fromRGB(75,220,120)

				MonsterDistanceText.Text =
					"Distance: --"

				MonsterStatus.Text =
					"● Monster System: RUNNING"

				MonsterStatus.TextColor3 =
					Color3.fromRGB(100,220,130)
			end

			--================================================
			-- DASHBOARD
			--================================================

			SystemInfo.Text =
				"FPS: "
				..math.floor(FPS)
				.."   •   Ping: "
				..math.floor(Ping)
				.."   •   Monsters: "
				..Count

			if #Activity > 0 then

				ActivityText.Text =
					table.concat(
						Activity,
						"\n"
					)

				MonsterLogText.Text =
					table.concat(
						Activity,
						"\n"
					)

			else

				ActivityText.Text =
					"No recent activity."

				MonsterLogText.Text =
					"No monster events."
			end

			--================================================
			-- GREETING
			--================================================

			local Hour =
				tonumber(
					os.date("%H")
				)

			if Hour >= 6
				and Hour < 18 then

				Greeting.Text =
					"Доброго дня ☀️"

				PerfGreeting.Text =
					"Доброго дня ☀️"

			else

				Greeting.Text =
					"Доброй ночи 🌙"

				PerfGreeting.Text =
					"Доброй ночи 🌙"
			end

			--================================================
			-- RECONSTRUCTION STATUS
			--================================================

			if State.VisualReconstruction then

				ReconstructionStatus.Text =
					"Status: ACTIVE • "
					..State.VisualQuality

				ReconstructionStatus.TextColor3 =
					Accent()

			else

				ReconstructionStatus.Text =
					"Status: OFF"

				ReconstructionStatus.TextColor3 =
					Color3.fromRGB(145,145,155)
			end

			--================================================
			-- SERVER
			--================================================

			ServerText.Text =
				"PlaceId: "
				..game.PlaceId
				.."\nJobId: "
				..game.JobId
				.."\nPlayers: "
				..#Players:GetPlayers()
				.."\nMonsters: "
				..Count
				.."\nInstances: "
				..CurrentInstances
				.."\nParts: "
				..CurrentParts
				.."\nVersion: "
				..VERSION

			--================================================
			-- DEBUG
			--================================================

			if State.Debug then

				DebugText.Text =
					"NOXI DEBUG\n\n"
					.."Version: "
					..VERSION
					.."\nPlayer: "
					..Player.Name
					.."\nDisplay: "
					..Player.DisplayName
					.."\nMain Developer: "
					..tostring(
						IsMainDeveloper
					)
					.."\nMonster Folder: "
					..(
						GetMonsterFolder()
						and "FOUND"
						or "NOT FOUND"
					)
					.."\n\nFPS: "
					..math.floor(FPS)
					.."\n1% Low: "
					..math.floor(LowFPS)
					.."\nPing: "
					..math.floor(Ping)
					.." ms"
					.."\nMemory: "
					..math.floor(Memory)
					.." MB"
					.."\nInstances: "
					..CurrentInstances
					.."\nParts: "
					..CurrentParts
					.."\nPlayers: "
					..#Players:GetPlayers()
					.."\nMonsters: "
					..Count
					.."\n\nGraphics Boost: "
					..tostring(
						State.GraphicsBoost
					)
					.."\nVisual Reconstruction: "
					..tostring(
						State.VisualReconstruction
					)
					.."\nVisual Quality: "
					..State.VisualQuality
					.."\nProfile: "
					..State.PerformanceProfile

			else

				DebugText.Text =
					"Debug disabled.\n\n"
					.."Enable Debug Mode to view\n"
					.."live developer diagnostics."
			end

		end)

	if not Success then

		warn(
			"[NOXI'S HUB] Runtime error:",
			Error
		)

	end
end)

--========================================================
-- INITIAL PAGE
--========================================================

OpenPage("Dashboard")

--========================================================
-- STARTUP
-- IMPORTANT:
-- Loading is protected separately from runtime systems.
--========================================================

task.spawn(function()

	local function Step(Text,Percent)

		pcall(function()
			SafeLoadStep(Text,Percent)
		end)

	end

	Step(
		"Initializing interface...",
		10
	)

	Step(
		"Loading UI modules...",
		25
	)

	Step(
		"Preparing Monster System...",
		40
	)

	pcall(function()
		Scan(true)
	end)

	Step(
		"Starting Performance Monitor...",
		58
	)

	Step(
		"Preparing visual systems...",
		70
	)

	Step(
		"Checking developer tools...",
		82
	)

	Step(
		"Preparing dashboard...",
		93
	)

	task.wait(.2)

	Step(
		"NOXI'S HUB LOADED ✓",
		100
	)

	task.wait(.35)

	--====================================================
	-- SHOW MAIN BEFORE FADE
	--====================================================

	Main.Visible = true

	--====================================================
	-- FADE
	--====================================================

	if Loading
		and Loading.Parent then

		for _,Object in ipairs(
			Loading:GetDescendants()
		) do

			if Object:IsA("TextLabel") then

				pcall(function()

					TweenService:Create(
						Object,
						TweenInfo.new(.35),
						{
							TextTransparency = 1
						}
					):Play()

				end)

			elseif Object:IsA("Frame") then

				pcall(function()

					TweenService:Create(
						Object,
						TweenInfo.new(.35),
						{
							BackgroundTransparency = 1
						}
					):Play()

				end)
			end
		end

		task.wait(.5)

		if Loading
			and Loading.Parent then

			Loading:Destroy()

		end
	end

	AddActivity(
		"🚀 Noxi's Hub "
		..VERSION
		.." loaded"
	)

	print(
		"================================"
	)

	print(
		"NOXI'S HUB "..VERSION
	)

	print(
		"MONSTER & PERFORMANCE REWORK"
	)

	print(
		"VISUAL RECONSTRUCTION READY"
	)

	print(
		"MAIN DEVELOPER: "
		..DEVELOPER_DISPLAY
		.." (@"
		..DEVELOPER_USERNAME
		..")"
	)

	print(
		"BUILD LOADED"
	)

	print(
		"================================"
	)

end)

--========================================================
-- END
--========================================================