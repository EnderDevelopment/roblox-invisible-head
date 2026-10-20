-- HideHeadFromOthers.server.lua

-- This script hides the head from other players while keeping hats and head accessories visible.

local Players = game:GetService("Players")

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    local head = character:WaitForChild("Head")

    -- Hide the head from other players
    head.Transparency = 1

    -- Keep hats and head accessories visible
    for _, accessory in ipairs(head:GetChildren()) do
        if accessory:IsA("Accessory") then
            accessory.Handle.Transparency = 0
        end
    end

    -- Handle hats and accessories added later
    head.ChildAdded:Connect(function(child)
        if child:IsA("Accessory") then
            child.Handle.Transparency = 0
        end
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(onCharacterAdded)
end)
