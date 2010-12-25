

function EFFECT:Init(data)
	
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)
	self.Forward = data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()

	local emitter = ParticleEmitter(self.Position)
		
		local particle = emitter:Add("sprites/heatwave", self.Position - self.Forward*4)
		particle:SetVelocity(80*self.Forward + 20*VectorRand())
		particle:SetDieTime(math.Rand(0.15,0.2))
		particle:SetStartSize(math.random(10,13))
		particle:SetEndSize(3)
		particle:SetRoll(math.Rand(180,480))
		particle:SetRollDelta(math.Rand(-1,1))
		particle:SetGravity(Vector(0,0,100))
		particle:SetAirResistance(160)
		
		local particle = emitter:Add("particle/particle_smokegrenade", self.Position)
		particle:SetVelocity(80*self.Forward)
		particle:SetDieTime(math.Rand(0.2,0.3))
		particle:SetStartAlpha(math.Rand(50,60))
		particle:SetStartSize(math.random(3,4))
		particle:SetEndSize(math.Rand(17,28))
		particle:SetRoll(math.Rand(180,480))
		particle:SetRollDelta(math.Rand(-1,1))
		particle:SetColor(245,245,245)
		particle:SetLighting(true)
		particle:SetAirResistance(80)

		
	for i=-1,1,2 do 
		local particle = emitter:Add("particle/particle_smokegrenade", self.Position)
		particle:SetVelocity(80*i*self.Right)
		particle:SetDieTime(math.Rand(0.2,0.3))
		particle:SetStartAlpha(math.Rand(50,60))
		particle:SetStartSize(math.random(2,3))
		particle:SetEndSize(math.Rand(12,14))
		particle:SetRoll(math.Rand(180,480))
		particle:SetRollDelta(math.Rand(-1,1))
		particle:SetColor(245,245,245)
		particle:SetLighting(true)
		particle:SetAirResistance(160)
	end
		
		if math.random(1,4) == 1 then
			for j=1,2 do
				for i=-1,1,2 do 
					local particle = emitter:Add("effects/muzzleflash"..math.random(1,4), self.Position - 3*self.Forward + 2*j*i*self.Right)
					particle:SetVelocity(60*j*i*self.Right)
					particle:SetDieTime(0.07)
					particle:SetStartAlpha(250)
					particle:SetStartSize(j)
					particle:SetEndSize(4*j)
					particle:SetRoll(math.Rand(180,480))
					particle:SetRollDelta(math.Rand(-1,1))
					particle:SetColor(255,255,255)	
				end
			end
		end

	emitter:Finish()

end


function EFFECT:Think()

	return false
	
end


function EFFECT:Render()

	
end



