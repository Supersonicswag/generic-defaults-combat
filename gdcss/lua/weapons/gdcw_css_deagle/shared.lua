// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Requesting permission to fire."
SWEP.Instructions				= "Round: 12.7mm \nVelocity: ~420 m/s \nSights: Iron \nCapacity: 7 rounds \nRate of Fire: 600 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_pist_deagle.mdl"
SWEP.WorldModel 				= "models/weapons/w_pist_deagle.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_Deagle.Single")
SWEP.Primary.Round			= ("gdcwa_12.7x33_420")
SWEP.Primary.RPM				= 600						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 7						// Size of a clip
SWEP.Primary.DefaultClip			= 8
SWEP.Primary.KickUp			= 1					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.5					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "357"

SWEP.Secondary.ClipSize			= 1						// Size of a clip
SWEP.Secondary.DefaultClip			= 1						// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false						// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 50						// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}						// The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (5.1517, 0, 2.6867)
SWEP.IronSightsAng = Vector (0.2495, 0.0087, 0)
SWEP.SightsPos = Vector (5.1517, 0, 2.6867)
SWEP.SightsAng = Vector (0.2495, 0.0087, 0)
SWEP.RunSightsPos = Vector (1.6926, 0, 3.6188)
SWEP.RunSightsAng = Vector (-21.0418, -0.1143, 0)