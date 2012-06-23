// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Medium range assault weapon."
SWEP.Instructions			= "Round: 5.56 \nVelocity: ~800 m/s \nSights: Iron, Red Dot, Holo, ACOG \nCapacity: 30 rounds \nRate of Fire: 750 rounds per minute"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 60
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_gdcw_G36Caco.mdl"
SWEP.WorldModel				= "models/weapons/w_g36c.mdl"
SWEP.Base 				= "gdcw_base_assault_emenu"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("G36F.single")
SWEP.Primary.Ball 			= ("gdcwa_5.56x45_ball")		// FMJ round
SWEP.Primary.Hollow 			= ("gdcwa_5.56x45_hollow")		// Hollow point round
SWEP.Primary.AP 			= ("gdcwa_5.56x45_ap")			// Armor Piercing round
SWEP.Primary.HEI 			= ("gdcwa_5.56x45_hei")			// High Explosive Incendiary round
SWEP.Primary.RPM			= 750					// This is in Rounds Per Minute
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
SWEP.SightMode				= 3

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.Silenceable			= true
SWEP.Silenced				= false
SWEP.BurstCapable			= false

SWEP.HasIronModel			= 1
SWEP.IronVModel				= "models/weapons/v_gdcw_G36Ciro.mdl"
SWEP.IronWModel				= "models/weapons/w_g36c.mdl"
SWEP.HasRDotModel			= 1
SWEP.RDotVModel				= "models/weapons/v_gdcw_G36Crds.mdl"
SWEP.RDotWModel				= "models/weapons/w_g36c.mdl"
SWEP.HasHoloModel			= 1
SWEP.HoloVModel				= "models/weapons/v_gdcw_G36Chol.mdl"
SWEP.HoloWModel				= "models/weapons/w_g36c.mdl"
SWEP.HasACOGModel			= 1
SWEP.ACOGVModel				= "models/weapons/v_gdcw_G36Caco.mdl"
SWEP.ACOGWModel				= "models/weapons/w_g36c.mdl"

SWEP.IronSightsPos = Vector (3.0729, -3.3862, 0.9386)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (3.0729, -3.3862, 0.9386)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (-4.0726, -2.2463, 0.5766)
SWEP.RunSightsAng = Vector (-10.8855, -47.285, 11.5733)
SWEP.WallSightsPos = Vector (0.2442, -11.6177, -3.9856)
SWEP.WallSightsAng = Vector (59.2164, 1.6346, -1.8014)

SWEP.ISPos = Vector (2.9453, 0, 1.3595)
SWEP.ISAng = Vector (0.5317, 0.2754, 0)
SWEP.RSPos = Vector (2.967, 0, 0.8302)
SWEP.RSAng = Vector (1.8624, 0.3413, 0)
SWEP.HSPos = Vector (2.8715, 0, 0.5942)
SWEP.HSAng = Vector (0, 0, 0)
SWEP.ASPos = Vector (3.0729, -3.3862, 0.9386)
SWEP.ASAng = Vector (0, 0, 0)