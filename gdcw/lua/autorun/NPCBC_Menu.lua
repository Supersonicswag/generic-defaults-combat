//===========================\\
//===Made by Major Victory===\\
//===========================\\
local function NPBC_Menu(Panel)
	Panel:ClearControls()

	local Params = {}
	Params.Text = "NPCBC Options"
	Params.Description = "Options for the NPC Battle Cleanup Mod"
	Panel:AddControl( "Header", Params)

	local Params = {}
	Params.Label = "Keep Ragdolls"
	Params.Description = "This must be enabled for NPCBC To work properly!"
	Params.Command = "ai_keepragdolls"
	Panel:AddControl( "CheckBox", Params)

	local Params = {}
	Params.Label = "Cleanup Dead NPCs"
	Params.Description = "Actively try to Remove Dead NPC Ragdolls"
	Params.Command = "Ragdoll_Cleanup_Enabled"
	Panel:AddControl( "CheckBox", Params)

	local Params = {}
	Params.Label = "Remove ALL Ragdolls"
	Params.Description = "On = Remove player-created ragdolls as well as dead NPC ragdolls"
	Params.Command = "Ragdoll_Cleanup_RemoveAll"
	Panel:AddControl( "CheckBox", Params)

	local Params = {}
	Params.Label = "Ragdoll Cleanup Interval"
	Params.Description = "How often to check for ragdolls (in seconds)"
	Params.Command = "Ragdoll_Cleanup_Interval"
	Params.Type = "Float"
	Params.Min = "0.01"
	Params.Max = "1"
	Panel:AddControl( "Slider", Params)

	local Params = {}
	Params.Label = "Ragdoll No-Fade Time"
	Params.Description = "How long a ragdoll stays before starting to fade (in seconds)"
	Params.Command = "Ragdoll_Cleanup_NoFadeTime"
	Params.Type = "Float"
	Params.Min = "0"
	Params.Max = "20"
	Panel:AddControl( "Slider", Params)

	local Params = {}
	Params.Label = "Ragdoll Fade Time"
	Params.Description = "How long it takes a ragdoll to fade (in seconds)"
	Params.Command = "Ragdoll_Cleanup_FadeTime"
	Params.Type = "Float"
	Params.Min = "0"
	Params.Max = "10"
	Panel:AddControl( "Slider", Params)

	local Params = {}
	Params.Label = "Cleanup Dead NPC's Weapons"
	Params.Description = "Enable/Disable Removing Dead NPC Weapons"
	Params.Command = "Weapon_Cleanup_Enabled"
	Panel:AddControl( "CheckBox", Params)

	local Params = {}
	Params.Label = "Use Filter"
	Params.Description = "Use the filter in NPCBC_Filter.lua to remove things"
	Params.Command = "Weapon_Cleanup_Filter"
	Panel:AddControl( "CheckBox", Params)

	local Params = {}
	Params.Label = "Weapon Cleanup Interval"
	Params.Description = "How often to check for weapons (in seconds)"
	Params.Command = "Weapon_Cleanup_Interval"
	Params.Type = "Float"
	Params.Min = "0.01"
	Params.Max = "1"
	Panel:AddControl( "Slider", Params)

	local Params = {}
	Params.Label = "Weapon No-Fade Time"
	Params.Description = "How long a weapon stays before being removed (in seconds)"
	Params.Command = "Weapon_Cleanup_NoFadeTime"
	Params.Type = "Float"
	Params.Min = "0"
	Params.Max = "60"
	Panel:AddControl( "Slider", Params)

	local Params = {}
	Params.Label = "Weapon Fade Time"
	Params.Description = "How long it takes a weapon to fade (in seconds)"
	Params.Command = "Weapon_Cleanup_FadeTime"
	Params.Type = "Float"
	Params.Min = "0"
	Params.Max = "10"
	Panel:AddControl( "Slider", Params)
end

local function LoadMenu()
	spawnmenu.AddToolMenuOption("Utilities", "Admin", "NPCBCOptions", "NPCBC Options", "", "", NPBC_Menu)
end
hook.Add( "PopulateToolMenu", "PopulateNPBCMenu", LoadMenu )