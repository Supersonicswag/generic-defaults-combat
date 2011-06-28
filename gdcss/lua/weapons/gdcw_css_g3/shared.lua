// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Killing"
SWEP.Instructions				= "Round: 7.62x51 \nVelocity: ~800 m/s \nSights: Parabolic 12x \nCapacity: 20 rounds \nRate of Fire: 500 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_snip_g3sg1.mdl"
SWEP.WorldModel 				= "models/weapons/w_snip_g3sg1.mdl"
SWEP.Base 				= "gdcw_base_rifleman"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_G3SG1.Single")
SWEP.Primary.Round			= ("gdcwa_7.62x51_tracer")
SWEP.Primary.RPM				= 500					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20					// Size of a clip
SWEP.Primary.DefaultClip			= 21					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.7						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.4						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.ScopeZoom			= 12	
SWEP.Secondary.UseParabolic		= true	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 				= 0.6


SWEP.IronSightsPos = Vector (5.4029, -2.7526, 2.1628)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (5.4029, -2.7526, 2.1628)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-1.502, -1.2016, 2.6582)
SWEP.RunSightsAng = Vector (-28.3988, -39.7767, 10)