local options = {
    x = 0.90,
    y = 0.30,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "VEHICLE CONTROL",
    color_r = 0,
    color_g = 0,
    color_b = 0,
}

local elements = {}
local menuopen = false
local isInVehicle = false
local engineon = true
local limiteur = false
speed = 0
local regulateur = 50

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(1, 26) and IsPedInAnyVehicle(GetPlayerPed(-1)) then
            MainMenu()
            Menu.hidden = not Menu.hidden
            menuopen = not menuopen
       end
        Menu.renderGUI(options)
    end
end)



function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function MainMenu()
    options.menu_subtitle = "CATEGORIES"  
    ClearMenu()
    Menu.addButton("On/Off Engine", "onoffengine", nil)
    Menu.addButton("Speed Regulator", "MenuSpeedo", 50)
    Menu.addButton("Doors", "DoorMenu", nil)
    Menu.addButton("Close menu", "closemenu", nil)
end

function DoorMenu()
    options.menu_subtitle = "CATEGORIES"  
    ClearMenu()
    Menu.addButton("Hood", "capot", nil)
    Menu.addButton("Trunk", "coffre", nil)
    Menu.addButton("Front doors", "avant", nil)    
    Menu.addButton("Back doors", "arriere", nil)
    Menu.addButton("All doors", "toute", nil)    
    Menu.addButton("Back", "MainMenu", nil)
end

function avant()
    options.menu_subtitle = "PORTIERES"  
    ClearMenu()
    Menu.addButton("Front left", "avantgauche", nil)
    Menu.addButton("Front right", "avantdroite", nil)
    Menu.addButton("Back", "DoorMenu", nil)
end

function arriere()
    options.menu_subtitle = "PORTIERES"  
    ClearMenu()
    Menu.addButton("Back left", "arrieregauche", nil)
    Menu.addButton("Back right", "arrieredroite", nil)
  Menu.addButton("Back", "DoorMenu", nil)
end

function MenuSpeedo()
  if regulateur == 50 then
    options.menu_subtitle = "SPEED REGULATOR :  NO"  
  else
    options.menu_subtitle = "SPEED REGULATOR : ~g~" ..regulateur..  "~s~ KPH"
  end
    ClearMenu()
    Menu.addButton("Increase regulator", "uprregu", nil)
    Menu.addButton("Decrease regulator", "downrregu", nil)
    if regulateur > 50 then
    Menu.addButton("Disable regulator", "suprregu", nil)
    end
    Menu.addButton("Back", "MainMenu", nil)
end

function capot()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 4, false)
       else
         SetVehicleDoorOpen(playerVeh, 4, false)
         frontleft = true        
      end
   end
end

function coffre()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 5, false)
       else
         SetVehicleDoorOpen(playerVeh, 5, false)
         frontleft = true        
      end
   end
end

function maxspeed()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   enableCruise = not enableCruise -- inverts bool
   cruiseSpeed = GetEntitySpeed(veh)  
   GetEntitySpeed(playerVeh, 10)
end

function avantgauche()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 0, false)
       else
         SetVehicleDoorOpen(playerVeh, 0, false)
         frontleft = true        
      end
   end
end

function MyPed()
   return GetPlayerPed(-1)
end


function avantdroite()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 1, false)
       else
         SetVehicleDoorOpen(playerVeh, 1, false)
         frontleft = true        
      end
   end
end

function arrieredroite()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 3, false)
       else
         SetVehicleDoorOpen(playerVeh, 3, false)
         frontleft = true        
      end
   end
end

function toute()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 5, false)        
         SetVehicleDoorShut(playerVeh, 4, false)
         SetVehicleDoorShut(playerVeh, 3, false)
         SetVehicleDoorShut(playerVeh, 2, false)
         SetVehicleDoorShut(playerVeh, 1, false)
         SetVehicleDoorShut(playerVeh, 0, false)         
       else
         SetVehicleDoorOpen(playerVeh, 5, false)        
         SetVehicleDoorOpen(playerVeh, 4, false)
         SetVehicleDoorOpen(playerVeh, 3, false)
         SetVehicleDoorOpen(playerVeh, 2, false)
         SetVehicleDoorOpen(playerVeh, 1, false)
         SetVehicleDoorOpen(playerVeh, 0, false)  
         frontleft = true        
      end
   end
end

function arrieregauche()
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   if ( IsPedSittingInAnyVehicle( playerPed ) ) then
      if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then 
         SetVehicleDoorShut(playerVeh, 2, false)
       else
         SetVehicleDoorOpen(playerVeh, 2, false)
         frontleft = true        
      end
   end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0) 
    if regulateur == 50 then
    else      
        speedo(regulateur)
      end
    end
end)

function setregul()
        local ped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(ped, false)  
        local currSpeed = GetEntitySpeed(vehicle)*3.6  
        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local vitesse = GetOnscreenKeyboardResult()
          if not vitesse ~= nil then
          Notify("NIL")
          else  
          local res = tonumber(vitesse)  
          if currSpeed > res then
            Notify("~r~You can't do this because your speed is higher at ~g~50 ~r~kph.")
        else             
            speedo(res)
            regulateur = res
            MainMenu()
            Wait(1)
            MenuSpeedo()  
            Menu.selection = 1    
            end      
          end
        end      
end

function suprregu()
  print("1")
  speedo(0)
  regulateur = 50
  MainMenu()
  Wait(1)
  MenuSpeedo()
  Menu.selection = 2
end

function uprregu()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)  
    local currSpeed = GetEntitySpeed(vehicle)*3.6
    if currSpeed > regulateur then
      Notify("~r~You can't do this because your speed is higher at ~g~50 ~r~kph.")
    else  
  regulateur = regulateur +10
  MainMenu()
  Wait(1)
  MenuSpeedo()
end
end

function downrregu()
  if regulateur < 60 then
    print('testtt')
    regulateur = 50
  MainMenu()
  Wait(1)
  MenuSpeedo()      
else
  if regulateur == 50 then
  regulateur = 50
  speedo(0)
else  
  regulateur = regulateur -10
  MainMenu()
  Wait(1)
  MenuSpeedo()  
  Menu.selection = 1
end
end
end

function speedo(vit)
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)  
    local currSpeed = GetEntitySpeed(vehicle)*3.6
    speed = vit/3.62
   
    local vehicleModel = GetEntityModel(vehicle)
    local float Max = GetVehicleMaxSpeed(vehicleModel)  
    if (vit == 0) then
    SetEntityMaxSpeed(vehicle, Max)
    end      
  if currSpeed > vit then
  else
   
    if (vit == 0) then
    SetEntityMaxSpeed(vehicle, Max)
    else
    if vit == 0 and currSpeed < 5 then  
    else
      SetEntityMaxSpeed(vehicle, speed)
  end
    end
end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
        if limiteur then
          local ped = GetPlayerPed(-1)
          local vehicle = GetVehiclePedIsIn(ped, false)          
          SetEntityMaxSpeed(vehicle, speed) 
       end
    end
end)

function onoffengine()
  if engineon then
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false)    
   engineon = false
  else
   local playerPed = GetPlayerPed(-1)
   local playerVeh = GetVehiclePedIsIn(playerPed, false)
   SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, false)   
   engineon = true 
end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
        if not engineon then
          SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false)     
       end
    end
end)

function closemenu()
    Menu.hidden = not Menu.hidden
    menuopen = not menuopen
end


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustPressed(1, 177) and menuopen then
            closemenu()
       end
    end
end)






