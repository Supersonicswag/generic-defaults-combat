

EFFECT.Mat = Material( "effects/select_ring" )

/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	
local vOffset = data:GetOrigin() 
 	 
 	local NumParticles = 15	 
 	local emitter = ParticleEmitter( vOffset ) 
 	 
 		for i=0, NumParticles do 
 		 
 			local particle = emitter:Add( "effects/spark", vOffset ) 
 			if (particle) then 
 				 
 				particle:SetVelocity( VectorRand() * math.Rand(50, 300) ) 
 				 
 				particle:SetLifeTime( 0 ) 
 				particle:SetDieTime( math.Rand(0.5, 1.5) ) 
 				 
 				particle:SetStartAlpha( 255 ) 
 				 
 				particle:SetStartSize( math.Rand(3, 6) ) 
 				particle:SetEndSize( 0 ) 
 				 
 				particle:SetRoll( math.Rand(0, 360) ) 
 				particle:SetRollDelta( math.Rand(-5, 5) ) 
 				 
 				particle:SetAirResistance( 2 ) 
 				
 				particle:SetGravity( Vector( 0, 0, -600 ) ) 
 			 
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