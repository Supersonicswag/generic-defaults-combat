// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Requesting permission to fire."
SWEP.Instructions				= "Round: 9mm \nVelocity: ~390 m/s \nSights: Iron \nCapacity: 33 rounds \nRate of Fire: 1200 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_pist_glock18.mdl"
SWEP.WorldModel 				= "models/weapons/w_pist_glock18.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_Glock.Single")
SWEP.Primary.Round			= ("gdcwa_9x19_350")
SWEP.Primary.RPM				= 1200						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 17						// Size of a clip
SWEP.Primary.DefaultClip			= 18
SWEP.Primary.KickUp			= 0.6					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5					// Maximum down recoil (skeet)
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


SWEP.IronSightsPos = Vector (4.3392, 0, 2.8203)
SWEP.IronSightsAng = Vector (0.6079, 0.0109, 0)
SWEP.SightsPos = Vector (4.3392, 0, 2.8203)
SWEP.SightsAng = Vector (0.6079, 0.0109, 0)
SWEP.RunSightsPos = Vector (0.4749, 0, 3.4521)
SWEP.RunSightsAng = Vector (-23.6565, -0.6917, 0)