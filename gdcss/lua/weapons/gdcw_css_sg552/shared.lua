// Variables that are used on both client and server
SWEP.Category				= "Generic Default's CSS Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Killing"
SWEP.Instructions				= "Round: 5.56x45 \nVelocity: ~840 m/s \nSights: ACOG 4x \nCapacity: 30 rounds \nRate of Fire: 700 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel 				= "models/weapons/v_rif_sg552.mdl"
SWEP.WorldModel 				= "models/weapons/w_rif_sg552.mdl"
SWEP.Base 				= "gdcw_base_rifleman"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_SG552.Single")
SWEP.Primary.Round			= ("gdcwa_5.56x45_tracer")
SWEP.Primary.RPM				= 700					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30					// Size of a clip
SWEP.Primary.DefaultClip			= 31					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.35						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.35						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.35						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.ScopeZoom			= 4	
SWEP.Secondary.UseACOG			= true	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 				= 0.6


SWEP.IronSightsPos = Vector (6.6619, -4.9188, 2.6584)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (6.6619, -4.9188, 2.6584)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-1.502, -1.2016, 2.6582)
SWEP.RunSightsAng = Vector (-28.3988, -39.7767, 10)