// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Snitch killing."
SWEP.Instructions				= "Round: 11mm \nVelocity: ~350 m/s \nSights: Iron \nCapacity: 7 rounds \nRate of Fire: 600 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCWCOLT911.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCM1911.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("M1911F.single")
SWEP.Primary.Round			= ("gdcwa_11x22_350")
SWEP.Primary.RPM				= 600						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 7						// Size of a clip
SWEP.Primary.DefaultClip			= 8
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



SWEP.IronSightsPos = Vector (2.5092, 0, 1.2977)
SWEP.IronSightsAng = Vector (0.2967, -0.0275, 0)
SWEP.SightsPos = Vector (2.5092, 0, 1.2977)
SWEP.SightsAng = Vector (0.2967, -0.0275, 0)
SWEP.RunSightsPos = Vector (0.7565, 0, 3.0687)
SWEP.RunSightsAng = Vector (-20.6358, 2.9693, 0)
SWEP.GSightsPos = Vector (1.3838, -2.1202, -2.5469)
SWEP.GSightsAng = Vector (0, 0, 65.0667)
