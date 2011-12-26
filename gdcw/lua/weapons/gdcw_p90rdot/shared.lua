// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Close to Medium range assault weapon."
SWEP.Instructions				= "Round: 5.7 \nVelocity: ~715 m/s \nSights: Red Dot \nCapacity: 50 rounds \nRate of Fire: 900 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_P90RDOT.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCP90.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("P90F.single")
SWEP.Primary.Round			= ("gdcwa_5.7x28_tracer")
SWEP.Primary.RPM			= 900					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 50					// Size of a clip
SWEP.Primary.DefaultClip		= 51					// Default number of bullets in a clip
SWEP.Primary.ConeSpray			= 2.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 1.0					// Rate of innacuracy
SWEP.Primary.ConeMax			= 4.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.KickUp			= 0.3						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40					// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1

SWEP.IronSightsPos = Vector (3.8488, -3, 1.2056)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (3.8488, -3, 1.2056)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 3.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)
