// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Medium to long range assault weapon."
SWEP.Instructions				= "Round: 5.56 \nVelocity: ~900 m/s \nSights: Iron \nCapacity: 200 rounds \nRate of Fire: 850 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_GDCW_M249IRON.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCM240.mdl"
SWEP.Base 				= "gdcw_base_assault_emenu"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("M249F.single")
SWEP.Primary.Round			= ("gdcwa_5.56x45_tracer")
SWEP.Primary.RPM			= 850					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 200					// Size of a clip
SWEP.Primary.DefaultClip		= 201					// Default number of bullets in a clip
SWEP.Primary.ConeSpray			= 2.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 1.0					// Rate of innacuracy
SWEP.Primary.ConeMax			= 4.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.KickUp			= 0.3						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.35						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40					// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1

SWEP.IronSightsPos = Vector (-4.0153, -2.7663, 1.7654)
SWEP.IronSightsAng = Vector (0.1316, -0.0083, 0)
SWEP.SightsPos = Vector (-4.0153, -2.7663, 1.7654)
SWEP.SightsAng = Vector (0.1316, -0.0083, 0)
SWEP.RunSightsPos = Vector (3.2216, 0, 2.3745)
SWEP.RunSightsAng = Vector (-21.6398, 36.3675, -11.0591)
SWEP.WallSightsPos = Vector (-0.5336, -14.2233, -4.8932)
SWEP.WallSightsAng = Vector (53.4322, 8.6914, 0)
