local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = " | IorvziHub",
   LoadingTitle = " | IorvziHub",
   LoadingSubtitle = "TikTok/Insta: iorvzi",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "Folder",
      FileName = "File"
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

---

Tab = Window:CreateTab("| Home", 6026568199)
 -- Important
  Tab:CreateParagraph({
   Title = "Important",
   Content = "My Social Medias For Updates!"
  })
 -- Link Copied Message
  local function copyAndNotify(link)
    setclipboard(link)
    Rayfield:Notify({
        Title = "Notification",
        Content = "Link Copied!",
        Duration = 3,
        Image = 6026568199
    })
  end
 -- Discord
  Tab:CreateButton({
    Name = "Discord",
    Callback = function()
        copyAndNotify("https://discord.gg/6WMDv77W")
    end
  })
 -- TikTok
  Tab:CreateButton({
    Name = "TikTok",
    Callback = function()
        copyAndNotify("tiktok.com/@iorvzi")
    end
  })
 -- Instagram
  Tab:CreateButton({
    Name = "Instagram",
    Callback = function()
        copyAndNotify("instagram.com/@iorvzi")
    end
  })

 -- Local Player
  Tab:CreateParagraph({
   Title = "Local Player",
   Content = "Modify Yourself!"
  })
  local Player = game.Players.LocalPlayer
  local Character = Player.Character or Player.CharacterAdded:Wait()
  local Humanoid = Character:WaitForChild("Humanoid")

  local RunService = game:GetService("RunService")
  local UserInputService = game:GetService("UserInputService")

  local SpeedEnabled = false
  local SpeedValue = 16
  local JumpEnabled = false
  local JumpValue = 50
  local InfiniteJumpEnabled = false
  local NoclipEnabled = false

  Player.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
  end)

  Tab:CreateToggle({
    Name = "Enable Speed",
    CurrentValue = false,
    Callback = function(value)
        SpeedEnabled = value
        if not value and Humanoid then
            Humanoid.WalkSpeed = 16
        end
    end
  })

  Tab:CreateSlider({
    Name = "Speed Slider",
    Range = {0, 250},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = 16,
    Callback = function(value)
        SpeedValue = value
    end
  })

  Tab:CreateToggle({
    Name = "Enable JumpPower",
    CurrentValue = false,
    Callback = function(value)
        JumpEnabled = value
        if not value and Humanoid then
            Humanoid.JumpPower = 50
        end
    end
  })

  Tab:CreateSlider({
    Name = "JumpPower Slider",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "JumpPower",
    CurrentValue = 50,
    Callback = function(value)
        JumpValue = value
    end
  })

  Tab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(value)
        InfiniteJumpEnabled = value
    end
  })

  UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
  end)

  Tab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(value)
        NoclipEnabled = value
    end
  })

  RunService.Stepped:Connect(function()
    if SpeedEnabled and Humanoid then
        Humanoid.WalkSpeed = SpeedValue
    end
    if JumpEnabled and Humanoid then
        Humanoid.JumpPower = JumpValue
    end
    if NoclipEnabled and Character then
        for _, part in pairs(Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
  end)

  Tab:CreateButton({
    Name = "Fly Script",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Xdyxz/flyscript.lua/main/flyscript.lua'))()
    end
  })
-- Visuals 
 Tab:CreateParagraph({
   Title = "Visuals",
   Content = "Things that only you see!"
 })

Window:CreateTab("| Target", 6026568199)
Window:CreateTab("| Other", 6026568199)
Window:CreateTab("| Settings", 6026568199)
