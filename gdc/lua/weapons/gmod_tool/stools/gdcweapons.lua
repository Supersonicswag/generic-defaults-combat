TOOL.Category		= "GDC"
TOOL.Name		= "#Generic Defaults Combat"
TOOL.Command		= nil
TOOL.ConfigName		= ""

TOOL.ClientConVar[ "gdcweaponsindex" ] = "0"
TOOL.ent = {}


cleanup.Register( "gdcweapons" )

	if SERVER then
	CreateConVar( 'sbox_maxgdc', 10 )
	end

// Add Default Language translation (saves adding it to the txt files)
if ( CLIENT ) then

	language.Add( "Tool_gdcweapons_name", "GDC Weapons" )
	language.Add( "Tool_gdcweapons_desc", "Puts weapons on stuff." )
	language.Add( "Tool_gdcweapons_0", "Left click to weld the gun to the place you're aiming. Right click to spawn it unwelded. R for weapon statistics." )
	

	language.Add( "Tool_gdcweapons_help0", "~860 RPM, Tracer/Ball, 26400 Inches/Second" )
	language.Add( "Tool_gdcweapons_help1", "~460 RPM, Tracer/Ball, 29700 Inches/Second" )
	language.Add( "Tool_gdcweapons_help2", "~700 RPM, High Explosive(5m), 23100 Inches/Second" )
	language.Add( "Tool_gdcweapons_help3", "300 RPM, High Explosive Incindiary[Tracer](6.5m)/Armor Piercing Incindiary[Tracer], 36300 Inches/Second" )
	language.Add( "Tool_gdcweapons_help4", "~600 RPM, High Explosive Incindiary(7m), 19800 Inches/Second" )
	language.Add( "Tool_gdcweapons_help5", "200 RPM, High Explosive(8m), 33000 Inches/Second" )
	language.Add( "Tool_gdcweapons_help6", "120 RPM, High Explosive(13m), 19800 Inches/Second" )
	language.Add( "Tool_gdcweapons_help7", "7 RPS, 7 Salvo, High Explosive(18m)/White Phosphorus(15m), 13200 Inches/Second" )
	language.Add( "Tool_gdcweapons_help8", "8 RPM, High Explosive(31m)/White Phosphorus(25m), 19800 Inches/Second" )
	language.Add( "Tool_gdcweapons_help9", "1500 RPM, Armor Piercing Incindiary[Tracer]/High Explosive Incindiary[Tracer](6.5m), Overheats after 25 rounds, 36300 Inches/Second" )
	language.Add( "Tool_gdcweapons_help10", "30 meter blast radius. Effective against infantry and light vehicles" )
	language.Add( "Tool_gdcweapons_help11", "1500 RPM, Tracer/Ball, Overheats after 75 rounds, 26400 Inches/Second" )
	language.Add( "Tool_gdcweapons_help12", "8 RPM, High Explosive Anti-Tank(18m)/SABOT, 19800 Inches/Second(HEAT), 36300 Inches/Second(SABOT)" )
	language.Add( "Tool_gdcweapons_help13", "Powerful 15m blast radius. Effective against vehicles" )
	language.Add( "Tool_gdcweapons_help14", "20 RPM, High Explosive(23m)/White Phosphorus(15m), 5280 Inches/Second" )
	language.Add( "Tool_gdcweapons_help15", "300 RPM, High Explosive(11m)/High Explosive Dual Purpose(9m), 9900 Inches/Second" )
	language.Add( "Tool_gdcweapons_help16", "30 RPM, High Explosive(25m), 2640-4620- Inches/Second" )
	language.Add( "Tool_gdcweapons_help17", "12 RPM, High Explosive(15m). IR Guided, GPS Guided, No coordinates will fire straight. BE CAREFUL! Don't fire at anything with unwanted targets in the general direction!" )
	language.Add( "Tool_gdcweapons_help18", "~1100 RPM, Tracer/Ball, Overheats after 50 rounds, 29700 Inches/Second" )
	language.Add( "Tool_gdcweapons_help19", "Smoke deployer." )
	language.Add( "Tool_gdcweapons_help20", "Flare deployer, 10 salvo. Flares can be used as smoke, signals, or IR jammers (GMLS will track it)" )
	language.Add( "Tool_gdcweapons_help21", "10 RPS, 16 Salvo, High Explosive Fragmentation(13m)/High Explosive Anti-Tank(8m)" )
	language.Add( "Tool_gdcweapons_help22", "4 RPS, 8 Salvo, High Explosive Anti-Tank(15m)/FAE (Thermobaric)(25m)/Penetrator(5m)." )
	language.Add( "Tool_gdcweapons_help23", "600 RPM, Armor Piercing Incindiary, Armor Piercing Incindiary Tracer, High Explosive Incindiary(4m), Overheats after 33 rounds, 39600 Inches/Second" )
	language.Add( "Tool_gdcweapons_help24", "600 RPM, Tracer(Green)/Ball, 29700 Inches/Second" )
	language.Add( "Tool_gdcweapons_help25", "900 RPM, Tracer/Ball, 33000 Inches/Second" )
	language.Add( "Tool_gdcweapons_help26", "Anti Tank Guided Missile Launcher. For now top attack only, future inputs will work. HEAT(23m)" )
	language.Add( "Tool_gdcweapons_help27", "50kg High Explosive Bomb. Use outputs for TV guidance. High Explosive(35m)" )


	language.Add( "Tool_turret_type", "Type of weapon" )
	language.Add( "Undone_gdcweapons", "Undone weapon" )
	language.Add( "Cleanup_gdcweapons", "Weapon" )
	language.Add( "Cleaned_gdcweapons", "Cleaned up all Weapons" )
	language.Add( "SBoxLimit_gdc", "You already have enough guns!" )

end

function TOOL:LeftClick( trace )
local ply = self:GetOwner()
if (!ply:CheckLimit( "gdc" )) then return end
if ( !trace.Hit ) then return end
	
	if ( SERVER && !util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) then return false end
	if (CLIENT) then return true end
	
	local gdcweaponsindex	= self:GetClientNumber( "gdcweaponsindex" ) 
	
	local SpawnPos = trace.HitPos + trace.HitNormal * 30

		if (gdcweaponsindex == 0) then
	self.ent = ents.Create( "gdc_m240" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 1) then
	self.ent = ents.Create( "gdc_m2hb" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 2) then
	self.ent = ents.Create( "gdc_m197" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 3) then
	self.ent = ents.Create( "gdc_m242" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 4) then
	self.ent = ents.Create( "gdc_m230" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 5) then
	self.ent = ents.Create( "gdc_2a42" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 6) then
	self.ent = ents.Create( "gdc_l60" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 7) then
	self.ent = ents.Create( "gdc_m260" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 8) then
	self.ent = ents.Create( "gdc_m101" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 9) then
	self.ent = ents.Create( "gdc_gau12" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 10) then
	self.ent = ents.Create( "gdc_2kg_he" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 11) then
	self.ent = ents.Create( "gdc_m134" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 12) then
	self.ent = ents.Create( "gdc_m256" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 13) then
	self.ent = ents.Create( "gdc_shape_charge" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 14) then
	self.ent = ents.Create( "gdc_mortar" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 15) then
	self.ent = ents.Create( "gdc_mk19" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 16) then
	self.ent = ents.Create( "gdc_81mmram" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 17) then
	self.ent = ents.Create( "gdc_84gml" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 18) then
	self.ent = ents.Create( "gdc_gau19" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 19) then
	self.ent = ents.Create( "gdc_smokepoppa" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 20) then
	self.ent = ents.Create( "gdc_flarepoppa" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 21) then
	self.ent = ents.Create( "gdc_ub16" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 22) then
	self.ent = ents.Create( "gdc_ub8" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 23) then
	self.ent = ents.Create( "gdc_kpv" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 24) then
	self.ent = ents.Create( "gdc_pkm" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 25) then
	self.ent = ents.Create( "gdc_m249" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 26) then
	self.ent = ents.Create( "gdc_atgml" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 27) then
	self.ent = ents.Create( "gdc_50kgbomber" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

	end
	
	
	local phys = self.ent:GetPhysicsObject()  	
	if (phys:IsValid() and trace.Entity:IsValid()) then  		
	local weld = constraint.Weld(self.ent, trace.Entity, 0, trace.PhysicsBone, 0)
	local nocollide = constraint.NoCollide(self.ent, trace.Entity, 0, trace.PhysicsBone)
	end 
	ply:AddCount( "gdc", self.ent )
	
	undo.Create("gdcweapons")
	undo.AddEntity( self.ent )
	undo.AddEntity( weld )
	undo.AddEntity( nocollide )
	undo.SetPlayer( ply )
	undo.Finish()
	return true

end

function TOOL:RightClick( trace )
local ply = self:GetOwner()
if (!ply:CheckLimit( "gdc" )) then return end	
if ( !trace.Hit ) then return end
	
	if ( SERVER && !util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) then return false end
	if (CLIENT) then return true end
	
	local gdcweaponsindex	= self:GetClientNumber( "gdcweaponsindex" ) 
	
	local SpawnPos = trace.HitPos + trace.HitNormal * 30

		if (gdcweaponsindex == 0) then
	self.ent = ents.Create( "gdc_m240" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 1) then
	self.ent = ents.Create( "gdc_m2hb" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 2) then
	self.ent = ents.Create( "gdc_m197" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 3) then
	self.ent = ents.Create( "gdc_m242" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 4) then
	self.ent = ents.Create( "gdc_m230" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 5) then
	self.ent = ents.Create( "gdc_2a42" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 6) then
	self.ent = ents.Create( "gdc_l60" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 7) then
	self.ent = ents.Create( "gdc_m260" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 8) then
	self.ent = ents.Create( "gdc_m101" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 9) then
	self.ent = ents.Create( "gdc_gau12" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 10) then
	self.ent = ents.Create( "gdc_2kg_he" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 11) then
	self.ent = ents.Create( "gdc_m134" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 12) then
	self.ent = ents.Create( "gdc_m256" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 13) then
	self.ent = ents.Create( "gdc_shape_charge" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 14) then
	self.ent = ents.Create( "gdc_mortar" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 15) then
	self.ent = ents.Create( "gdc_mk19" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 16) then
	self.ent = ents.Create( "gdc_81mmram" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 17) then
	self.ent = ents.Create( "gdc_84gml" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 18) then
	self.ent = ents.Create( "gdc_gau19" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 19) then
	self.ent = ents.Create( "gdc_smokepoppa" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 20) then
	self.ent = ents.Create( "gdc_flarepoppa" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 21) then
	self.ent = ents.Create( "gdc_ub16" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 22) then
	self.ent = ents.Create( "gdc_ub8" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 23) then
	self.ent = ents.Create( "gdc_kpv" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 24) then
	self.ent = ents.Create( "gdc_pkm" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 25) then
	self.ent = ents.Create( "gdc_m249" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 26) then
	self.ent = ents.Create( "gdc_atgml" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

		elseif (gdcweaponsindex == 27) then
	self.ent = ents.Create( "gdc_50kgbomber" )
	self.ent:SetPos( SpawnPos )
	self.ent:SetAngles( trace.HitNormal:Angle() + Angle(90,0,0))
	self.ent:Spawn()
	self.ent:Activate()

	end

	ply:AddCount( "gdc", self.ent )
	undo.Create("gdcweapons")
	undo.AddEntity( self.ent )
	undo.AddEntity( weld )
	undo.AddEntity( nocollide )
	undo.SetPlayer( ply )
	undo.Finish()
	return true

end

function TOOL:Reload()
	local ply = self:GetOwner()
	local gdcweaponsindex	= self:GetClientNumber( "gdcweaponsindex" ) 
	ply:PrintMessage( HUD_PRINTTALK, "#Tool_gdcweapons_help" .. gdcweaponsindex )
end



function TOOL.BuildCPanel( CPanel )

	// HEADER
	CPanel:AddControl( "Header", { Text = "#Tool_gdcweapons_name", Description	= "#Tool_gdcweapons_desc" }  )
	
	
	// the pertenent cannon
	local Ctype = {Label = "#Tool_turret_type", MenuButton = 0, Options={}}

		Ctype["Options"]["#M240 7.62"]			= { gdcweapons_gdcweaponsindex = "0" }
		Ctype["Options"]["#M2HB 12.7"]			= { gdcweapons_gdcweaponsindex = "1" }
		Ctype["Options"]["#M197 20mm"]			= { gdcweapons_gdcweaponsindex = "2" }
		Ctype["Options"]["#M242 25mm"]			= { gdcweapons_gdcweaponsindex = "3" }
		Ctype["Options"]["#M230 30mm"]			= { gdcweapons_gdcweaponsindex = "4" }
		Ctype["Options"]["#2A42 30mm"]			= { gdcweapons_gdcweaponsindex = "5" }
		Ctype["Options"]["#L60 40mm"]			= { gdcweapons_gdcweaponsindex = "6" }
		Ctype["Options"]["#M260 70mm"]			= { gdcweapons_gdcweaponsindex = "7" }
		Ctype["Options"]["#M101 105mm"]			= { gdcweapons_gdcweaponsindex = "8" }
		Ctype["Options"]["#GAU-12 25mm"]		= { gdcweapons_gdcweaponsindex = "9" }
		Ctype["Options"]["#2KG High Explosive Charge"]	= { gdcweapons_gdcweaponsindex = "10" }
		Ctype["Options"]["#M134 7.62mm"]		= { gdcweapons_gdcweaponsindex = "11" }
		Ctype["Options"]["#M256 120mm"]			= { gdcweapons_gdcweaponsindex = "12" }
		Ctype["Options"]["#HEAT Shape Charge"]		= { gdcweapons_gdcweaponsindex = "13" }
		Ctype["Options"]["#Mortar Launcher 81mm"]	= { gdcweapons_gdcweaponsindex = "14" }
		Ctype["Options"]["#MK-19 40mm"]			= { gdcweapons_gdcweaponsindex = "15" }
		Ctype["Options"]["#RAM 81mm "]			= { gdcweapons_gdcweaponsindex = "16" }
		Ctype["Options"]["#GML 84mm "]			= { gdcweapons_gdcweaponsindex = "17" }
		Ctype["Options"]["#GAU-19 12.7mm"]		= { gdcweapons_gdcweaponsindex = "18" }
		Ctype["Options"]["#Smoke Deployer"]		= { gdcweapons_gdcweaponsindex = "19" }
		Ctype["Options"]["#Flare Deployer"]		= { gdcweapons_gdcweaponsindex = "20" }
		Ctype["Options"]["#UB-16 57mm"]			= { gdcweapons_gdcweaponsindex = "21" }
		Ctype["Options"]["#UB-8 80mm"]			= { gdcweapons_gdcweaponsindex = "22" }
		Ctype["Options"]["#KPV 14.5mm"]			= { gdcweapons_gdcweaponsindex = "23" }
		Ctype["Options"]["#PKM 7.62mm"]			= { gdcweapons_gdcweaponsindex = "24" }
		Ctype["Options"]["#M249 5.56mm"]		= { gdcweapons_gdcweaponsindex = "25" }
		Ctype["Options"]["#ATGML"]			= { gdcweapons_gdcweaponsindex = "26" }
		Ctype["Options"]["#50KG Bomb"]			= { gdcweapons_gdcweaponsindex = "27" }

	CPanel:AddControl("ComboBox", Ctype )
	

end
