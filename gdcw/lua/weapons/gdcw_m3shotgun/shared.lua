// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Blastin Foos"
SWEP.Instructions			= "Round: Buckshot, Slug, Breaching, FRAG-12 \nVelocity: ~360 m/s \nSights: Iron \nCapacity: 8 rounds \nRate of Fire: 70 rounds per minute \nHold E and Right click to switch rounds. "
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 55
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCW_M3SHOTGUN.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCW_M3SHOTGUN.mdl"
SWEP.Base 				= "gdcw_base_shotgun"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("M3F.single")
SWEP.Primary.Round1 			= ("gdcwa_buckshot")		// Buckshot
SWEP.Primary.Round2			= ("gdcwa_slug")		// Slug
SWEP.Primary.Round3 			= ("gdcwa_breach")		// Door breaching round
SWEP.Primary.Round4 			= ("gdcwa_frag12")		// FRAG-12 grenade
SWEP.Primary.RPM			= 80				// This is in Rounds Per Minute
SWEP.Primary.MRAD			= 20				// Accuracy of pellets in MILIRADIANS; 1 Radian = ~57.3 Degrees
SWEP.Primary.Pellets			= 9				// Numba of pellets
SWEP.Primary.ClipSize			= 8				// Size of a clip
SWEP.Primary.DefaultClip		= 9				// Default number of bullets in a clip
SWEP.Primary.ConeSpray			= 2.0				// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 5.0				// Rate of innacuracy
SWEP.Primary.ConeMax			= 5.0				// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1				// Rate of accuracy
SWEP.Primary.KickUp			= 1				// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.8				// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.6				// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "buckshot"

SWEP.Secondary.ClipSize			= 1				// Size of a clip
SWEP.Secondary.DefaultClip		= 1				// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 50	

SWEP.data 				= {}				//The starting firemode
SWEP.data.ironsights			= 1


--------------------
SWEP.IronSightsPos = Vector (2.8519, -2.135, 2.1993)
SWEP.IronSightsAng = Vector (1.2984, 0.7282, -3.6645)
SWEP.SightsPos = Vector (2.8519, -2.135, 2.1993)
SWEP.SightsAng = Vector (1.2984, 0.7282, -3.6645)
SWEP.RunSightsPos = Vector (-0.5731, -1.4372, 2.1909)
SWEP.RunSightsAng = Vector (-18.0621, -37.2846, 9.5424)
