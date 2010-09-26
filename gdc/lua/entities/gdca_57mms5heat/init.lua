AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   
self.flightvector = self.Entity:GetUp() * ((200*39.37)/66)
self.timeleft = CurTime() + 7
self.Entity:SetModel( "models/combatmodels/tankshell.mdl" )	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3           
self.Entity:SetColor(255,255,0,255)
FireTrail = ents.Create("env_spritetrail")
FireTrail:SetKeyValue("lifetime","0.3")
FireTrail:SetKeyValue("startwidth","20")
FireTrail:SetKeyValue("endwidth","200")
FireTrail:SetKeyValue("spritename","trails/smoke.vmt")
FireTrail:SetKeyValue("rendermode","5")
FireTrail:SetKeyValue("rendercolor","200 200 200")
FireTrail:SetPos(self.Entity:GetPos())
FireTrail:SetParent(self.Entity)
FireTrail:Spawn()
FireTrail:Activate()
end   

 function ENT:Think()

		if self.timeleft < CurTime() then
		self.Entity:Remove()				
		end

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.flightvector*1.2
		trace.filter = self.Entity 
	local tr = util.TraceLine( trace )
	

			if tr.HitSky then
			self.Entity:Remove()
			return true
			end
	
				if tr.Hit then
					util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 500, 100)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(2)			// Size of explosion
					effectdata:SetRadius(0.5)			// Relative width of explosion
					effectdata:SetMagnitude(13)			// Length of explosion trails
					util.Effect( "gdca_cinematicboom", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 1, 2000 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

					if tr.Entity:IsValid() then
					local attack = gcombat.hcgexplode( tr.HitPos, 150, 250, 10)		// Radius, Damage
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetStart(tr.HitPos)
					util.Effect( "gdca_sparks", effectdata )	
					end

					self.Entity:Remove()	
					end
	
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector =  self.flightvector - self.flightvector/80 + self.Entity:GetUp()*5 + Vector(math.Rand(-0.2,0.2), math.Rand(-0.2,0.2),math.Rand(-0.2,0.2)) + Vector(0,0,-0.10)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
