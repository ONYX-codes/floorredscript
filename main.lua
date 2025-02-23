Workspace = game:GetService("Workspace")
Players = game:GetService("Players")
Player = Players.LocalPlayer

local floor = Instance.new("Part")
floor.Size = Vector3.new(10000000, 1, 10000000)
floor.Position = Vector3.new(0, -0.6, 0)
floor.Anchored = true
floor.Material = Enum.Material.Glass
floor.Color = Color3.new(5, 0, 0)
floor.Transparency = 0.8
floor.Parent = Workspace

getgenv().CloneSettings = {
    Enabled = false,
    Bind = "G",
    Value = 15,
    Delay = 0.05
}

InputService = game:GetService("UserInputService")

InputService.InputBegan:Connect(function(Input, GetInput)
    if GetInput then
        return
    end

    if Input.KeyCode == Enum.KeyCode[getgenv().CloneSettings.Bind] then
        getgenv().CloneSettings.Enabled = not getgenv().CloneSettings.Enabled
    end
end)

while task.wait() do
    pcall(function()
        if getgenv().CloneSettings.Enabled then
            local cOld = Player.Character.HumanoidRootPart.CFrame

            Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(-getgenv().CloneSettings.Value, 0, 0)
            task.wait(getgenv().CloneSettings.Delay)
            Player.Character.HumanoidRootPart.CFrame = cOld
            task.wait(getgenv().CloneSettings.Delay)
            Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(getgenv().CloneSettings.Value, 0, 0)
            task.wait(getgenv().CloneSettings.Delay)
            Player.Character.HumanoidRootPart.CFrame = cOld
        end
    end)
end
