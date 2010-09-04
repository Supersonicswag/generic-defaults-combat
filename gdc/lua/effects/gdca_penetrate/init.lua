
   
 /*--------------------------------------------------------- 
    Initializes the effect. The data is a table of data  
    which was passed from the server. 
 ---------------------------------------------------------*/ 
 function EFFECT:Init( data ) 
	
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
	self.Emitter = ParticleEmitter( self.Origin )
		

	for i=0, 50*self.Scale do
	
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
		if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(0,700*self.Scale) + VectorRand():GetNormalized() * 200*self.Scale )
			Debris:SetDieTime( math.random( 0.3, 0.6)  )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(2,5)*self.Scale )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-5, 5) )			
			Debris:SetAirResistance( 50 ) 			 			
			Debris:SetColor( 105,100,90 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 
			Debris:SetCollide( true )
			Debris:SetBounce( 0.5 )			

		end
	end

	for i=0, 7*self.Scale do
	
		local Smoke = self.Emitter:Add( "particle/particle_composite", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 0,500*self.Scale) + VectorRand():GetNormalized()*20*self.Scale )
			Smoke:SetDieTime( math.Rand( 0.2 , 0.5 ) )
			Smoke:SetStartAlpha( 200 )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 20*self.Scale )
			Smoke:SetEndSize( 30*self.Scale )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 150 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-50, 50) * self.Scale, math.Rand(-50, 50) * self.Scale, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 105,100,90 )
		end
	end
 end 
   
   
/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think( )
	return false
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()
end

 