// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Killing"
SWEP.Instructions				= "Round: 7.62x51 \nVelocity: ~730 m/s \nSights: Mil Dot 9x \nCapacity: 10 rounds \nRate of Fire: 40 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCW_M24SI.mdl"
SWEP.WorldModel				= "models/weapons/w_snip_m24_6.mdl"
SWEP.Base 				= "gdcw_base_rifleman"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("M24F.single")
SWEP.Primary.Round			= ("gdcwa_7.62x51_lowvel")
SWEP.Primary.RPM				= 40					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 5					// Size of a clip
SWEP.Primary.DefaultClip			= 6					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.6						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.6						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.6						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.ScopeZoom			= 9	
SWEP.Secondary.UseRangefinder		= true	
SWEP.Secondary.UseMilDot			= true	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 				= 0.7

SWEP.IronSightsPos = Vector (2.894, 0, 1.7624)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.894, 0, 1.7624)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 2.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)
