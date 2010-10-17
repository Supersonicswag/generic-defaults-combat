 include('shared.lua')     
 //[[---------------------------------------------------------     
 //Name: Draw     Purpose: Draw the model in-game.     
 //Remember, the things you render first will be underneath!  
 //-------------------------------------------------------]]  
 function ENT:Draw()      
 // self.BaseClass.Draw(self)  
 -- We want to override rendering, so don't call baseclass.                                   
 // Use this when you need to add to the rendering.        
 self.Entity:DrawModel()       // Draw the model.   
 end
 
   function ENT:Initialize()
	pos = self:GetPos()
	self.emitter = ParticleEmitter( pos )
 end
 
 function ENT:Think()
	
	pos = self:GetPos()
		for i=0, (6) do
			local particle = self.emitter:Add( "particle/particle_smokegrenade", pos + (self:GetUp() * -80 * i))
			if (particle) then
				particle:SetVelocity((self:GetUp() * -1000)+VectorRand():GetNormalized()*math.Rand(50, 100) )
				particle:SetDieTime( math.Rand( 2, 5 ) )
				particle:SetStartAlpha( math.Rand( 50, 70 ) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand( 60, 70 ) )
				particle:SetEndSize( math.Rand( 170, 200 ) )
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-1, 1) )
				particle:SetColor( 200 , 200 , 200 ) 
 				particle:SetAirResistance( 100 ) 
 				particle:SetGravity( VectorRand():GetNormalized()*math.Rand(20, 70) ) 
			end

			for i=1, 10 do
				local particle = self.emitter:Add( "particles/flamelet"..math.random(1,5), pos + (self:GetUp() * -40 * i) )

				particle:SetVelocity((self:GetUp() * -1000)+VectorRand():GetNormalized()*math.Rand(70, 120) )
				particle:SetDieTime( 0.07 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 25 )
				particle:SetEndSize( math.Rand( 35, 45 ) )
				particle:SetRoll( math.Rand( -5, 5 ) )
				particle:SetRollDelta( 0 )
				particle:SetAirResistance(50)
				particle:SetColor( 255,255,255 )

			end
		
		end
end
