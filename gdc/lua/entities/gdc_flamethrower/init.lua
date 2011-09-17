AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()   
		
	self.Entity:SetModel( "models/props_pipes/pipecluster08d_extender64.mdl" ) 	
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )	
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetColor(70,70,70,255)

      
	local phys = self.Entity:GetPhysicsObject()  	
	if (phys:IsValid()) then  		
	phys:Wake() 
	end 
	
	self.Heat = 0
	self.CoolTime = 0
	self.Burning = false
	self:SetNetworkedBool( "fire", false)
	self.SoundString = "Flamer.Emit"
 
	self.Sound = CreateSound(self.Entity,self.SoundString )


	
	self.Inputs 	= Wire_CreateInputs( self.Entity,  { "Burn" } )
	self.Outputs 	= Wire_CreateOutputs( self.Entity, { "Heat" } )
end   


function ENT:Think()

	if self.Burning then

	self.Heat = self.Heat+1.25
	self.Sound:ChangePitch( 100-(self.Heat/1.75),0.133 )

	local EIS = ents.FindInCone(self:GetPos()+self.Entity:GetUp()*30, self.Entity:GetUp(), 2300, 10)
		for _,t in pairs(EIS) do	if t:IsValid() and t:GetPhysicsObject():IsValid() then
		if self:GetUp():DotProduct((t:GetPos() - self:GetPos()):GetNormalized())>0.993 then


	local trace 	= {}
	trace.start 	= self.Entity:GetPos() + self.Entity:GetUp()*50
	trace.endpos 	= t:LocalToWorld(t:OBBCenter())
	trace.filter 	= self.Entity 
	trace.mask 	= MASK_SHOT + MASK_WATER
	local tr 	= util.TraceLine( trace )

		if tr.Hit then
		if tr.Entity==t.Entity			then
			if !t.Entity:IsOnFire()	then	t.Entity:Ignite( 6, 100 )	end 
			if (t.Entity:IsPlayer() || t.Entity:IsNPC()) then
			local dmginfo = DamageInfo()
			dmginfo:SetDamage( 1 ) 
			dmginfo:ScaleDamage( 1 )
			dmginfo:SetDamageType( DMG_BURN )
			dmginfo:SetAttacker( self.Entity )
			dmginfo:SetInflictor( self.Entity )
			t.Entity:TakeDamageInfo( dmginfo ) 	
			end
			if t.Entity:IsValid() and GDCENGINE then	local attack =  gdc.caphit( t.Entity, 3)	end
		end 
		end


				end
				end
				end

	end

			if self.Heat>0 then
			Wire_TriggerOutput(self.Entity, "Heat", self.Heat)
			self.Heat = self.Heat-1
			end

			if self.Heat>100 then
			if self.Burning 	then 	self.Entity:EmitSound( "Flamer.Stop" ) 	end
			self.CoolTime = CurTime()+5
			self.Burning = false
			self:SetNetworkedBool( "fire", false) 
			self.Sound:Stop()
			end

		self.Entity:NextThink(CurTime())
		return true
end			

function ENT:TriggerInput(k, v)

		if (k == "Burn") then
		if ((v or 0)>0) then
		if (!self.Burning and (self.CoolTime<CurTime())) 	then 	self.Burning = true
									self:SetNetworkedBool( "fire", true) 	
									self.Sound = CreateSound(self.Entity,self.SoundString )
									self.Sound:Play()
		end
		else
		if (self.Burning) 			then 	self.Burning = false
								self:SetNetworkedBool( "fire", false) 
								self.Entity:EmitSound( "Flamer.Stop" )
								self.Sound:Stop()
				end
		end
		end
	
end
 
 
