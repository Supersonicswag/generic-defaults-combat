
   
 /*--------------------------------------------------------- 
    Initializes the effect. The data is a table of data  
    which was passed from the server. 
 ---------------------------------------------------------*/ 
 function EFFECT:Init( data ) 
	
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
	self.Radius = data:GetRadius()
	self.Emitter = ParticleEmitter( self.Origin )

	WorldSound( "Explosion.Boom", self.Origin)
	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", self.Origin, 100, 100 )
		
	for i=0, 30*self.Scale do
	
		local Smoke = self.Emitter:Add( "particle/particle_smokegrenade", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 200,700*self.Scale) + VectorRand():GetNormalized()*250*self.Scale )
			Smoke:SetDieTime( math.Rand( 13 , 20 ) )
			Smoke:SetStartAlpha( math.Rand( 100, 120 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 40*self.Scale )
			Smoke:SetEndSize( 70*self.Scale )
			Smoke:SetRoll( math.Rand(0, 360) )
			Smoke:SetRollDelta( math.Rand(-1, 1) )			
			Smoke:SetAirResistance( 200 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-300, 300), math.Rand(-300, 300), math.Rand(-100, -200) ) ) 			
			Smoke:SetColor( 255,255,255 )
		end
	
	end
	

		for i=1,5 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
				Flash:SetVelocity( self.DirVec*100 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.15 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( math.Rand( 600, 700 )*self.Scale )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,255,255)	
			end
		end

		local Density = 40*self.Radius
		local Angle = self.DirVec:Angle()
			
			for i=0, Density do	
				
				Angle:RotateAroundAxis(Angle:Forward(), (360/Density))
				local ShootVector = Angle:Up()
				local Smoke = self.Emitter:Add( "particle/particle_smokegrenade", self.Origin+self.DirVec*100 )

				if (Smoke) then
					Smoke:SetVelocity( ShootVector * math.Rand(10,500*self.Radius) )
					Smoke:SetDieTime( math.Rand( 10 , 20 ) )
					Smoke:SetStartAlpha( math.Rand( 70, 100 ) )
					Smoke:SetEndAlpha( 0 )
					Smoke:SetStartSize( 40*self.Scale )
					Smoke:SetEndSize( 70*self.Radius )
					Smoke:SetRoll( math.Rand(0, 360) )
					Smoke:SetRollDelta( math.Rand(-1, 1) )			
					Smoke:SetAirResistance( 200 ) 			 
					Smoke:SetGravity( Vector( math.Rand( -300 , 300 ), math.Rand( -300 , 300 ), math.Rand( 10 , 10 ) ) )			
					Smoke:SetColor( 255,255,255 )
				end	
		end

 end 
   
   
/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think()
	return false
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()
end

 