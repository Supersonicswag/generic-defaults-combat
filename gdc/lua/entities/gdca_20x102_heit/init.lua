AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   
self.flightvector = self.Entity:GetUp() * 350
self.timeleft = CurTime() + 5
self.Entity:SetModel( "models/combatmodels/tankshell_25mm.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3            
FireTrail = ents.Create("env_spritetrail")
FireTrail:SetKeyValue("lifetime",".1")
FireTrail:SetKeyValue("startwidth","50")
FireTrail:SetKeyValue("endwidth","0")
FireTrail:SetKeyValue("spritename","trails/laser.vmt")
FireTrail:SetKeyValue("rendermode","5")
FireTrail:SetKeyValue("rendercolor","250 150 100")
FireTrail:SetPos(self.Entity:GetPos())
FireTrail:SetParent(self.Entity)
FireTrail:Spawn()
FireTrail:Activate()
self:Think()
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

				if (tr.Hit) then
					util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 200, 50)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(1)			// Size of explosion
					effectdata:SetRadius(0.6)			// Relative width of explosion
					effectdata:SetMagnitude(10)			// Length of explosion trails
					util.Effect( "gdca_cinematicboom", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 0.5, 600 )
					util.Decal("fadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

					if tr.Entity:IsValid() then
					local attack = gcombat.hcgexplode( tr.HitPos, 30, 80, 6)		// Radius, Damage
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetStart(tr.HitPos)
					util.Effect( "gdca_sparks", effectdata )	
					end

					self.Entity:Remove()
					end


	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector + Vector(math.Rand(-0.5,0.5), math.Rand(-0.5,0.5),math.Rand(-0.5,0.5)) + Vector(0,0,-0.2)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
	end