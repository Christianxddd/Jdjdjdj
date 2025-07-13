-- Script de velocidad y salto alto forzado para "Roba un Brainlot"

local speed = 100 -- Puedes subir más si quieres
local jump = 120  -- Puedes subir más si quieres

local player = game.Players.LocalPlayer

-- Función para aplicar los valores
local function applyStats()
	local char = player.Character
	if char and char:FindFirstChild("Humanoid") then
		local hum = char:FindFirstChild("Humanoid")
		hum.WalkSpeed = speed
		hum.JumpPower = jump
	end
end

-- Ejecuta al inicio
applyStats()

-- Si respawnea, reaplica
player.CharacterAdded:Connect(function()
	wait(1)
	applyStats()
end)

-- Forzar que se mantenga activo (cada 0.1s)
while true do
	task.wait(0.1)
	pcall(applyStats)
end
