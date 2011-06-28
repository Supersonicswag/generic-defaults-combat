// Variables that are used on both client and server
SWEP.Category				= "Generic Default's Weapons"
SWEP.Author				= "Generic Default"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 		// Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 		// Should be "2" for CSS models or "1" for hl2 models
SWEP.DrawCrosshair			= false		// Hell no, crosshairs r 4 nubz!
SWEP.ViewModelFOV			= 65		// How big the gun will look
SWEP.ViewModelFlip			= true		// True for CSS models, False for HL2 models


SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false


SWEP.Primary.Sound 			= Sound("")				// Sound of the gun
SWEP.Primary.Round1 			= ("")					// Buckshot
SWEP.Primary.Round2			= ("")					// Slug
SWEP.Primary.Round3 			= ("")					// Door breaching round
SWEP.Primary.Round4 			= ("")					// FRAG-12 grenade
SWEP.Primary.AmmoSwitch 			= 1
SWEP.Primary.MRAD			= 0					// Accuracy of pellets
SWEP.Primary.Pellets			= 0					// Numba of pellets
SWEP.Primary.RPM				= 0					// This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 0					// Size of a clip
SWEP.Primary.DefaultClip			= 0					// Default number of bullets in a clip
SWEP.Primary.KickUp			= 0					// Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0					// Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 0					// Maximum side recoil (koolaid)
SWEP.Primary.Automatic			= true					// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"					// What kind of ammo
SWEP.Primary.Reloading			= false					// Reloading function

SWEP.Secondary.ClipSize			= 0					// Size of a clip
SWEP.Secondary.DefaultClip			= 0					// Default number of bullets in a clip
SWEP.Secondary.Automatic			= false					// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.IronFOV			= 0					// How much you 'zoom' in. Less is more! 

SWEP.data 				= {}					-- The starting firemode
SWEP.data.ironsights			= 1

SWEP.IronSightsPos = Vector (2.4537, 1.0923, 0.2696)
SWEP.IronSightsAng = Vector (0.0186, -0.0547, 0)

function SWEP:Initialize()
	util.PrecacheSound(self.Primary.Sound)
	self.Reloadaftershoot = 0 				-- Can't reload when firering
	if !self.Owner:IsNPC() then
		self:SetWeaponHoldType("shotgun")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
	end
	if SERVER and self.Owner:IsNPC() then
		self:SetWeaponHoldType("shotgun")                          	-- Hold type style ("ar2" "pistol" "shotgun" "rpg" "normal" "melee" "grenade" "smg")
		self:SetNPCMinBurst(1)			
		self:SetNPCMaxBurst(1)			// None of this really matters but you need it here anyway
		self:SetNPCFireRate(5)	
		self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
	end
end

function SWEP:Deploy()
	self:SetWeaponHoldType("shotgun")                          	// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight false
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	if !self.Owner:IsNPC() then self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration() end
	return true
	end


function SWEP:Precache()
	util.PrecacheSound(self.Primary.Sound)
	util.PrecacheSound("Buttons.snd14")
end


function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() then

		if self.Primary.AmmoSwitch==1 then
		for i=1, self.Primary.Pellets do		self:FireRound1() end end
		if self.Primary.AmmoSwitch==2 then 	self:FireRound2() end
		if self.Primary.AmmoSwitch==3 then 	self:FireRound3() end
		if self.Primary.AmmoSwitch==4 then 	self:FireRound4() end

		self.Weapon:EmitSound(self.Primary.Sound)
		self.Weapon:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		local fx 		= EffectData()
		fx:SetEntity(self.Weapon)
		fx:SetOrigin(self.Owner:GetShootPos())
		fx:SetNormal(self.Owner:GetAimVector())
		fx:SetAttachment(self.MuzzleAttachment)
		util.Effect("gdcw_muzzle",fx)
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Owner:MuzzleFlash()
		self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))
	end
end

function SWEP:FireRound1()
	aim = self.Owner:GetAimVector()
	side = aim:Cross(Vector(0,0,1))
	up = side:Cross(aim)
	pos = self.Owner:GetShootPos()+(side*math.Rand(-1,1)+up*math.Rand(-1,1)):GetNormalized()*10
	if SERVER then
		local rocket = ents.Create(self.Primary.Round1)
		if !rocket:IsValid() then return false end
		rocket:SetAngles(aim:Angle()+Angle(90,0,0)+Angle(math.Rand(-self.Primary.MRAD*0.0573,self.Primary.MRAD*0.0573), math.Rand(-self.Primary.MRAD*0.0573,self.Primary.MRAD*0.0573), 0 ) )
		rocket:SetPos(pos)
		rocket:SetOwner(self.Owner)
		rocket:Spawn()
		rocket:Activate()
		end
		if !self.Owner:IsNPC() then
		local anglo = Angle(math.Rand(-self.Primary.KickDown,self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		self.Owner:ViewPunch(anglo)
		if !MULTIPLAYER then
		angle = self.Owner:EyeAngles() - anglo
		self.Owner:SetEyeAngles(angle)			// Setting eye angles lags in MP, only do it in SP
		end
		end
end

function SWEP:FireRound2()
	if (self:GetIronsights() == true) and self.Owner:KeyDown(IN_ATTACK2) then
	aim = self.Owner:GetAimVector()
	else 
	aim = self.Owner:GetAimVector()+Vector(math.Rand(-0.02,0.02), math.Rand(-0.02,0.02),math.Rand(-0.02,0.02))
	end
	pos = self.Owner:GetShootPos()
	if SERVER then
		local rocket = ents.Create(self.Primary.Round2)
		if !rocket:IsValid() then return false end
		rocket:SetAngles(aim:Angle()+Angle(90,0,0))
		rocket:SetPos(pos)
		rocket:SetOwner(self.Owner)
		rocket:Spawn()
		rocket:Activate()
		end
		if !self.Owner:IsNPC() then
		local anglo = Angle(math.Rand(-self.Primary.KickDown,self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		self.Owner:ViewPunch(anglo)
		end
end

function SWEP:FireRound3()
 	local trace = self.Owner:GetEyeTrace()
	if trace.HitPos:Distance(self.Owner:GetShootPos()) > 50 then return end
	if trace.Entity:GetClass() == "prop_door_rotating" and SERVER then
			local effectdata = EffectData()
			effectdata:SetOrigin(trace.HitPos)
			effectdata:SetNormal(trace.HitNormal)
			effectdata:SetRadius(trace.MatType)
			effectdata:SetScale(1.5)
			util.Effect( "gdcw_universal_impact", effectdata )
		trace.Entity:Fire("open", "", 0.001)
		trace.Entity:Fire("unlock", "", 0.001)
		local pos = trace.Entity:GetPos()
		local ang = trace.Entity:GetAngles()
		local model = trace.Entity:GetModel()
		local skin = trace.Entity:GetSkin()
		local smoke = EffectData()
		smoke:SetOrigin(pos)
		trace.Entity:SetNotSolid(true)
		trace.Entity:SetNoDraw(true)
		local function ResetDoor(door, fakedoor)
		door:SetNotSolid(false)
		door:SetNoDraw(false)
		fakedoor:Remove()
		end
		local norm = (pos - self.Owner:GetPos()):Normalize()
		local push = 10000 * norm
		local ent = ents.Create("prop_physics")
		ent:SetPos(pos)
		ent:SetAngles(ang)
		ent:SetModel(model)
		if(skin) then
		ent:SetSkin(skin)
		end
		ent:Spawn()
		timer.Simple(0.01, ent.SetVelocity, ent, push)               
		timer.Simple(0.01, ent:GetPhysicsObject().ApplyForceCenter, ent:GetPhysicsObject(), push)
		timer.Simple(25, ResetDoor, trace.Entity, ent)
		end
		if !self.Owner:IsNPC() then
		local anglo = Angle(math.Rand(-self.Primary.KickDown,self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		self.Owner:ViewPunch(anglo)
		end
end

function SWEP:FireRound4()
	if (self:GetIronsights() == true) and self.Owner:KeyDown(IN_ATTACK2) then
	aim = self.Owner:GetAimVector()
	else 
	aim = self.Owner:GetAimVector()+Vector(math.Rand(-0.02,0.02), math.Rand(-0.02,0.02),math.Rand(-0.02,0.02))
	end
	pos = self.Owner:GetShootPos()
	if SERVER then
		local rocket = ents.Create(self.Primary.Round4)
		if !rocket:IsValid() then return false end
		rocket:SetAngles(aim:Angle()+Angle(90,0,0))
		rocket:SetPos(pos)
		rocket:SetOwner(self.Owner)
		rocket:Spawn()
		rocket:Activate()
		end
		if !self.Owner:IsNPC() then
		local anglo = Angle(math.Rand(-self.Primary.KickDown,self.Primary.KickUp), math.Rand(-self.Primary.KickHorizontal,self.Primary.KickHorizontal), 0)
		self.Owner:ViewPunch(anglo)
		end
end

function SWEP:SecondaryAttack()
	return false
end

function SWEP:Reload()

	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
	timer.Simple( 0.4, self.InsertShell, self )		

	self.Owner:SetFOV( 0, 0.45 )
	self:SetIronsights(false)
	return
end

function SWEP:InsertShell()
	if self.Weapon:Clip1() < self.Primary.ClipSize then
	self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
	self.Weapon:SetClip1(self.Weapon:Clip1()+1)
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	end

	if self.Weapon:Clip1() < self.Primary.ClipSize then 	
	timer.Simple( 0.4, self.InsertShell, self )		
	end

	if self.Weapon:Clip1() == self.Primary.ClipSize then
	timer.Simple(0.4, function()
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
	end) 
	end
end
/*---------------------------------------------------------
IronSight
---------------------------------------------------------*/
function SWEP:IronSight()

	if !self.Owner:IsNPC() then
	if self.ResetSights and CurTime() >= self.ResetSights then
	self.ResetSights = nil
	self:SendWeaponAnim(ACT_VM_IDLE)
	end end

	if self.Owner:KeyDown(IN_USE) and self:CanPrimaryAttack() || self.Owner:KeyDown(IN_SPEED) then		// If you hold E and you can shoot then
	self.Weapon:SetNextPrimaryFire(CurTime()+0.3)				// Make it so you can't shoot for another quarter second
	self:SetWeaponHoldType("passive")                          			// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg
	self.IronSightsPos = self.RunSightsPos					// Hold it down
	self.IronSightsAng = self.RunSightsAng					// Hold it down
	self:SetIronsights(true, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )
	end								

	if self.Owner:KeyReleased(IN_USE) || self.Owner:KeyReleased (IN_SPEED) then	// If you release E then
	self:SetWeaponHoldType("shotgun")                          			// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self:SetIronsights(false, self.Owner)					// Set the ironsight true
	self.Owner:SetFOV( 0, 0.3 )
	end								// Shoulder the gun

	if self.Owner:KeyPressed(IN_WALK) then		// If you are holding ALT (walking slow) then
	self:SetWeaponHoldType("ar2")                      	// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	end					// Hold it at the shoulder (Pro!)

	if !self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_SPEED) then

		if self.Owner:KeyPressed(IN_ATTACK2) then
				if !self.Owner:KeyDown(IN_DUCK) and !self.Owner:KeyDown(IN_WALK) then
				self:SetWeaponHoldType("rpg")
				end
			self.Owner:SetFOV( self.Secondary.IronFOV, 0.3 )
			self.IronSightsPos = self.SightsPos					// Bring it up
			self.IronSightsAng = self.SightsAng					// Bring it up
			self:SetIronsights(true, self.Owner)
			-- Set the ironsight true

			if CLIENT then return end
 		end
	end

	if self.Owner:KeyReleased(IN_ATTACK2) and !self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_SPEED) then
	self:SetWeaponHoldType("shotgun")                          			// Hold type styles; ar2 pistol shotgun rpg normal melee grenade smg slam fist melee2 passive knife
	self.Owner:SetFOV( 0, 0.3 )
	self:SetIronsights(false, self.Owner)
	if CLIENT then return end
	end

		if self.Owner:KeyDown(IN_ATTACK2) and !self.Owner:KeyDown(IN_USE) and !self.Owner:KeyDown(IN_SPEED) then
		self.SwayScale 	= 0.05
		self.BobScale 	= 0.05
		else
		self.SwayScale 	= 1.0
		self.BobScale 	= 1.0
		end
end
/*---------------------------------------------------------
Switch Ammo
---------------------------------------------------------*/
function SWEP:SwitchAmmo()
	if self.Owner:KeyDown(IN_USE) and self.Owner:KeyPressed(IN_ATTACK2) then		// If you hold E and click then
	self.Weapon:SetNextPrimaryFire(CurTime()+1)					// Make it so you can't shoot for another quarter second
	self.Primary.AmmoSwitch = self.Primary.AmmoSwitch + 1
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
	timer.Simple(0.6, function() self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH) end)

	if self.Primary.AmmoSwitch==1 || self.Primary.AmmoSwitch>4 then self.Owner:PrintMessage( HUD_PRINTCENTER, "Buckshot Rounds" ) end
	if self.Primary.AmmoSwitch==2 then self.Owner:PrintMessage( HUD_PRINTCENTER, "Slug Rounds" ) end
	if self.Primary.AmmoSwitch==3 then self.Owner:PrintMessage( HUD_PRINTCENTER, "Breaching Rounds" ) end
	if self.Primary.AmmoSwitch==4 then self.Owner:PrintMessage( HUD_PRINTCENTER, "FRAG-12 Rounds" ) end
	end
	
	if self.Primary.AmmoSwitch>4 then
	self.Primary.AmmoSwitch = 1 end

end
/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function SWEP:Think()
if self.Owner:KeyPressed(IN_RELOAD) then
self:Reload()
end
self:IronSight()
self:SwitchAmmo()

end


/*---------------------------------------------------------
GetViewModelPosition
---------------------------------------------------------*/
local IRONSIGHT_TIME = 0.3
-- Time to enter in the ironsight mod

function SWEP:GetViewModelPosition(pos, ang)

	if (not self.IronSightsPos) then return pos, ang end

	local bIron = self.Weapon:GetNWBool("Ironsights")

	if (bIron != self.bLastIron) then
		self.bLastIron = bIron
		self.fIronTime = CurTime()

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
