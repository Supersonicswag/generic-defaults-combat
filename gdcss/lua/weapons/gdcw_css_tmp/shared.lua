// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Requesting permission to fire."
SWEP.Instructions				= "Round: 9mm \nVelocity: ~390 m/s \nSights: Iron \nCapacity: 32 rounds \nRate of Fire: 900 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= true	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_smg_tmp.mdl"
SWEP.WorldModel 				= "models/weapons/w_smg_tmp.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_TMP.Single")
SWEP.Primary.Round			= ("gdcwa_9x19_350")
SWEP.Primary.RPM				= 900						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 32						// Size of a clip
SWEP.Primary.DefaultClip			= 33
SWEP.Primary.KickUp			= 0.4					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.3					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true						// Automatic/Semi Auto
SWEP.Primary.Ammo			= "pistol"

SWEP.Secondary.ClipSize			= 1						// Size of a clip
SWEP.Secondary.DefaultClip			= 1						// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false						// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 45						// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}						// The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (2.1087, -3.6357, 3.1598)
SWEP.IronSightsAng = Vector (0.2791, -0.1519, 2.9516)
SWEP.SightsPos = Vector (2.1087, -3.6357, 3.1598)
SWEP.SightsAng = Vector (0.2791, -0.1519, 2.9516)
SWEP.RunSightsPos = Vector (-1.777, 0, 1.7216)
SWEP.RunSightsAng = Vector (-15.9503, -26.3505, 0)
