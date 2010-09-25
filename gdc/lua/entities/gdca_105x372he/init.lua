
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()   

self.flightvector = self.Entity:GetUp() * 200
self.timeleft = CurTime() + 10
self.Entity:SetModel( "models/props_junk/garbage_plasticbottle003a.mdl" )
self.Entity:SetGravity( 0.5 ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3           
self.Entity:SetColor(255,255,0,255)
 
end   

 function ENT:Think()
	
		if self.timeleft < CurTime() then
		self.Entity:Remove()				
		end

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.flightvector
		trace.filter = self.Entity 
	local tr = util.TraceLine( trace )
	
			if tr.HitSky then
			self.Entity:Remove()
			return true
			end

			if tr.Hit then
				util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 1200, 200)		// Radius, Damage
				local effectdata = EffectData()
				effectdata:SetOrigin(tr.HitPos)
				effectdata:SetNormal(tr.HitNormal)
				effectdata:SetScale(4.5)			// Size of explosion
				effectdata:SetRadius(1)			// Relative width of explosion
				effectdata:SetMagnitude(20)			// Length of explosion trails
				util.Effect( "gdca_cinematicboom", effectdata )
				util.ScreenShake(tr.HitPos, 20, 5, 1, 2500 )
				util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

				local attack = gcombat.hcgexplode( tr.HitPos, 600, 400, 6)
				self.Entity:Remove()
				end
	
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector + Vector(math.Rand(-0.3,0.3), math.Rand(-0.3,0.3),math.Rand(-0.3,0.2)) + Vector(0,0,-0.2)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
