
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('entities/base_wire_entity/init.lua'); 
include('shared.lua')

function ENT:Initialize()   

	self.ammomodel = "models/props_c17/canister01a.mdl"
	self.ammos = 7
	self.clipsize = 7
	self.armed = false
	self.loading = false
	self.reloadtime = 0
	self.infire = false
	self.Entity:SetModel( "models/props_junk/plasticbucket001a.mdl" ) 	
	self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   --after all, gmod is a physics  	
	self.Entity:SetSolid( SOLID_VPHYSICS )        -- Toolbox     
	self.Entity:SetColor(25,25,25,255)
	
          
	local phys = self.Entity:GetPhysicsObject()  	
	if (phys:IsValid()) then  		
		phys:Wake() 
	end 
 
	self.Inputs = Wire_CreateInputs( self.Entity, { "Fire HE", "Fire WP"} )
	self.Outputs = Wire_CreateOutputs( self.Entity, { "Can Fire", "shots"})
end   

function ENT:SpawnFunction( ply, tr)
	
	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 60
	
	
	local ent = ents.Create( "gdc_m260" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	
	
	
	return ent

end

function ENT:firehe()

		local ent = ents.Create( "gdca_70mmhydrahe" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 250)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()
		
		self.Entity:EmitSound( "arty/rocket.wav", 100, 100 )
		self.ammos = self.ammos-1
	

end

function ENT:firewp()

		local ent = ents.Create( "gdca_70mmhydrawp" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 250)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()
		
		self.Entity:EmitSound( "arty/rocket.wav", 100, 100 )
		self.ammos = self.ammos-1
	

end

function ENT:Think()
if FIELDS == nil and COMBATDAMAGEENGINE == nil then return end
Wire_TriggerOutput(self.Entity, "shots", self.ammos)
	if self.ammos <= 0 then
	self.reloadtime = CurTime()+14
	self.ammos = self.clipsize
	end
	
	if (self.reloadtime < CurTime()) then
		Wire_TriggerOutput(self.Entity, "Can Fire", 1)
	else
		Wire_TriggerOutput(self.Entity, "Can Fire", 0)
	end
	
	if (self.inFire == true) then
		if (self.reloadtime < CurTime()) then
		
			self:firehe()
			
		end
	end
	
	if (self.inFire2 == true) then
		if (self.reloadtime < CurTime()) then
		
			self:firewp()
			
		end
	end

	self.Entity:NextThink( CurTime() + 0.14285)
	return true
end

function ENT:TriggerInput(k, v)
if(k=="Fire HE") then
		if((v or 0) >= 1) then
			self.inFire = true
		else
			self.inFire = false
		end
	end
	
	if(k=="Fire WP") then
		if((v or 0) >= 1) then
			self.inFire2 = true
		else
			self.inFire2 = false
		end
	end
	
end
 
 
