
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('entities/base_wire_entity/init.lua');
include('shared.lua')

function ENT:SpawnFunction( ply, tr)
	
	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 60
	
	local ent = ents.Create( "gdc_shape_charge" )
		ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()

	return ent

end

function ENT:Initialize()
	self.Entity:SetModel( "models/props_junk/popcan01a.mdl" )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   --after all, gmod is a physics  	
	self.Entity:SetSolid( SOLID_VPHYSICS )        -- Toolbox   
	self.infire = false
	self.Entity:SetOwner(self.owner)
	local phys = self.Entity:GetPhysicsObject()
	if phys:IsValid() then 
		phys:Wake()
	end

      self.Inputs = Wire_CreateInputs ( self.Entity, { "Detonate" } )
end


function ENT:Think()

        if self.infire then
		local effectdata = EffectData()
			effectdata:SetOrigin( self.Entity:GetPos() )
			effectdata:SetStart(self.Entity:GetUp())
		util.Effect( "gdca_40x311_effect", effectdata )
		util.Effect( "gdca_sparks", effectdata )
		util.ScreenShake(self.Entity:GetPos(), 25, 5, 1, 1000 )
		self.Entity:EmitSound( "Explosion.Boom")
		self.Entity:EmitSound( "Explosion.Boom")
		cbt_hcgexplode( self.Entity:GetPos(), 200, 1500, 10)
		util.BlastDamage(self.Entity, self.Entity, self.Entity:GetPos(), 500, 200)
		self.Entity:Remove()
	end
end
		

function ENT:TriggerInput(iname, value)

	if (iname == "Detonate") then
		if (value == 1 && self.infire == false) then self.infire = true end
		if (value == 0 && self.infire == true) then self.infire = false end
	end

end






