// Variables that are used on both client and server
SWEP.Category				= "Generic Default's HL2 Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Killing"
SWEP.Instructions				= "Round: 10mm \nVelocity: ~350 m/s \nSights: Iron \nCapacity: 17 rounds \nRate of Fire: 1000 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= false
SWEP.ViewModel 				= "models/weapons/v_pistol.mdl"
SWEP.WorldModel 				= "models/weapons/w_pistol.mdl"
SWEP.Base 				= "gdcw_base_pistol"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_Pistol.NPC_Single")
SWEP.Primary.Round			= ("gdcwa_10x22_350")
SWEP.Primary.RPM				= 1000					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 17					// Size of a clip
SWEP.Primary.DefaultClip			= 18					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.5						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.5						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "pistol"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 50					// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1


SWEP.IronSightsPos = Vector (-5.8883, -5.6278, 3.9925)
SWEP.IronSightsAng = Vector (0.3666, -1.2483, 1.9062)
SWEP.SightsPos = Vector (-5.8883, -5.6278, 3.9925)
SWEP.SightsAng = Vector (0.3666, -1.2483, 1.9062)
SWEP.RunSightsPos = Vector (0.4609, 0, 4.5064)
SWEP.RunSightsAng = Vector (-21.6199, 0.1251, 0)