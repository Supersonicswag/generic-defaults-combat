
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('entities/base_wire_entity/init.lua'); 
include('shared.lua')


// READ ME!

// So you found this entity and you're wondering why its not on the list.
// It's because it's an exploit and I don't want it to be minged. It isn't even the best weapon but it's easy to abuse so 
// DONT TELL ANYBODY HOW TO USE IT. Otherwise I will change/remove it so it's not usable by you, and you'll be sorry.

function ENT:Initialize()   

	self.ammos = 1
	self.clipsize = 1
	self.armed = false
	self.loading = false
	self.reloadtime = 0
	self.infireFrag = false
	self.heat = 0
	self.Entity:SetModel( "models/props_pipes/pipecluster08d_extender64.mdl" ) 	
	self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   --after all, gmod is a physics  	
	self.Entity:SetSolid( SOLID_VPHYSICS )        -- Toolbox     
	self.Entity:SetColor(25,25,25,255)
	
	local phys = self.Entity:GetPhysicsObject()  	
	if (phys:IsValid()) then  		
	phys:Wake() 
	end 
 
	self.Inputs = Wire_CreateInputs( self.Entity, { "Fire Frag"} )
	self.Outputs = Wire_CreateOutputs( self.Entity, {"Can Fire"})
end   

function ENT:SpawnFunction( ply, tr)
	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 60
	local ent = ents.Create( "gdc_s13" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	return ent
end

	function ENT:firefrag()
		local ent = ents.Create( "gdca_122mms13frag" )
		ent:SetPos( self.Entity:GetPos() +  self.Entity:GetUp() * 250)
		ent:SetAngles( self.Entity:GetAngles() )
		ent:Spawn()
		ent:Activate()		
		self.Entity:EmitSound( "M260.single" )
		self.ammos = self.ammos-1
	end

function ENT:Think()
if FIELDS == nil and COMBATDAMAGEENGINE == nil then return end
	if self.ammos <= 0 then
	self.reloadtime = CurTime()+10
	self.ammos = self.clipsize
	end

	if (self.reloadtime < CurTime()) then
		Wire_TriggerOutput(self.Entity, "Can Fire", 1)
	else
		Wire_TriggerOutput(self.Entity, "Can Fire", 0)
	end
	
	if (self.inFireFrag == true) then
	if (self.reloadtime < CurTime()) then
	self:firefrag()
	end
	end

	self.Entity:NextThink( CurTime() + 0.1)
	return true
end

function ENT:TriggerInput(k, v)
	if(k=="Fire Frag") then
		if((v or 0) >= 1) then
		self.inFireFrag = true
		else
		self.inFireFrag = false
		end
	end
end