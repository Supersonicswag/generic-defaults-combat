
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

util.PrecacheSound( "weapons/rpg/rocket1.wav" )

function ENT:Initialize()   

	local CheckHo = ents.FindByClass( "gdca_atgm" )		
	for _,t in pairs(CheckHo) do
	if t.Entity:IsValid() and (t.Entity!=self.Entity) and (t.Entity:GetClass()=="gdca_atgm") then
	if t:GetPos():Distance(self:GetPos())<800 then
	self.Entity:Remove()
	end
	end
	end

self.Target 		= self.Guider:GetVar("Target",Vector)
self.FlightData 	= self.Guider:GetVar("FlightData",Vector)
self.W 			= 1
self.Zmod 		= 0.25
self.DistanceCutoff 	= 4000

self.Accelerator 	= 20
self.AccelRate		= 1
self.AccelMax		= 100
self.flightvector = self.Entity:GetUp() * self.Accelerator
self.timeleft = CurTime() + 10
self.ArmedTime = CurTime() + 1
self.Armed = false
self.Entity:SetModel( "models/props_c17/canister01a.mdl" ) 	
self.Entity:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,  	
self.Entity:SetMoveType( MOVETYPE_NONE )   --after all, gmod is a physics  	
self.Entity:SetSolid( SOLID_VPHYSICS )        -- CHEESECAKE!    >:3 
self.Sound = CreateSound( self.Entity, Sound( "weapons/rpg/rocket1.wav" ) ) 
self.Sound:Play()

self:Think()
end   

function ENT:OnRemove()
	self.Sound:Stop()
end

 function ENT:Think()
	
if (self.Accelerator<self.AccelMax) then self.Accelerator = self.Accelerator+self.AccelRate	end	// Speed it up!

if !self.Guider:IsValid() then self.Guider = self.Entity end
	self.Target = self.Guider:GetVar("Target",Vector) 		// Refresh target position

	self.Distance = ((self.Target-Vector(0,0,self.Target.z))-self:GetPos()):Length()// Horizontal Distance

	if self.Distance>self.DistanceCutoff then					// If you are far away
	self.Zadd = Vector(0,0,	self.Distance*self.Zmod	)				// Add to the Z coordinate
	else self.Zadd = Vector(0,0,0) end						// Or else go straight for it

	self.Target = self.Target + self.Zadd						// Add Distance * Z Multiplier


	if self.timeleft < CurTime() || !self.Guider:IsValid() then
	self.Entity:Remove()				
	end

		if self.ArmedTime < CurTime() and !self.Armed then
		self.Armed = true				
		end

	local trace = {}
		trace.start 	= self.Entity:GetPos()
		trace.endpos 	= self.Entity:GetPos() + self.flightvector*1.1
		trace.filter 	= self.Entity 
		trace.mask 	= MASK_SHOT + MASK_WATER			// Trace for stuff that bullets would normally hit
	local tr = util.TraceLine( trace )


				if tr.Hit then
					if tr.HitSky then
					self.Entity:Remove()
					return true
					end
					if tr.MatType==83 then				//83 is wata
					local effectdata = EffectData()
					effectdata:SetOrigin( tr.HitPos )
					effectdata:SetNormal( tr.HitNormal )		// In case you hit sideways water?
					effectdata:SetScale( 70 )			// Big splash for big bullets
					util.Effect( "watersplash", effectdata )
					self.Entity:Remove()
					return true
					end
			if (self.Armed) then
			util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 900, 150)
			local effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)				// Position of Impact
			effectdata:SetNormal(tr.HitNormal)			// Direction of Impact
			effectdata:SetStart(self.flightvector:GetNormalized())	// Direction of Round
			effectdata:SetEntity(self.Entity)			// Who done it?
			effectdata:SetScale(4.5)				// Size of explosion
			effectdata:SetRadius(tr.MatType)			// Texture of Impact
			effectdata:SetMagnitude(17)				// Length of explosion trails
			util.Effect( "gdca_cinematicboom", effectdata )
			util.ScreenShake(tr.HitPos, 10, 5, 1, 4000 )
			util.Decal("Scorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
			if GDCENGINE then	
			local attack = gdc.gdcsplode( tr.HitPos, 500, 800, self.Entity)	// Position, Radius, Damage, Self		
			end	
			self.Entity:Remove()
			else 
			util.BlastDamage(self.Entity, self.Entity, tr.HitPos, 90, 100)	// Without detonation
			local effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)				// Position of Impact
			effectdata:SetNormal(tr.HitNormal)			// Direction of Impact
			effectdata:SetStart(self.flightvector:GetNormalized())	// Direction of Round
			effectdata:SetEntity(self.Entity)			// Who done it?
			effectdata:SetScale(0.5)				// Size of explosion
			effectdata:SetRadius(tr.MatType)			// Texture of Impact
			effectdata:SetMagnitude(15)				// Length of explosion trails
			util.Effect( "gdca_cinematicboom", effectdata )
			self.Entity:Remove()
			end
			end


	if self.Target != Vector(0,0,0) then
	ForwardAngle = self.Entity:GetUp():Angle()
	TangY = math.NormalizeAngle((self.Target - self:GetPos()):GetNormalized():Angle().y)
	AddY = math.Clamp(math.AngleDifference(TangY, self.Entity:GetUp():Angle().y)*1,-self.Accelerator/200,self.Accelerator/200)
	TangP = math.NormalizeAngle((self.Target - self:GetPos()):GetNormalized():Angle().p)
	AddP = math.Clamp(math.AngleDifference(TangP, self.Entity:GetUp():Angle().p)*5,-0.5,1.0)
	self.Entity:SetAngles((Angle(AddP,AddY,0) + ForwardAngle) + Angle(90,0,0) + Angle(math.Rand(-self.W,self.W),math.Rand(-self.W,self.W),math.Rand(-self.W,self.W)))
	else
	self.Entity:SetAngles(self.flightvector:Angle() + Angle(90,0,0))
	end

	self.flightvector = self.Entity:GetUp()*self.Accelerator
	self.Entity:SetPos(self.Entity:GetPos() + self.flightvector)
	self.Entity:NextThink( CurTime() )
	return true
end
 
 
