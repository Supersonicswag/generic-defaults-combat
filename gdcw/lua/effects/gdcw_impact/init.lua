
   
 /*--------------------------------------------------------- 
    Initializes the effect. The data is a table of data  
    which was passed from the server. 
 ---------------------------------------------------------*/ 
 function EFFECT:Init( data ) 
	
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
	self.Emitter = ParticleEmitter( self.Origin )

	WorldSound( "Impacts/Impact_0" .. math.random(1, 5) .. ".wav", self.Origin, 100, 120-(20/self.Scale) )
		
	for i=0, 15*self.Scale do
	
		local Smoke = self.Emitter:Add( "particle/particle_smokegrenade", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 0,500*self.Scale) + VectorRand()*100*self.Scale )
			Smoke:SetDieTime( math.Rand( 1 , 3 )*self.Scale )
			Smoke:SetStartAlpha( math.Rand( 100, 120 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 13*self.Scale )
			Smoke:SetEndSize( 30*self.Scale )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 300 ) 			 
			Smoke:SetGravity( Vector( math.Rand(-100, 100) * self.Scale, math.Rand(-100, 100) * self.Scale, math.Rand(0, -100) ) ) 			
			Smoke:SetColor( 120,115,105 )

		end
	
	end

	for i=0, 12*self.Scale do
	
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
		if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(200,300*self.Scale) + VectorRand() * 300*self.Scale )
			Debris:SetDieTime( math.random( 0.6, 1) )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(1,5*self.Scale) )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-5, 5) )			
			Debris:SetAirResistance( 50 ) 			 			
			Debris:SetColor( 105,100,90 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 
			Debris:SetCollide( true )
			Debris:SetBounce( 1 )			

		end
	end
	
		for i=0,1 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
				Flash:SetVelocity( self.DirVec*100 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.1 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( math.Rand( 30, 40 )*self.Scale )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,255,255)	
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

 