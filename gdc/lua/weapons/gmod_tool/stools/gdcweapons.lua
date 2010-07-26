
TOOL.Category		= "GCX"
TOOL.Name			= "#Generic Defaults Combat"
TOOL.Command		= nil
TOOL.ConfigName		= ""

TOOL.ClientConVar[ "gdcweaponsindex" ] = "0"
TOOL.ent = {}


cleanup.Register( "gdcweapons" )


// Add Default Language translation (saves adding it to the txt files)
if ( CLIENT ) then

	language.Add( "Tool_gdcweapons_name", "GDC Weapons" )
	language.Add( "Tool_gdcweapons_desc", "Puts weapons on stuff." )
	language.Add( "Tool_gdcweapons_0", "Left click to weld the gun to the place you're aiming. Right click to spawn it unwelded." )
	

	language.Add( "Tool_gdcweapons_help0", "~860 RPM, Tracer/Ball" )
	language.Add( "Tool_gdcweapons_help1", "~460 RPM, Tracer/Ball" )
	language.Add( "Tool_gdcweapons_help2", "~700 RPM, High Explosive" )
	language.Add( "Tool_gdcweapons_help3", "300 RPM, High Explosive Incindiary/Armor Piercing Incindiary" )
	language.Add( "Tool_gdcweapons_help4", "~600 RPM, High Explosive Incindiary" )
	language.Add( "Tool_gdcweapons_help5", "200 RPM, High Explosive" )
	language.Add( "Tool_gdcweapons_help6", "120 RPM, High Explosive" )
	language.Add( "Tool_gdcweapons_help7", "7 RPM, 7 Salvo, High Explosive/White Phosphorus" )
	language.Add( "Tool_gdcweapons_help8", "8 RPM, High Explosive/White Phosphorus" )
	language.Add( "Tool_gdcweapons_help9", "1200 RPM, Armor Piercing Incindiary, Overheats after 25 rounds" )
	language.Add( "Tool_gdcweapons_help10", "25 meter blast radius. Effective against infantry" )
	language.Add( "Tool_gdcweapons_help11", "1500 RPM, Tracer/Ball, Overheats after 75 rounds" )
	language.Add( "Tool_gdcweapons_help12", "8 RPM, High Explosive Anti-Tank/SABOT" )
	language.Add( "Tool_gdcweapons_help13", "Powerful 5m blast radius. Effective against armored vehicles." )
	language.Add( "Tool_gdcweapons_help14", "20 RPM, High Explosive/White Phosphorus" )
	language.Add( "Tool_gdcweapons_help15", "300 RPM, High Explosive/High Explosive Dual Purpose" )
	language.Add( "Tool_gdcweapons_help16", "30 RPM, High Explosive" )
	language.Add( "Tool_gdcweapons_help17", "12 RPM, High Explosive. IR Guided, GPS Guided, No coordinates will fire straight. BE CAREFUL! Don't fire at anything with unwanted targets in the general direction!" )
	language.Add( "Tool_gdcweapons_help18", "~1100 RPM, Tracer/Ball, Overheats after 50 rounds" )
	language.Add( "Tool_gdcweapons_help19", "Smoke deployer." )


	language.Add( "Tool_turret_type", "Type of weapon" )
	
	language.Add( "Undone_gdcweapons", "Undone weapon" )
	
	language.Add( "Cleanup_gdcweapons", "Weapon" )
	language.Add( "Cleaned_gdcweapons", "Cleaned up all Weapons" )
	language.Add( "SBoxLimit_gcombats", "You've reached the Weapon limit!" )

end

function TOOL:LeftClick( trace )
local ply = self:GetOwner()
if FIELDS == nil and COMBATDAMAGEENGINE == nil then
	ply:PrintMessage( HUD_PRINTCENTER, "You need Gcombat Core to use GCX" )  
	return 
end
if (!ply:CheckLimit( "gcombat" )) then return end
if ( !trace.Hit ) then return end
	
	if ( SERVER && !util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) then return false end
	if (CLIENT) then return true end
	
	local gdcweaponsindex	= self:GetClientNumber( "gdcweaponsindex" ) 
	
	local SpawnPos = trace.HitPos + trace.HitNormal * 5

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

	end
	
	
	local phys = self.ent:GetPhysicsObject()  	
	if (phys:IsValid()) then  		
		local weld = constraint.Weld(self.ent, trace.Entity, 0, trace.PhysicsBone, 0)
		local nocollide = constraint.NoCollide(self.ent, trace.Entity, 0, trace.PhysicsBone)
	end 
	ply:AddCount( "gcombat", self.ent )
	
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
if FIELDS == nil and COMBATDAMAGEENGINE == nil then
	ply:PrintMessage( HUD_PRINTCENTER, "You need Gcombat Core to use GCX" )  
	return 
end
if (!ply:CheckLimit( "gcombat" )) then return end	
if ( !trace.Hit ) then return end
	
	if ( SERVER && !util.IsValidPhysicsObject( trace.Entity, trace.PhysicsBone ) ) then return false end
	if (CLIENT) then return true end
	
	local gdcweaponsindex	= self:GetClientNumber( "gdcweaponsindex" ) 
	
	local SpawnPos = trace.HitPos + trace.HitNormal * 5

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
	end

	ply:AddCount( "gcombat", self.ent )
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

		Ctype["Options"]["#M240 7.62"]		= { gdcweapons_gdcweaponsindex = "0" }
		Ctype["Options"]["#M2HB 12.7"]		= { gdcweapons_gdcweaponsindex = "1" }
		Ctype["Options"]["#M197 20mm"]		= { gdcweapons_gdcweaponsindex = "2" }
		Ctype["Options"]["#M242 25mm"]		= { gdcweapons_gdcweaponsindex = "3" }
		Ctype["Options"]["#M230 30mm"]		= { gdcweapons_gdcweaponsindex = "4" }
		Ctype["Options"]["#2A42 30mm"]		= { gdcweapons_gdcweaponsindex = "5" }
		Ctype["Options"]["#L60 40mm"]		= { gdcweapons_gdcweaponsindex = "6" }
		Ctype["Options"]["#M260 70mm"]		= { gdcweapons_gdcweaponsindex = "7" }
		Ctype["Options"]["#M101 105mm"]		= { gdcweapons_gdcweaponsindex = "8" }
		Ctype["Options"]["#GAU-12 25mm"]		= { gdcweapons_gdcweaponsindex = "9" }
		Ctype["Options"]["#2KG High Explosive Charge"]	= { gdcweapons_gdcweaponsindex = "10" }
		Ctype["Options"]["#M134 7.62mm"]		= { gdcweapons_gdcweaponsindex = "11" }
		Ctype["Options"]["#M256 120mm"]		= { gdcweapons_gdcweaponsindex = "12" }
		Ctype["Options"]["#HEAT Shape Charge"]	= { gdcweapons_gdcweaponsindex = "13" }
		Ctype["Options"]["#Mortar Launcher 81mm"]	= { gdcweapons_gdcweaponsindex = "14" }
		Ctype["Options"]["#MK-19 40mm"]		= { gdcweapons_gdcweaponsindex = "15" }
		Ctype["Options"]["#81mm RAM"]		= { gdcweapons_gdcweaponsindex = "16" }
		Ctype["Options"]["#84mm GML"]		= { gdcweapons_gdcweaponsindex = "17" }
		Ctype["Options"]["#GAU-19 12.7mm"]		= { gdcweapons_gdcweaponsindex = "18" }
		Ctype["Options"]["#Smoke Deployer"]		= { gdcweapons_gdcweaponsindex = "19" }

	CPanel:AddControl("ComboBox", Ctype )
	

end
