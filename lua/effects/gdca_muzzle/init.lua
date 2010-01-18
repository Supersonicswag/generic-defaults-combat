
   
 /*--------------------------------------------------------- 
    Initializes the effect. The data is a table of data  
    which was passed from the server. 
 ---------------------------------------------------------*/ 
 function EFFECT:Init( data ) 
	
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
	self.Emitter = ParticleEmitter( self.Origin )
		
	for i=0, 20*self.Scale do
	
		local Smoke = self.Emitter:Add( "particle/smokestack", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 0,1000*self.Scale) + VectorRand()*200*self.Scale )
			Smoke:SetDieTime( math.Rand( 0.5 , 4 )*self.Scale )
			Smoke:SetStartAlpha( math.Rand( 40, 60 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 40*self.Scale )
			Smoke:SetEndSize( 50*self.Scale )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 300 ) 			 
			Smoke:SetGravity( Vector( 0, 0, math.Rand(0, 100) ) ) 			
			Smoke:SetColor( 100,100,100 )
		end
	
	end
	
	
	for i=0, 10 do
	
		local Embers = self.Emitter:Add( "effects/fire_cloud1", self.Origin )
		if (Embers) then
			Embers:SetVelocity ( self.DirVec *i*300*self.Scale  )
			Embers:SetDieTime( math.Rand(0.06, 0.08) )
			Embers:SetStartAlpha( 150 )
			Embers:SetEndAlpha( 0 )
			Embers:SetStartSize( (30 - i*1.5)*self.Scale )
			Embers:SetEndSize( (50 - i*1.5)*self.Scale )
			Embers:SetRoll( math.Rand(0, 360) )
			Embers:SetRollDelta( math.Rand(-50, 50) )			
			Embers:SetAirResistance( 100 ) 			 		
			Embers:SetColor( 250,250,200 )
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

 