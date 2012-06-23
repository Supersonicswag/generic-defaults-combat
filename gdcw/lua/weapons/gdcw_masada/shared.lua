// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Medium range assault weapon."
SWEP.Instructions			= "Round: 5.56 \nVelocity: ~850 m/s \nSights: Iron \nCapacity: 30 rounds \nRate of Fire: 850 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 55
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_GDMasada.mdl"
SWEP.WorldModel				= "models/weapons/w_GDC_Masada.mdl"
SWEP.Base 				= "gdcw_base_assault_emenu"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true


SWEP.Primary.Sound			= Sound("MasadaF.single")
SWEP.Primary.Ball 			= ("gdcwa_5.56x45_ball")		// FMJ round
SWEP.Primary.Hollow 			= ("gdcwa_5.56x45_hollow")		// Hollow point round
SWEP.Primary.AP 			= ("gdcwa_5.56x45_ap")			// Armor Piercing round
SWEP.Primary.HEI 			= ("gdcwa_5.56x45_hei")			// High Explosive Incendiary round
SWEP.Primary.RPM			= 850					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30					// Size of a clip
SWEP.Primary.DefaultClip		= 31					// Default number of bullets in a clip
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
SWEP.Secondary.ScopeZoom		= 8					// How much the scope magnifies
SWEP.Secondary.UseACOG			= false	
SWEP.Secondary.UseMilDot		= false		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex		= true	
SWEP.Secondary.UseRangefinder		= false	
SWEP.ScopeScale 			= 0					// This is the size of the scope overlay
SWEP.ReticleScale 			= 1.2					// This is the size of the scope crosshairs
SWEP.CrossScale 			= 0.07

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.Silenceable			= true
SWEP.Silenced				= false

SWEP.HasIronModel			= 1
SWEP.IronVModel				= "models/weapons/v_GDMasada.mdl"
SWEP.IronWModel				= "models/weapons/w_GDC_Masada.mdl"
SWEP.HasRDotModel			= 0
SWEP.RDotVModel				= "models/weapons/v_M4A1_RDS.mdl"
SWEP.RDotWModel				= "models/weapons/w_M4A1HOLO.mdl"
SWEP.HasHoloModel			= 0
SWEP.HoloVModel				= "models/weapons/v_M4A1HOLO.mdl"
SWEP.HoloWModel				= "models/weapons/w_M4A1HOLO.mdl"
SWEP.HasACOGModel			= 0
SWEP.ACOGVModel				= "models/weapons/v_Masada_Sco.mdl"
SWEP.ACOGWModel				= "models/weapons/w_GDC_Masada.mdl"

SWEP.IronSightsPos = Vector (2.0034, 0, 0.6822)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (2.0034, 0, 0.6822)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-2.3095, -2.0514, 1.3965)
SWEP.RunSightsAng = Vector (-19.8471, -33.9181, 10)
SWEP.WallSightsPos = Vector (-0.821, -9.1122, -6.1656)
SWEP.WallSightsAng = Vector (63.6207, -1.7454, 0)

SWEP.ISPos = Vector (2.0034, 0, 0.6822)
SWEP.ISAng = Vector (0, 0, 0)
SWEP.RSPos = Vector (2.4519, 0, 0.8248)
SWEP.RSAng = Vector (0, 0, 0)
SWEP.HSPos = Vector (2.4651, 2.4751, 0.7767)
SWEP.HSAng = Vector (-2.5, 0, 0)
SWEP.ASPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.ASAng = Vector (-0.0105, -0.0061, 0)