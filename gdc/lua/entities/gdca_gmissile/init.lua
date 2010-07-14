AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

util.PrecacheSound( "weapons/rpg/rocket1.wav" )

function ENT:Initialize()   

math.randomseed(CurTime())
self.flightvector = self.Entity:GetUp() * 30
self.timeleft = CurTime() + 10

self.nexttarGet = CurTime()

self.Entity:SetModel( "models/props_c17/canister01a.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3 
	
 	self.Sound = CreateSound( self.Entity, Sound( "weapons/rpg/rocket1.wav" ) ) 
 	self.Sound:Play()
	
	self.target = self.Entity    

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
		trace.endpos = self.Entity:GetPos() + self.flightvector
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
					effectdata:SetScale(3)
					effectdata:SetRadius(3)
					util.Effect( "gdca_splodering", effectdata )
					util.Effect( "gdca_splodecolumn", effectdata )
					util.ScreenShake(tr.HitPos, 10, 5, 1, 2000 )
					util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

					local attack = gcombat.hcgexplode( tr.HitPos, 300, 400, 8)
					self.Entity:Remove()	

					end
	
	local EIS = ents.FindInSphere(self:GetPos(), 40000)
	local distance = 40000
	
	if (!self.target:IsValid() || self.target == self.Entity) then 
	
	self.target = self.Entity
	local EIS = ents.FindInSphere(self:GetPos(), 40000)
	local distance = 40000
	
	if self.nexttarGet < CurTime() then 
		for _,t in pairs(EIS) do
			if (t:GetClass() == "prop_physics" || t:GetClass() == "prop_vehicle" || t:IsNPC()) then
				if (t:GetPos():Distance(self:GetPos()) < distance && self:GetUp():DotProduct((t:GetPos() - self:GetPos()):GetNormalized()) > 0.98) then
						self.target = t
						distance = t:GetPos():Distance(self:GetPos())
				end
			end
		end
		
		self.nexttarGet = CurTime() + 1
	end
	 end
	if self.target != self.Entity then
		self.flightvector = self.flightvector + Vector(math.Rand(-1,1), math.Rand(-1,1),math.Rand(-0.5,0.5)) + (self.target:GetPos() - self:GetPos()):GetNormalized() * 6
		if self:GetPos():Distance(self.target:GetPos()) > 1500 then
			local trace = {}
				trace.start = self.Entity:GetPos()
				trace.endpos = self.Entity:GetPos() + self.flightvector * 10
				trace.filter = self.Entity 
			local tr = util.TraceLine( trace )
			if tr.Hit then self.flightvector = self.flightvector + tr.HitNormal * 0.8 + VectorRand() * 5 end
		end
		self.flightvector = self.flightvector:GetNormalized() * 150 + Vector(math.Rand(-1,1), math.Rand(-1,1),math.Rand(-1,1)) + Vector(0,0,-0.06)
	end

	self.flightvector = self.flightvector - self.flightvector/100 + self.Entity:GetUp()*4 + Vector(math.Rand(-0.3,0.3), math.Rand(-0.3,0.3),math.Rand(-0.2,0.2))
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
