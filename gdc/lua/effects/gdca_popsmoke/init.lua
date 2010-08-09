

EFFECT.Mat = Material( "effects/select_ring" )

/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	
local vOffset = data:GetOrigin() 

 	local NumParticles = 200	 
 	local emitter = ParticleEmitter( vOffset ) 
 	 
 		for i=0, NumParticles do 
			
			local particle2 = emitter:Add( "particle/particle_smokegrenade", vOffset ) 
 			if (particle2) then 
 				 
 				particle2:SetVelocity( VectorRand():GetNormalized() * math.Rand(1000, 2000) ) 
 				particle2:SetDieTime( math.Rand(10, 20) )  				 
 				particle2:SetStartAlpha( 150 ) 
 				particle2:SetEndAlpha( 0 )  				 
 				particle2:SetStartSize( math.Rand(130, 150) ) 
 				particle2:SetEndSize( math.Rand(300, 400) ) 				 
 				particle2:SetRoll( math.Rand(0, 360) ) 
 				particle2:SetRollDelta( math.Rand(-0.5, 0.5) ) 				 
 				particle2:SetAirResistance( 200 ) 
 				particle2:SetColor(200,200,200) 
 				particle2:SetGravity( Vector( math.Rand(-200, 200), math.Rand(-200, 200), 0) ) 
				particle2:SetCollide( true )
				particle2:SetBounce( 1 )

 				 
 			 
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
