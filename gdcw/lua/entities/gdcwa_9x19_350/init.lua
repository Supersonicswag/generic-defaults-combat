
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:SpawnFunction(ply, tr)
	if not tr.Hit then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create ("gdcwa_9x19_350")
	ent:SetPos (SpawnPos)
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:Initialize()   

math.randomseed(CurTime())
self.smoking = false
self.Owner = self:GetOwner()
self.penetrate = 4
self.flightvector = self.Entity:GetUp() * ((350*39.37)/66)             	-- Velocity in m/s, inches to meters conversion, ticks per second.FIRST NUMMER = SPEED
self.timeleft = CurTime() + 5
self.Entity:SetModel( "models/led.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3            

self:Think()
 
end   

function ENT:Think()


		if self.timeleft < CurTime() then
					self.exploded = true
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


					if tr.Hit and !tr.Entity:IsPlayer() and !tr.Entity:IsNPC() then
					util.BlastDamage(self.Entity, self.Owner, tr.HitPos, 30, 10)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(1.1)
					effectdata:SetRadius(1.1)
					util.Effect( "gdcw_impact", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 0.1, 200 )
					util.Decal("ExplosiveGunshot", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
					end

				if tr.Hit and tr.Entity:IsPlayer() || tr.Entity:IsNPC() then
				local dmginfo = DamageInfo()
					dmginfo:SetDamage( math.Rand(25,35) ) 	--1 or 2 hits for a kill
					dmginfo:SetDamageType( DMG_BULLET ) 	--Bullet damage
					dmginfo:SetAttacker( self.Owner ) 		--Shooter gets credit
					dmginfo:SetInflictor( self.Entity ) 		--Bullet gets credit
					dmginfo:SetDamageForce( self.flightvector/100 ) 	--A few newtons...
				tr.Entity:TakeDamageInfo( dmginfo ) 			--Take damage!
					local effectdata = EffectData()
					effectdata:SetOrigin( tr.HitPos )
					util.Effect( "BloodImpact", effectdata )
				end

	local trace = {}
		trace.start = tr.HitPos + self.flightvector:GetNormalized() * 4
		trace.endpos = tr.HitPos
		trace.filter = self.Entity 
	local pr = util.TraceLine( trace )

		if pr.StartSolid || tr.Hit and !pr.Hit || self.penetrate<0 then
		self.Entity:Remove()
		end

		if tr.Hit and pr.Hit then
		self.penetrate = self.penetrate - (tr.HitPos:Distance(pr.HitPos))
		end

		if !pr.StartSolid and tr.Hit and self.penetrate>0 and !pr.Entity:IsPlayer() and !pr.Entity:IsNPC() then
				util.BlastDamage(self.Entity, self.Owner, pr.HitPos, 40, 10)
				self.Entity:SetPos(pr.HitPos + self.flightvector:GetNormalized()*10)
					local effectdata = EffectData()
					effectdata:SetOrigin(pr.HitPos)
					effectdata:SetNormal(self.flightvector:GetNormalized())
					effectdata:SetScale(1)
					effectdata:SetRadius(1)
					util.Effect( "gdcw_penetrate", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 0.1, 250 )
					util.Decal("ExplosiveGunshot", pr.HitPos + pr.HitNormal, pr.HitPos - pr.HitNormal)
					end


	if !pr.Hit then
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	end
	self.flightvector = self.flightvector - self.flightvector/150 + Vector(math.Rand(-0.2,0.2), math.Rand(-0.2,0.2),math.Rand(-0.2,0.2)) + Vector(0,0,-0.06)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
	end
 
 
