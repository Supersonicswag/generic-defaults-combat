// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Explosives"
SWEP.Author				= "Generic Default"
SWEP.Contact				= "AIDS!"
SWEP.Purpose				= "Sploding"
SWEP.Instructions			= "Rounds:\n 90mm HEAT \nVelocity: 250 m/s \nSights: 4x Optical \nCapacity: 1 round disposable"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment		= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false	

SWEP.ViewModelFOV			= 55
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_MAT.mdl"
SWEP.WorldModel				= "models/weapons/w_GDCW_MATADOR_RL.mdl"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Round 			= ("gdcwa_matador_90mm")	
SWEP.Primary.RPM			= 20					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1					// Size of a clip
SWEP.Primary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Primary.Automatic			= false					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "RPG_Round"

SWEP.Secondary.ClipSize			= 1					// Size of a clip
SWEP.Secondary.DefaultClip		= 1					// Default number of bullets in a clip
SWEP.Secondary.Automatic		= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= ""
SWEP.Secondary.ScopeZoom		= 4

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 0.6
SWEP.ReticleScale 			= 0.5
SWEP.IronSightsPos = Vector (-3.0556, -8.6664, 1.4751)
SWEP.IronSightsAng = Vector (0, 0, 0)
SWEP.SightsPos = Vector (-3.0556, -8.6664, 1.4751)
SWEP.SightsAng = Vector (0, 0, 0)
SWEP.RunSightsPos = Vector (2.4946, -1.5644, 1.699)
SWEP.RunSightsAng = Vector (-20.1104, 35.1164, -12.959)


function SWEP:Initialize()

	if CLIENT then
	
		-- We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()
		
		-- The following code is only slightly riped off from Night Eagle
		-- These tables are used to draw things like scopes and crosshairs to the HUD.

		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight*self.ScopeScale
		self.ScopeTable.x1 = 0.5*(iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5*(iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5*(iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5*(iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1
		self.ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale -- I don't know why this works, but it does.

		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3

		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2*self.ScopeTable.l
		self.LensTable.h = 2*self.ScopeTable.l

		self.ReticleTable = {}
		self.ReticleTable.wdivider = 3.125
		self.ReticleTable.hdivider = 1.7579/self.ReticleScale		// Draws the texture at 512 when the resolution is 1600x900
		self.ReticleTable.x = (iScreenWidth/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.y = (iScreenHeight/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.w = iScreenHeight/self.ReticleTable.hdivider
		self.ReticleTable.h = iScreenHeight/self.ReticleTable.hdivider

		self.FilterTable = {}
		self.FilterTable.wdivider = 3.125
		self.FilterTable.hdivider = 1.7579/1.35	
		self.FilterTable.x = (iScreenWidth/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.y = (iScreenHeight/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.w = iScreenHeight/self.FilterTable.hdivider
		self.FilterTable.h = iScreenHeight/self.FilterTable.hdivider

	end

	if !self.Owner:IsNPC() then
		self:SetWeaponHoldType("rpg")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
	end
	if SERVER and self.Owner:IsNPC() then
		self:SetWeaponHoldType("rpg")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
		self:SetNPCMinBurst(1)			
		self:SetNPCMaxBurst(1)			// None of this really matters but you need it here anyway
		self:SetNPCFireRate(1)	
		self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
	end
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
end

function SWEP:Precache()
	util.PrecacheSound("MATADORF.single")
end


function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() then
		self:FireRocket()
		self.Weapon:EmitSound("MATADORF.single")
		self.Weapon:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)
		util.Effect("gdcw_backblast",fx)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Owner:MuzzleFlash()
		self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))

		timer.Simple( 1.5, self.Reload, self )
		timer.Simple( 2.0, self.Dump, self )

	end
end

function SWEP:FireRocket()
	local aim = self.Owner:GetAimVector()
	local pos = self.Owner:GetShootPos()

	if SERVER then
	local rocket = ents.Create(self.Primary.Round)
	if !rocket:IsValid() then return false end
	rocket:SetAngles(aim:Angle()+Angle(90,0,0))
	rocket:SetPos(pos)
	rocket:SetOwner(self.Owner)
	rocket:Spawn()
	rocket.owner = self.Owner
	rocket:Activate()
	util.ScreenShake(self.Owner:GetShootPos(), 1000, 10, 0.3, 500 )
	end
end

function SWEP:Dump()

	if SERVER then
	local launcher = ents.Create("gdcwa_matador_used")
	if !launcher:IsValid() then return false end
	launcher:SetAngles(self.Owner:GetAngles()+Angle(0,0,0))
	launcher:SetPos(self.Owner:GetPos()+Vector(0,0,50))
	launcher:Spawn()
	end

	
end
function SWEP:SecondaryAttack()
	return false
end

function SWEP:Reload()

	self.Weapon:DefaultReload(ACT_VM_RELOAD) 


	if ( self.Weapon:Clip1() < self.Primary.ClipSize ) and !self.Owner:IsNPC() then

	self.Owner:SetFOV( 0, 0.5 )
	self:SetIronsights(false, self.Owner)
	if CLIENT then return end
	self.Owner:DrawViewModel(true)

end
	
end


/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/
function SWEP:IronSight()

		
		if self.Owner:KeyPressed(IN_ATTACK2) then
		self.Owner:SetFOV( 75/self.Secondary.ScopeZoom, 0.3 )
		self.IronSightsPos = self.SightsPos					// Bring it up
		self.IronSightsAng = self.SightsAng					// Bring it up
		self:SetIronsights(true, self.Owner)
		if CLIENT then return end
		self.Owner:DrawViewModel(false)

 		elseif self.Owner:KeyDown(IN_SPEED) then
	self.Weapon:SetNextPrimaryFire(CurTime()+0.5)				// Make it so you can't shoot for another quarter second
	self:SetWeaponHoldType("passive")                          			// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg
	self.IronSightsPos = self.RunSightsPos					// Hold it down
	self.IronSightsAng = self.RunSightsAng					// Hold it down
	self:SetIronsights(true, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )						// Reset FOV
	if CLIENT then return end
	self.Owner:DrawViewModel(true)
	end								

	if self.Owner:KeyReleased(IN_SPEED) then				// If you stop running then
	self:SetWeaponHoldType("rpg")                          				// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )						// Reset FOV
	end


		if self.Owner:KeyReleased(IN_ATTACK2) and !self.Owner:KeyDown(IN_SPEED) then
		self.Owner:SetFOV( 0, 0.3 )
		self:SetIronsights(false, self.Owner)
		if CLIENT then return end
		self.Owner:DrawViewModel(true)
		end
end


function SWEP:DrawHUD()


	if  (self:GetIronsights()==true) and self.Owner:KeyDown(IN_ATTACK2) and (!self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_USE)) then

			-- Draw the SCOPE
			surface.SetDrawColor(0, 0, 0, 255)
			surface.SetTexture(surface.GetTextureID("scope/gdcw_matador"))
			surface.DrawTexturedRect(self.LensTable.x-1, self.LensTable.y, self.LensTable.w, self.LensTable.h)

			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawRect(self.QuadTable.x1 - 2.5, self.QuadTable.y1 - 2.5, self.QuadTable.w1 + 5, self.QuadTable.h1 + 5)
			surface.DrawRect(self.QuadTable.x2 - 2.5, self.QuadTable.y2 - 2.5, self.QuadTable.w2 + 5, self.QuadTable.h2 + 5)
			surface.DrawRect(self.QuadTable.x3 - 2.5, self.QuadTable.y3 - 2.5, self.QuadTable.w3 + 5, self.QuadTable.h3 + 5)
			surface.DrawRect(self.QuadTable.x4 - 2.5, self.QuadTable.y4 - 2.5, self.QuadTable.w4 + 5, self.QuadTable.h4 + 5)

//////////////////////////////////
	local trace = {}
	trace.start = self.Owner:GetShootPos()
	trace.endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector()*60000		// Laser Rangefinder
	trace.filter = self.Owner
	local tr = util.TraceLine( trace )

	self.Range = self.Owner:GetShootPos():Distance(tr.HitPos)/52.5
	self.Time = math.Round(((self.Range^1.01)/250)*100)/100
	self.Drop = math.Round((4.9*(self.Time^2))*100)/100

	draw.SimpleText( "RANGE " ..tostring(math.Round(self.Range)) .. "m","ScoreboardText",ScrW() / 3, ScrH() * (44/60),Color(130,170,70,255))			//Range in meters
	draw.SimpleText( "TIME " ..tostring(self.Time) .. "s","ScoreboardText",ScrW() / 3, ScrH() * (45/60),Color(170,130,70,255))					//Flight time in seconds
	draw.SimpleText( "DROP " ..tostring(self.Drop) .. "m","ScoreboardText",ScrW() / 3, ScrH() * (46/60),Color(230,70,70,255))					//Drop in meters
/////////////////////////////////
	end
end

function SWEP:AdjustMouseSensitivity()
     
	if self.Owner:KeyDown(IN_ATTACK2) then
        return (1/(self.Secondary.ScopeZoom/2))
    	else 
    	return 1
     	end
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function SWEP:Think()

	self:IronSight()
end

/*---------------------------------------------------------
GetViewModelPosition
---------------------------------------------------------*/
local IRONSIGHT_TIME = 0.5
-- Time to enter in the ironsight mod

function SWEP:GetViewModelPosition(pos, ang)

	if (not self.IronSightsPos) then return pos, ang end

	local bIron = self.Weapon:GetNWBool("Ironsights")

	if (bIron != self.bLastIron) then
		self.bLastIron = bIron
		self.fIronTime = CurTime()

		if (bIron) and !self.Owner:KeyDown(IN_SPEED) then	// If Ironsights and NOT RUNNING then
			self.SwayScale 	= 0.02
			self.BobScale 	= 0.02
		else
			self.SwayScale 	= 1.0
			self.BobScale 	= 1.0
		end
	end

	local fIronTime = self.fIronTime or 0

	if (not bIron and fIronTime < CurTime() - IRONSIGHT_TIME) then
		return pos, ang
	end

	local Mul = 1.0

	if (fIronTime > CurTime() - IRONSIGHT_TIME) then
		Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

		if not bIron then Mul = 1 - Mul end
	end

	local Offset	= self.IronSightsPos

	if (self.IronSightsAng) then
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), 		self.IronSightsAng.x * Mul)
		ang:RotateAroundAxis(ang:Up(), 		self.IronSightsAng.y * Mul)
		ang:RotateAroundAxis(ang:Forward(), 	self.IronSightsAng.z * Mul)
	end

	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()

	pos = pos + Offset.x * Right * Mul
	pos = pos + Offset.y * Forward * Mul
	pos = pos + Offset.z * Up * Mul

	return pos, ang
end

/*---------------------------------------------------------
SetIronsights
---------------------------------------------------------*/
function SWEP:SetIronsights(b)

	self.Weapon:SetNetworkedBool("Ironsights", b)
end

function SWEP:GetIronsights()

	return self.Weapon:GetNWBool("Ironsights")
end
