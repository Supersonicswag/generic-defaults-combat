// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Requesting permission to fire."
SWEP.Instructions				= "Round: 9mm \nVelocity: ~350 m/s \nSights: Iron \nCapacity: 15 rounds \nRate of Fire: 1000 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_pist_usp.mdl"
SWEP.WorldModel 				= "models/weapons/w_pist_usp.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_USP.Single")
SWEP.Primary.Round			= ("gdcwa_10x22_350")
SWEP.Primary.RPM				= 1000						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 15						// Size of a clip
SWEP.Primary.DefaultClip			= 16
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


SWEP.IronSightsPos = Vector (4.4777, 0, 2.752)
SWEP.IronSightsAng = Vector (-0.2267, -0.0534, 0)
SWEP.SightsPos = Vector (4.4777, 0, 2.752)
SWEP.SightsAng = Vector (-0.2267, -0.0534, 0)
SWEP.RunSightsPos = Vector (0.4751, 0, 1.8442)
SWEP.RunSightsAng = Vector (-17.6945, -1.4012, 0)

