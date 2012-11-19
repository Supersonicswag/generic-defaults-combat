// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Medium range assault weapon."
SWEP.Instructions			= "Round: 7.62x51 \nVelocity: ~840 m/s \nSights: Iron, Red Dot, Holo, ACOG \nCapacity: 30 rounds \nRate of Fire: 700 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDCW_FALHOL.mdl"
SWEP.WorldModel				= "models/weapons/w_FALIRO.mdl"
SWEP.Base 				= "gdcw_base_assault_emenu"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("FALF.single")
SWEP.Primary.Ball 			= ("gdcwa_7.62x51_ball")		// FMJ round
SWEP.Primary.Hollow 			= ("gdcwa_7.62x51_hollow")		// Hollow point round
SWEP.Primary.AP 			= ("gdcwa_7.62x51_ap")			// Armor Piercing round
SWEP.Primary.HEI 			= ("gdcwa_7.62x51_hei")			// High Explosive Incendiary round
SWEP.Primary.RPM			= 700					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30					// Size of a clip
SWEP.Primary.DefaultClip		= 31					// Default number of bullets in a clip
SWEP.Primary.ConeSpray			= 2.0					// Hip fire accuracy
SWEP.Primary.ConeIncrement		= 2.5					// Rate of innacuracy
SWEP.Primary.ConeMax			= 6.0					// Maximum Innacuracy
SWEP.Primary.ConeDecrement		= 0.1					// Rate of accuracy
SWEP.Primary.KickUp			= 0.55					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.5					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.4					// Maximum up recoil (stock)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.IronFOV			= 40					// How much you 'zoom' in. Less is more! 
SWEP.Secondary.ScopeZoom		= 4					// How much the scope magnifies
SWEP.Secondary.UseACOG			= false	
SWEP.Secondary.UseMilDot		= false		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex		= true	
SWEP.Secondary.UseRangefinder		= false	
SWEP.ScopeScale 			= 0.5					// This is the size of the scope overlay
SWEP.ReticleScale 			= 1.2					// This is the size of the scope crosshairs
SWEP.CrossScale 			= 0.07
SWEP.SightMode				= 2

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.Silenceable			= false
SWEP.Silenced				= false
SWEP.BurstCapable			= false

SWEP.HasIronModel			= 1
SWEP.IronVModel				= "models/weapons/v_GDCIROFAL.mdl"
SWEP.IronWModel				= "models/weapons/w_FALIRO.mdl"
SWEP.HasRDotModel			= 1
SWEP.RDotVModel				= "models/weapons/v_GDCW_FALRDS.mdl"
SWEP.RDotWModel				= "models/weapons/w_FALIRO.mdl"
SWEP.HasHoloModel			= 1
SWEP.HoloVModel				= "models/weapons/v_GDCW_FALHOL.mdl"
SWEP.HoloWModel				= "models/weapons/w_FALIRO.mdl"
SWEP.HasACOGModel			= 1
SWEP.ACOGVModel				= "models/weapons/v_FAL_SNIPE.mdl"
SWEP.ACOGWModel				= "models/weapons/w_GDCFAL.mdl"

SWEP.IronSightsPos = Vector (2.9291, 0, 0.832)
SWEP.IronSightsAng = Vector (-1.8143, 1.0776, 0)
SWEP.SightsPos = Vector (2.9291, 0, 0.832)
SWEP.SightsAng = Vector (-1.8143, 1.0776, 0)
SWEP.RunSightsPos = Vector (-1.9636, -1.8965, 1.1305)
SWEP.RunSightsAng = Vector (-19.5185, -42.292, 19.3397)
SWEP.WallSightsPos = Vector (0.2442, -11.6177, -3.9856)
SWEP.WallSightsAng = Vector (59.2164, 1.6346, -1.8014)

SWEP.ISPos = Vector (2.854, -2.2612, 1.5607)
SWEP.ISAng = Vector (-2.623, 0.9674, 0)
SWEP.RSPos = Vector (2.969, 0, 1.4772)
SWEP.RSAng = Vector (-2.2447, 1.1258, 0)
SWEP.HSPos = Vector (2.9291, 0, 0.832)
SWEP.HSAng = Vector (-1.8143, 1.0776, 0)
SWEP.ASPos = Vector (2.7876, -2.3711, 0.9477)
SWEP.ASAng = Vector (0, 0, 0)