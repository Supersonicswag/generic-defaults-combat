

EFFECT.Mat = Material( "effects/select_ring" )

/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	
local vOffset = data:GetOrigin() 

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", vOffset, 100, 120 )

 	local NumParticles = 80	 
 	local emitter = ParticleEmitter( vOffset ) 
 	 
 		for i=0, NumParticles do 
 		 
 			local particle = emitter:Add( "effects/spark", vOffset ) 
 			if (particle) then 
 				 
 				particle:SetVelocity( VectorRand() * math.Rand(2000, 2500) ) 
 				 
 				particle:SetLifeTime( 0 ) 
 				particle:SetDieTime( math.Rand(0, 0.2) ) 
 				 
 				particle:SetStartAlpha( 255 ) 
 				particle:SetEndAlpha( 0 ) 
 				 
 				particle:SetStartSize( math.Rand(10, 30) ) 
 				particle:SetEndSize( 0 ) 
 				 
 				particle:SetRoll( math.Rand(0, 360) ) 
 				particle:SetRollDelta( math.Rand(-5, 5) ) 
 				 
 				particle:SetAirResistance( 100 ) 
 			 
 			end 
			
			local particle1 = emitter:Add( "particles/flamelet"..math.Rand(1,5), vOffset ) 
 			if (particle1) then 
 				 
 				particle1:SetVelocity( data:GetNormal() + Vector( math.Rand(-1,1), math.Rand(-1,1), math.Rand(-1,1)) * math.Rand(1000, 2000) ) 
 				 
 				particle1:SetLifeTime( 0 ) 
 				particle1:SetDieTime( math.Rand(0.1, 0.2) ) 
 				 
 				particle1:SetStartAlpha( 255 ) 
 				particle1:SetEndAlpha( 0 ) 
 				 
 				particle1:SetStartSize( math.Rand(10, 30) ) 
 				particle1:SetEndSize( math.Rand(20, 60) ) 
 				 
 				particle1:SetRoll( math.Rand(0, 360) ) 
 				particle1:SetRollDelta( math.Rand(-1.5, 1.5) ) 
 				 
 				particle1:SetAirResistance( 400 ) 
 				 
 				particle1:SetGravity( Vector( 0, 0, 250 ) ) 
 			 
 			end 
			
			local particle2 = emitter:Add( "particles/smokey", vOffset ) 
 			if (particle2) then 
 				 
 				particle2:SetVelocity( data:GetNormal() * 3 + Vector(math.Rand(-1,1),math.Rand(-1,1),math.Rand(-1,1)) * math.Rand(1000, 1500) ) 
 				 
 				particle2:SetLifeTime( 0 ) 
 				particle2:SetDieTime( math.Rand(0.2, 0.8) ) 
 				 
 				particle2:SetStartAlpha( 255 ) 
 				particle2:SetEndAlpha( 0 ) 
 				 
 				particle2:SetStartSize( math.Rand(30, 40) ) 
 				particle2:SetEndSize( math.Rand(50, 80) ) 
 				 
 				particle2:SetRoll( math.Rand(0, 360) ) 
 				particle2:SetRollDelta( math.Rand(-2.5, 2.5) ) 
 				 
 				particle2:SetAirResistance( 600 ) 

 				particle2:SetColor(100,100,100) 
 				 
 			 
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
