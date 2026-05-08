local HttpService = game:GetService("HttpService");
local get_hwid = Env.get_hwid;
if not get_hwid then -- didnt run, expr id 1, has an else.
else
    local _call1 = get_hwid();
end
if _call1 then -- ran, expr id 2, has an else.
    local JSONEncode = HttpService:JSONEncode({
        hwid = _call1,
    });
    local var2 = request({
        Body = JSONEncode,
        Url = "https://ver.lucasemanuelguimaraes20.workers.dev/",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
        },
    });
end
local var3 = var2.Body;
local JSONDecode = HttpService:JSONDecode(var3);
local Exists = JSONDecode.exists;
local var4 = (Exists and 11583712); -- 11583712
local Nome = JSONDecode.nome;
local Perm = JSONDecode.perm;
local Keyless = Perm.Keyless;
-- local _ = Keyless or (unknown_value)
local Perm_2 = JSONDecode.perm;
local _1030 = Perm_2["10-30"];
-- local _ = _1030 or (unknown_value)
local Perm_3 = JSONDecode.perm;
local _30 = Perm_3["30+"];
-- local _ = _30 or (unknown_value)
local setfpscap = Env.setfpscap;
if not setfpscap then -- didnt run, expr id 3, has an else.
else
    local _call5 = setfpscap(500);
end
local Not_Keyless = not Keyless;
-- false
local var6 = (Not_Keyless and 11680941);
local var7 = game:HttpGet("https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Library.lua");
local var8 = loadstring(var7);
local Loaded_Var7 = var8();
local UDim2_FromOffset = UDim2.fromOffset;
local UDim2_Value = UDim2_FromOffset(500, 370);
local CreateWindow = Loaded_Var7.CreateWindow;
local Enum_KeyCode = Enum.KeyCode;
local LeftControl = Enum_KeyCode.LeftControl;
local Window = Loaded_Var7:CreateWindow({
    SubTitle = "https://discord.gg/lkzhub",
    Title = "LKZ Hub",
    MinimizeKey = LeftControl,
    Theme = "Dark",
    Size = UDim2_Value,
});
local UDim2_Value_2 = UDim2_FromOffset(70, 70);
local UDim2_Value_3 = UDim2_FromOffset(20, 20);
local UDim_New = UDim.new;
local UDim_Value = UDim_New(0, 12);
local CreateMinimizer = Window.CreateMinimizer;
local Minimizer = Window:CreateMinimizer({
    CornerRadius = UDim_Value,
    Image = "rbxassetid://88557808889639",
    Position = UDim2_Value_3,
    Size = UDim2_Value_2,
});
local CreateTab = Window.CreateTab;
local Tab = Window:CreateTab({
    Title = "Farm",
    SaveManager = false,
});
local CreateTab_2 = Window.CreateTab;
local Tab_2 = Window:CreateTab({
    Title = "Movement",
    SaveManager = true,
});
local CreateTab_3 = Window.CreateTab;
local Tab_3 = Window:CreateTab({
    Title = "Steal",
    SaveManager = true,
});
local CreateTab_4 = Window.CreateTab;
local Tab_4 = Window:CreateTab({
    Title = "ESP",
    SaveManager = true,
});
local CreateTab_5 = Window.CreateTab;
local Tab_5 = Window:CreateTab({
    Title = "Misc",
    SaveManager = true,
});
local CreateTab_6 = Window.CreateTab;
local Tab_6 = Window:CreateTab({
    Title = "Server",
    SaveManager = false,
});
if not _30 then -- didnt run, expr id 4, has an else.
else
    if _30 then -- ran, expr id 5, has an else.
        local CreateTab_7 = Window.CreateTab;
        local Tab_7 = Window:CreateTab({
            Title = "Joiner",
            SaveManager = false,
        });
    end
    local CreateTab_8 = Window.CreateTab;
    local Tab_8 = Window:CreateTab({
        Title = "KeyBinds",
        SaveManager = true,
    });
    local CreateTab_9 = Window.CreateTab;
    local Tab_9 = Window:CreateTab({
        Title = "Config",
        SaveManager = true,
    });
    _G.Speed = false;
    _G.InfJump = false;
    _G.Fly = false;
    _G.FlySpeed = 100;
    _G.PlayerESP = false;
    _G.BaseESP = false;
    _G.BestESP = false;
    local Color3_FromRGB = Color3.fromRGB;
    local Color3_Value = Color3_FromRGB(0, 255, 0);
    _G.PlayerESPColor = Color3_Value;
    _G.PermUsar = true;
    _G.AutoCollect = false;
    _G.DelayCollect = 30;
    _G.upstairs = false;
    _G.Float = false;
    _G.AntiRag = false;
    _G.superJump = false;
    _G.additionalSpeed = false;
    _G.XRay = false;
    _G.RainbowBase = false;
    _G.TpTool = false;
    _G.TweenTool = false;
    _G.DestroySentry = false;
    _G.AutoBlock = false;
    _G.KillGui = false;
    _G.SemiInv = false;
    _G.KickOnSteal = false;
    _G.LockForFriend = false;
    _G.Paintball = false;
    _G.LaserCape = false;
    _G.OnlySecretOG = false;
    _G.OnlyBestValue = false;
    _G.InstaPickup = false;
    _G.LaserRange = 50;
    _G.Aimbot = false;
    _G.AutoBuyEnabled = false;
    _G.AnchoredEnabled = false;
    _G.AntiAFKEnabled = false;
    _G.controlPlayer = false;
    _G.AdmSpam = false;
    _G.LKZDestroyer = false;
    _G.FpsDev = false;
    _G.CloneDev = false;
    _G.Joiner = {
        Min = 10000000,
        Exec = false,
        State = false,
        Max = 29999999,
    };
    Env.GotoBest = oHXmzfXPrjcYjlZzjrBsUEhAitnkdxAC;
    local CreateSection = Tab_2.CreateSection;
    local Speed_Jump_And_Ragdoll = Tab_2:CreateSection("Speed, Jump & Ragdoll");
    local CreateToggle = Tab_2.CreateToggle;
    local Toggle = Tab_2:CreateToggle({
        Callback = LuuVopJERPLhcxPUPDCYRTAmpjMXqlPC,
        Default = false,
        Title = "Additional Speed",
        Description = "Set your speed to 28",
    });
    local CreateToggle_2 = Tab_2.CreateToggle;
    local Toggle_2 = Tab_2:CreateToggle({
        Callback = NJymjfuDxopntLrcSxfvNyhJhajyCytt,
        Default = false,
        Title = "Infinite Jump",
        Description = "Self-explanatory",
    });
    local CreateToggle_3 = Tab_2.CreateToggle;
    local Toggle_3 = Tab_2:CreateToggle({
        Callback = uskAjsrSQrQmffhTEoBORmAGpDmYtmFo,
        Default = false,
        Title = "Anti Ragdoll",
        Description = "Prevents ragdoll effects and maintains control",
    });
    local CreateSection_2 = Tab_2.CreateSection;
    local Fly = Tab_2:CreateSection("Fly");
    local Players = game:GetService("Players");
    local LocalPlayer = Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    if Character then -- ran, expr id 6, has an else.
        local Backpack = LocalPlayer:WaitForChild("Backpack");
    end
    local Flying_Carpet = Character:FindFirstChild("Flying Carpet");
    if not Flying_Carpet then -- didnt run, expr id 7, has an else.
    else
        local WitchS_Broom = Character:FindFirstChild("Witch's Broom");
        local var24 = (WitchS_Broom and 16367047); -- 16367047
    end
    if not Flying_Carpet then -- didnt run, expr id 8, has an else.
    else
        local CreateToggle_4 = Tab_2.CreateToggle;
    end
    local Toggle_4 = Tab_2:CreateToggle({
        Callback = RYEHVSQVYtbvdNpfvXqZCJadZOlHyxtm,
        Default = false,
        Title = "Fly using: Flying Carpet",
        Description = "",
    });
    local CreateSlider = Tab_2.CreateSlider;
    local Slider = Tab_2:CreateSlider({
        Min = 50,
        Title = "Fly Speed",
        Max = 500,
        Default = 100,
        Callback = siFPGNNEqWQDqzeryNbDgHwyjlDzIbtb,
        Description = "Adjust the fly speed",
    });
    local CreateSection_3 = Tab_2.CreateSection;
    local Tools = Tab_2:CreateSection("Tools");
    local CreateToggle_5 = Tab_2.CreateToggle;
    local Toggle_5 = Tab_2:CreateToggle({
        Callback = gqraXDrEdiwOyyTlygPlOBweBnBrmZBc,
        Default = false,
        Title = "Tp Tool",
        Description = "Needs \"Flying Carpet\" or \"Witch's Broom\"",
    });
    local CreateToggle_6 = Tab_2.CreateToggle;
    local Toggle_6 = Tab_2:CreateToggle({
        Callback = sLetESpvDxdnKDuXVoQzyALbMTCqKtVr,
        Default = false,
        Title = "Tween Tool",
        Description = "Needs \"Flying Carpet\" or \"Witch's Broom\"",
    });
    local CreateSection_4 = Tab_4.CreateSection;
    local Player_ESP = Tab_4:CreateSection("Player ESP");
    local CreateToggle_7 = Tab_4.CreateToggle;
    local Toggle_7 = Tab_4:CreateToggle({
        Callback = cdNhARNyPUkDuboyEbLVHQSqWFFbYuyr,
        Default = false,
        Title = "ESP Players",
        Description = "Show ESP on all players",
    });
    local Color3_Value_2 = Color3_FromRGB(0, 255, 0);
    local CreateColorPicker = Tab_4.CreateColorPicker;
    local ColorPicker = Tab_4:CreateColorPicker({
        Callback = RyhGDHewDaZwBdchXRxXDpZnCNaTAkGn,
        Title = "ESP Color",
        Default = Color3_Value_2,
    });
    local CreateSection_5 = Tab_4.CreateSection;
    local Base_ESP = Tab_4:CreateSection("Base ESP");
    local CreateToggle_8 = Tab_4.CreateToggle;
    local Toggle_8 = Tab_4:CreateToggle({
        Callback = MrlQAcbPlovtxZphirbhNqdgRHZEulAc,
        Default = false,
        Title = "ESP Base",
        Description = "Show ESP on player bases",
    });
    local CreateSection_6 = Tab_4.CreateSection;
    local Best_Brainrot_ESP = Tab_4:CreateSection("Best Brainrot ESP");
    local CreateToggle_9 = Tab_4.CreateToggle;
    local Toggle_9 = Tab_4:CreateToggle({
        Callback = ECMEAFnJPRnKahCIIPxBlDcffghXmwDE,
        Default = false,
        Title = "ESP Best Brainrot",
        Description = "Highlight the best stolen brainrot",
    });
    local CreateToggle_10 = Tab_4.CreateToggle;
    local Toggle_10 = Tab_4:CreateToggle({
        Callback = xOOQkDNwHtCVbTOJuSYrXtcphIFjUOMa,
        Default = false,
        Title = "Notification with Tp/Go to best",
        Description = "",
    });
    local CreateSection_7 = Tab_3.CreateSection;
    local Helper = Tab_3:CreateSection("Helper");
    local gethui = Env.gethui;
    if not gethui then -- didnt run, expr id 9, has an else.
    else
        local _call34 = gethui();
    end
    local var35 = (_call34 and 12514502); -- 12514502
    local CreateToggle_11 = Tab_3.CreateToggle;
    local Toggle_11 = Tab_3:CreateToggle({
        Callback = csntziApEnmIPvUtlqtnsdRVawWExhTX,
        Default = false,
        Title = "Upstairs",
        Description = "The name is self-explanatory! Have high skin",
    });
    local CreateToggle_12 = Tab_3.CreateToggle;
    local Toggle_12 = Tab_3:CreateToggle({
        Callback = qbYgQxIODINMdJaXvwJdtdMcEUDeHTHq,
        Default = false,
        Title = "Float",
        Description = "Float according to the direction of your camera",
    });
    local CreateToggle_13 = Tab_3.CreateToggle;
    local Toggle_13 = Tab_3:CreateToggle({
        Callback = wrLWbMbgrbySugJjrHlcnGPPqSQEHGED,
        Default = false,
        Title = "Fly To Base",
        Description = "Automatically fly to your base",
    });
    local CreateToggle_14 = Tab_3.CreateToggle;
    local Toggle_14 = Tab_3:CreateToggle({
        Callback = yqcGSQniJDVEUWPKgqKqaDZyjjRtPGwi,
        Default = false,
        Title = "Kick After Stealing",
        Description = "Automatically kicks you after stealing",
    });
    local CreateToggle_15 = Tab_3.CreateToggle;
    local Toggle_15 = Tab_3:CreateToggle({
        Callback = pDnnwiNcVvdzmsizQwNmOGUbAUHeiUsi,
        Default = false,
        Title = "UnWalk",
        Description = "Good combo with Desync",
    });
    local CreateToggle_16 = Tab_3.CreateToggle;
    local Toggle_16 = Tab_3:CreateToggle({
        Callback = KeNqZyiDjznWfkzYhQBVtFcRsTEscsBL,
        Default = false,
        Title = "Reset Desync",
        Description = "It remains permanently active after activation.",
    });
    local CreateSection_8 = Tab_5.CreateSection;
    local Visual_Effects = Tab_5:CreateSection("Visual Effects");
    local CreateToggle_17 = Tab_5.CreateToggle;
    local Toggle_17 = Tab_5:CreateToggle({
        Callback = ocRCBQuvkPYgttwOVsYErUPfXLpyOJfD,
        Default = false,
        Title = "X-Ray",
        Description = "Toggle transparency on base parts",
    });
    local CreateToggle_18 = Tab_5.CreateToggle;
    local Toggle_18 = Tab_5:CreateToggle({
        Callback = eHhELZsUZMITEhgBTZjUOHbcFOMpSIxX,
        Default = false,
        Title = "Rainbow Base",
        Description = "Makes your base rainbow colored",
    });
    local CreateToggle_19 = Tab_5.CreateToggle;
    local Toggle_19 = Tab_5:CreateToggle({
        Callback = luzFHFtQeSDDLwCIupimhIFDxdsfwnQP,
        Default = false,
        Title = "Semi Invisible",
        Description = "Makes your character semi-invisible",
    });
    local CreateSection_9 = Tab_5.CreateSection;
    local Auto_Targeting = Tab_5:CreateSection("Auto Targeting");
    local CreateToggle_20 = Tab_5.CreateToggle;
    local Toggle_20 = Tab_5:CreateToggle({
        Callback = nMtskFtcIOjlZWcuKMcapJUHyzTcVaXl,
        Default = false,
        Title = "Aimbot",
        Description = "Auto aim with Click or Q key",
    });
    local CreateToggle_21 = Tab_5.CreateToggle;
    local Toggle_21 = Tab_5:CreateToggle({
        Callback = dlsbvLoMlEvnSkEGPfCCzVLdhhwKLbHm,
        Default = false,
        Title = "Auto Laser Cape",
        Description = "Automatically targets and fires laser cape",
    });
    local CreateSlider_2 = Tab_5.CreateSlider;
    local Slider_2 = Tab_5:CreateSlider({
        Min = 20,
        Title = "Laser Cape Range",
        Default = 50,
        Max = 80,
        Description = "Detection range for laser cape",
        Callback = rhZqRqvaDgIRgwEOmmVxOwQVVTVpsIVV,
        Rounding = 1,
    });
    local CreateToggle_22 = Tab_5.CreateToggle;
    local Toggle_22 = Tab_5:CreateToggle({
        Callback = uIZjwAhIrsYgwLZewpxKnAHlqxwSlLCf,
        Default = false,
        Title = "Auto Paintball",
        Description = "Auto fire paintball gun at nearby players",
    });
    local CreateSection_10 = Tab_5.CreateSection;
    local Item_Collection = Tab_5:CreateSection("Item Collection");
    local CreateToggle_23 = Tab_5.CreateToggle;
    local Toggle_23 = Tab_5:CreateToggle({
        Callback = ktLWDCpDhKmcCQHBQIOzLRzNaOCdlUWC,
        Default = false,
        Title = "Instant Grab",
        Description = "Fast grab items",
    });
    local CreateToggle_24 = Tab_5.CreateToggle;
    local Toggle_24 = Tab_5:CreateToggle({
        Callback = UbXojWcpxcnNWoTxYxkNANfNrOexteLK,
        Default = false,
        Title = "Only Grab Secrets & OG",
        Description = "Filter for secret and OG rarity only",
    });
    local CreateToggle_25 = Tab_5.CreateToggle;
    local Toggle_25 = Tab_5:CreateToggle({
        Callback = irwWQCEcQNfsCKkPosZQGXtxDivTuHsX,
        Default = false,
        Title = "Only Grab Best Brainrot",
        Description = "Filter for best value brainrot only",
    });
    local CreateSection_11 = Tab_5.CreateSection;
    local Combat_Utilities = Tab_5:CreateSection("Combat Utilities");
    local CreateToggle_26 = Tab_5.CreateToggle;
    local Toggle_26 = Tab_5:CreateToggle({
        Callback = MuYLhCCEHYfhSdXxLKSLMcnkiVknwZPM,
        Default = false,
        Title = "Auto Block After Steal",
        Description = "Automatically blocks players",
    });
    local CreateToggle_27 = Tab_5.CreateToggle;
    local Toggle_27 = Tab_5:CreateToggle({
        Callback = ffBsQHPMRzpSQLsStdEtJMTBtfAgzFRl,
        Default = false,
        Title = "Auto Destroy Sentry",
        Description = "Automatically destroys enemy sentries",
    });
    local CreateSection_12 = Tab_5.CreateSection;
    local Navigation = Tab_5:CreateSection("Navigation");
    local Players_2 = game:GetService("Players");
    local LocalPlayer_2 = Players.LocalPlayer;
    local Character_2 = LocalPlayer.Character;
    if Character_2 then -- ran, expr id 10, has an else.
        local Backpack_2 = LocalPlayer:WaitForChild("Backpack");
    end
    local Flying_Carpet_2 = Character_2:FindFirstChild("Flying Carpet");
    if Flying_Carpet then -- ran, expr id 11, has an else.
        local CreateButton = Tab_5.CreateButton;
    end
    local Button = Tab_5:CreateButton({
        Callback = VVdNbPRkMvWXSKJQlBdZutNZXfetUziZ,
        Title = "TP TO BEST",
        Description = "Ready to use",
    });
    local CreateSection_13 = Tab_5.CreateSection;
    local Advanced = Tab_5:CreateSection("Advanced");
    local CreateToggle_28 = Tab_5.CreateToggle;
    local Toggle_28 = Tab_5:CreateToggle({
        Callback = kFNFcbxyPVvinoyXLBJXnhttuoZAvRYz,
        Default = false,
        Title = "Kill Player",
        Description = "Open player killing interface",
    });
    local CreateToggle_29 = Tab_5.CreateToggle;
    local Toggle_29 = Tab_5:CreateToggle({
        Callback = VaiPmPrOKcSWRyJDWfyOUFNGUbtJMkfC,
        Default = false,
        Title = "Control Panel",
        Description = "Advanced player control interface",
    });
    local CreateToggle_30 = Tab_5.CreateToggle;
    local Toggle_30 = Tab_5:CreateToggle({
        Callback = tYOFpgcWRSuAUeNdLTBFcchdYoGuwRFs,
        Default = false,
        Title = "LKZ Destroyer",
        Description = "FPS Devourer mode (requires auras)",
    });
    local CreateToggle_31 = Tab_5.CreateToggle;
    local Toggle_31 = Tab_5:CreateToggle({
        Callback = asAteSiuNBnLfFQgTQwdUJgonwhAdxVY,
        Default = false,
        Title = "Lock/Open Base For Friends",
        Description = "Self-explanatory",
    });
    local CreateToggle_32 = Tab_5.CreateToggle;
    local Toggle_32 = Tab_5:CreateToggle({
        Callback = ZkSUuTJYUQzKlloZwilEeolWzDqVSHJl,
        Default = false,
        Title = "Admin Panel Spam",
        Description = "Require Ap Gamepass to Use",
    });
    local Spawned = task.spawn(vcakhpxLqpmaMUfLOnnxFqxwRwHvJWyv);
    local CreateSection_14 = Tab.CreateSection;
    local Auto_Collect = Tab:CreateSection("Auto Collect");
    local CreateToggle_33 = Tab.CreateToggle;
    local Toggle_33 = Tab:CreateToggle({
        Callback = HjVAAzuNwwVZXFDiLwaxxaZamGwcSGIM,
        Default = false,
        Title = "Auto Collect",
        Description = "Automatically collect coins from your base",
    });
    local CreateSlider_3 = Tab.CreateSlider;
    local Slider_3 = Tab:CreateSlider({
        Min = 5,
        Title = "Delay Auto Collect",
        Default = 30,
        Max = 100,
        Description = "Delay between collections in seconds",
        Callback = KUrAkymwHNbejxbJtVIxnhzSXoucoIMd,
        Rounding = 1,
    });
    local CreateSection_15 = Tab.CreateSection;
    local Auto_Buy = Tab:CreateSection("Auto Buy");
    local CreateToggle_34 = Tab.CreateToggle;
    local Toggle_34 = Tab:CreateToggle({
        Callback = PjHRbejtHxnSVKUNSFDqscCGyMxBnxUy,
        Default = false,
        Title = "Auto Buy",
        Description = "Automatically purchases items within 30 studs radius",
    });
    local CreateToggle_35 = Tab.CreateToggle;
    local Toggle_35 = Tab:CreateToggle({
        Callback = qGMtPyNJjTIDzKscDWDzBzVVLJGXVoTR,
        Default = false,
        Title = "Anchored",
        Description = "A good combo with auto-buy in admin abuse, to avoid Ragdoll.",
    });
    local CreateToggle_36 = Tab.CreateToggle;
    local Toggle_36 = Tab:CreateToggle({
        Callback = OhLrjTthUsGoDkPqagpsUpkSTRURtHcz,
        Default = false,
        Title = "Anti AFK",
        Description = "Performs actions every 30 seconds to prevent idle kick",
    });
    local CreateSection_16 = Tab_6.CreateSection;
    local JobId_Enter = Tab_6:CreateSection("JobId Enter");
    local CreateInput = Tab_6.CreateInput;
    local Input = Tab_6:CreateInput({
        Placeholder = "Enter JobId",
        Title = "Server JobId",
        Default = "",
        Numeric = false,
        Finished = true,
        Callback = LJkZvVvjnpsJhsKyaxFhGXfQVQlccYqz,
        Description = "Enter the JobId to teleport",
    });
    local CreateButton_2 = Tab_6.CreateButton;
    local Button_2 = Tab_6:CreateButton({
        Title = "Clear Input",
        Callback = FpHjrAhbgHruJEBnHzhoeoRaIKhwMDZL,
    });
    local CreateSection_17 = Tab_6.CreateSection;
    local Hop_Server_And_Rejoin = Tab_6:CreateSection("Hop Server & Rejoin");
    local CreateButton_3 = Tab_6.CreateButton;
    local Button_3 = Tab_6:CreateButton({
        Callback = XqmPZiDTtlOKNRvOxQHaZnPiwBAmFUvu,
        Title = "Rejoin Server",
        Description = "Rejoin the same server",
    });
    local CreateButton_4 = Tab_6.CreateButton;
    local Button_4 = Tab_6:CreateButton({
        Callback = DZcaXwqOSSPJikigswMRYgLBubyVyYkl,
        Title = "Hop Server",
        Description = "Find a server with 6 or less players",
    });
    local CreateSection_18 = Tab_6.CreateSection;
    local Graphics = Tab_6:CreateSection("Graphics");
    local CreateToggle_37 = Tab_6.CreateToggle;
    local Toggle_37 = Tab_6:CreateToggle({
        Callback = foCRcQiaeXgrSLHSBJYgqFrUMpKiNjED,
        Default = false,
        Title = "Low Graphics",
        Description = "Reduces graphics quality significantly to improve performance",
    });
    local CreateButton_5 = Tab_9.CreateButton;
    local Button_5 = Tab_9:CreateButton({
        Callback = OawPadlQvKetsTLsqHJqPhrhqUqtSAZS,
        Title = "Clear Config File",
        Description = "Clear all saved settings",
    });
    local var71 = (_1030 and 11724299); -- 11724299
    local var72 = (var71 or 10286510);
    local Themes = Loaded_Var7.Themes;
    local CreateDropdown = Tab_9.CreateDropdown;
    local Dropdown = Tab_9:CreateDropdown({
        Title = "Theme",
        Values = Themes,
        Default = "Dark",
        Multi = false,
        Callback = TcqtEayGmOuDcCigbksRWfQtAfsJyhhw,
        Description = "Change UI theme",
    });
    local CreateDropdown_2 = Tab_7.CreateDropdown;
    local Dropdown_2 = Tab_7:CreateDropdown({
        Title = "Joiner Range",
        Values = {
            "10M - 30M",
            "30M - 100B",
        },
        Default = "10M - 30M",
        Multi = false,
        Callback = znyRhPDomoGttyHTaLzBbserPlooiIMD,
        Description = "Select the value range",
    });
    local CreateToggle_38 = Tab_7.CreateToggle;
    local Toggle_38 = Tab_7:CreateToggle({
        Callback = JNpGaDkgfgKLhGIftYkoijrVCZMJDmxf,
        Default = false,
        Title = "Active Joiner",
        Description = "Enable/Disable the joiner system",
    });
    local CreateToggle_39 = Tab_7.CreateToggle;
    local Toggle_39 = Tab_7:CreateToggle({
        Callback = gzEcivPxHHfsJjahzRiZbqwebKsChVMc,
        Default = false,
        Title = "Auto Execute",
        Description = "Automatically execute after joining server",
    });
    local CreateSection_19 = Tab_8.CreateSection;
    local Movement = Tab_8:CreateSection("Movement");
    local CreateKeyBind = Tab_8.CreateKeyBind;
    local KeyBind = Tab_8:CreateKeyBind({
        Title = "Additional Speed",
    });
    local CreateKeyBind_2 = Tab_8.CreateKeyBind;
    local KeyBind_2 = Tab_8:CreateKeyBind({
        Title = "Infinite Jump",
    });
    local CreateKeyBind_3 = Tab_8.CreateKeyBind;
    local KeyBind_3 = Tab_8:CreateKeyBind({
        Title = "Anti Ragdoll",
    });
    local CreateKeyBind_4 = Tab_8.CreateKeyBind;
    local KeyBind_4 = Tab_8:CreateKeyBind({
        Title = "Fly using: Flying Carpet",
    });
    local CreateSection_20 = Tab_8.CreateSection;
    local ESP = Tab_8:CreateSection("ESP");
    local CreateKeyBind_5 = Tab_8.CreateKeyBind;
    local KeyBind_5 = Tab_8:CreateKeyBind({
        Title = "ESP Players",
    });
    local CreateKeyBind_6 = Tab_8.CreateKeyBind;