// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "The best gun there is."
SWEP.Instructions			= "Round: 7.62x51 \nVelocity: ~840 m/s \nSights: Red Dot \nCapacity: 30 rounds \nRate of Fire: 700 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCW_FALRDS.mdl"
SWEP.WorldModel				= "models/weapons/w_FALIRO.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("FALF.single")
SWEP.Primary.Round			= ("gdcwa_7.62x51_tracer")
SWEP.Primary.RPM			= 700					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30					// Size of a clip
SWEP.Primary.DefaultClip		= 31					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.55					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40	


SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (2.969, 0, 1.4772)
SWEP.IronSightsAng = Vector (-2.2447, 1.1258, 0)
SWEP.SightsPos = Vector (2.969, 0, 1.4772)
SWEP.SightsAng = Vector (-2.2447, 1.1258, 0)
SWEP.RunSightsPos = Vector (-1.9636, -1.8965, 1.1305)
SWEP.RunSightsAng = Vector (-19.5185, -42.292, 19.3397)