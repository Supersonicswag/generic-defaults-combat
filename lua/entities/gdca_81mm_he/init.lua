
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()   

self.smoking = false
self.exploded = false
self.armed = true

self.flightvector = self.Entity:GetUp() * 80
self.timeleft = CurTime() + 10
self.Entity:SetModel( "models/props_junk/garbage_glassbottle001a.mdl" )
self.Entity:SetGravity( 0.5 ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3           
self.Entity:SetColor(255,255,0,255)
 
end   

 function ENT:Think()
	
		if self.timeleft < CurTime() then
					self.exploded = true
					self.Entity:Remove()
					
	end

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.flightvector
		trace.filter = self.Entity 
	local tr = util.TraceLine( trace )
	
	
if tr.Hit then
util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 1000, 250)
local effectdata = EffectData()
effectdata:SetOrigin(tr.HitPos)
effectdata:SetNormal(tr.HitNormal)
effectdata:SetStart(tr.HitPos)
util.Effect( "gdca_105x372he_effect1", effectdata )
util.Effect( "gdca_105x372he_effect2", effectdata )
util.ScreenShake(tr.HitPos, 20, 5, 1, 2500 )
util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

if (tr.Entity:IsPlayer() || tr.Entity:IsNPC() || tr.HitSky) then
self.Entity:Remove()
return true
end

local attack = gcombat.hcgexplode( tr.HitPos, 300, 200, 6)
self.Entity:Remove()

end
	
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector + Vector(math.Rand(-0.2,0.2), math.Rand(-0.2,0.2),math.Rand(-0.2,0.2)) + Vector(0,0,-0.3)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
