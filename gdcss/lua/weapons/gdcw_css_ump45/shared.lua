// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Requesting permission to fire."
SWEP.Instructions				= "Round: 9mm \nVelocity: ~350 m/s \nSights: Iron \nCapacity: 32 rounds \nRate of Fire: 600 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_smg_ump45.mdl"
SWEP.WorldModel 				= "models/weapons/w_smg_ump45.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_UMP45.Single")
SWEP.Primary.Round			= ("gdcwa_11x22_350")
SWEP.Primary.RPM				= 600						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 25						// Size of a clip
SWEP.Primary.DefaultClip			= 26
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

SWEP.IronSightsPos = Vector (7.2978, -3.5086, 3.2685)
SWEP.IronSightsAng = Vector (-1.5478, 0.2653, 2.6166)
SWEP.SightsPos = Vector (7.2978, -3.5086, 3.2685)
SWEP.SightsAng = Vector (-1.5478, 0.2653, 2.6166)
SWEP.RunSightsPos = Vector (-0.9988, 0, 2.986)
SWEP.RunSightsAng = Vector (-15.9503, -26.3505, 0)
