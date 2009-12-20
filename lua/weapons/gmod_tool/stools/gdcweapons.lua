
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
	

	language.Add( "Tool_gdcweapons_help0", ".30 caliber medium machine gun. 26400 inches/sec, ~860 RPM, Tracer/Ball" )
	language.Add( "Tool_gdcweapons_help1", ".50 caliber heavy machine gun. 29700 inches/sec, ~460 RPM, Tracer/Ball" )
	language.Add( "Tool_gdcweapons_help2", "20mm gatling gun. 23100 inches/sec, ~700 RPM, High Explosive" )
	language.Add( "Tool_gdcweapons_help3", "25mm cannon. 36300 inches/sec, 300 RPM, High Explosive Incindiary/Armor Piercing Incindiary" )
	language.Add( "Tool_gdcweapons_help4", "30mm chain gun. 19800 inches/sec, ~600 RPM, High Explosive Incindiary" )
	language.Add( "Tool_gdcweapons_help5", "30mm cannon. 33000 inches/sec, 200 RPM, High Explosive" )
	language.Add( "Tool_gdcweapons_help6", "40mm cannon. 19800 inches/sec, 120 RPM, High Explosive" )
	language.Add( "Tool_gdcweapons_help7", "70mm rocket pod. 13200 inches/sec, 7 Salvo, High Explosive/White Phosphorus" )
	language.Add( "Tool_gdcweapons_help8", "105mm cannon. 13200 inches/sec, 8 RPM, High Explosive/White Phosphorus" )
	language.Add( "Tool_gdcweapons_help9", "25mm gatling gun. 36300 inches/sec, 1200 RPM, Armor Piercing Incindiary" )
	language.Add( "Tool_gdcweapons_help10", "2kg High Explosive charge. 25 meter blast radius. Effective agasint infantry and light vehicles." )
	language.Add( "Tool_gdcweapons_help11", "7.62mm gatling gun. 26400 inches/sec, 1500 RPM, Tracer/Ball" )
	language.Add( "Tool_gdcweapons_help12", "120mm. 19800/36300 inches/sec, 8 RPM, High Explosive Anti-Tank/SABOT" )
	language.Add( "Tool_gdcweapons_help13", "HEAT Shape Charge. 5m blast radius that does lots of damage. Effective against armored vehicles." )
	language.Add( "Tool_gdcweapons_help14", "81mm mortar for indirect fire. 5280 inches/sec, 20 RPM, High Explosive/White Phosphorus" )
	language.Add( "Tool_gdcweapons_help15", "40mm grenade launcher for mounted weapons. 9900 inches/sec, 300 RPM, High Explosive/High Explosive Dual Purpose" )
	language.Add( "Tool_gdcweapons_help16", "81mm rocket assisted mortar launcher. 5280 inches/sec CONSTANT, 30 RPM, High Explosive" )
	
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

		Ctype["Options"]["#M240 7.62"]	= { gdcweapons_gdcweaponsindex = "0" }
		Ctype["Options"]["#M2HB 12.7"]	= { gdcweapons_gdcweaponsindex = "1" }
		Ctype["Options"]["#M197 20mm"]	= { gdcweapons_gdcweaponsindex = "2" }
		Ctype["Options"]["#M242 25mm"]	= { gdcweapons_gdcweaponsindex = "3" }
		Ctype["Options"]["#M230 30mm"]	= { gdcweapons_gdcweaponsindex = "4" }
		Ctype["Options"]["#2A42 30mm"]	= { gdcweapons_gdcweaponsindex = "5" }
		Ctype["Options"]["#L60 40mm"]	= { gdcweapons_gdcweaponsindex = "6" }
		Ctype["Options"]["#M260 70mm"]	= { gdcweapons_gdcweaponsindex = "7" }
		Ctype["Options"]["#M101 105mm"]	= { gdcweapons_gdcweaponsindex = "8" }
		Ctype["Options"]["#GAU-12 25mm"]	= { gdcweapons_gdcweaponsindex = "9" }
		Ctype["Options"]["#2KG High Explosive Charge"]	= { gdcweapons_gdcweaponsindex = "10" }
		Ctype["Options"]["#M134 7.62mm"]	= { gdcweapons_gdcweaponsindex = "11" }
		Ctype["Options"]["#M256 120mm"]	= { gdcweapons_gdcweaponsindex = "12" }
		Ctype["Options"]["#HEAT Shape Charge"]	= { gdcweapons_gdcweaponsindex = "13" }
		Ctype["Options"]["#81mm Mortar Launcher"]	= { gdcweapons_gdcweaponsindex = "14" }
		Ctype["Options"]["#Mk-19 40mm"]	= { gdcweapons_gdcweaponsindex = "15" }
		Ctype["Options"]["#81mm RAM"]	= { gdcweapons_gdcweaponsindex = "16" }

	CPanel:AddControl("ComboBox", Ctype )
	

end
