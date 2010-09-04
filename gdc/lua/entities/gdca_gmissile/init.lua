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
					effectdata:SetScale(3)			// Size of cloud
					effectdata:SetRadius(3)			// Size of ring
					effectdata:SetMagnitude(150)			// Size of flash
					util.Effect( "gdca_splodering", effectdata )
					util.Effect( "gdca_splodecolumn", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 1, 2000 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

					local attack = gcombat.hcgexplode( tr.HitPos, 300, 400, 10)
					self.Entity:Remove()	
					end
	

	local EIS = ents.FindInSphere(self:GetPos(), 40000)
	local distance = 40000
	if self.nexttarGet < CurTime() then 
		for _,t in pairs(EIS) do
			if !(t:GetClass() == "gdca_flare") and !self.Flared then
			if (t:GetClass() == "prop_physics" || t:GetClass() == "prop_vehicle" || t:GetClass() == "gdca_flare" || t:IsNPC()) then
				if (t:GetPos():Distance(self:GetPos()) < distance && self:GetUp():DotProduct((t:GetPos() - self:GetPos()):GetNormalized()) > 0.98) then
						self.Target = t
				end
				end
						elseif (t:GetClass() == "gdca_flare") then	
						self.Target = t 
						self.Flared = true
						end
			end
			self.nexttarGet = CurTime() + 1
		end


	if (self.Target != self.Entity) and (self.Target:GetPos():Distance(self:GetPos()) < distance && self:GetUp():DotProduct((self.Target:GetPos() - self:GetPos()):GetNormalized()) > 0.50) then
	ForwardAngle = self.Entity:GetUp():Angle()
	TangY = (self.Target:GetPos() - self:GetPos()):GetNormalized():Angle().y
	AddY = math.Clamp(math.AngleDifference(TangY, self.Entity:GetUp():Angle().y)*15,-1.5,1.5)
	TangP = (self.Target:GetPos() - self:GetPos()):GetNormalized():Angle().p
	AddP = math.Clamp(math.AngleDifference(TangP, self.Entity:GetUp():Angle().p)*15,-1.5,1.5)
	self.Entity:SetAngles((Angle(AddP,AddY,0) + ForwardAngle) + Angle(90,0,0) + Angle(math.Rand(-0.5,0.5),math.Rand(-0.5,0.5),math.Rand(-0.5,0.5)))
	else
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	end

	self.flightvector = self.Entity:GetUp()*150 + Vector(math.Rand(-0.3,0.3), math.Rand(-0.3,0.3),math.Rand(-0.3,0.3))
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
