
   
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

	WorldSound( "Explosion.Boom", self.Origin)
		
	for i=0, 7*self.Radius do
	
		local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 30,120*self.Radius) + VectorRand() * math.random( 50,100*self.Radius) )
			Smoke:SetLifeTime( 0 )
			Smoke:SetDieTime( math.Rand( 2 , 4 )*self.Radius/3  )
			Smoke:SetStartAlpha( math.Rand( 50, 100 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 5*self.Scale )
			Smoke:SetEndSize( 50*self.Radius )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-2, 2) )			
			Smoke:SetAirResistance( 100 ) 			 
			Smoke:SetGravity( Vector( math.random(-20,20)*self.Radius, math.random(-20,20)*self.Radius, 250 ) ) 			
			Smoke:SetColor( 53,50,45 )
		end
	
	end
		
	for i=0, 3*self.Radius do
	 
		local Flame = self.Emitter:Add( "particles/flamelet"..math.random(1,5), self.Origin)
		if (Flame) then
			Flame:SetVelocity( VectorRand() * math.random(100,300*self.Radius) )
			Flame:SetLifeTime( 0 )
			Flame:SetDieTime( 0.15 )
			Flame:SetStartAlpha( math.Rand( 50, 255 ) )
			Flame:SetEndAlpha( 0 )
			Flame:SetStartSize( 2 )
			Flame:SetEndSize( 80*self.Scale )
			Flame:SetRoll( math.random(120, 360) )
			Flame:SetRollDelta( math.Rand(-1, 1) )			
			Flame:SetAirResistance( 300 ) 			 
			Flame:SetGravity( Vector( 0, 0, 4 ) ) 			
			Flame:SetColor( 255,255,255 )
		end
		
	end
	
	for i=0, 3*self.Radius do
	
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
		if (Debris) then
			Debris:SetVelocity ( VectorRand() * math.random(500*self.Radius,600*self.Radius) )
			Debris:SetLifeTime( 0 )
			Debris:SetDieTime( math.Rand( 3 , 6 )*self.Radius/3 )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( 2 )
			Debris:SetEndSize( 2 )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-0.2, 0.2) )			
			Debris:SetAirResistance( 100 ) 			 
			Debris:SetGravity( Vector( 0, 0, -650 ) ) 			
			Debris:SetColor( 100,80,90 )
		end
	end
	
	
	for i=0, 3*self.Radius do
		local Whisp = self.Emitter:Add( "particles/smokey", self.Origin )
			if (Whisp) then
				Whisp:SetVelocity(VectorRand() * math.random( 100,200*self.Radius) )
				Whisp:SetDieTime( math.Rand( 4 , 10 )*self.Scale/2  )
				Whisp:SetStartAlpha( math.Rand( 35, 50 ) )
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
		local Density = 30*self.Radius
		local Angle = self.DirVec:Angle()
		if Timer > CurTime() then
			
			for i=0, Density do	
				
				Angle:RotateAroundAxis(Angle:Forward(), (360/Density))
				local ShootVector = Angle:Up()
				local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
				if (Smoke) then
					Smoke:SetVelocity( ShootVector * math.Rand(10,500*self.Radius) )
					Smoke:SetLifeTime( 0 )
					Smoke:SetDieTime( math.Rand( 2 , 5 )*self.Radius /2 )
					Smoke:SetStartAlpha( math.Rand( 60, 90 ) )
					Smoke:SetEndAlpha( 0 )
					Smoke:SetStartSize( 25*self.Scale )
					Smoke:SetEndSize( 40*self.Radius )
					Smoke:SetRoll( math.Rand(0, 360) )
					Smoke:SetRollDelta( math.Rand(-1, 1) )			
					Smoke:SetAirResistance( 200 ) 			 
					Smoke:SetGravity( Vector( math.Rand( -200 , 200 ), math.Rand( -200 , 200 ), math.Rand( 10 , 100 ) ) )			
					Smoke:SetColor( 60,55,45 )
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

 
