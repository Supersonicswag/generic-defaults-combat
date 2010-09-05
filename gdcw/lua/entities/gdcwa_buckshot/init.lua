AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   

self.flightvector = self.Entity:GetUp() * ((360*39.37)/66)             	-- Velocity in m/s, inches to meters conversion, ticks per second.FIRST NUMMER = SPEED
self.timeleft = CurTime() + 3
self.Owner = self:GetOwner()
self.Entity:SetModel( "models/led.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )	
self.Entity:SetMoveType( MOVETYPE_NONE )
self.Entity:SetSolid( SOLID_VPHYSICS )
self:Think()
end   

function ENT:Think()	

	if self.timeleft < CurTime() then
		self.Entity:Remove()
		end

	Table	={} 			//Table name is table name
	Table[1]	=self.Owner 		//The person holding the gat
	Table[2]	=self.Entity 		//The cap

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.flightvector
		trace.filter =	Table
		local tr = util.TraceLine( trace )

		if tr.HitSky then
			self.Entity:Remove()
			return true
			end	
	
					if tr.Hit and !tr.Entity:IsPlayer() and !tr.Entity:IsNPC() then
					util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 30, 5)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(0.8)
					effectdata:SetRadius(0.8)
					util.Effect( "gdcw_impact", effectdata )
					util.Decal("ExplosiveGunshot", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
					self.Entity:Remove()
					return true
					end

					if tr.Hit and tr.Entity:IsPlayer() || tr.Entity:IsNPC() then
					local dmginfo = DamageInfo()
					dmginfo:SetDamage( math.Rand(15,20) ) 	-- 30-50 damage
					hitgroup = tr.HitGroup
	if hitgroup == HITGROUP_HEAD 					then 	dmginfo:ScaleDamage( 10 ) 			end
	if hitgroup == HITGROUP_STOMACH 					then 	dmginfo:ScaleDamage( 1 ) 			end
	if hitgroup == HITGROUP_CHEST 					then 	dmginfo:ScaleDamage( math.Rand(1,1.5) ) 	end
	if  hitgroup == HITGROUP_LEFTARM || hitgroup == HITGROUP_RIGHTARM  	then 	dmginfo:ScaleDamage( math.Rand(0.3,0.5) ) 	end
	if  hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG  	then 	dmginfo:ScaleDamage( math.Rand(0.3,0.6) ) 	end
					dmginfo:SetDamageType( DMG_BULLET ) 	--Bullet damage
					dmginfo:SetAttacker( self.Owner ) 		--Shooter gets credit
					dmginfo:SetInflictor( self.Entity ) 		--Bullet gets credit
					dmginfo:SetDamageForce( self.flightvector/250 ) 	--A few newtons...
				tr.Entity:TakeDamageInfo( dmginfo ) 			--Take damage!
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					util.Effect( "BloodImpact", effectdata )			// Nothing violent here either!
					self.Entity:Remove()
					return true
					end

self.flightvector = self.flightvector - self.flightvector/50 + Vector(math.Rand(-0.1,0.1), math.Rand(-0.1,0.1),math.Rand(-0.1,0.1)) + Vector(0,0,-0.06)
self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
self.Entity:NextThink( CurTime() )
return true
end
 
 
