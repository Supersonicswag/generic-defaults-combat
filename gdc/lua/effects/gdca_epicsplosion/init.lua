
/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
	
function EFFECT:Init( data )
	
	self.Origin = data:GetOrigin()
	self.Scale = data:GetScale()
	self.DirVec = data:GetNormal()
	self.Magnitude = data:GetMagnitude()
	NumSmokers = 7

	WorldSound( "Explosion.Boom", self.Origin)
	local emitter = ParticleEmitter( self.Origin)
	
			local Density = NumSmokers*self.Scale
			local Angle = self.DirVec:Angle()

		for i=0, Density do
			Angle:RotateAroundAxis(Angle:Forward(), (360/Density))
			local ShootVector = Angle:Up()
			particle = emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
			if (particle) then
				particle:SetVelocity( (self.DirVec*self.Scale*math.Rand(200, 700))+ShootVector*300*self.Scale)
				particle:SetDieTime( math.Rand(0.3, 1.5) )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 20 )
				particle:SetEndSize( 10 )
				particle:SetColor(100,100,100)
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-200, 200) )
				particle:SetAirResistance( 50 )
				particle:SetGravity( Vector( 0, 0, -600 ) )
				particle:SetCollide( true )
				particle:SetBounce( 0.9 )
				particle:SetThinkFunction(ParticleThink)
				particle:SetNextThink(CurTime()+0.04)
			end
		end
	emitter:Finish()
end


/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think( )
	return true
end

function ParticleThink( part )
	if part:GetLifeTime() > 0 and part:GetLifeTime() < 1.5 then 
		local vOffset = part:GetPos()	
		local emitter = ParticleEmitter( vOffset )
		local particle = emitter:Add( "particles/smokey", vOffset )
		if (particle) then
			particle:SetVelocity( VectorRand()*math.Rand(50,100))
			particle:SetDieTime(math.Rand(3,7) )
			particle:SetStartAlpha( 40 )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( (20*self.Scale) - (part:GetLifeTime() * 100) )
			particle:SetEndSize( (50*self.Scale) - (part:GetLifeTime() * 100) )
			particle:SetColor( 60,55,45 )
			particle:SetRoll( math.Rand(-0.5, 0.5) )
			particle:SetRollDelta( math.Rand(-1, 1) )
			particle:SetAirResistance( 100 )
			particle:SetGravity( VectorRand()*math.Rand(50, 200) )
			particle:SetLighting( false )
		end		
		emitter:Finish()
	end
	part:SetNextThink( CurTime() + 0.12-self.Scale )
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()
end
