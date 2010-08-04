// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Shooting into crowds of starving African children."
SWEP.Instructions				= "Round: 7.62x51mm \nVelocity: ~840m/s \nSights: Iron \nCapacity: 150 rounds \nRate of Fire: 800 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_GENERIC_HK21E.mdl"
SWEP.WorldModel				= "models/weapons/w_GENERIC_HK21E.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("HK21F.single")
SWEP.Primary.Round			= ("gdcwa_7.62x51_tracer")
SWEP.Primary.RPM				= 800						// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 150						// Size of a clip
SWEP.Primary.DefaultClip			= 151
SWEP.Primary.KickUp			= 0.6					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.6					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.4					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true						// Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize			= 1						// Size of a clip
SWEP.Secondary.DefaultClip			= 1						// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false						// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40						// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}						// The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (-3.3992, -3.7154, 1.9119)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-3.3992, -3.7154, 1.9119)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (4.3544, 0, 2.2908)
SWEP.RunSightsAng = Vector (-20.9861, 40.9598, -10)