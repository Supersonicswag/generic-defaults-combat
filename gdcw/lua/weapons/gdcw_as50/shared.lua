// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Long range killing."
SWEP.Instructions				= "Round: 12.7x99 \nVelocity: ~850 m/s \nSights: Parabolic 16x \nCapacity: 10 rounds \nRate of Fire: 400 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCWAS50.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCAS50.mdl"
SWEP.Base 				= "gdcw_base_rifleman"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("AS50F.single")
SWEP.Primary.Round			= ("gdcwa_12.7x99_ap")
SWEP.Primary.RPM				= 400					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10					// Size of a clip
SWEP.Primary.DefaultClip			= 11					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 1						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.5						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "357"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.ScopeZoom			= 16	
SWEP.Secondary.UseRangefinder		= true	
SWEP.Secondary.UseParabolic		= true	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 				= 0.8

SWEP.IronSightsPos = Vector (3.7135, -3.3734, 1.3861)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (3.7135, -3.3734, 1.3861)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (0.086, 0.2556, -0.4962)
SWEP.RunSightsAng = Vector (-16.088, -35.3317, 10)
