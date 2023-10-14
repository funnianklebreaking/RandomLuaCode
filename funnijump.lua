local character = game.Players.LocalPlayer.Character
local humanoid = character:WaitForChild("Humanoid")

local groundSpeed = 24
local airSpeed = 50

humanoid.WalkSpeed = groundSpeed

local function onStateChanged(oldState, newState)
    if newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Freefall then
        humanoid.WalkSpeed = airSpeed
    else
        humanoid.WalkSpeed = groundSpeed
    end
end

humanoid.StateChanged:Connect(onStateChanged)
