// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Explosives"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Burining"
SWEP.Instructions				= "White Phosphorus. 17 meter incindiary radius. Left click to throw, hold right click to toss."
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_GDPHOSPHORUS.mdl"
SWEP.WorldModel 			= "models/weapons/w_eq_smokegrenade.mdl"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Round 			= ("gdcwa_wpnade")	
SWEP.Primary.RPM				= 20					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1					// Size of a clip
SWEP.Primary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "grenade"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""

function SWEP:Initialize()
	//if SERVER then
	self:SetWeaponHoldType("melee")
	//end
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
end

function SWEP:Precache()
	util.PrecacheSound("RPG7F.single")
end


function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() then
		self.Weapon:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim(ACT_VM_PULLPIN)
		self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))
		timer.Simple( 0.6, self.Throw, self )

	end
end

function SWEP:Throw()
	self.Weapon:SendWeaponAnim(ACT_VM_THROW)
	timer.Simple( 0.15, self.SwingArm, self )
	timer.Simple( 0.15, self.Grenada, self )
	timer.Simple( 1, self.Reload, self )
	timer.Simple( 1, self.Deploy, self )
end

function SWEP:SwingArm()
	self.Owner:SetAnimation(PLAYER_ATTACK1)
end

function SWEP:Grenada()
	aim = self.Owner:GetAimVector()
	side = aim:Cross(Vector(0,0,1))
	up = side:Cross(aim)
	pos = self.Owner:GetShootPos() + side * 5 + up * -1
	if SERVER then
	local rocket = ents.Create(self.Primary.Round)
	if !rocket:IsValid() then return false end
	rocket:SetAngles(aim:Angle()+Angle(90,0,0))
	rocket:SetPos(pos)
	rocket:SetOwner(self.Owner)
	rocket:Spawn()
	local phys = rocket:GetPhysicsObject()
	if self.Owner:KeyDown(IN_ATTACK2) then
	phys:ApplyForceCenter(self.Owner:GetAimVector() * 2000)
	else 
	phys:ApplyForceCenter(self.Owner:GetAimVector() * 5500) end
	end
end

function SWEP:SecondaryAttack()
	return false
end

