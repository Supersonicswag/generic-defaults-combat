function EFFECT:Init( data )

local Pos = data:GetOrigin()
local Scale = data:GetScale()	
local DirVec = data:GetNormal()
local Particles = data:GetMagnitude()
local Angle = DirVec:Angle()

self.Particles = data:GetMagnitude()
self.Scale = data:GetScale()	
self.Size = 5*self.Scale

self.emitter = ParticleEmitter( Pos )
self.IsDead = false
self.Origin = Pos	
self.Ptable = {}	


		for i=1,5 do 
			local Flash = self.emitter:Add( "effects/muzzleflash"..math.random(1,4), Pos )
			if (Flash) then
				Flash:SetVelocity( DirVec*100 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.15 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( Scale*200 )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,255,255)	
			end
		end

		for i=1, 25*Scale do
			local Dust = self.emitter:Add( "particle/particle_composite", Pos )
			if (Dust) then
				Dust:SetVelocity( DirVec * math.random( 100,500)*Scale + VectorRand():GetNormalized()*250*Scale )
				Dust:SetDieTime( math.Rand( 1 , 2 ) )
				Dust:SetStartAlpha( 200 )
				Dust:SetEndAlpha( 0 )
				Dust:SetStartSize( 45*Scale )
				Dust:SetEndSize( 70*Scale )
				Dust:SetRoll( math.Rand(150, 360) )
				Dust:SetRollDelta( math.Rand(-1, 1) )			
				Dust:SetAirResistance( 200 ) 			 
				Dust:SetGravity( Vector( 0, 0, math.Rand(-100, -400) ) ) 			
				Dust:SetColor( 80,75,70 )
			end
		end

		for i=1, 25*Scale do
			local Debris = self.emitter:Add( "effects/fleck_cement"..math.random(1,2), Pos )
			if (Debris) then
				Debris:SetVelocity ( DirVec * math.random(0,400)*Scale + VectorRand():GetNormalized() * math.random(0,300)*Scale )
				Debris:SetDieTime( math.random( 0.8, 1.5) * Scale )
				Debris:SetStartAlpha( 255 )
				Debris:SetEndAlpha( 0 )
				Debris:SetStartSize( math.random(4,7)*Scale)
				Debris:SetRoll( math.Rand(0, 360) )
				Debris:SetRollDelta( math.Rand(-5, 5) )			
				Debris:SetAirResistance( 40 ) 			 			
				Debris:SetColor( 53,50,45 )
				Debris:SetGravity( Vector( 0, 0, -600) ) 	
			end
		end

	for i = 1, Particles do 	
			Angle:RotateAroundAxis(Angle:Forward(), (360/Particles))
				local DustRing = Angle:Up()
		self.Ptable[i] = {}		
		self.Ptable[i].RanVec = (DirVec*math.Rand(0, 5) + DustRing*math.Rand(3, 5))
		self.Ptable[i].RanNum = math.random(10,15) + 1	
		self.Ptable[i].CurP = 1	
		self.Ptable[i].LPos = Pos	
		self.Ptable[i].Origin = Pos	
		self.Ptable[i].EScale = Scale
		self.Ptable[i].RSpeed = math.random(1,3) * self.Size
	end

		for k = 1, table.getn(self.Ptable) do
	
			local RRanVec = self.Ptable[k].RanVec + Vector(math.Rand(-0.0001, 0.0001),math.Rand(-0.0001, 0.0001),math.Rand(-0.0001, 0.0001)):GetNormal()
			local NPos = self.Ptable[k].LPos + self.Ptable[k].RanVec*self.Size/3
			local Grav = VectorRand():GetNormalized()*math.Rand(8, 20)* self.Size
			local Rcolor = math.random(-40,-10)
	
			local particle1 = self.emitter:Add( "particles/smokey", NPos )				
			particle1:SetVelocity((VectorRand():GetNormalized()*math.Rand(1, 2) * self.Size) + self.Ptable[k].RanVec*self.Size/3)	
			particle1:SetDieTime( math.Rand( 1, 3 )*self.Scale )	
			particle1:SetStartAlpha( math.Rand( 80, 100 ) )			
			particle1:SetEndAlpha(0)	
			particle1:SetGravity(Grav)
			particle1:SetAirResistance( 100 ) 		
			particle1:SetStartSize( (5*self.Size)-((k/self.Particles)*self.Size*3) )	
			particle1:SetEndSize( (10*self.Size)-((k/self.Particles)*self.Size) )
			particle1:SetRoll( math.random( -500, 500 )/100 )	
			particle1:SetRollDelta( math.random( -0.3, 0.3 ) )	
			particle1:SetColor( 120+Rcolor,115+Rcolor,100+Rcolor )
		end
end

function EFFECT:Think( )
	return false
end

function EFFECT:Render()

end



