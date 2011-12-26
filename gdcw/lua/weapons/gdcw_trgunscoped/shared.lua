// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "DC Sniper"
SWEP.Instructions				= "Round: 7.62x51 \nVelocity: ~850 m/s \nSights: Iron \nCapacity: 10 rounds \nRate of Fire: 55 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_NO_SCOPE.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCTRG.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("TRGF.single")
SWEP.Primary.Round			= ("gdcwa_7.62x51_ap")
SWEP.Primary.RPM			= 55					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10					// Size of a clip
SWEP.Primary.DefaultClip		= 11					// Default number of bullets in a clip
SWEP.Primary.ConeSpray			= 3.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 3.0					// Rate of innacuracy
SWEP.Primary.ConeMax			= 6.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.KickUp			= 0.6						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.6						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.6						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 35	


SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (3.3977, 3.9602, 2.1354)
SWEP.IronSightsAng = Vector (-0.5304, 0.5856, 0)
SWEP.SightsPos = Vector (3.3977, 3.9602, 2.1354)
SWEP.SightsAng = Vector (-0.5304, 0.5856, 0)
SWEP.RunSightsPos = Vector (-0.5731, -1.4372, 2.1909)
SWEP.RunSightsAng = Vector (-18.0621, -37.2846, 9.5424)
