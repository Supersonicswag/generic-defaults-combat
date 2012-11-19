// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions			= ""
SWEP.MuzzleAttachment			= "1" 		// Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 		// Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false		// Hell no, crosshairs r 4 nubz!
SWEP.ViewModelFOV			= 65		// How big the gun will look
SWEP.ViewModelFlip			= true		// True for CSS models, False for HL2 models


SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

SWEP.Primary.Sound 			= Sound("")				// Sound of the gun
SWEP.Primary.Ball 			= ("gdcwa_5.56x45_ball")		// FMJ round
SWEP.Primary.Hollow 			= ("gdcwa_5.56x45_hollow")		// Hollow point round
SWEP.Primary.AP 			= ("gdcwa_5.56x45_ap")			// Armor Piercing round
SWEP.Primary.HEI 			= ("gdcwa_5.56x45_hei")			// High Explosive Incendiary round
SWEP.Primary.Cone			= 0.0					// This is the variable
SWEP.Primary.ConeSpray			= 2.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 1.0					// Rate of innacuracy
SWEP.Primary.ConeMax			= 4.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.RPM			= 700					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30					// Size of a clip
SWEP.Primary.DefaultClip		= 31					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0					// Maximum side recoil (koolaid)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"				// What kind of ammo

SWEP.Secondary.ClipSize			= 0					// Size of a clip
SWEP.Secondary.DefaultClip		= 0					// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV			= 45					// How much you 'zoom' in. Less is more! 
SWEP.Secondary.ScopeZoom		= 4
SWEP.Secondary.UseACOG			= false	
SWEP.Secondary.UseMilDot		= false		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex		= false	
SWEP.Secondary.UseRangefinder		= false	
SWEP.ScopeScale 			= 0.5					// This is the size of the scope overlay
SWEP.ReticleScale 			= 0.6					// This is the size of the scope crosshairs
SWEP.CrossScale 			= 0.07

SWEP.data 				= {}
SWEP.data.ironsights			= 1
SWEP.TracerMode				= 4
SWEP.TracerCount			= 1
SWEP.Tracer				= 0
SWEP.FireMode				= 1
SWEP.BulletMode				= 0
SWEP.SuppressorMode			= 0
SWEP.SightMode				= 0
SWEP.CrossMode				= 0
SWEP.FOVMode				= 70
SWEP.Silenceable			= false
SWEP.Silenced				= false
SWEP.BurstCounter			= 1
SWEP.BurstCapable			= false
SWEP.ACOGDEPLOYED			= false
	SWEP.IronMul=0

SWEP.MenuScale 				= 0.7
SWEP.EYaw				= nil
SWEP.EPitch				= nil

SWEP.SightsUp				= 0
SWEP.WallSights				= false
SWEP.RunSights				= 0
SWEP.HasIronModel			= 0
SWEP.HasRDotModel			= 0
SWEP.HasHoloModel			= 0
SWEP.HasACOGModel			= 0

SWEP.IronSightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.IronSightsAng = Vector (0.0186, -0.0547, 0)

SWEP.WallSightsPos = Vector (-0.821, -9.1122, -6.1656)
SWEP.WallSightsAng = Vector (63.6207, -1.7454, 0)

function SWEP:Initialize()

	util.PrecacheSound(self.Primary.Sound)
	util.PrecacheModel(self.IronVModel)
	util.PrecacheModel(self.IronWModel)
	util.PrecacheModel(self.RDotVModel)
	util.PrecacheModel(self.RDotWModel)
	util.PrecacheModel(self.HoloVModel)
	util.PrecacheModel(self.HoloWModel)
	util.PrecacheModel(self.ACOGVModel)
	util.PrecacheModel(self.ACOGWModel)
	self.Reloadaftershoot = 0 				-- Can't reload when firing
	if !self.Owner:IsNPC() then
		self:SetWeaponHoldType("ar2")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
	end
	if SERVER and self.Owner:IsNPC() then
		self:SetWeaponHoldType("ar2")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
		self:SetNPCMinBurst(3)			
		self:SetNPCMaxBurst(10)			// None of this really matters but you need it here anyway
		self:SetNPCFireRate(1/(self.Primary.RPM/60))	
		self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
	end

	if CLIENT then
		-- We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()
		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight*self.ScopeScale
		self.ScopeTable.x1 = 0.5*(iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5*(iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5*(iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5*(iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1
		self.ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale -- I don't know why this works, but it does.
		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3
		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2*self.ScopeTable.l
		self.LensTable.h = 2*self.ScopeTable.l
		self.ReticleTable = {}
		self.ReticleTable.wdivider = 3.125
		self.ReticleTable.hdivider = 1.7579/self.ReticleScale		// Draws the texture at 512 when the resolution is 1600x900
		self.ReticleTable.x = (iScreenWidth/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.y = (iScreenHeight/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.w = iScreenHeight/self.ReticleTable.hdivider
		self.ReticleTable.h = iScreenHeight/self.ReticleTable.hdivider

		self.MenuTable = {}
		self.MenuTable.w = surface.ScreenHeight()*self.MenuScale
		self.MenuTable.h = surface.ScreenHeight()*self.MenuScale
		self.MenuTable.x = (surface.ScreenWidth()/2)-self.MenuTable.w/2
		self.MenuTable.y = (surface.ScreenHeight()/2)-self.MenuTable.h/2
		self.MenuTable.stretch = surface.ScreenHeight()/1080

		self.CrossTable = {}
		self.CrossTable.w = surface.ScreenHeight()*self.CrossScale
		self.CrossTable.h = surface.ScreenHeight()*self.CrossScale
		self.CrossTable.x = (surface.ScreenWidth()/2)-self.CrossTable.w/2
		self.CrossTable.y = (surface.ScreenHeight()/2)-self.CrossTable.h/2
		end

end

function SWEP:Deploy()
if game.SinglePlayer() then self.Single=true
else
self.Single=false
end
	self:SetWeaponHoldType("ar2")                          	// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight false
	if !self.Silenced then	self.Weapon:SendWeaponAnim( ACT_VM_DRAW ) else self.Weapon:SendWeaponAnim( ACT_VM_DRAW_SILENCED )	end
	if !self.Owner:IsNPC() then self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration() end
	return true
	end


function SWEP:Precache()
	util.PrecacheSound(self.Primary.Sound)
	util.PrecacheSound("Buttons.snd14")
end


function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() then
			if self.FireMode==3 then
				if self.BurstCounter<3 then	timer.Simple( 1/(self.Primary.RPM/60), self.PrimaryAttack, self ) else self.BurstCounter=0 end
			self.BurstCounter = self.BurstCounter+1
			end

		if !self.Silenced then
		self.Weapon:EmitSound(self.Primary.Sound, 150) self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)
		util.Effect("gdcw_muzzle",fx)
		self.Owner:MuzzleFlash()
		else	
	 	self.Weapon:EmitSound("M24F.single") self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_SILENCED )
		local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)
		util.Effect("gdcw_muzzle_sup",fx)
		end

		if 	self.BulletMode==0 then		self:FireBall()
		elseif 	self.BulletMode==1 then		self:FireHollow()
		elseif 	self.BulletMode==2 then		self:FireAP()
		elseif 	self.BulletMode==3 then		self:FireHEI()		end

		self.Weapon:TakePrimaryAmmo(1)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))

		// RECOIL FOR SINGLEPLAYER IS RIGHT BELOW THESE WORDS
		if SERVER and (self.Single) and !self.Owner:IsNPC() then
		local anglo = Angle(math.Rand(-self.Primary.KickDown,self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		self.Owner:ViewPunch(anglo)
		angle = self.Owner:EyeAngles() - anglo
		self.Owner:SetEyeAngles(angle)
		end

	if (!self.Single)  and !self.Owner:IsNPC() then		// RECOIL FOR MULTIPLAYER IS RIGHT BELOW THESE WORDS
	self.Primary.Cone = math.Clamp(self.Primary.Cone+self.Primary.ConeIncrement,0,self.Primary.ConeMax)
	local anglo = Angle(math.Rand(-self.Primary.KickDown,self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
	self.Owner:ViewPunch(anglo)
	end

end

end

function SWEP:FireBall() 
	if self:GetIronsights() and self.Owner:KeyDown(IN_ATTACK2) then
	aim = self.Owner:GetAimVector()+(VectorRand()*self.Primary.Cone/360)
	else 
	aim = self.Owner:GetAimVector()+(VectorRand()*math.Rand(0,0.04))
	end
	if !self.Owner:IsNPC() then
	pos = self.Owner:GetShootPos()
	else
	pos = self.Owner:GetShootPos()+self.Owner:GetAimVector()*50
	end
		if 	self.TracerMode==0 then self.Tracer=0 
		elseif	self.TracerMode==1 then self.Tracer=1
		elseif	self.TracerMode>=1 then 
		if	self.TracerCount>=self.TracerMode then self.Tracer=1 self.TracerCount=1 	end	
		end
	if SERVER then
		local bullet = ents.Create(self.Primary.Ball)
		if !bullet:IsValid() then return false end
		bullet:SetAngles(aim:Angle()+Angle(90,0,0))
		bullet:SetPos(pos)
		bullet:SetOwner(self.Owner)
		bullet:Spawn()
		bullet:Activate()
		bullet.Data=Vector(self.Tracer,0,0)
		self.TracerCount = self.TracerCount+1
		self.Tracer=0
		end
end
function SWEP:FireHollow() 
	if self:GetIronsights() and self.Owner:KeyDown(IN_ATTACK2) then
	aim = self.Owner:GetAimVector()+(VectorRand()*self.Primary.Cone/360)
	else 
	aim = self.Owner:GetAimVector()+(VectorRand()*math.Rand(0,0.04))
	end
	if !self.Owner:IsNPC() then
	pos = self.Owner:GetShootPos()
	else
	pos = self.Owner:GetShootPos()+self.Owner:GetAimVector()*50
	end
		if 	self.TracerMode==0 then self.Tracer=0 
		elseif	self.TracerMode==1 then self.Tracer=1
		elseif	self.TracerMode>=1 then 
		if	self.TracerCount>=self.TracerMode then self.Tracer=1 self.TracerCount=1 	end	
		end
	if SERVER then
		local bullet = ents.Create(self.Primary.Hollow)
		if !bullet:IsValid() then return false end
		bullet:SetAngles(aim:Angle()+Angle(90,0,0))
		bullet:SetPos(pos)
		bullet:SetOwner(self.Owner)
		bullet:Spawn()
		bullet:Activate()
		bullet.Data=Vector(self.Tracer,0,0)
		self.TracerCount = self.TracerCount+1
		self.Tracer=0
		end
end
function SWEP:FireAP() 
	if self:GetIronsights() and self.Owner:KeyDown(IN_ATTACK2) then
	aim = self.Owner:GetAimVector()+(VectorRand()*self.Primary.Cone/360)
	else 
	aim = self.Owner:GetAimVector()+(VectorRand()*math.Rand(0,0.04))
	end
	if !self.Owner:IsNPC() then
	pos = self.Owner:GetShootPos()
	else
	pos = self.Owner:GetShootPos()+self.Owner:GetAimVector()*50
	end
		if 	self.TracerMode==0 then self.Tracer=0 
		elseif	self.TracerMode==1 then self.Tracer=1
		elseif	self.TracerMode>=1 then 
		if	self.TracerCount>=self.TracerMode then self.Tracer=1 self.TracerCount=1 	end	
		end
	if SERVER then
		local bullet = ents.Create(self.Primary.AP)
		if !bullet:IsValid() then return false end
		bullet:SetAngles(aim:Angle()+Angle(90,0,0))
		bullet:SetPos(pos)
		bullet:SetOwner(self.Owner)
		bullet:Spawn()
		bullet:Activate()
		bullet.Data=Vector(self.Tracer,0,0)
		self.TracerCount = self.TracerCount+1
		self.Tracer=0
		end
end
function SWEP:FireHEI() 
	if self:GetIronsights() and self.Owner:KeyDown(IN_ATTACK2) then
	aim = self.Owner:GetAimVector()+(VectorRand()*self.Primary.Cone/360)
	else 
	aim = self.Owner:GetAimVector()+(VectorRand()*math.Rand(0,0.04))
	end
	if !self.Owner:IsNPC() then
	pos = self.Owner:GetShootPos()
	else
	pos = self.Owner:GetShootPos()+self.Owner:GetAimVector()*50
	end
		if 	self.TracerMode==0 then self.Tracer=0 
		elseif	self.TracerMode==1 then self.Tracer=1
		elseif	self.TracerMode>=1 then 
		if	self.TracerCount>=self.TracerMode then self.Tracer=1 self.TracerCount=1 	end	
		end
	if SERVER then
		local bullet = ents.Create(self.Primary.HEI)
		if !bullet:IsValid() then return false end
		bullet:SetAngles(aim:Angle()+Angle(90,0,0))
		bullet:SetPos(pos)
		bullet:SetOwner(self.Owner)
		bullet:Spawn()
		bullet:Activate()
		bullet.Data=Vector(self.Tracer,0,0)
		self.TracerCount = self.TracerCount+1
		self.Tracer=0
		end
end

function SWEP:SecondaryAttack()
	return false
end

function SWEP:Reload()
	if !self.Silenced then	self.Weapon:DefaultReload(ACT_VM_RELOAD) else self.Weapon:DefaultReload(ACT_VM_RELOAD_SILENCED) end
	if !self.Owner:IsNPC() then
	self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration() end

	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then
	-- When the current clip < full clip and the rest of your ammo > 0, then

self.BurstCounter = 1

		self.Owner:SetFOV( 0, 0.3 )
		self:SetIronsights(false)
		if CLIENT then return end
		self.Owner:DrawViewModel(true)


end
	
end

/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/
function SWEP:IronSight()

	if !self.Owner:IsNPC() then
	if self.ResetSights and CurTime() >= self.ResetSights then
	self.ResetSights = nil
	if !self.Silenced then self:SendWeaponAnim(ACT_VM_IDLE) else self:SendWeaponAnim(ACT_VM_IDLE_SILENCED)	end
	end end

	local trace = {}
		trace.start = self.Owner:GetShootPos()
		trace.endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector()*35	
		trace.filter = self.Owner
	local tr = util.TraceLine( trace )

	if tr.Hit and (!tr.Entity:IsNPC() and !tr.Entity:IsPlayer()) then		
				self:SetIronsights(true, self.Owner)					// Set the ironsight true
				self.WallSights	= true
				self.IronSightsPos = self.WallSightsPos					// Hold it down
				self.IronSightsAng = self.WallSightsAng					// Hold it down
				self.Weapon:SetNextPrimaryFire(CurTime()+0.29)
				elseif self.WallSights then self:SetIronsights(false, self.Owner)	self.WallSights=false	end	//


	if self.Owner:KeyDown(IN_SPEED) then					// If you run and you can shoot then
	self.Weapon:SetNextPrimaryFire(CurTime()+0.3)				// Make it so you can't shoot for another quarter second
	self:SetWeaponHoldType("passive")                          		// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg
	self.IronSightsPos = self.RunSightsPos					// Hold it down
	self.IronSightsAng = self.RunSightsAng					// Hold it down
	self:SetIronsights(true, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.2 )
	end								

	if self.Owner:KeyReleased (IN_SPEED) then				// If you release run then
	self:SetWeaponHoldType("ar2")                          			// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.2 )
	end								// Shoulder the gun

	if self.Owner:KeyPressed(IN_WALK) then		// If you are holding ALT (walking slow) then
	self:SetWeaponHoldType("shotgun")                      	// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	end					// Hold it at the hip (NO RUSSIAN WOOOT!)

	if  !self.Owner:KeyDown(IN_SPEED) then
	-- If the RUN is not pressed, then

		if self.Owner:KeyPressed(IN_ATTACK2) then
			if self.SightMode!=3 then
				if !self.Owner:KeyDown(IN_DUCK) and !self.Owner:KeyDown(IN_WALK) then
				self:SetWeaponHoldType("rpg") else self:SetWeaponHoldType("ar2")  
				end  
				self.Owner:SetFOV( self.FOVMode, 0.2 )
				self.IronSightsPos = self.SightsPos					// Bring it up
				self.IronSightsAng = self.SightsAng					// Bring it up
				self:SetIronsights(true, self.Owner)
				if CLIENT then return end
 			else

			self.Owner:SetFOV( 75/self.Secondary.ScopeZoom, 0.15 )
				if !self.Owner:KeyDown(IN_DUCK) and !self.Owner:KeyDown(IN_WALK) then
				self:SetWeaponHoldType("rpg") else self:SetWeaponHoldType("ar2")  
				end                         		
			self.IronSightsPos = self.SightsPos					// Bring it up
			self.IronSightsAng = self.SightsAng					// Bring it up
			self:SetIronsights(true, self.Owner)
				if	self.ScopeScale>0		then
				if CLIENT then return end
				self.Owner:DrawViewModel(false)
				end
			end
		end
	end

	if self.Owner:KeyReleased(IN_ATTACK2) and !self.Owner:KeyDown(IN_SPEED) then
	-- If the right click is released, then
		self:SetWeaponHoldType("ar2")                      // Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
		self.Owner:SetFOV( 0, 0.3 )
		self:SetIronsights(false, self.Owner)
		if self.SightMode==3 then	self:Deploy() self.ACOGDEPLOYED=true 		end
		if CLIENT then return end
		self.Owner:DrawViewModel(true)

	end

		if self.Owner:KeyDown(IN_ATTACK2) and !self.Owner:KeyDown(IN_SPEED) then
		self.SwayScale 	= 0.05
		self.BobScale 	= 0.05
		else
		self.SwayScale 	= 1.0
		self.BobScale 	= 1.0
		end
end


function SWEP:DrawHUD()

	if self.Owner:KeyPressed(IN_USE) then
	EPitch = self.Owner:EyeAngles().p
 	EYaw = self.Owner:EyeAngles().y
	end


if self.Owner:KeyDown(IN_USE) then

	local s = self.MenuTable.stretch
	 Pitch 	= math.AngleDifference(EPitch,self.Owner:EyeAngles().p)*(17*s)
	 Yaw 	= math.AngleDifference(EYaw,self.Owner:EyeAngles().y)*(17*s)

			-- Draw the E Menu
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_emenu_a"))
			surface.DrawTexturedRect(-Yaw + self.MenuTable.x, Pitch + self.MenuTable.y, self.MenuTable.w, self.MenuTable.h)


	if   	Pitch<210*s  	and Pitch>-210*s 	and Yaw<200*s 	and Yaw>-200*s 	then 	display = " "					elseif

		Pitch<330*s 	and Pitch>210*s		and Yaw>-180*s 	and Yaw<-115*s	then 	display = "All Tracers"				elseif
		Pitch<330*s 	and Pitch>210*s		and Yaw>-115*s 	and Yaw<-15*s	then 	display = "Tracer every 3rd"			elseif
		Pitch<330*s 	and Pitch>210*s		and Yaw>-15*s 	and Yaw<90*s	then 	display = "Tracer every 5th"			elseif
		Pitch<330*s 	and Pitch>210*s		and Yaw>90*s 	and Yaw<180*s	then 	display = "No Tracers"				elseif

		Pitch<200*s 	and Pitch>70*s		and Yaw>200*s 	and Yaw<350*s	then 	display = "Semi Auto"				elseif
		Pitch<70*s 	and Pitch>-70*s		and Yaw>200*s 	and Yaw<350*s	then 	display = "Full Auto"				elseif
		Pitch<-70*s 	and Pitch>-230*s	and Yaw>200*s 	and Yaw<350*s	then 	display = "3 Round Burst"			elseif

		Pitch<-210*s 	and Pitch>-400*s	and Yaw>70*s 	and Yaw<140*s	then 	display = "Hollow Point"			elseif
		Pitch<-210*s 	and Pitch>-400*s	and Yaw>-10*s 	and Yaw<70*s	then 	display = "Full Metal Jacket"			elseif
		Pitch<-210*s 	and Pitch>-400*s	and Yaw>-90*s 	and Yaw<-10*s	then 	display = "Armor Piercing"			elseif
		Pitch<-210*s 	and Pitch>-400*s	and Yaw>-180*s 	and Yaw<-90*s	then 	display = "High Explosive Incendiary"		elseif

		Pitch<200*s 	and Pitch>130*s		and Yaw>-400*s 	and Yaw<-200*s	then 	display = "No Suppressor"			elseif
		Pitch<130*s 	and Pitch>75*s		and Yaw>-400*s 	and Yaw<-200*s	then 	display = "Suppressor"				elseif
		Pitch<75*s 	and Pitch>-10*s		and Yaw>-400*s 	and Yaw<-200*s	then 	display = "Iron Sights"				elseif
		Pitch<-10*s 	and Pitch>-75*s		and Yaw>-400*s 	and Yaw<-200*s	then 	display = "Red Dot Sight"			elseif
		Pitch<-75*s	and Pitch>-170*s	and Yaw>-400*s 	and Yaw<-200*s	then 	display = "Holo Sight"				elseif
		Pitch<-170*s 	and Pitch>-280*s	and Yaw>-400*s 	and Yaw<-200*s	then 	display = "Scope"				elseif

		Pitch<385*s 	and Pitch>290*s		and Yaw>-380*s 	and Yaw<-280*s	then 	display = "Circle Reticle"			elseif
		Pitch<385*s 	and Pitch>290*s		and Yaw>-280*s 	and Yaw<-180*s	then 	display = "Cross Reticle"			elseif
		Pitch<290*s 	and Pitch>230*s		and Yaw>-350*s 	and Yaw<-180*s	then 	display = "No Reticle"				elseif
		Pitch<360*s 	and Pitch>250*s		and Yaw>200*s 	and Yaw<350*s	then 	display = "High FOV"				elseif
		Pitch<-236*s 	and Pitch>-350*s	and Yaw>200*s 	and Yaw<350*s	then 	display = "Low FOV"				
		
										else	display = " "						end



	draw.SimpleText( display,"Default",-Yaw + (ScrW()/2), Pitch + (ScrH()/2),Color(50,170,30,255))

	draw.SimpleText( "[*]","Default",(ScrW()/2), (ScrH()/2),Color(50,170,30,255))

	//draw.SimpleText( tostring(Yaw),"Default",(ScrW()/4), (ScrH()/4),Color(150,170,30,255))
	//draw.SimpleText( tostring(Pitch),"Default",(ScrW()/4), (ScrH()/3),Color(150,170,30,255))

end

	local trace = {}
	trace.start = self.Owner:GetShootPos()
	trace.endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector()*60000		// Laser Rangefinder
	trace.filter = self.Owner
	local tr = util.TraceLine( trace )

	if !self.Owner:KeyDown(IN_ATTACK2) then
		if 	self.CrossMode==1 then
			surface.SetDrawColor(0, 0, 0, 255)
			if tr.Entity:IsPlayer() || tr.Entity:IsNPC() then
			surface.SetTexture(surface.GetTextureID("scope/gdcw_circlereticle_red")) else
			surface.SetTexture(surface.GetTextureID("scope/gdcw_circlereticle_white")) end
			surface.DrawTexturedRect(self.CrossTable.x, self.CrossTable.y, self.CrossTable.w, self.CrossTable.h)
		elseif self.CrossMode==2 then 
			surface.SetDrawColor(0, 0, 0, 255)
			if tr.Entity:IsPlayer() || tr.Entity:IsNPC() then
			surface.SetTexture(surface.GetTextureID("scope/gdcw_crossreticle_red")) else 
			surface.SetTexture(surface.GetTextureID("scope/gdcw_crossreticle_white")) end
			surface.DrawTexturedRect(self.CrossTable.x, self.CrossTable.y, self.CrossTable.w, self.CrossTable.h)
		end

	elseif   (self:GetIronsights()==true) and !self.Owner:KeyDown(IN_SPEED) and self.SightMode==3 and self.Weapon:Clip1() then

			if self.Secondary.UseACOG then
			-- Draw the FAKE SCOPE THANG
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_closedsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)

			-- Draw the CHEVRON
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_acogchevron"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)

			-- Draw the ACOG REFERENCE LINES
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_acogcross"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)
			end

			if self.Secondary.UseMilDot then
			-- Draw the MIL DOT SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_scopesight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseSVD then
			-- Draw the SVD SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_svdsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseParabolic then
			-- Draw the PARABOLIC SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_parabolicsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseElcan then
			-- Draw the RETICLE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_elcanreticle"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)
			
			-- Draw the ELCAN SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_elcansight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

			if self.Secondary.UseGreenDuplex then
			-- Draw the RETICLE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_nvgilluminatedduplex"))
			surface.DrawTexturedRect(self.ReticleTable.x, self.ReticleTable.y, self.ReticleTable.w, self.ReticleTable.h)

			-- Draw the SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_closedsight"))
			surface.DrawTexturedRect(self.LensTable.x, self.LensTable.y, self.LensTable.w, self.LensTable.h)
			end

	if self.Secondary.UseRangefinder then
	self.Range = self.Owner:GetShootPos():Distance(tr.HitPos)/52.5
	self.Time = math.Round(((self.Range)/self.Velocity)*100)/100
	self.Drop = math.Round((4.9*(self.Time^2))*100)/100

	draw.SimpleText( "RANGE " ..tostring(math.Round(self.Range)) .. "m","Default",ScrW() / 3, ScrH() * (44/60),Color(130,170,70,255))			//Range in meters
	draw.SimpleText( "TIME " ..tostring(self.Time) .. "s","Default",ScrW() / 3, ScrH() * (45/60),Color(170,130,70,255))					//Flight time in seconds
	draw.SimpleText( "DROP " ..tostring(self.Drop) .. "m","Default",ScrW() / 3, ScrH() * (46/60),Color(230,70,70,255))					//Drop in meters
	end

	end

end


/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function SWEP:Think()

//SWEP.Mode				= 0
//SWEP.SightsUp				= 0
//SWEP.WallSights			= 0
//SWEP.RunSights			= 0

	if self.Owner:KeyPressed(IN_USE) then
	EPitch = self.Owner:EyeAngles().p
 	EYaw = self.Owner:EyeAngles().y
	end


	if self.Owner:KeyReleased(IN_USE) then

	Pitch 	= math.AngleDifference(EPitch,self.Owner:EyeAngles().p)*(17)
	Yaw 	= math.AngleDifference(EYaw,self.Owner:EyeAngles().y)*(17)
	
	if   	Pitch<210  	and Pitch>-210 		and Yaw<200 	and Yaw>-200 					then 							elseif

		Pitch<330 	and Pitch>210		and Yaw>-180 	and Yaw<-115					then 	self.TracerMode=1				elseif
		Pitch<330 	and Pitch>210		and Yaw>-115 	and Yaw<-15					then 	self.TracerMode=4				elseif
		Pitch<330 	and Pitch>210		and Yaw>-15 	and Yaw<90					then 	self.TracerMode=6				elseif
		Pitch<330 	and Pitch>210		and Yaw>90 	and Yaw<180					then 	self.TracerMode=0				elseif

		Pitch<200 	and Pitch>70		and Yaw>200 	and Yaw<350					then 	self.FireMode=1		self:FireSwitch()	elseif
		Pitch<70 	and Pitch>-70		and Yaw>200 	and Yaw<350					then 	self.FireMode=5		self:FireSwitch()	elseif
		Pitch<-70 	and Pitch>-230		and Yaw>200 	and Yaw<350	and	self.BurstCapable	then 	self.FireMode=3		self:FireSwitch() 	elseif

		Pitch<-210 	and Pitch>-400		and Yaw>70 	and Yaw<140					then 	self.BulletMode=1				elseif
		Pitch<-210 	and Pitch>-400		and Yaw>-10 	and Yaw<70					then 	self.BulletMode=0				elseif
		Pitch<-210 	and Pitch>-400		and Yaw>-90 	and Yaw<-10					then 	self.BulletMode=2				elseif
		Pitch<-210 	and Pitch>-400		and Yaw>-180 	and Yaw<-90					then 	self.BulletMode=3				elseif

		Pitch<200 	and Pitch>130		and Yaw>-400 	and Yaw<-200					then 	self.SuppressorMode=0	self:Suppressor()	elseif
		Pitch<130 	and Pitch>75		and Yaw>-400 	and Yaw<-200					then 	self.SuppressorMode=1	self:Suppressor()	elseif
		Pitch<75 	and Pitch>-10		and Yaw>-400 	and Yaw<-200					then 	self.SightMode=0	self:SightSwitch()	elseif
		Pitch<-10 	and Pitch>-75		and Yaw>-400 	and Yaw<-200					then 	self.SightMode=1	self:SightSwitch()	elseif
		Pitch<-75	and Pitch>-170		and Yaw>-400 	and Yaw<-200					then 	self.SightMode=2	self:SightSwitch()	elseif
		Pitch<-170 	and Pitch>-280		and Yaw>-400 	and Yaw<-200	and	self.HasACOGModel==1	then 	self.SightMode=3	self:SightSwitch()	elseif

		Pitch<385 	and Pitch>290		and Yaw>-380 	and Yaw<-280					then 	self.CrossMode=1				elseif
		Pitch<385 	and Pitch>290		and Yaw>-280 	and Yaw<-180					then 	self.CrossMode=2				elseif
		Pitch<290 	and Pitch>230		and Yaw>-350 	and Yaw<-180					then 	self.CrossMode=0				elseif
		Pitch<360 	and Pitch>250		and Yaw>200 	and Yaw<350					then 	self.FOVMode=70					elseif
		Pitch<-236 	and Pitch>-350		and Yaw>200 	and Yaw<350					then 	self.FOVMode=self.Secondary.IronFOV				
		
										else	display = " "						end

	end


self:IronSight()

	if !self.Owner:IsNPC() then
	if self.Idle and CurTime() >= self.Idle then
	self.Idle = nil
	if !self.Silenced then self:SendWeaponAnim(ACT_VM_IDLE) else self:SendWeaponAnim(ACT_VM_IDLE_SILENCED) end
	end end

	if	(self.Primary.Cone>0.09)	then
	self.Primary.Cone = self.Primary.Cone - self.Primary.ConeDecrement	end

end

function SWEP:AdjustMouseSensitivity()
     
	if self.Owner:KeyDown(IN_ATTACK2) and self.SightMode==3 then
        return (1/(self.Secondary.ScopeZoom/2))
    	else 
    	return 1
     	end
end

function SWEP:Suppressor() 
if self.Silenceable then

	if	self.SuppressorMode==0 and self.Silenced then
	self.Silenced = false
	self.Weapon:SetNextPrimaryFire(CurTime()+2)
	self.Weapon:SendWeaponAnim(ACT_VM_DETACH_SILENCER)
	
	elseif 	self.SuppressorMode==1 and !self.Silenced then
	self.Silenced = true
	self.Weapon:SetNextPrimaryFire(CurTime()+2)
	self.Weapon:SendWeaponAnim(ACT_VM_ATTACH_SILENCER)	
	end
end
end

function SWEP:FireSwitch() 

	if 	self.FireMode==1 	then
	self.Primary.Automatic	= false
	elseif 	self.FireMode==5 	then
	self.Primary.Automatic	= true
	elseif 	self.FireMode==3  	then
	self.Primary.Automatic	= false
	end
end

function SWEP:SightSwitch() 

	if 	self.SightMode==0 and self.HasIronModel==1 then
	util.PrecacheModel(self.IronVModel)
	self.ViewModel		= self.IronVModel
	self.WorldModel		= self.IronWModel
	self.SightsPos 		= self.ISPos	
	self.SightsAng 		= self.ISAng	
	//timer.Simple( 0.3, self.Deploy, self )	
	self:Deploy()

	elseif 	self.SightMode==1 and self.HasRDotModel==1 then
	util.PrecacheModel(self.RDotVModel)
	self.ViewModel		= self.RDotVModel
	self.WorldModel		= self.RDotWModel
	self.SightsPos 		= self.RSPos	
	self.SightsAng  	= self.RSAng	
	self:Deploy()
	//timer.Simple( 0.3, Deploy() )//, self )	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )

	elseif 	self.SightMode==2 and self.HasHoloModel==1 then
	util.PrecacheModel(self.HoloVModel)
	self.ViewModel		= self.HoloVModel
	self.WorldModel		= self.HoloWModel
	self.SightsPos 		= self.HSPos	
	self.SightsAng  	= self.HSAng	
	//timer.Simple( 0.3, self.Deploy, self )	
	self:Deploy()

	elseif 	self.SightMode==3 and self.HasACOGModel==1 then
	util.PrecacheModel(self.ACOGVModel)
	self.ViewModel		= self.ACOGVModel
	self.WorldModel		= self.ACOGWModel
	self.SightsPos 		= self.ASPos	
	self.SightsAng  	= self.ASAng
	//timer.Simple( 0.3, self.Deploy, self )	
	self:Deploy()

	end
end


/*---------------------------------------------------------
GetViewModelPosition
---------------------------------------------------------*/
local IRONSIGHT_TIME = 0.2
-- Time to enter in the ironsight mod

function SWEP:GetViewModelPosition(pos, ang)

	if (not self.IronSightsPos) then return pos, ang end

	local bIron = self.Weapon:GetNWBool("Ironsights")

	if (bIron != self.bLastIron) then
		self.bLastIron = bIron
		self.fIronTime = CurTime()

	end

	local fIronTime = self.fIronTime or 0

	if (not bIron and fIronTime < CurTime() - IRONSIGHT_TIME) then
		return pos, ang
	end

	local Mul = 1.0

	if (fIronTime > CurTime() - IRONSIGHT_TIME) then
		Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

		if not bIron then Mul = 1 - Mul end
	end
	self.IronMul=Mul
	local Offset	= self.IronSightsPos

	if (self.IronSightsAng) then
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), 		self.IronSightsAng.x * Mul)
		ang:RotateAroundAxis(ang:Up(), 		self.IronSightsAng.y * Mul)
		ang:RotateAroundAxis(ang:Forward(), 	self.IronSightsAng.z * Mul)
	end

	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()

	pos = pos + Offset.x * Right * Mul
	pos = pos + Offset.y * Forward * Mul
	pos = pos + Offset.z * Up * Mul

	return pos, ang
end

/*---------------------------------------------------------
SetIronsights
---------------------------------------------------------*/
function SWEP:SetIronsights(b)

	self.Weapon:SetNetworkedBool("Ironsights", b)
end

function SWEP:GetIronsights()

	return self.Weapon:GetNWBool("Ironsights")
end

///////////////////////////////////////////////

function SWEP:GetStretch()

	return self.Weapon:GetNWFloat("Stretch")
end
