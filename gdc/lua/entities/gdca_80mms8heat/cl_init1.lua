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
		for i=1, (6) do
			local particle = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), pos + (self:GetUp() * -100 * i))
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
		
	end
end
