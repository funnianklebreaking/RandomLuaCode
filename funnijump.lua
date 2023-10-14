local player = game.Players.LocalPlayer

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    local groundSpeed = 24
    local airSpeed = 50

    humanoid.WalkSpeed = groundSpeed -- Set the initial ground speed here.

    local function onStateChanged(oldState, newState)
        if newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Freefall then
            humanoid.WalkSpeed = airSpeed
        else
            humanoid.WalkSpeed = groundSpeed
        end
    end

    humanoid.StateChanged:Connect(onStateChanged)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end
