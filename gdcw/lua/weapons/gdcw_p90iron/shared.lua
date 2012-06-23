// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Close to Medium range assault weapon."
SWEP.Instructions			= "Round: 5.7 \nVelocity: ~715 m/s \nSights: Iron, Red Dot, Holo, ACOG \nCapacity: 50 rounds \nRate of Fire: 900 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_P90IRON.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCP90.mdl"
SWEP.Base 				= "gdcw_base_assault_emenu"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("P90F.single")
SWEP.Primary.Ball 			= ("gdcwa_5.7x28_ball")			// FMJ round
SWEP.Primary.Hollow 			= ("gdcwa_5.7x28_hollow")		// Hollow point round
SWEP.Primary.AP 			= ("gdcwa_5.7x28_ap")			// Armor Piercing round
SWEP.Primary.HEI 			= ("gdcwa_5.7x28_hei")			// High Explosive Incendiary round
SWEP.Primary.RPM			= 900					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 50					// Size of a clip
SWEP.Primary.DefaultClip		= 51					// Default number of bullets in a clip
SWEP.Primary.ConeSpray			= 2.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 1.0					// Rate of innacuracy
SWEP.Primary.ConeMax			= 4.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.KickUp			= 0.3					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40					// How much you 'zoom' in. Less is more! 
SWEP.Secondary.ScopeZoom		= 4					// How much the scope magnifies
SWEP.Secondary.UseACOG			= true	
SWEP.Secondary.UseMilDot		= false		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex		= false	
SWEP.Secondary.UseRangefinder		= false	
SWEP.ScopeScale 			= 0.5					// This is the size of the scope overlay
SWEP.ReticleScale 			= 0.6					// This is the size of the scope crosshairs
SWEP.CrossScale 			= 0.07
SWEP.SightMode				= 0

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.Silenceable			= false
SWEP.Silenced				= false
SWEP.BurstCapable			= false

SWEP.HasIronModel			= 1
SWEP.IronVModel				= "models/weapons/v_P90IRON.mdl"
SWEP.IronWModel				= "models/weapons/w_GDCP90.mdl"
SWEP.HasRDotModel			= 1
SWEP.RDotVModel				= "models/weapons/v_P90RDOT.mdl"
SWEP.RDotWModel				= "models/weapons/w_GDCP90.mdl"
SWEP.HasHoloModel			= 1
SWEP.HoloVModel				= "models/weapons/v_P90HOLO.mdl"
SWEP.HoloWModel				= "models/weapons/w_GDCP90.mdl"
SWEP.HasACOGModel			= 1
SWEP.ACOGVModel				= "models/weapons/v_P90ACOG.mdl"
SWEP.ACOGWModel				= "models/weapons/w_GDCP90.mdl"

SWEP.IronSightsPos = Vector (3.8494, -1.9252, 1.0525)
SWEP.IronSightsAng = Vector (1, 0, 0)
SWEP.SightsPos = Vector (3.8494, -1.9252, 1.0525)
SWEP.SightsAng = Vector (1, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -3.0514, 3.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)
SWEP.WallSightsPos = Vector (0.2442, -11.6177, -3.9856)
SWEP.WallSightsAng = Vector (59.2164, 1.6346, -1.8014)

SWEP.ISPos = Vector (3.8494, -1.9252, 1.0525)
SWEP.ISAng = Vector (1, 0, 0)
SWEP.RSPos = Vector (3.8488, -3, 1.2056)
SWEP.RSAng = Vector (0, 0, 0)
SWEP.HSPos = Vector (3.8436, -1.9252, 0.4575)
SWEP.HSAng = Vector (0, 0, 0)
SWEP.ASPos = Vector (3.8464, -10.355, 0.5953)
SWEP.ASAng = Vector (0, 0, 0)