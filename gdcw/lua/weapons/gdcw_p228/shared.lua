// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Requesting permission to fire."
SWEP.Instructions				= "Round: 10mm \nVelocity: ~350 m/s \nSights: Iron \nCapacity: 14 rounds \nRate of Fire: 900 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCW_P228.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCW_P228.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("P228F.single")
SWEP.Primary.Round			= ("gdcwa_10x22_350")
SWEP.Primary.RPM				= 900						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 13						// Size of a clip
SWEP.Primary.DefaultClip			= 14
SWEP.Primary.KickUp			= 0.4					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.3					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "pistol"

SWEP.Secondary.ClipSize			= 1						// Size of a clip
SWEP.Secondary.DefaultClip			= 1						// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false						// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 50						// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}						// The starting firemode
SWEP.data.ironsights			= 1

SWEP.IronSightsPos = Vector (3.7362, 0, 2.374)
SWEP.IronSightsAng = Vector (0.3571, -0.0154, 0)
SWEP.SightsPos = Vector (3.7362, 0, 2.374)
SWEP.SightsAng = Vector (0.3571, -0.0154, 0)
SWEP.RunSightsPos = Vector (1.6926, 0, 3.6188)
SWEP.RunSightsAng = Vector (-21.0418, -0.1143, 0)
SWEP.GSightsPos = Vector (1.3838, -2.1202, -2.5469)
SWEP.GSightsAng = Vector (0, 0, 65.0667)
