local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Teleport")
local T75 = wndw:Tab("Note")

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
  dash = false,
  island = {},
  szone = "null",
  method = "tween"
}
--lib:TeleportMethod(mthd,str)
lib:AddTable(workspace["Map"]["Islands"],var.island)

T75:Label("This script is still in " .. lib:ColorFonts("development stage","Red") .. "\nSome features are upcoming and bugs will be " .. lib:ColorFonts("fixed","Red") .. " soon.")
T75:Label("Currently the 'Auto attack' feature is still available for melee weapons\nfor fruit and others will come in future updates.")
T75:Label("DONT COMPLAIN BITCH")

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

T1:Toggle("Auto attack [ Melee ]",false,function(value)
    var.click = value
    while wait() do
      if var.click == false then break end
      getEnemy(false,25,function(v)
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

T2:Dropdown("Select island",var.island,function(value)
    var.szone = value
end)

T2:Dropdown("Select tp method",{"tween","tp"},function(value)
    var.method = value
end)

T2:Button("Go to selected island",function()
    if var.szone ~= "null" then
      lib:TeleportMethod(var.method,workspace["Map"]["Islands"][var.szone]["Model"]["Spawner"]["Crystal"]["CFrame"])
    end
end)

if self.Name == "Rivanda_Cheater" then
local T3 = wndw:Tab("Developer")
  
T3:Button("Remote spy",function()
      lib:notify("Injecting",10)
      lib:RemoteSpy()
end)
end
