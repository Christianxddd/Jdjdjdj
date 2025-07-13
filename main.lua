--// By Christian - Panel con velocidad y salto toggle

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "PanelC"

-- Botón flotante "C"
local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.new(0, 40, 0, 40)
icon.Position = UDim2.new(0, 100, 0, 100)
icon.Text = "C"
icon.TextScaled = true
icon.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.Draggable = true
icon.Active = true

-- Panel principal
local panel = Instance.new("Frame", gui)
panel.Size = UDim2.new(0, 300, 0, 150)
panel.Position = UDim2.new(0.5, -150, 0.5, -75)
panel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
panel.BackgroundTransparency = 0.3
panel.Visible = false
panel.Active = true
panel.Draggable = true

-- Título
local titulo = Instance.new("TextLabel", panel)
titulo.Size = UDim2.new(1, 0, 0, 30)
titulo.BackgroundTransparency = 1
titulo.Text = "Panel de Velocidad y Salto"
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.Font = Enum.Font.SourceSansBold
titulo.TextScaled = true

-- Botón Velocidad
local speedBtn = Instance.new("TextButton", panel)
speedBtn.Size = UDim2.new(0.4, 0, 0, 40)
speedBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
speedBtn.Text = "🏃 Velocidad: OFF"
speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBtn.Font = Enum.Font.SourceSans
speedBtn.TextScaled = true

-- Botón Salto
local jumpBtn = Instance.new("TextButton", panel)
jumpBtn.Size = UDim2.new(0.4, 0, 0, 40)
jumpBtn.Position = UDim2.new(0.55, 0, 0.4, 0)
jumpBtn.Text = "🦘 Salto: OFF"
jumpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
jumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpBtn.Font = Enum.Font.SourceSans
jumpBtn.TextScaled = true

-- Estado de activación
local speedOn = false
local jumpOn = false

-- Funciones
speedBtn.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    if speedOn then
        humanoid.WalkSpeed = 100
        speedBtn.Text = "🏃 Velocidad: ON"
        speedBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        humanoid.WalkSpeed = 16
        speedBtn.Text = "🏃 Velocidad: OFF"
        speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

jumpBtn.MouseButton1Click:Connect(function()
    jumpOn = not jumpOn
    if jumpOn then
        humanoid.JumpPower = 120
        jumpBtn.Text = "🦘 Salto: ON"
        jumpBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        humanoid.JumpPower = 50
        jumpBtn.Text = "🦘 Salto: OFF"
        jumpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Abrir/cerrar panel con botón "C"
icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)
