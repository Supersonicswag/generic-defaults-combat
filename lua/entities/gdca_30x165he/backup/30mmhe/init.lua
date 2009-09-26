function EFFECT:Init( data )
	
	local vOffset = data:GetOrigin()

	local emitter = ParticleEmitter( vOffset )

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", vOffset, 100, 100 )

		for i = 0,3 do
			local particle = emitter:Add( "particle/particle_smokegrenade", vOffset )

				particle:SetVelocity( 1000 * i * (data:GetNormal() * -1) + Vector( 0,0,1) + 8 * VectorRand() )
				particle:SetAirResistance(600)

				particle:SetDieTime( math.Rand( 2, 5 ) )

				particle:SetStartAlpha( math.Rand( 150, 220 ) )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( math.Rand( 50, 100 ) )
				particle:SetEndSize( math.Rand( 150, 200 ) )

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

				particle:SetStartSize( math.Rand( 200, 500 ) * i )
				particle:SetEndSize( 1 * i )

				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

				particle:SetColor(255,255,255)	
		end

			local particle = emitter:Add( "sprites/heatwave", vOffset )

				particle:SetVelocity( VectorRand() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( 0.35 )

				particle:SetStartSize( 0 )
				particle:SetEndSize( math.random(500,1000) )

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