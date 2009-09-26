function EFFECT:Init( data )

	local vOffset = data:GetOrigin()

	local emitter = ParticleEmitter( vOffset )

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", vOffset, 100, 140 )

		for i = 0,3 do
			local particle = emitter:Add( "particle/particle_smokegrenade", vOffset )

				particle:SetVelocity( 700 * i * data:GetNormal() + 8 * VectorRand() )
				particle:SetAirResistance(700)

				particle:SetDieTime( math.Rand( 0.8, 1.3 ) )

				particle:SetStartAlpha( math.Rand( 230, 250 ) )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( math.Rand( 30, 50 ) )
				particle:SetEndSize( math.Rand( 100, 150 ) )

				particle:SetRoll( math.Rand( -25, 25 ) )
				particle:SetRollDelta( math.Rand( -0.5, 0.5 ) )

				particle:SetColor( 110, 110, 110 )
				particle:SetCollide( true )
				particle:SetBounce( 0 )
				particle:SetGravity( Vector( 0, 0, -600 ) )
		end

		for i=1,2 do 
			local particle = emitter:Add( "effects/muzzleflash"..math.random(1,4), vOffset )

				particle:SetVelocity( 100 * data:GetNormal() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( 0.1)

				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( 200 )
				particle:SetEndSize( 0 )

				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

				particle:SetColor(255,255,255)	
		end

			local particle = emitter:Add( "sprites/heatwave", vOffset )

				particle:SetVelocity( 80 * data:GetNormal() + 20 * VectorRand() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( math.Rand(0.2, 0.3) )

				particle:SetStartSize( 0 )
				particle:SetEndSize( math.random(290,400)  )


				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

	emitter:Finish()
end

function EFFECT:Think( )

	return false
end

function EFFECT:Render()

end