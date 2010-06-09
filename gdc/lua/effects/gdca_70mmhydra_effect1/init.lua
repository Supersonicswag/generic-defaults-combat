

EFFECT.Mat = Material( "effects/select_ring" )

/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	
local vOffset = data:GetOrigin() 

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", vOffset, 100, 80 )

 	local NumParticles = 80	 
 	local emitter = ParticleEmitter( vOffset ) 
 	 
 		for i=0, NumParticles do 
 		 
 			local particle = emitter:Add( "effects/fleck_tile"..math.random(1,2), vOffset ) 
 			if (particle) then 
 				 
 				particle:SetVelocity( VectorRand() * math.Rand(3000, 5500) ) 
 				particle:SetDieTime( math.Rand(0.3, 0.6) ) 			 
 				particle:SetStartAlpha( 255 ) 
 				particle:SetEndAlpha( 255 ) 		 
 				particle:SetStartSize( math.Rand(3, 15) ) 
 				particle:SetEndSize( 0 ) 				 
 				particle:SetRoll( math.Rand(0, 360) ) 
 				particle:SetRollDelta( math.Rand(-5, 5) ) 				 
 				particle:SetAirResistance( 30 ) 
 				particle:SetColor(0,0,0) 				 
 				particle:SetGravity( Vector( 0, 0, -600 ) ) 
				particle:SetCollide( true )
				particle:SetBounce( 1 )	
 			 
 			end 
			
			local particle1 = emitter:Add( "particles/flamelet"..math.Rand(1,5), vOffset ) 
 			if (particle1) then 
 				 
 				particle1:SetVelocity( VectorRand() * math.Rand(1300, 1500) ) 
 				 
 				particle1:SetLifeTime( 0 ) 
 				particle1:SetDieTime( math.Rand(0.2, 0.3) ) 
 				 
 				particle1:SetStartAlpha( 255 ) 
 				particle1:SetEndAlpha( 0 ) 
 				 
 				particle1:SetStartSize( math.Rand(40, 50) ) 
 				particle1:SetEndSize( math.Rand(70, 120) ) 
 				 
 				particle1:SetRoll( math.Rand(0, 360) ) 
 				particle1:SetRollDelta( math.Rand(-1.5, 1.5) ) 
 				 
 				particle1:SetAirResistance( 200 ) 
 				 
 				particle1:SetGravity( Vector( 0, 0, 250 ) ) 
 			 
 			end 
			
			local particle2 = emitter:Add( "particles/smokey", vOffset ) 
 			if (particle2) then 
 				 
 				particle2:SetVelocity( VectorRand() * math.Rand(1000, 1500) ) 
 				 
 				particle2:SetLifeTime( 0 ) 
 				particle2:SetDieTime( math.Rand(1, 4) ) 
 				 
 				particle2:SetStartAlpha( 255 ) 
 				particle2:SetEndAlpha( 0 ) 
 				 
 				particle2:SetStartSize( math.Rand(70, 100) ) 
 				particle2:SetEndSize( math.Rand(200, 300) ) 
 				 
 				particle2:SetRoll( math.Rand(0, 360) ) 
 				particle2:SetRollDelta( math.Rand(-2.5, 2.5) ) 
 				 
 				particle2:SetAirResistance( 200 ) 

 				particle2:SetColor(60,60,60) 
 				 
 				particle2:SetGravity( Vector( 0, 0, 400 ) ) 
 			 
 			end 
 			 
 		end 
 		 
 	emitter:Finish() 
	
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