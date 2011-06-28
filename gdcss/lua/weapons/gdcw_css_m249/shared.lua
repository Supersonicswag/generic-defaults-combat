// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "NO RUSSIAN! Perfect for airport genocide."
SWEP.Instructions				= "Round: 5.56x45mm \nVelocity: ~905m/s \nSights: Iron \nCapacity: 150 rounds \nRate of Fire: 850 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel 				= "models/weapons/v_mach_m249para.mdl"
SWEP.WorldModel 				= "models/weapons/w_mach_m249para.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_M249.Single")
SWEP.Primary.Round			= ("gdcwa_5.56x45_tracer")
SWEP.Primary.RPM				= 850						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 150						// Size of a clip
SWEP.Primary.DefaultClip			= 151
SWEP.Primary.KickUp			= 0.35					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.3					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true						// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize			= 1						// Size of a clip
SWEP.Secondary.DefaultClip			= 1						// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false						// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40						// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}						// The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (-4.463, 0, 2.1356)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-4.463, 0, 2.1356)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (4.3544, 0, 2.2908)
SWEP.RunSightsAng = Vector (-20.9861, 40.9598, -10)