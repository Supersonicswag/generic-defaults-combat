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
		for i=0, (4) do
			local particle = self.emitter:Add( "particles/smokey", pos + (self:GetUp() * -50 * i))
			if (particle) then
				particle:SetVelocity((self:GetUp() * -300) )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( math.Rand( 0.3, 2.5 ) )
				particle:SetStartAlpha( math.Rand( 60, 80 ) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand( 30, 40 ) )
				particle:SetEndSize( math.Rand( 100, 150 ) )
				particle:SetRoll( math.Rand(0, 360) )
				particle:SetRollDelta( math.Rand(-1, 1) )
				particle:SetColor( 255 , 255 , 255 ) 
				particle:VelocityDecay( true )	
			end
		end
end
