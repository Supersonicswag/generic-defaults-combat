// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Public executions."
SWEP.Instructions				= "Round: 12.7mm \nVelocity: ~420 m/s \nSights: Iron \nCapacity: 7 rounds \nRate of Fire: 600 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCWGDEAGLE.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCDEAGLE.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("DeagleF.single")
SWEP.Primary.Round			= ("gdcwa_12.7x33_420")
SWEP.Primary.RPM			= 600						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 7						// Size of a clip
SWEP.Primary.DefaultClip		= 8
SWEP.Primary.ConeSpray			= 2.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 4.0					// Rate of innacuracy
SWEP.Primary.ConeMax			= 5.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.KickUp			= 1					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.5					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "357"

SWEP.Secondary.ClipSize			= 1						// Size of a clip
SWEP.Secondary.DefaultClip		= 1						// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false						// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 50						// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}						// The starting firemode
SWEP.data.ironsights			= 1


SWEP.IronSightsPos = Vector (3.7444, 0, 1.6641)
SWEP.IronSightsAng = Vector (0.1727, -0.0694, 0)
SWEP.SightsPos = Vector (3.7444, 0, 1.6641)
SWEP.SightsAng = Vector (0.1727, -0.0694, 0)
SWEP.RunSightsPos = Vector (1.6926, 0, 3.6188)
SWEP.RunSightsAng = Vector (-21.0418, -0.1143, 0)
SWEP.GSightsPos = Vector (1.3838, -2.1202, -2.5469)
SWEP.GSightsAng = Vector (0, 0, 65.0667)
