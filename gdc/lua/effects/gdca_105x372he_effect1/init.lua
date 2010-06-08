

EFFECT.Mat = Material( "effects/select_ring" )

/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	
local vOffset = data:GetOrigin() 

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", vOffset, 100, 70 )

 	local NumParticles = 80	 
 	local emitter = ParticleEmitter( vOffset ) 
 	 
 		for i=0, NumParticles do 
 		 
 			local particle = emitter:Add( "effects/spark", vOffset ) 
 			if (particle) then 
 				 
 				particle:SetVelocity( VectorRand() * math.Rand(1000, 3000) ) 
 				 
 				particle:SetLifeTime( 0 ) 
 				particle:SetDieTime( math.Rand(0, 3) ) 
 				 
 				particle:SetStartAlpha( 255 ) 
 				particle:SetEndAlpha( 0 ) 
 				 
 				particle:SetStartSize( math.Rand(20, 60) ) 
 				 
 				particle:SetRoll( math.Rand(0, 360) ) 
 				particle:SetRollDelta( math.Rand(-5, 5) ) 
 				 
 				particle:SetAirResistance( 100 ) 
 				 
 				particle:SetGravity( Vector( 0, 0, -600 ) ) 
 			 
 			end 
			
			local particle1 = emitter:Add( "particles/flamelet"..math.Rand(1,5), vOffset ) 
 			if (particle1) then 
 				 
 				particle1:SetVelocity( VectorRand() * math.Rand(800, 1500) ) 
 				 
 				particle1:SetLifeTime( 0 ) 
 				particle1:SetDieTime( math.Rand(0.2, 0.3) ) 
 				 
 				particle1:SetStartAlpha( 255 ) 
 				particle1:SetEndAlpha( 0 ) 
 				 
 				particle1:SetStartSize( math.Rand(50, 80) ) 
 				particle1:SetEndSize( math.Rand(100, 150) ) 
 				 
 				particle1:SetRoll( math.Rand(0, 360) ) 
 				particle1:SetRollDelta( math.Rand(-1.5, 1.5) ) 
 				 
 				particle1:SetAirResistance( 100 ) 
 				 
 				particle1:SetGravity( Vector( 0, 0, 250 ) ) 
 			 
 			end 
			
			local particle2 = emitter:Add( "particles/smokey", vOffset ) 
 			if (particle2) then 
 				 
 				particle2:SetVelocity( VectorRand() * math.Rand(2000, 4000) ) 
 				 
 				particle2:SetLifeTime( 0 ) 
 				particle2:SetDieTime( math.Rand(3, 7) ) 
 				 
 				particle2:SetStartAlpha( 255 ) 
 				particle2:SetEndAlpha( 0 ) 
 				 
 				particle2:SetStartSize( math.Rand(100, 200) ) 
 				particle2:SetEndSize( math.Rand(300, 500) ) 
 				 
 				particle2:SetRoll( math.Rand(0, 360) ) 
 				particle2:SetRollDelta( math.Rand(-1.5, 1.5) ) 
 				 
 				particle2:SetAirResistance( 300 ) 

 				particle2:SetColor(50,50,50) 
 				 
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
