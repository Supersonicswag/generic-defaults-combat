
ENT.Type 			= "anim"
ENT.Base 			= "base_gmodentity"
ENT.PrintName		= "NPC Spawner"
ENT.Author			= "Devenger"
ENT.Purpose			= "NPC spawner."

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model1			= "models/props_c17/streetsign004e.mdl"
ENT.Model2			= "models/props_c17/streetsign004f.mdl"

ENT.Conversions = {
	{ "Headcrab", "npc_headcrab" },    
	{ "Headcrab Poison", "npc_headcrab_poison" },
	{ "Zombie", "npc_zombie" },
	{ "Antlion", "npc_antlion" },
	{ "Antlion Guard", "npc_antlionguard" },
	{ "Crow", "npc_crow" },
	{ "Citizen", "npc_citizen" },
	{ "Rebel", "Citizen_rebel" },
	{ "Rebel Medic", "Citizen_medic" },
	{ "C17 Downtrodden", "Citizen_dt" },
	{ "Combine", "npc_combine_s" },
	{ "Fast Zombie", "npc_fastzombie" },
	{ "Poison Zombie", "npc_poisonzombie" },
	{ "Fast Headcrab", "npc_headcrab_fast" },
	{ "Manhack", "npc_manhack" },
	{ "Rollermine", "npc_rollermine" },
	{ "Vortigaunt", "npc_vortigaunt" },
	{ "Crowbar", "weapon_crowbar" },
	{ "Stunstick", "weapon_stunstick" },
	{ "Pistol", "weapon_pistol" },
	{ "SMG1", "weapon_smg1" },
	{ "AR2", "weapon_ar2" },
	{ "Shotgun", "weapon_shotgun" },
	{ "RPG", "weapon_rpg" },
	{ "Package", "weapon_citizenpackage" },
	{ "Suitcase", "weapon_citizensuitcase" },
	{ "None", "NULL" },
	{ "Random Rebel Weapon", "random_rebel"},
	{ "Random Combine Weapon", "random_combine"},
	{ "Random Citizen Item", "random_citizen"}
}

function ENT:UpdateLabel()
	otxt = "NPC: "..self.Entity:GetNWString("npc").."\nWeapon: "..self.Entity:GetNWString("weapon").."\nDelay: "..self.Entity:GetNWString("delay").."\nMaximum: "..self.Entity:GetNWString("maximum")
	otxt = self:Convert (otxt)
	self:SetOverlayText (otxt)
end

function ENT:Convert (text)
	for k,v in pairs (self.Conversions) do
		text = string.gsub (text, v[2], v[1])
	end
	return text
end
