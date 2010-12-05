function EFFECT:Init( data )

local Pos = data:GetOrigin()
local Scale = data:GetScale()	
local Radius = data:GetRadius()
local DirVec = data:GetNormal()
local Particles = data:GetMagnitude()
local Angle = DirVec:Angle()
local DebrizzlemyNizzle = 10+data:GetScale()	

self.Particles = data:GetMagnitude()
self.Scale = data:GetScale()	
self.Size = 5*self.Scale

self.emitter = ParticleEmitter( Pos )
self.Origin = Pos	
			if Scale<2.1 then
				WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", Pos, 100, 100 )
			else
				WorldSound( "Explosion.Boom", Pos)
				WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", Pos, 100, 100 )
			end

		for i=1,5 do 
			local Flash = self.emitter:Add( "effects/muzzleflash"..math.random(1,4), Pos )
			if (Flash) then
				Flash:SetVelocity( DirVec*100 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.15 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( Scale*300 )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,255,255)	
			end
		end

		for i=1, 20*Scale do
			local Dust = self.emitter:Add( "particle/particle_composite", Pos )
			if (Dust) then
				Dust:SetVelocity( DirVec * math.random( 100,400)*Scale + ((VectorRand():GetNormalized()*300/Radius)*Scale) )
				Dust:SetDieTime( math.Rand( 2 , 3 ) )
				Dust:SetStartAlpha( 230-((-1+Radius)*120) )
				Dust:SetEndAlpha( 0 )
				Dust:SetStartSize( (60*Scale)/Radius )
				Dust:SetEndSize( (100*Scale)/Radius )
				Dust:SetRoll( math.Rand(150, 360) )
				Dust:SetRollDelta( math.Rand(-1, 1) )			
				Dust:SetAirResistance( 150 ) 			 
				Dust:SetGravity( Vector( 0, 0, math.Rand(-100, -400) ) ) 			
				Dust:SetColor( 80,75,70 )
			end
		end

		for i=1, 25*Scale do
			local Debris = self.emitter:Add( "effects/fleck_cement"..math.random(1,2), Pos )
			if (Debris) then
				Debris:SetVelocity ( DirVec * math.random(0,500)*Scale + VectorRand():GetNormalized() * math.random(0,400)*Scale )
				Debris:SetDieTime( math.random( 1, 2) * Scale )
				Debris:SetStartAlpha( 255 )
				Debris:SetEndAlpha( 0 )
				Debris:SetStartSize( math.random(5,10)*Scale)
				Debris:SetRoll( math.Rand(0, 360) )
				Debris:SetRollDelta( math.Rand(-5, 5) )			
				Debris:SetAirResistance( 40 ) 			 			
				Debris:SetColor( 53,50,45 )
				Debris:SetGravity( Vector( 0, 0, -600) ) 	
			end
		end

	for i = 1, DebrizzlemyNizzle do 	
		Angle:RotateAroundAxis(Angle:Forward(), (360/DebrizzlemyNizzle))
		local DustRing = Angle:Up()
		local RanVec = DirVec*math.Rand(1, 5) + (DustRing*math.Rand(3, 5)/Radius)

		for k = 3, self.Particles do
			local Rcolor = math.random(-20,20)
			local particle1 = self.emitter:Add( "particles/smokey", Pos )				
			particle1:SetVelocity((VectorRand():GetNormalized()*math.Rand(1, 2) * self.Size) + (RanVec*self.Size*k*3.5))	
			particle1:SetDieTime( math.Rand( 0, 3 )*self.Scale )	
			particle1:SetStartAlpha( math.Rand( 70, 90 )-((-1+Radius)*10) )			
			particle1:SetEndAlpha(0)	
			particle1:SetGravity((VectorRand():GetNormalized()*math.Rand(5, 10)* self.Size) + Vector(0,0,-50))
			particle1:SetAirResistance( 200+Scale*20 ) 		
			particle1:SetStartSize( (5*self.Size)-((k/self.Particles)*self.Size*3) )	
			particle1:SetEndSize( (20*self.Size)-((k/self.Particles)*self.Size) )
			particle1:SetRoll( math.random( -500, 500 )/100 )	
			particle1:SetRollDelta( math.random( -0.5, 0.5 ) )	
			particle1:SetColor( 90+Rcolor,86+Rcolor,75+Rcolor )
		end

	end

end

function EFFECT:Think( )
	return false
end

function EFFECT:Render()

end