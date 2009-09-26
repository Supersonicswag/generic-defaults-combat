function EFFECT:Init( data )
	
	local vOffset = data:GetOrigin()

	local emitter = ParticleEmitter( vOffset )

	WorldSound( "Impacts/Impact_0" .. math.random(1, 5) .. ".wav", vOffset, 100, 95 )

		for i = 0,3 do
			local particle = emitter:Add( "particle/particle_smokegrenade", vOffset )

				particle:SetVelocity( 800 * i * (data:GetNormal() * -1)  + 8 * VectorRand() )
				particle:SetAirResistance(600)

				particle:SetDieTime( math.Rand( 0.8, 1.5 ) )

				particle:SetStartAlpha( math.Rand( 150, 200 ) )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( math.Rand( 25, 40 ) )
				particle:SetEndSize( math.Rand( 65, 90 ) )

				particle:SetRoll( math.Rand( -100, 100 ) )
				particle:SetRollDelta( math.Rand( -0.05, 0.05 ) )

				particle:SetColor( 150, 150, 150 )
				particle:SetCollide( true )
				particle:SetBounce( 1 )
				particle:SetGravity( Vector( math.Rand( -1000, 1000 ) , math.Rand( -1000, 1000 ) , math.Rand( 0, -600 ) ) )
		end

		for i=1,2 do 
			local particle = emitter:Add( "effects/muzzleflash"..math.random(1,4), vOffset )

				particle:SetVelocity( 100 * data:GetNormal() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( 0.1 )

				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( math.Rand( 30, 60 ) * i )
				particle:SetEndSize( 1 * i )

				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

				particle:SetColor(255,200,200)	
		end

			local particle = emitter:Add( "sprites/heatwave", vOffset )

				particle:SetVelocity( VectorRand() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( 0.1 )

				particle:SetStartSize( 0 )
				particle:SetEndSize( math.random(150,250) )

				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )

				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

	emitter:Finish()
end

function EFFECT:Think( )

	return false
end

function EFFECT:Render()

end