TOOL.Category		= "NPC Manipulation"		// Name of the category
TOOL.Name			= "#NPC Spawn Platforms"		// Name to display
TOOL.Command		= nil				// Command on click (nil for default)
TOOL.ConfigName		= ""				// Config file name (nil for default)

function DEBUG_Msg (mesg)
	--Msg (mesg)
end

npcs = {
	{ "Headcrab", "npc_headcrab" },    
	{ "Headcrab Poison", "npc_headcrab_poison" },
	{ "Zombie", "npc_zombie" },
	{ "Antlion", "npc_antlion" },
	{ "Antlion Guard", "npc_antlionguard" },
	{ "Crow", "npc_crow" },
	{ "Citizen", "npc_citizen" },
	{ "Rebel", "npc_citizen_rebel" },
	{ "Rebel Medic", "npc_citizen_medic" },
	{ "C17 Downtrodden", "npc_citizen_dt" },
	{ "Combine Soldier", "npc_combine_s" },
	{ "Combine Prison", "npc_combine_p" },
	{ "Combine Elite", "npc_combine_e" },
	{ "Metrocop", "npc_metropolice" },
	{ "Fast Zombie", "npc_fastzombie" },
	{ "Poison Zombie", "npc_poisonzombie" },
	{ "Fast Headcrab", "npc_headcrab_fast" },
	{ "Poison Headcrab", "npc_headcrab_black" },
	{ "Manhack", "npc_manhack" },
	{ "Rollermine", "npc_rollermine" },
	{ "Vortigaunt", "npc_vortigaunt" },
}

wpns = {
	{ "GDCW M240", "gdcw_m240" },
	{ "GDCW Desert Eagle", "gdcw_deagle" },
	{ "GDCW M1911", "gdcw_m1911" },
	{ "GDCW Mini Uzi", "gdcw_miniuzi" },
	{ "GDCW Uzi", "gdcw_fulluzi" },
	{ "GDCW P228", "gdcw_p228" },
	{ "GDCW M9", "gdcw_m9" },
	{ "GDCW FiveSeven", "gdcw_fiveseven" },
	{ "GDCW FAL", "gdcw_fal" },
	{ "GDCW M16 ACOG", "gdcw_m16acog" },
	{ "GDCW M16 Red Dot", "gdcw_m16rdot" },
	{ "GDCW M16 Holo", "gdcw_m16holo" },
	{ "GDCW M16 Iron", "gdcw_m16iron" },
	{ "GDCW G36C", "gdcw_g36cacog" },
	{ "GDCW HK416", "gdcw_hk416iron" },
	{ "GDCW AK47", "gdcw_ak47iron" },
	{ "GDCW P90", "gdcw_p90iron" },
	{ "GDCW M4A1 Iron", "gdcw_m4a1iron" },
	{ "GDCW M4A1 ACOG", "gdcw_m4a1acog" },
	{ "GDCW M4A1 Holo", "gdcw_m4a1holo" },
	{ "Crowbar", "weapon_crowbar" },
	{ "Stunstick", "weapon_stunstick" },
	{ "Pistol", "weapon_pistol" },
	{ "Alyx's Gun", "weapon_alyxgun" },
	{ "SMG1", "weapon_smg1" },
	{ "AR2", "weapon_ar2" },
	{ "Shotgun", "weapon_shotgun" },
	{ "Anabelle", "weapon_annabelle" },
	{ "RPG", "weapon_rpg" },
	{ "Package", "weapon_citizenpackage" },
	{ "Suitcase", "weapon_citizensuitcase" },
	{ "None", "NULL" },
	{ "Random Rebel Weapon", "random_rebel"},
	{ "Random Combine Weapon", "random_combine"},
	{ "Random Citizen Item", "random_citizen"}
}

if CLIENT then
	language.Add ("Tool_npcspawner_name", "NPC Spawn Platforms")
	language.Add ("Tool_npcspawner_desc", "Create NPC Spawning Platforms.")
	language.Add ("Tool_npcspawner_0", "Left-click: Spawn Platform  Right-click: Copy Platform Data")
else
	if server_settings.Int("sbox_maxnpcspawners", -1) == -1 then
		CreateConVar("sbox_maxnpcspawners",3)
	end
	cleanup.Register( "sent_npcspawner" )
	function SpawnNPCSpawner (pl, Pos, Ang, npc, weapon, delay, maximum, toggleable, spawnheight, spawnradius, on, autoremove, healthmul, customsquads, squadoverride, nocollide, onkey, offkey)
		local ent = ents.Create ("sent_npcspawner")
		ent:SetKeyValue("npc", npc)
		ent:SetKeyValue("weapon", weapon)
		ent:SetKeyValue("delay", delay)
		ent:SetKeyValue("maximum", maximum)
		ent:SetKeyValue("toggleable", toggleable)
		ent:SetKeyValue("spawnheight", spawnheight)
		ent:SetKeyValue("spawnradius", spawnradius)
		ent:SetKeyValue("autoremove", autoremove)
		ent:SetKeyValue("healthmul", healthmul)
		ent:SetKeyValue("customsquads", customsquads)
		ent:SetKeyValue("squadoverride", squadoverride)
		ent:SetKeyValue("nocollide", nocollide)
		ent:SetKeyValue("onkey", onkey)
		ent:SetKeyValue("offkey", offkey)
		ent:SetKeyValue("ply", pl:EntIndex())
		ent:SetPos (Pos)
		ent:SetAngles (Ang)
		ent:Spawn()
		ent:Activate()
		--scary scary numpad stuff (I find it scary anyway)
		AllocateNumpadFunctions (pl, ent)
	end
	duplicator.RegisterEntityClass("sent_npcspawner", SpawnNPCSpawner, "Pos", "Ang", "npc", "weapon", "delay", "maximum", "toggleable", "spawnheight", "spawnradius", "on", "autoremove", "healthmul", "customsquads", "squadoverride", "nocollide", "onkey", "offkey")
end

TOOL.ClientConVar ["npc"] = "npc_zombie"
TOOL.ClientConVar ["weapon"] = "weapon_smg1"
TOOL.ClientConVar ["delay"] = "4"
TOOL.ClientConVar ["maximum"] = "5"
TOOL.ClientConVar ["toggleable"] = "1"
TOOL.ClientConVar ["spawnheight"] = "300"
TOOL.ClientConVar ["spawnradius"] = "1024"
TOOL.ClientConVar ["on"] = "1"
TOOL.ClientConVar ["autoremove"] = "1"
TOOL.ClientConVar ["healthmul"] = "1"
TOOL.ClientConVar ["customsquads"] = "0"
TOOL.ClientConVar ["squadoverride"] = "1"
TOOL.ClientConVar ["nocollide"] = "1"
TOOL.ClientConVar ["onkey"] = "1"
TOOL.ClientConVar ["offkey"] = "2"

function TOOL:LeftClick (trace)
	DEBUG_Msg ("Left-click.\n")
	if not self:GetSWEP():CheckLimit( "npcspawners" ) then return false end
	if CLIENT then return true end
	if trace.Entity:GetClass() == "sent_npcspawner" then
		ent = trace.Entity
		self:SetKVs (ent)
		return true
	end
	local ent = ents.Create ("sent_npcspawner")
	self:SetKVs (ent)
	ent:SetPos (trace.HitPos)
	ent:SetAngles (Angle (0.5, -0.5, -1))
	ent:Spawn()
	ent:Activate()
	AllocateNumpadFunctions (self:GetOwner(), ent)
	return true
end

function TOOL:RightClick (trace)
	DEBUG_Msg ("Right-click.\n")
	if trace.Entity:GetClass() == "sent_npcspawner" then
		--if CLIENT then
			DEBUG_Msg ("serverside, defining\n")
			ent = trace.Entity
			--steal some values
			npc = ent:GetNWString("npc")
			weapon = ent:GetNWString("weapon")
			delay = ent:GetNWString("delay")
			maximum = ent:GetNWString("maximum")
			toggleable = ent:GetNWString("toggleable")
			spawnheight = ent:GetNWString("spawnheight")
			spawnradius = ent:GetNWString("spawnradius")
			autoremove = ent:GetNWString("autoremove")
			healthmul = ent:GetNWString("healthmul")
			customsquads = ent:GetNWString("customsquads")
			squadoverride = ent:GetNWString("squadoverride")
			squadoverride = ent:GetNWString("nocollide")
			onkey = ent:GetNWString("onkey")
			offkey = ent:GetNWString("offkey")
			o = self:GetOwner()
			o:ConCommand ("npcspawner_npc "..npc.."\n")
			o:ConCommand ("npcspawner_weapon "..weapon.."\n")
			o:ConCommand ("npcspawner_delay "..delay.."\n")
			o:ConCommand ("npcspawner_maximum "..maximum.."\n")
			o:ConCommand ("npcspawner_toggleable "..toggleable.."\n")
			o:ConCommand ("npcspawner_spawnheight "..spawnheight.."\n")
			o:ConCommand ("npcspawner_spawnradius "..spawnradius.."\n")
			o:ConCommand ("npcspawner_autoremove "..autoremove.."\n")
			o:ConCommand ("npcspawner_healthmul "..healthmul.."\n")
			o:ConCommand ("npcspawner_customsquads "..customsquads.."\n")
			o:ConCommand ("npcspawner_squadoverride "..squadoverride.."\n")
			o:ConCommand ("npcspawner_nocollide "..nocollide.."\n")
			o:ConCommand ("npcspawner_onkey "..onkey.."\n")
			o:ConCommand ("npcspawner_offkey "..offkey.."\n")
		--else
		--	DEBUG_Msg ("serverside, ignoring\n")
		--end
	end
end

function TOOL:SetKVs (ent)
	ent:SetKeyValue("npc", self:GetClientInfo ("npc"))
	ent:SetKeyValue("weapon", self:GetClientInfo ("weapon"))
	ent:SetKeyValue("delay", math.max (self:GetClientInfo ("delay"), 0.5))
	ent:SetKeyValue("maximum", math.min (self:GetClientInfo ("maximum"), 25))
	ent:SetKeyValue("toggleable", self:GetClientInfo ("toggleable"))
	ent:SetKeyValue("spawnheight", math.min (self:GetClientInfo ("spawnheight"), 1028))
	ent:SetKeyValue("spawnradius", math.min (self:GetClientInfo ("spawnradius"), 1028))
	ent:SetKeyValue("active", self:GetClientInfo ("on"))
	ent:SetKeyValue("autoremove", self:GetClientInfo ("autoremove"))
	ent:SetKeyValue("healthmul", math.min (self:GetClientInfo ("healthmul"), 5))
	ent:SetKeyValue("customsquads", self:GetClientInfo ("customsquads"))
	ent:SetKeyValue("squadoverride", self:GetClientInfo ("squadoverride"))
	ent:SetKeyValue("nocollide", self:GetClientInfo ("nocollide"))
	ent:SetKeyValue("onkey", self:GetClientInfo ("onkey"))
	ent:SetKeyValue("offkey", self:GetClientInfo ("offkey"))
	DEBUG_Msg ("entindex: "..self:GetOwner():EntIndex().."\n")
	ent:SetKeyValue("ply", self:GetOwner():EntIndex())
end

function TOOL.BuildCPanel (cp)
    cp:AddControl("Header", {Text = "#Tool_npcspawner_name", Description    = "#Tool_npcspawner_desc"}) 
	--Type select
    combo = {}
    combo.Label = "NPC"
	combo.Height = 150
    combo.Options = {} 
	for k,v in pairs (npcs) do 
		combo.Options[v[1]] = {npcspawner_npc = v[2]}    
	end
	cp:AddControl ("ListBox", combo)
	--Weapon select
	combo = {}
    combo.Label = "Weapon"
    combo.MenuButton = 0
    combo.Folder = "settings/menu/main/construct/test/"
    combo.Options = {} 
	for k,v in pairs (wpns) do 
		combo.Options[v[1]] = {npcspawner_weapon = v[2]}    
	end
	cp:AddControl ("ComboBox", combo)
	--Timer select
	cp:AddControl("Slider",  {Label = "Spawn Delay",
	Type	= "Float",
	Min		= 0.5,
	Max		= 60,
	Command = "npcspawner_delay",
	Description = "The delay between each NPC spawn."})
	--Maximum select
	cp:AddControl("Slider",  {Label = "Maximum In Action Simultaneously",
	Type	= "Integer",
	Min		= 1,
	Max		= 25,
	Command = "npcspawner_maximum",
	Description = "The maximum NPCs allowed from the spawnpoint at one time."})
	--Autoremove select
	cp:AddControl( "Checkbox", { Label = "Remove All Spawned NPCs on Platform Remove", Command = "npcspawner_autoremove",
	Description = "If this is checked, all NPCs spawned by a platform will be removed with the platform."} )
	--Toggle header
	cp:AddControl("Header", {Text = "Toggle Options", Description    = "Options on how the spawner is to be turned on and off"})
	--Numpad on/off select
	cp:AddControl( "Numpad", { Label = "#Turn On", Label2 = "#Turn Off",
	Command = "npcspawner_onkey", Command2 = "npcspawner_offkey",
	ButtonSize = 22 } )
	--Toggleable select
	cp:AddControl( "Checkbox", { Label = "Toggle On/Off With Use", Command = "npcspawner_toggleable",
	Description = "If this is checked, pressing Use on the spawn platform toggles the spawner on and off."} )
	cp:AddControl("Header", {Text = "Spawn Positioning", Description    = "Options on how newly spawned NPCs are positioned"})
	--Off select
	cp:AddControl( "Checkbox", { Label = "Spawn/Set On", Command = "npcspawner_on",
	Description = "If this is checked, spawned or updated platforms will be turned on."} )
	--Spawnheight select
	cp:AddControl("Slider",  {Label = "Spawn Height Offset",
	Type	= "Float",
	Min		= 8,
	Max		= 1028,
	Command = "npcspawner_spawnheight",
	Description = "(Only change if needed) Height above spawn platform NPCs originate from."})
	--Spawnradius select
	cp:AddControl("Slider",  {Label = "Spawn X/Y Radius",
	Type	= "Float",
	Min		= 0,
	Max		= 1028,
	Command = "npcspawner_spawnradius",
	Description = "(Use 0 if confused) Radius in which NPCs spawn (use small radius unless on flat open area)."})
	--Another header
	cp:AddControl("Header", {Text = "NPC Additional Options", Description    = "Additional options allowing greater modification of NPCs"}) 
	--Healthmul select
	cp:AddControl("Slider",  {Label = "Health Multiplier",
	Type	= "Float",
	Min		= 0.5,
	Max		= 5,
	Command = "npcspawner_healthmul",
	Description = "The multiplier applied to the health of all NPCs on spawn."})
	cp:AddControl( "Checkbox", { Label = "Use Custom Squad Indexes", Command = "npcspawner_customsquads",
	Description = "If this is checked, NPCs spawn under the squad defined by the override. Otherwise NPCs are squadded based on allegiance."} )
	cp:AddControl("Slider",  {Label = "Squad Override",
	Type	= "Integer",
	Min		= 1,
	Max		= 10,
	Command = "npcspawner_squadoverride",
	Description = "Squad number override (if custom squads is checked)"})
	cp:AddControl( "Checkbox", { Label = "No Collision Between Spawned NPCs", Command = "npcspawner_nocollide",
	Description = "If this is checked, NPCs will not collide with any other NPCs spawned with this option on. This helps prevent stacking in the spawn area"} )
end


function TOOL:Reload (trace)
	// The SWEP doesn't reload so this does nothing :(
	DEBUG_Msg( "RELOAD\n" )
end

function TOOL:Think()
	
end
