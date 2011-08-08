
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')


function ENT:Initialize()   

	math.randomseed(CurTime())
	self.exploded = false
	self.fuseleft = CurTime() + math.random(3,6)
	self.minsmoke = CurTime() + 1
	self.deathtype = 0	
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS ) 
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WORLD)
	local phys = self.Entity:GetPhysicsObject()  	
	local pos = self.Entity:GetPos()
	local mass = phys:GetMass()
	self.Cola = self.Entity:GetColor()

	if phys:IsValid() then  		
	phys:Wake()
	phys:EnableGravity(true)
	phys:ApplyForceCenter(VectorRand():GetNormalized() * math.random(200,400))
	end 
 
end   
 
function ENT:Think()
	if (self.fuseleft < CurTime()) then
	self.Entity:Remove()
	end
	 
	if (self.Entity:GetPhysicsObject():GetVelocity():Length()>0 ) then
	local effectdata = EffectData()
	effectdata:SetOrigin(self.Entity:GetPos())
	effectdata:SetStart(self.Entity:GetPos())
	effectdata:SetScale( math.Clamp(self.Entity:BoundingRadius()/50,0.8,3) )
	util.Effect( "gdca_debrismoke", effectdata )				
	end
	local yarg = math.Clamp(100/(self.Entity:GetPhysicsObject():GetVelocity():Length()),0.04,0.3)
	self.Entity:NextThink( CurTime() + yarg)
										//models/props_wasteland/metal_tram001a
	return true
end

function ENT:OnTakeDamage( dmginfo )
self.Entity:TakePhysicsDamage( dmginfo )
end

function ENT:PhysicsUpdate()
return true
end

function ENT:PhysicsCollide( data, physobj )
if (self.minsmoke < CurTime()) then
self.Entity:Remove()
end
end