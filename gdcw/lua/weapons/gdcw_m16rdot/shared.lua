// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Requesting permission to fire."
SWEP.Instructions				= "Round: 5.56 \nVelocity: ~900 m/s \nSights: Red Dot \nCapacity: 30 rounds \nRate of Fire: 800 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCM16DOT.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCM16DOT.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("M4A1F.single")
SWEP.Primary.Round			= ("gdcwa_5.56x45_tracer")
SWEP.Primary.RPM				= 800					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30					// Size of a clip
SWEP.Primary.DefaultClip			= 31					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.3					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.3					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40					// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1


SWEP.IronSightsPos = Vector (2.3055, -2.0691, 0.7616)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.3055, -2.0691, 0.7616)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-3.0328, 0, 2.888)
SWEP.RunSightsAng = Vector (-24.2146, -36.522, 0)
