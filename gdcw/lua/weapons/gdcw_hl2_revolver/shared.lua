// Variables that are used on both client and server
SWEP.Category				= "Generic Default's HL2 Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Killing"
SWEP.Instructions				= "Round: 9.1mm \nVelocity: ~490 m/s \nSights: Iron \nCapacity: 6 rounds \nRate of Fire: 150 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= false
SWEP.ViewModel 				= "models/weapons/v_357.mdl"
SWEP.WorldModel 				= "models/weapons/w_357.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_357.Single")
SWEP.Primary.Round			= ("gdcwa_357_490")
SWEP.Primary.RPM				= 150					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 6					// Size of a clip
SWEP.Primary.DefaultClip			= 6					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.8						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.6						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "357"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 50					// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (-5.6952, 0, 2.7221)
SWEP.IronSightsAng = Vector (-0.2417, -0.1801, 0.6463)
SWEP.SightsPos = Vector (-5.6952, 0, 2.7221)
SWEP.SightsAng = Vector (-0.2417, -0.1801, 0.6463)
SWEP.RunSightsPos = Vector (0.4609, 0, 4.5064)
SWEP.RunSightsAng = Vector (-21.6199, 0.1251, 0)