// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 		// Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 		// Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false		// Hell no, crosshairs r 4 nubz!
SWEP.ViewModelFOV			= 65		// How big the gun will look
SWEP.ViewModelFlip			= true		// True for CSS models, False for HL2 models


SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false


SWEP.Primary.Sound 			= Sound("")				// Sound of the gun
SWEP.Primary.Round 			= ("")					// What kind of bullet?
SWEP.Primary.Cone			= 0.2					// Accuracy of NPCs
SWEP.Primary.RPM				= 0					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 0					// Size of a clip
SWEP.Primary.DefaultClip			= 0					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0					// Maximum side recoil (koolaid)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"					// What kind of ammo

SWEP.Secondary.ClipSize			= 0					// Size of a clip
SWEP.Secondary.DefaultClip			= 0					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV			= 0					// How much you 'zoom' in. Less is more! 

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1

SWEP.IronSightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.IronSightsAng = Vector (0.0186, -0.0547, 0)
SWEP.GSightsPos = Vector (0, 0, 0)
SWEP.GSightsAng = Vector (0, 0, -90)

function SWEP:Initialize()
	self.Reloadaftershoot = 0 				-- Can't reload when firering
	if !self.Owner:IsNPC() then
		self:SetWeaponHoldType("pistol")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
	end
	if SERVER and self.Owner:IsNPC() then
		self:SetWeaponHoldType("pistol")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
		self:SetNPCMinBurst(3)			
		self:SetNPCMaxBurst(10)			// None of this really matters but you need it here anyway
		self:SetNPCFireRate(1)	
		self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
	end
end

function SWEP:Deploy()
	self:SetWeaponHoldType("pistol")                          	// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight false
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	return true
	end


function SWEP:Precache()
	util.PrecacheSound(self.Primary.Sound)
	util.PrecacheSound("Buttons.snd14")
end


function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() then
		self:FireRocket()
		self.Weapon:EmitSound(self.Primary.Sound)
		self.Weapon:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		if !self.Owner:IsNPC() then
		local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)
		util.Effect("gdcw_muzzle",fx)
		local shell 	= EffectData()
		shell:SetEntity(self.Weapon)
		shell:SetNormal(self.Owner:GetAimVector())
		shell:SetAttachment(self.ShellEjectAttachment)
		util.Effect("gdcw_caps",shell)	
		end
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Owner:MuzzleFlash()
		self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))
	end
end

function SWEP:FireRocket()
	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() +  aim * 50 + side * 4 + up * -1	--offsets the rocket so it spawns from the muzzle (hopefully)
	if SERVER then
	local rocket = ents.Create(self.Primary.Round)
		if !rocket:IsValid() then return false end
		rocket:SetAngles(aim:Angle()+Angle(90,0,0))
		rocket:SetPos(pos)
	rocket:SetOwner(self.Owner)
	rocket:Spawn()
	rocket:Activate()
	end
		if SERVER and !self.Owner:IsNPC() then
		local anglo = Angle(math.Rand(-self.Primary.KickDown,self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		self.Owner:ViewPunch(anglo)
		angle = self.Owner:EyeAngles() - anglo
		self.Owner:SetEyeAngles(angle)
		end
end

function SWEP:SecondaryAttack()
	return false
end

function SWEP:Reload()

	self.Weapon:DefaultReload(ACT_VM_RELOAD) 
	-- Animation when you're reloading

	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then
	-- When the current clip < full clip and the rest of your ammo > 0, then

		self.Owner:SetFOV( 0, 0.25 )
		-- Zoom = 0

		self:SetIronsights(false)
		-- Set the ironsight to false

end
	
end

/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/
function SWEP:IronSight()

	if self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_ATTACK2) and !self.Owner:KeyDown(IN_WALK) and self:CanPrimaryAttack()  then		// If you hold E and you can shoot then
	self.Weapon:SetNextPrimaryFire(CurTime()+0.2)				// Make it so you can't shoot for another quarter second
	self:SetWeaponHoldType("normal")                          			// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg
	self.IronSightsPos = self.RunSightsPos					// Hold it down
	self.IronSightsAng = self.RunSightsAng					// Hold it down
	self:SetIronsights(true, self.Owner)					// Set the ironsight true
	end								// Lower the gun

	if self.Owner:KeyDown(IN_USE) then					// If you hold E and you can shoot then
	self.Weapon:SetNextPrimaryFire(CurTime()+0.2)				// Make it so you can't shoot for another quarter second
	end								// Lower the gun

	if (self.Owner:KeyReleased(IN_USE) || self.Owner:KeyReleased(IN_SPEED)) then	// If you release E then
	self:SetWeaponHoldType("pistol")                          				// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight true
	end								// Shoulder the gun

	if self.Owner:KeyPressed(IN_WALK) and !self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_ATTACK2) then		// If you press ALT then
	self.IronSightsPos = self.GSightsPos		// EL-GHETTEAU, HOLD IT G-NIGS STYLE
	self.IronSightsAng = self.GSightsAng		// EL-GHETTEAU, HOLD IT G-NIGS STYLE
	self:SetIronsights(true, self.Owner)		// Set the ironsight true
	end	
				
	if self.Owner:KeyReleased(IN_WALK) and !self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_ATTACK2) then	// If you press ALT then
	self:SetIronsights(false, self.Owner)		// Set the ironsight true
	end					



	if !self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_WALK) then
	-- If the key E (Use Key) is not pressed, then

		if self.Owner:KeyPressed(IN_ATTACK2) then
		-- When the right click is pressed, then
			self.IronSightsPos = self.SightsPos					// Return to functional sights
			self.IronSightsAng = self.SightsAng					// Return to functional sights
			self:SetWeaponHoldType("pistol")                          		// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
			self.Owner:SetFOV( self.Secondary.IronFOV, 0.3 )

			self:SetIronsights(true, self.Owner)
			-- Set the ironsight true

			if CLIENT then return end
 		end
	end

	if self.Owner:KeyReleased(IN_ATTACK2) and !self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_WALK) then
	-- If the right click is released, then

		self.Owner:SetFOV( 0, 0.3 )

		self:SetIronsights(false, self.Owner)
		-- Set the ironsight false

		if CLIENT then return end
	end
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function SWEP:Think()

	self:IronSight()
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

		if (bIron) and !self.Owner:KeyDown(IN_SPEED) then	// If Ironsights and NOT RUNNING then
			self.SwayScale 	= 0.02
			self.BobScale 	= 0.02
		else
			self.SwayScale 	= 1.0
			self.BobScale 	= 1.0
		end
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
