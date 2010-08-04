AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   

self.flightvector = self.Entity:GetUp() * ((115*39.37)/66)
self.timeleft = CurTime() + 10
self.Owner = self:GetOwner()
self.Entity:SetModel( "models/combatmodels/tankshell.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3           
self.Entity:SetColor(255,255,255,255)
 
end   

 function ENT:Think()
	
 	if (self.smoking == false) then
		self.smoking = true
	
		FireTrail = ents.Create("env_spritetrail")
		FireTrail:SetKeyValue("lifetime","0.5")
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

		if self.timeleft < CurTime() then
		self.Entity:Remove()				
		end

	Table	={} 			//Table name is table name
	Table[1]	=self.Owner 		//The person holding the gat
	Table[2]	=self.Entity 		//The cap

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.flightvector
		trace.filter = Table
	local tr = util.TraceLine( trace )
	

			if tr.HitSky then
			self.Entity:Remove()
			return true
			end
	
				if tr.Hit then
					util.BlastDamage(self.Entity, self.Owner, tr.HitPos, 600, 150)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(2.5)			// Size of cloud
					effectdata:SetRadius(2.5)			// Size of ring
					effectdata:SetMagnitude(200)			// Size of flash
					util.Effect( "gdca_splodering", effectdata )
					util.Effect( "gdca_splodecolumn", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 1, 3000 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

					self.Entity:Remove()	
					end
	
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector - self.flightvector/((147*39.37)/66) + self.Entity:GetUp()*2 + Vector(math.Rand(-0.3,0.3), math.Rand(-0.3,0.3),math.Rand(-0.2,0.2)) + Vector(0,0,-0.06)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
