// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Explosives"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Jihadding"
SWEP.Instructions				= "Rounds:\n PG-7V 85mm HEAT, 10 meter casualty radius. \nVelocity: 115-295 m/s \nSights: Iron \nCapacity: 1 round \nRate of Fire: ~20 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 55
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_RL7.mdl"
SWEP.WorldModel				= "models/weapons/w_GDC_RPG7.mdl"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Round 			= ("gdcwa_rpg_heat")	
SWEP.Primary.RPM			= 20					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1					// Size of a clip
SWEP.Primary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "RPG_Round"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1

SWEP.IronSightsPos = Vector (-3.7384, -5.7481, -0.2713)
SWEP.IronSightsAng = Vector (1.1426, 0.0675, 0)
SWEP.SightsPos = Vector (-3.7384, -5.7481, -0.2713)
SWEP.SightsAng = Vector (1.1426, 0.0675, 0)
SWEP.RunSightsPos = Vector (2.4946, -1.5644, 1.699)
SWEP.RunSightsAng = Vector (-20.1104, 35.1164, -12.959)


function SWEP:Initialize()
	if !self.Owner:IsNPC() then
		self:SetWeaponHoldType("rpg")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
	end
	if SERVER and self.Owner:IsNPC() then
		self:SetWeaponHoldType("rpg")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
		self:SetNPCMinBurst(1)			
		self:SetNPCMaxBurst(1)			// None of this really matters but you need it here anyway
		self:SetNPCFireRate(1)	
		self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
	end
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
end

function SWEP:Precache()
	util.PrecacheSound("RPGF.single")
end


function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() then
		self:FireRocket()
		self.Weapon:EmitSound("RPGF.single")
		self.Weapon:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)
		util.Effect("gdcw_backblast",fx)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Owner:MuzzleFlash()
		self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))

		//timer.Simple( 2, self.Reload, self)
		timer.Create( "ReloadTimer", 2, 1, self.Reload )

	end
end

function SWEP:FireRocket()
	local aim = self.Owner:GetAimVector()
	local pos = self.Owner:GetShootPos()

	if SERVER then
	local rocket = ents.Create(self.Primary.Round)
	if !rocket:IsValid() then return false end
	rocket:SetAngles(aim:Angle()+Angle(90,0,0))
	rocket:SetPos(pos)
	rocket:SetOwner(self.Owner)
	rocket:Spawn()
	rocket.owner = self.Owner
	rocket:Activate()
	end
end

function SWEP:SecondaryAttack()
	return false
end

function SWEP:Reload()

	self.Weapon:DefaultReload(ACT_VM_RELOAD) 
	-- Animation when you're reloading
		self:SetIronsights(false, self.Owner)

	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then
	-- When the current clip < full clip and the rest of your ammo > 0, then


end
	
end


/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/
function SWEP:IronSight()


	if self.Owner:KeyDown(IN_SPEED) then					// If you run then
	self.Weapon:SetNextPrimaryFire(CurTime()+0.5)				// Make it so you can't shoot for another quarter second
	self:SetWeaponHoldType("passive")                          			// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg
	self.IronSightsPos = self.RunSightsPos					// Hold it down
	self.IronSightsAng = self.RunSightsAng					// Hold it down
	self:SetIronsights(true, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )						// Reset FOV
	end								

	if self.Owner:KeyReleased(IN_SPEED) then				// If you stop running then
	self:SetWeaponHoldType("rpg")                          				// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )						// Reset FOV
	end


		if self.Owner:KeyPressed(IN_ATTACK2) then
		self.Owner:SetFOV( 40, 0.5 )
		self.IronSightsPos = self.SightsPos					// Bring it up
		self.IronSightsAng = self.SightsAng					// Bring it up
		self:SetIronsights(true, self.Owner)
 		end

		if self.Owner:KeyReleased(IN_ATTACK2) and !self.Owner:KeyDown(IN_SPEED) then
		self.Owner:SetFOV( 0, 0.5 )
		self:SetIronsights(false, self.Owner)
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
local IRONSIGHT_TIME = 0.5
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
