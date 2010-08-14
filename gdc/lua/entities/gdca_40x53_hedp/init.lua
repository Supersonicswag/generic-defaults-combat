AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   

math.randomseed(CurTime())
self.flightvector = self.Entity:GetUp() * 150
self.timeleft = CurTime() + 8
self.Entity:SetModel( "models/combatmodels/tankshell_40mm.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3            
self.Entity:SetColor(255,255,0,255)

self:Think()
 
end   

function ENT:Think()

	if (self.smoking == false) then
		self.smoking = true
	
		FireTrail = ents.Create("env_spritetrail")
		FireTrail:SetKeyValue("lifetime","0.3")
		FireTrail:SetKeyValue("startwidth","20")
		FireTrail:SetKeyValue("endwidth","0")
		FireTrail:SetKeyValue("spritename","trails/smoke.vmt")
		FireTrail:SetKeyValue("rendermode","5")
		FireTrail:SetKeyValue("rendercolor","150 150 150")
		FireTrail:SetPos(self.Entity:GetPos())
		FireTrail:SetParent(self.Entity)
		FireTrail:Spawn()
		FireTrail:Activate()
	end 

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
					util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 350, 80)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(1.5)			// Size of cloud
					effectdata:SetRadius(1)			// Size of ring
					effectdata:SetMagnitude(50)			// Size of flash
					util.Effect( "gdca_splodecolumn", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 1, 700 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

					if (tr.Entity:IsValid()) then
					cbt_hcgexplode( tr.HitPos, 200, 200, 6)		// Radius, Damage
					gcombat.hcghit( tr.Entity, 200, 15, tr.HitPos, tr.HitPos) 	// Entity, Damage, Pierce
					end

					self.Entity:Remove()
					end

	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector + Vector(math.Rand(-0.20,0.20), math.Rand(-0.2,0.2),math.Rand(-0.2,0.2)) + Vector(0,0,-0.15)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
	end
 
 
