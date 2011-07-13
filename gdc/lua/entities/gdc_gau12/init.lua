
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('entities/base_wire_entity/init.lua'); 
include('shared.lua')

function ENT:Initialize()   

	self.armed = false
	self.loading = false
	self.reloadtime = 0
	self.infire = false
	self.infire2 = false
	self.heat = 0
	self.Entity:SetModel( "models/props_lab/pipesystem01b.mdl" ) 	
	self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   --after all, gmod is a physics  	
	self.Entity:SetSolid( SOLID_VPHYSICS )        -- Toolbox     
	self.Entity:SetColor(180,180,180,255)
	self.Entity:DrawShadow( false )
	
          
	local phys = self.Entity:GetPhysicsObject()  	
	if (phys:IsValid()) then  		
		phys:Wake() 
	end 
 
	self.Inputs = Wire_CreateInputs( self.Entity, { "Fire API", "Fire HEI" } )
	self.Outputs = Wire_CreateOutputs( self.Entity, { "Can Fire", "Heat"})
end   

function ENT:SpawnFunction( ply, tr)
	
	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 60
	local ent = ents.Create( "gdc_gau12" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:fireapi()

		local ent = ents.Create( "gdca_25x137_api" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 200)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()
		self.heat = self.heat+5

		local phys = self.Entity:GetPhysicsObject()  	
		if (phys:IsValid()) then  		
		phys:ApplyForceCenter( self.Entity:GetUp() * -25000 ) 
		end 
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos() +  self.Entity:GetUp() * 20)
		effectdata:SetNormal(self:GetUp())
		effectdata:SetScale(0.6)
		util.Effect( "gdca_muzzle", effectdata )
		util.ScreenShake(self.Entity:GetPos(), 20, 5, 0.1, 400 )
		self.Entity:EmitSound( "GAU12.single" )

end

function ENT:firehei()

		local ent = ents.Create( "gdca_25x137_hei" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 200)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()
		self.heat = self.heat+5

		local phys = self.Entity:GetPhysicsObject()  	
		if (phys:IsValid()) then  		
		phys:ApplyForceCenter( self.Entity:GetUp() * -25000 ) 
		end 
		
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos() +  self.Entity:GetUp() * 20)
		effectdata:SetNormal(self:GetUp())
		effectdata:SetScale(0.6)
		util.Effect( "gdca_muzzle", effectdata )
		util.ScreenShake(self.Entity:GetPos(), 20, 5, 0.1, 400 )
		self.Entity:EmitSound( "GAU12.single" )

end

function ENT:Think()


			if self.heat>0 then
			Wire_TriggerOutput(self.Entity, "Heat", self.heat)
			self.heat = self.heat-1
			end

			if self.heat>100 then
			self.reloadtime = CurTime()+4		// Overheat for 4 seconds
			end
	
		if (self.reloadtime < CurTime()) then
		Wire_TriggerOutput(self.Entity, "Can Fire", 1)
		else
		Wire_TriggerOutput(self.Entity, "Can Fire", 0)
		end
	
		if (self.inFire == true) then
		if (self.reloadtime < CurTime()) then
		self:fireapi()	
		end
		end

		if (self.inFire2 == true) then
		if (self.reloadtime < CurTime()) then
		self:firehei()	
		end
		end

	self.Entity:NextThink( CurTime() + .05)
	return true
end

function ENT:TriggerInput(k, v)
		if(k=="Fire API") then
		if((v or 0) >= 1) then
		self.inFire = true
		else
		self.inFire = false
		end
		end

		if(k=="Fire HEI") then
		if((v or 0) >= 1) then
		self.inFire2 = true
		else
		self.inFire2 = false
		end
		end
	
if(k=="Reload") then
		if((v or 0) >= 1) then
			self.ammos = 0
		end
	end
	
end
 
 
