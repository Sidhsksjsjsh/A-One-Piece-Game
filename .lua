local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")

local workspace = game:GetService("Workspace")
local self = game:GetService("Players").LocalPlayer

local var = {
  click = false,
  item = {
    typ = "MouseButton1",
    name = "Fighting Style",
    dmg = 9e9
  },
  spin = false,
  dash = false
}

local function getEnemy(near,num,funct)
for i,v in pairs(workspace["Entities"]:GetChildren()) do
  if near == true then
    if (self.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < num then
      funct(v)
    end
  else
    funct(v)
  end
end
end

T1:Toggle("Auto attack [ Melee ] [ Nearest 25 studs ]",false,function(value)
    var.click = value
    while wait() do
      if var.click == false then break end
      getEnemy(true,25,function(v)
          game:GetService("ReplicatedStorage")["Remotes"]["requestAbility"]:FireServer(var.item.name,var.item.typ,CFrame.new(0,0,0,0,0,0,0,0,0,0,0,0),v.Head,var.item.dmg)
      end)
    end
end)

T1:Toggle("Auto spin",false,function(value)
    var.spin = value
    while wait() do
      if var.spin == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["RequestSpinReward"]:FireServer({["Action"] = "Claim",["Type"] = "Normal"})
    end
end)

T1:Toggle("Auto dash",false,function(value)
    var.dash = value
    while wait() do
      if var.dash == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["requestDash"]:InvokeServer("W")
    end
end)