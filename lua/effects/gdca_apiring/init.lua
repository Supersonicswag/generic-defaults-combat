
   
 /*--------------------------------------------------------- 
    Initializes the effect. The data is a table of data  
    which was passed from the server. 
 ---------------------------------------------------------*/ 
 function EFFECT:Init( data ) 
	
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
	self.Radius = data:GetRadius()
	self.Emitter = ParticleEmitter( self.Origin )

	WorldSound( "Impacts/Explosion2.wav", self.Origin, 100, 100 )
	
		
		for i=1,2 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
				Flash:SetVelocity( self.DirVec*100 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.1 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( math.Rand( 150, 250 )*self.Scale )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,200,200)	
			end
		end
	
	for i=0, 10*self.Radius do
	
		local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 50,200*self.Radius) + VectorRand() * math.random( 50,100*self.Radius) )
			Smoke:SetDieTime( math.Rand( 1 , 3 )*self.Radius)
			Smoke:SetStartAlpha( math.Rand( 30, 50 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 15*self.Scale )
			Smoke:SetEndSize( 35*self.Radius )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-1, 1) )			
			Smoke:SetAirResistance( 200 ) 			 
			Smoke:SetGravity( Vector( math.random(-20,20)*self.Radius, math.random(-20,20)*self.Radius, -200 ) ) 			
			Smoke:SetColor( 140,135,125 )
		end
	
	end

	for i=0, 20*self.Scale do
	
		local Debris = self.Emitter:Add( "effects/fleck_tile"..math.random(1,2), self.Origin )
		if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(0,700*self.Scale) + VectorRand() * 200*self.Scale )
			Debris:SetDieTime( math.random( 0.7, 1.5) * self.Scale )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(0.2,2*self.Scale) )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-5, 5) )			
			Debris:SetAirResistance( 30 ) 			 			
			Debris:SetColor( 105,100,90 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 
			Debris:SetCollide( true )
			Debris:SetBounce( 0.1 )	
		end
	end

	for i=0, 3*self.Radius do
		local Whisp = self.Emitter:Add( "particles/smokey", self.Origin )
			if (Whisp) then
				Whisp:SetVelocity(VectorRand() * math.random( 100,300*self.Radius) )
				Whisp:SetDieTime( math.Rand( 4 , 10 )*self.Scale/2  )
				Whisp:SetStartAlpha( math.Rand( 20, 30 ) )
				Whisp:SetEndAlpha( 0 )
				Whisp:SetStartSize( 70*self.Scale )
				Whisp:SetEndSize( 100*self.Radius )
				Whisp:SetRoll( math.Rand(150, 360) )
				Whisp:SetRollDelta( math.Rand(-2, 2) )			
				Whisp:SetAirResistance( 200 ) 			 
				Whisp:SetGravity( Vector( math.random(-60,60)*self.Radius, math.random(-60,60)*self.Radius, 0 ) ) 			
				Whisp:SetColor( 150,150,150 )
			end
	end
	
 end 
   
   
/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think( )

	if self.DirVec != Vector(1,1,0) then
	
		local Timer = CurTime() + 3
		local Density = 50*self.Radius
		local Angle = self.DirVec:Angle()
		if Timer > CurTime() then
			
			for i=0, Density do	
				
				Angle:RotateAroundAxis(Angle:Forward(), (360/Density))
				local ShootVector = Angle:Up()
				local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
				if (Smoke) then
					Smoke:SetVelocity( self.DirVec*50 + ShootVector * math.Rand(10,500*self.Radius) )
					Smoke:SetDieTime( math.Rand( 2 , 5 )*self.Radius /2 )
					Smoke:SetStartAlpha( math.Rand( 80, 120 ) )
					Smoke:SetEndAlpha( 0 )
					Smoke:SetStartSize( 15*self.Scale )
					Smoke:SetEndSize( 25*self.Radius )
					Smoke:SetRoll( math.Rand(0, 360) )
					Smoke:SetRollDelta( math.Rand(-2, 2) )			
					Smoke:SetAirResistance( 300 ) 			 		
					Smoke:SetColor( 140,135,125 )
				end	
			
			end
			
		else	
		self.Emitter:Finish() 
		return false
		end
	
	else
	
		for i=0, 40*self.Radius do
	
			local AirBurst = self.Emitter:Add( "particles/smokey", self.Origin )
			if (AirBurst) then
				AirBurst:SetVelocity( VectorRand() * math.random( 300,450*self.Radius) )
				AirBurst:SetLifeTime( 0 )
				AirBurst:SetDieTime( math.Rand( 2 , 4 )*self.Radius/3  )
				AirBurst:SetStartAlpha( math.Rand( 100, 255 ) )
				AirBurst:SetEndAlpha( 0 )
				AirBurst:SetStartSize( 5*self.Scale )
				AirBurst:SetEndSize( 50*self.Radius )
				AirBurst:SetRoll( math.Rand(150, 360) )
				AirBurst:SetRollDelta( math.Rand(-2, 2) )			
				AirBurst:SetAirResistance( 200 ) 			 
				AirBurst:SetGravity( Vector( math.random(-20,20)*self.Radius, math.random(-20,20)*self.Radius, 20 ) ) 			
				AirBurst:SetColor( 20,15,0 )
			end
		end
		self.Emitter:Finish() 
		return false
	
	end
	
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()
end

 
