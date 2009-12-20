
   
 /*--------------------------------------------------------- 
    Initializes the effect. The data is a table of data  
    which was passed from the server. 
 ---------------------------------------------------------*/ 
 function EFFECT:Init( data ) 
	
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
	self.Emitter = ParticleEmitter( self.Origin )

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", self.Origin, 100, 100 )
		
	for i=0, 20*self.Scale do
	
		local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 300,700*self.Scale) + VectorRand()*250*self.Scale )
			Smoke:SetDieTime( math.Rand( 1 , 2.5 )*self.Scale )
			Smoke:SetStartAlpha( math.Rand( 120, 150 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 40*self.Scale )
			Smoke:SetEndSize( 70*self.Scale )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 200 ) 			 
			Smoke:SetGravity( Vector( 0, 0, math.Rand(-100, -400) ) ) 			
			Smoke:SetColor( 60,55,45 )
		end
	
	end
	
	for i=0, 20*self.Scale do
	
		local Debris = self.Emitter:Add( "effects/fleck_tile"..math.random(1,2), self.Origin )
		if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(300,500*self.Scale) + VectorRand() * 300*self.Scale )
			Debris:SetDieTime( math.random( 1, 2) * self.Scale )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(4,7*self.Scale) )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-0.5, 0.5) )			
			Debris:SetAirResistance( 50 ) 			 			
			Debris:SetColor( 53,50,45 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 
			Debris:SetCollide( true )
			Debris:SetBounce( 1 )			

		end
	end
	
	for i=0, 10*self.Scale do
	
		local Embers = self.Emitter:Add( "particles/flamelet"..math.random(1,5), self.Origin )
		if (Embers) then
			Embers:SetVelocity ( self.DirVec * math.random(300,600) + VectorRand() * 200*self.Scale )
			Embers:SetDieTime( math.Rand( 0.05 , 0.07 )*self.Scale )
			Embers:SetStartAlpha( 255 )
			Embers:SetEndAlpha( 0 )
			Embers:SetStartSize( 20*self.Scale )
			Embers:SetEndSize( 40*self.Scale )
			Embers:SetRoll( math.Rand(0, 360) )
			Embers:SetRollDelta( math.Rand(-0.2, 0.2) )			
			Embers:SetAirResistance( 100 ) 			 		
			Embers:SetColor( 250,250,200 )
		end
	end

	local Sparks = EffectData()
		Sparks:SetOrigin( self.Origin )
		Sparks:SetNormal( self.DirVec )
		Sparks:SetMagnitude( self.Scale*3 )
		Sparks:SetScale( self.Scale*1 )
		Sparks:SetRadius( self.Scale*3 )
	util.Effect( "Sparks", Sparks )
	
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

 