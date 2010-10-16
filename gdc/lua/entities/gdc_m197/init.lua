AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('entities/base_wire_entity/init.lua'); 
include('shared.lua')

function ENT:Initialize()   
	self.reloadtime = 0
	self.InFireHEI = false
	self.InFireHEIT = false
	self.InFireAPI = false
	self.heat = 0
	self.Entity:SetModel( "models/props_lab/pipesystem01b.mdl" ) 
	self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   --after all, gmod is a physics  	
	self.Entity:SetSolid( SOLID_VPHYSICS )        -- Toolbox     
	self.Entity:SetColor(100,100,100,255)
	
	local phys = self.Entity:GetPhysicsObject()  	
	if (phys:IsValid()) then  		
	phys:Wake() 
	end 
 
	self.Inputs = Wire_CreateInputs( self.Entity, { "Fire", "Fire Tracer", "Fire API" } )
	self.Outputs = Wire_CreateOutputs( self.Entity, { "Can Fire", "Heat"})
end   


function ENT:FireHEI()
		local ent = ents.Create( "gdca_20x102_hei" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 200)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()
		self.heat = self.heat+4
		
		local phys = self.Entity:GetPhysicsObject()  	
		if (phys:IsValid()) then  		
		phys:ApplyForceCenter( self.Entity:GetUp() * -20000 ) 
		end 
		
		self.Entity:EmitSound( "M197.single" )
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos() +  self.Entity:GetUp() * 30)
		effectdata:SetNormal(self:GetUp())
		effectdata:SetScale(0.65)
		util.Effect( "gdca_muzzle", effectdata )
		util.ScreenShake(self.Entity:GetPos(), 20, 5, 0.1, 500 )
end

function ENT:FireHEIT()
		local ent = ents.Create( "gdca_20x102_heit" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 200)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()
		self.heat = self.heat+4
		
		local phys = self.Entity:GetPhysicsObject()  	
		if (phys:IsValid()) then  		
		phys:ApplyForceCenter( self.Entity:GetUp() * -20000 ) 
		end 
		
		self.Entity:EmitSound( "M197.single" )
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos() +  self.Entity:GetUp() * 30)
		effectdata:SetNormal(self:GetUp())
		effectdata:SetScale(0.65)
		util.Effect( "gdca_muzzle", effectdata )
		util.ScreenShake(self.Entity:GetPos(), 20, 5, 0.1, 500 )
end

function ENT:FireAPI()
		local ent = ents.Create( "gdca_20x102_api" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 200)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()
		self.heat = self.heat+4
		
		local phys = self.Entity:GetPhysicsObject()  	
		if (phys:IsValid()) then  		
		phys:ApplyForceCenter( self.Entity:GetUp() * -10000 ) 
		end 
		
		self.Entity:EmitSound( "M197.single" )
		local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos() +  self.Entity:GetUp() * 30)
		effectdata:SetNormal(self:GetUp())
		effectdata:SetScale(0.65)
		util.Effect( "gdca_muzzle", effectdata )
		util.ScreenShake(self.Entity:GetPos(), 20, 5, 0.1, 500 )
end

function ENT:Think()
if FIELDS == nil and COMBATDAMAGEENGINE == nil then return end

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
	
		if self.InFireHEI then
		if (self.reloadtime < CurTime()) then
		self:FireHEI()
		end
		end

		if self.InFireHEIT and !self.InFireHEI then
		if (self.reloadtime < CurTime()) then
		self:FireHEIT()
		end
		end

		if self.InFireAPI and !self.InFireHEIT and !self.InFireHEI then
		if (self.reloadtime < CurTime()) then
		self:FireAPI()
		end
		end

	self.Entity:NextThink( CurTime() + .085)
	return true
end

function ENT:TriggerInput(k, v)

		if(k=="Fire") then
		if((v or 0) >= 1) then
		self.InFireHEI = true
		else
		self.InFireHEI = false
		end
		end
	
		if(k=="Fire Tracer") then
		if((v or 0) >= 1) then
		self.InFireHEIT = true
		else
		self.InFireHEIT = false
		end
		end

		if(k=="Fire API") then
		if((v or 0) >= 1) then
		self.InFireAPI = true
		else
		self.InFireAPI = false
		end
		end
	
end
 
 
