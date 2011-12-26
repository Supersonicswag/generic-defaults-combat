// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "DC Sniper"
SWEP.Instructions			= "Round: 12.7x99 \nVelocity: ~850 m/s \nSights: Mil Dot 10x \nCapacity: 5 rounds \nRate of Fire: 55 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCWAW50.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCW_AW50.mdl"
SWEP.Base 				= "gdcw_base_rifleman"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("AW50F.single")
SWEP.Primary.Round			= ("gdcwa_12.7x99_ap")
SWEP.Primary.RPM			= 35					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 5					// Size of a clip
SWEP.Primary.DefaultClip		= 6					// Default number of bullets in a clip
SWEP.Primary.ConeSpray			= 2.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 5.0					// Rate of innacuracy
SWEP.Primary.ConeMax			= 5.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.KickUp			= 1					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.6					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1				// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.ScopeZoom			= 10		
SWEP.Secondary.UseRangefinder		= true	
SWEP.Secondary.UseMilDot			= true	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 0.7
SWEP.Velocity				= 850

SWEP.IronSightsPos = Vector (3.2269, -3.3734, 1.3315)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (3.2269, -3.3734, 1.3315)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 1.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)