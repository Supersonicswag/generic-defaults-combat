// Variables that are used on both client and server
SWEP.Category				= "Generic Default's HL2 Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Killing"
SWEP.Instructions				= "Round: 5.7mm \nVelocity: ~715 m/s \nSights: Holo \nCapacity: 45 rounds \nRate of Fire: 800 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= false
SWEP.ViewModel 				= "models/weapons/v_smg1.mdl"
SWEP.WorldModel 				= "models/weapons/w_smg1.mdl"
SWEP.Base 				= "gdcw_base_assault"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_SMG1.NPC_Single")
SWEP.Primary.Round			= ("gdcwa_4.6x30_tracer")
SWEP.Primary.RPM				= 800					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 45					// Size of a clip
SWEP.Primary.DefaultClip			= 46					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0.35						// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.35						// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.35						// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip			= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 50					// How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1



SWEP.IronSightsPos = Vector (-6.4353, 0, 2.5371)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-6.4353, 0, 2.5371)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (2.3241, 0, 3.9618)
SWEP.RunSightsAng = Vector (-21.1675, 21.9253, 0)
