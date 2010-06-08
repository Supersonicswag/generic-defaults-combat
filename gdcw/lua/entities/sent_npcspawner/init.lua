AddCSLuaFile("shared.lua")
include('shared.lua')

function DEBUG_Msg (mesg)
	--Msg (mesg)
end

util.PrecacheModel (ENT.Model1)

ENT.ComplexNPCTypes = {
	npc_citizen_medic = {class = "npc_citizen", kvs = {citizentype = 3, spawnflags = 131072}},
	npc_citizen_rebel = {class = "npc_citizen", kvs = {citizentype = 3}},
	npc_citizen_dt = {class = "npc_citizen", kvs = {citizentype = 1}},
	npc_citizen = {class = "npc_citizen", kvs = {citizentype = 2}},
	npc_combine_e = {class = "npc_combine_s", kvs = {model = "models/combine_super_soldier.mdl"}},
	npc_combine_p = {class = "npc_combine_s", kvs = {model = "models/combine_soldier_prisonguard.mdl"}}
}

ENT.npc = "npc_combine_s"
ENT.weapon = "weapon_smg1"
ENT.delay = 5
ENT.maximum = 5
ENT.spawnheight = 16
ENT.spawnradius = 16
ENT.toggleable = 1
ENT.autoremove = 1
ENT.healthmul = 1
ENT.on = 0
ENT.customsquads = 0
ENT.squadoverride = 1
ENT.onkey = 1
ENT.offkey = 2

ENT.RandomWeaponSets = {
	random_rebel = {"weapon_pistol", "weapon_smg1", "weapon_ar2", "weapon_shotgun"},
	random_combine = {"weapon_smg1", "weapon_ar2", "weapon_shotgun"},
	random_citizen = {"weapon_citizenpackage", "weapon_citizensuitcase", "NULL"}
}

ENT.DefaultSquads = {
	combine = {"npc_combine_s", "npc_metropolice", "npc_manhack", "npc_rollermine"},
	resistance = {"npc_citizen", "npc_vortigaunt"},
	antlions = {"npc_antlion", "npc_antlionguard"},
	zombies = {"npc_zombie", "npc_fastzombie", "npc_poisonzombie", "npc_headcrab", "npc_headcrab_fast", "npc_headcrab_black"}
}

ENT.active = 0
ENT.LastSpawn = CurTime()
ENT.LastChange = 0
ENT.Spawned = 0

ENT.SpawnedEntities = {}

function ENT:SpawnFunction(ply, tr)
	if not tr.Hit then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create ("sent_npcspawner")
	ent:SetPos (SpawnPos)
	ent:Spawn()
	ent:Activate()
	return ent
end

function ENT:Initialize ()
	self.Entity:SetModel (self.Model1)
	self.Entity:PhysicsInit (SOLID_VPHYSICS)
	self.Entity:SetMoveType (MOVETYPE_VPHYSICS)
	self.Entity:SetSolid (SOLID_VPHYSICS) 
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	self.LastSpawn = CurTime()
	self.Spawned = 0
	self.SpawnedEntities = {}
	numpad.OnDown (player.GetByID(tonumber(self.ply)), self.onkey, "NPCSpawnerOn", self.Entity)
	numpad.OnDown (player.GetByID(tonumber(self.ply)), self.offkey, "NPCSpawnerOff", self.Entity)
	local function NPCSpawnerOn (pl, ent, pid)
		DEBUG_Msg ("Entity: "..tostring(ent).." getting turned on\n")
		if ent:IsValid() then
			ent:SetKeyValue ("active", 1)
		else
			DEBUG_Msg ("Invalid entity!\n")
		end
	end
	numpad.Register ("NPCSpawnerOn", NPCSpawnerOn)
	
	local function NPCSpawnerOff (pl, ent, pid)
		DEBUG_Msg ("Entity: "..tostring(ent).." getting turned off\n")
		if ent:IsValid() then
			ent:SetKeyValue ("active", 0)
		else
			DEBUG_Msg ("Invalid entity!\n")
		end
	end
	
	numpad.Register ("NPCSpawnerOff", NPCSpawnerOff)
end

function ENT:Think ()
	if SERVER then
		if self.Spawned < 0 then self.Spawned = 0 end
		if self.active == 0 then
			self.Entity:SetColor (255, 0, 0, 255)
			return
		end
		self.Entity:SetColor (0, 255, 0, 255)
		DEBUG_Msg ("["..self.Spawned.."] ")
		for k,v in pairs (self.SpawnedEntities) do
			if not v:IsValid () then
				self.Spawned = self.Spawned - 1
				self.SpawnedEntities[k] = nil
				if self.Spawned <= self.maximum and self.Spawned + 1 >= self.maximum then
					self.LastSpawn = CurTime()
				end
			end
		end
		if self.Spawned >= self.maximum then return end
		if self.LastSpawn + self.delay < CurTime() then
			DEBUG_Msg ("\nSpawn.\n")
			--find the class
			class = self.npc
			kvs = {}
			for k,v in pairs (self.ComplexNPCTypes) do
				if self.npc == k then
					class = v.class
					--pick up some other data too
					kvs = v.kvs
				end
			end
			npc = ents.Create (class)
			--calc. the spawn pos.
			spawnpos = self.Entity:GetPos() + Vector ((math.random () - 0.5) * self.spawnradius * 2, (math.random () - 0.5) * self.spawnradius * 2, self.spawnheight)
			DEBUG_Msg (tostring(spawnpos).." (spawnpos) \n")
			npc:SetPos (spawnpos)
			--calc. the spawn angle (face away from spawn) (removed because too many misrotation issues)
			--[[vec = spawnpos - self.Entity:GetPos()
			norm = vec:GetNormal ()
			norm.z = 0
			DEBUG_Msg (tostring(norm).." = norm\n")
			npc:SetAngles (norm:Angle())]]
			--set the weapon
			wpn = self.weapon
			i = 0
			for k,v in pairs (self.RandomWeaponSets) do
				i = i + 1
				if i > 10 then
					DEBUG_Msg ("Something has been damaged\n")
					break
				end
				DEBUG_Msg ("k: "..k.." against "..self.weapon.."\n")
				if self.weapon == k then
					wpn = v[math.random(1, table.getn(v))]
				end
			end
			if wpn ~= "NULL" then
				npc:SetKeyValue ("additionalequipment", wpn)
			end
			--set complex keyvalues
			for k,v in pairs(kvs) do
				npc:SetKeyValue (k, v)
			end
			--set npc squad
			if self.customsquads == 1 then
				squad = "csquad"..self.squadoverride
			else
				for k,v in pairs(self.DefaultSquads) do
					DEBUG_Msg ("["..k.."]: ")
					for k2, v2 in pairs(v) do
						DEBUG_Msg ("["..v2.."]\n")
						if class == v2 then
							squad = k
						end
					end
				end
			end
			DEBUG_Msg ("Squad: "..tostring(squad).."\n")
			npc:SetKeyValue ("squadname", squad)
			npc:Spawn ()
			--set maxhealth/health
			omh = npc:GetMaxHealth()
			npc:SetMaxHealth (omh * self.healthmul)
			npc:SetHealth (omh * self.healthmul)
			--set nocollide
			if self.nocollide == 1 then
				npc:SetCollisionGroup (3)
			end
			table.insert (self.SpawnedEntities, npc)
			self.Spawned = self.Spawned + 1
			self.LastSpawn = CurTime()
		end
	end
	self:UpdateLabel()
end

function ENT:Use (activator, caller)
	if self.toggleable == 0 then return end
	if self.LastChange + 1 > CurTime() then return end
	DEBUG_Msg ("\nChange time!\n")
	if self.active == 0 then
		self.active = 1
		self.Entity:SetColor (0, 255, 0, 255)
	else
		self.active = 0
		self.Entity:SetColor (255, 0, 0, 255)
	end
	self:CheckActive ()
end

function ENT:CheckActive ()
	if self.active == 1 then
		self.Entity:SetModel (self.Model1)
		self.LastSpawn = CurTime()
	else
		self.Entity:SetModel (self.Model2)
	end
	self.Entity:SetNWString ("active", self.active)
	self.LastChange = CurTime()
end

function ENT:KeyValue (key, value)
	self[key] = tonumber(value) or value
	self.Entity:SetNWString (key, value)
	DEBUG_Msg ("["..key.." = "..value.."] ")
	if key == "delay" then
		self.LastSpawn = CurTime()
	end
	if key == "active" then
		self:CheckActive ()
	end
	self:UpdateLabel()
end

function ENT:OnRemove ()
	if self.autoremove == 1 then
		DEBUG_Msg ("autoremoving . . . \n")
		for k,v in pairs (self.SpawnedEntities) do
			v:Remove ()
		end
	end
end
