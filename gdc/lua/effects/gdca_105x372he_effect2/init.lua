function EFFECT:Init( data )
	
	local vOffset = data:GetOrigin()

	local emitter = ParticleEmitter( vOffset )

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", vOffset, 100, 70 )

		for i = 0,3 do
			local particle = emitter:Add( "particle/particle_smokegrenade", vOffset )

				particle:SetVelocity( 1500 * i * (data:GetNormal() * -1) + Vector( 0,0,1) + 8 * VectorRand() )
				particle:SetAirResistance(600)

				particle:SetDieTime( math.Rand( 2, 5 ) )

				particle:SetStartAlpha( math.Rand( 230, 250 ) )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( math.Rand( 100, 300 ) )
				particle:SetEndSize( math.Rand( 400, 500 ) )

				particle:SetRoll( math.Rand( -100, 100 ) )
				particle:SetRollDelta( math.Rand( -0.05, 0.05 ) )

				particle:SetColor( 50, 50, 50 )
	end

		for i=1,2 do 
			local particle = emitter:Add( "effects/muzzleflash"..math.random(1,4), vOffset )

				particle:SetVelocity( data:GetNormal() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( math.random(0.25,0.3) )

				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )

				particle:SetStartSize( math.Rand( 1000, 2000 ) )
				particle:SetEndSize( 0 )

				particle:SetRoll( math.Rand(180,480) )
				particle:SetRollDelta( math.Rand(-1,1) )

				particle:SetColor(255,255,255)	
		end

			local particle = emitter:Add( "sprites/heatwave", vOffset )

				particle:SetVelocity( VectorRand() )
				particle:SetAirResistance( 200 )

				particle:SetDieTime( math.random(0.5,1.5) )

				particle:SetStartSize( 0 )
				particle:SetEndSize( math.random(2000,3500) )

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