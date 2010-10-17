AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

util.PrecacheSound( "weapons/rpg/rocket1.wav" )

function ENT:Initialize()   
self.flightvector = self.Entity:GetUp() * 30
self.timeleft = CurTime() + 10
self.nexttarGet = CurTime()
self.Entity:SetModel( "models/props_c17/canister01a.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3 
self.Sound = CreateSound( self.Entity, Sound( "weapons/rpg/rocket1.wav" ) ) 
self.Sound:Play()
self.Target = self.Entity    
self.Flared = false

SmokeTrail = ents.Create("env_spritetrail")
SmokeTrail:SetKeyValue("lifetime","1")
SmokeTrail:SetKeyValue("startwidth","40")
SmokeTrail:SetKeyValue("endwidth","200")
SmokeTrail:SetKeyValue("spritename","trails/smoke.vmt")
SmokeTrail:SetKeyValue("rendermode","5")
SmokeTrail:SetKeyValue("rendercolor","200 200 200")
SmokeTrail:SetPos(self.Entity:GetPos())
SmokeTrail:SetParent(self.Entity)
SmokeTrail:Spawn()
SmokeTrail:Activate()

Glow = ents.Create("env_sprite")
Glow:SetPos(self.Entity:GetPos())
Glow:SetKeyValue("renderfx", "0")
Glow:SetKeyValue("rendermode", "5")
Glow:SetKeyValue("renderamt", "255")
Glow:SetKeyValue("rendercolor", "250 200 150")
Glow:SetKeyValue("framerate12", "20")
Glow:SetKeyValue("model", "light_glow03.spr")
Glow:SetKeyValue("scale", "2.5")
Glow:SetKeyValue("GlowProxySize", "130")
Glow:SetParent(self.Entity)
Glow:Spawn()
Glow:Activate()

self:Think()
end   

function ENT:OnRemove()
	self.Sound:Stop()
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
				util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 600, 150)
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetNormal(tr.HitNormal)
					effectdata:SetScale(3)			// Size of explosion
					effectdata:SetRadius(1)			// Relative width of explosion. Higher is narrower.
					effectdata:SetMagnitude(15)			// Length of explosion trails
					util.Effect( "gdca_cinematicboom", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 1, 2000 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)


					if tr.Entity:IsValid() then
					local attack = gcombat.hcgexplode( tr.HitPos, 300, 300, 10)		// Radius, Damage
					local effectdata = EffectData()
					effectdata:SetOrigin(tr.HitPos)
					effectdata:SetStart(tr.HitPos)
					util.Effect( "gdca_sparks", effectdata )	
					end

					self.Entity:Remove()	
					end
	

	local EIS = ents.FindInSphere(self:GetPos(), 40000)
	local distance = 40000
	if self.nexttarGet < CurTime() then 
		for _,t in pairs(EIS) do
			if !(t:GetClass() == "gdca_flare") and !self.Flared then
			if (t:IsValid() and (t:GetClass() == "prop_physics" || t:GetClass() == "prop_vehicle_prisoner_pod" || t:GetClass() == "prop_vehicle_jeep" || t:GetClass() == "prop_vehicle_airboat" || t:GetClass() == "gdca_flare" || t:IsNPC()) and (t:GetVelocity():Length() > 0)) then
				if (t:GetPos():Distance(self:GetPos()) < distance && self:GetUp():DotProduct((t:GetPos() - self:GetPos()):GetNormalized()) > 0.98) then
						self.Target = t
				end
				end
						elseif (t:GetClass() == "gdca_flare") then	
						self.Target = t 
						self.Flared = true
						end
			end
			self.nexttarGet = CurTime() + 0.3
		end


	if (self.Target:IsValid()) and (self.Target != self.Entity) and (self.Target:GetPos():Distance(self:GetPos()) < distance && self:GetUp():DotProduct((self.Target:GetPos() - self:GetPos()):GetNormalized()) > 0.50) then
	ForwardAngle = self.Entity:GetUp():Angle()
	TangY = (self.Target:GetPos() - self:GetPos()):GetNormalized():Angle().y
	AddY = math.Clamp(math.AngleDifference(TangY, self.Entity:GetUp():Angle().y)*15,-1.2,1.2)
	TangP = (self.Target:GetPos() - self:GetPos()):GetNormalized():Angle().p
	AddP = math.Clamp(math.AngleDifference(TangP, self.Entity:GetUp():Angle().p)*15,-1.2,1.2)
	self.Entity:SetAngles((Angle(AddP,AddY,0) + ForwardAngle) + Angle(90,0,0) + Angle(math.Rand(-0.8,0.8),math.Rand(-0.8,0.8),math.Rand(-0.8,0.8)))
	else
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	end

	self.flightvector = self.Entity:GetUp()*120 + Vector(math.Rand(-0.3,0.3), math.Rand(-0.3,0.3),math.Rand(-0.3,0.3))
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
