AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   

math.randomseed(CurTime())
self.flightvector = self.Entity:GetUp() * 300
self.timeleft = CurTime() + 5
self.Entity:SetModel( "models/combatmodels/tankshell_120mm.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3            

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
				util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 700, 300)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(3)			// Size of explosion
					effectdata:SetRadius(1)			// Relative width of explosion
					effectdata:SetMagnitude(17)			// Length of explosion trails
					util.Effect( "gdca_cinematicboom", effectdata )
					util.ScreenShake(tr.HitPos, 20, 5, 1, 1200 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
					local attack = cbt_hcgexplode( tr.HitPos, 200, 1500, 7)

					if (tr.Entity:IsValid()) then				
					local attack = cbt_dealhcghit( tr.Entity, 1500, 20, tr.HitPos , tr.HitPos)										
					end

					self.Entity:Remove()
					end


	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector + Vector(math.Rand(-0.1,0.1), math.Rand(-0.1,0.1),math.Rand(-0.1,0.1)) + Vector(0,0,-0.15)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
	end
 
 
