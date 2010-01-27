
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()   

math.randomseed(CurTime())
self.exploded = false
self.armed = true
self.ticking = true
self.smoking = false
self.flightvector = self.Entity:GetUp() * 400
self.timeleft = CurTime() + 5
self.Entity:SetModel( "models/combatmodels/tankshell_25mm.mdl" ) 	
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

	local trace = {}
		trace.start = self.Entity:GetPos()
		trace.endpos = self.Entity:GetPos() + self.flightvector 
		trace.filter = self.Entity 
	local tr = util.TraceLine( trace )
	
	if (tr.Hit) then
		if ( self.exploded == false ) then
			if ( self.exploded == false && self.ticking == true ) then
				util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 75, 100)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(1)
					effectdata:SetRadius(1)
					util.Effect( "gdca_impact", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 0.3, 150 )
					util.Decal("ExplosiveGunshot", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

				if (tr.Entity:IsWorld() || tr.Entity:IsPlayer() || tr.Entity:IsNPC() || tr.HitSky) then
					self.exploded = true
					self.Entity:Remove()
					return true
				end
			if (tr.Entity:IsValid()) then
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetStart(tr.HitPos)
					util.Effect( "gdca_sparks", effectdata )	
			
					local attack = cbt_dealhcghit( tr.Entity, 50, 10, tr.HitPos , tr.HitPos)
						if (attack == 0) then
							brokedshell = ents.Create("prop_physics")
							brokedshell:SetPos(self.Entity:GetPos())
							brokedshell:SetAngles(self.Entity:GetAngles())
							brokedshell:SetKeyValue( "model", "models/combatmodels/tankshell.mdl" )
							brokedshell:PhysicsInit( SOLID_VPHYSICS )
							brokedshell:SetMoveType( MOVETYPE_VPHYSICS )
							brokedshell:SetSolid( SOLID_VPHYSICS )
							brokedshell:Activate()
							brokedshell:Spawn()
							brokedshell:Fire("Kill", "", 20)
						local phys = brokedshell:GetPhysicsObject()  	
						if (phys:IsValid()) then  
						phys:SetVelocity(self.flightvector * 600000)
						end
			end
				
			end

				self.exploded = true
				self.Entity:Remove()
			end
		end
	end

	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.flightvector = self.flightvector + Vector(math.Rand(-0.5,0.5), math.Rand(-0.5,0.5),math.Rand(-0.5,0.5)) + Vector(0,0,-0.2)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
	end
 
 
