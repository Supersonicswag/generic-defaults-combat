--------NPC Battle Cleanup Mod
----------By: Major Victory
include("autorun/NPCBC_Filter.lua")

settingstable = {}
settingstable[1] = {"Ragdoll_Cleanup_Enabled",1}
settingstable[2] = {"Ragdoll_Cleanup_RemoveAll",0}
settingstable[3] = {"Ragdoll_Cleanup_Interval",0.1}
settingstable[4] = {"Ragdoll_Cleanup_NoFadeTime",0.3}
settingstable[5] = {"Ragdoll_Cleanup_FadeTime",0.4}
settingstable[6] = {"Weapon_Cleanup_Enabled",1}
settingstable[7] = {"Weapon_Cleanup_Filter",0}
settingstable[8] = {"Weapon_Cleanup_Interval",0.1}
settingstable[9] = {"Weapon_Cleanup_NoFadeTime",3}
settingstable[10] = {"Weapon_Cleanup_FadeTime",0.5}

for i=1,#settingstable do
	local convar = settingstable[i][1]
	local default = settingstable[i][2]
	if !ConVarExists( convar ) then
		CreateConVar(convar,default)
	end
end

NextRagdollCleanup = 0
NextWeaponCleanup = 0
NPCRagdolls = {}
DroppedWeapons = {}
local function Think()
	CleanRagdolls = util.tobool(GetConVarNumber("Ragdoll_Cleanup_Enabled"))
	CleanWeapons = util.tobool(GetConVarNumber("Weapon_Cleanup_Enabled"))
	RagdollCleanupInterval = GetConVarNumber("Ragdoll_Cleanup_Interval")
	WeaponCleanupInterval = GetConVarNumber("Weapon_Cleanup_Interval")

	if CleanWeapons then
		if CurTime() >= NextWeaponCleanup then
			NextWeaponCleanup = CurTime() + WeaponCleanupInterval
			GetDroppedWeapons()
		end

	end
	if CleanRagdolls then
		if CurTime() >= NextRagdollCleanup then
			NextRagdollCleanup = CurTime() + RagdollCleanupInterval
			GetDeadRagdolls()
		end
	end
	//continue doing the ones already found
	if #DroppedWeapons > 0 then
		DroppedWeapons = FadeThink(DroppedWeapons,"Weapon")
	end
	if #NPCRagdolls > 0 then
		NPCRagdolls = FadeThink(NPCRagdolls,"Ragdoll")
	end
end

hook.Add("Think","NPCBC_Think",Think)

function GetDroppedWeapons()
	local itemtable = {}
	if !util.tobool(GetConVarNumber("Weapon_Cleanup_Filter")) then
		itemtable = table.Add(itemtable, ents.FindByClass("weapon_*"))
		itemtable = table.Add(itemtable, ents.FindByClass("gdcw_*"))
		itemtable = table.Add(itemtable, ents.FindByClass("ai_weapon_*"))
		itemtable = table.Add(itemtable, ents.FindByClass("item_ammo_ar2_altfire"))
		itemtable = table.Add(itemtable, ents.FindByClass("item_healthvial"))
	else
		itemtable = CustomFilter
	end
	for k,gun in pairs(itemtable) do
		if gun and gun:IsValid() and gun:GetOwner() == NULL then
			local add = true
			if #DroppedWeapons > 0 then
				for k,v in pairs(DroppedWeapons) do
					if v and v.Entity:EntIndex() == gun:EntIndex() then add = false end
				end
			end
			if (add) then
				local Entry = { Entity = gun, EntryTime = CurTime() }
				table.insert(DroppedWeapons, Entry)
			end
		end
	end
end

function GetDeadRagdolls()
	local RagdollRemoveAll = util.tobool(GetConVarNumber("Ragdoll_Cleanup_RemoveAll"))

	local ragdolltable = {}
	ragdolltable = table.Add(ragdolltable, ents.FindByClass("prop_ragdoll"))
	ragdolltable = table.Add(ragdolltable, ents.FindByClass("raggib"))

	for k,ragdoll in pairs(ragdolltable) do
		if ragdoll and ragdoll:IsValid() then
			//Dead npc's no longer have OnDieFunctions
			if !ragdoll:GetTable().OnDieFunctions or RagdollRemoveAll then
				local add = true
				if #NPCRagdolls > 0 then
					for k,v in pairs(NPCRagdolls) do
						if v and v.Entity:EntIndex() == ragdoll:EntIndex() then add = false end
					end
				end
				if (add) then
					local Entry = { Entity = ragdoll, EntryTime = CurTime() }
					table.insert(NPCRagdolls, Entry)
				end
			end
		end
	end
end

function FadeThink(enttable,type)
	local NoFadeTime = GetConVarNumber(type.."_Cleanup_NoFadeTime")
	local FadeTime = GetConVarNumber(type.."_Cleanup_FadeTime")
	for k,v in pairs(enttable) do
		if v and v.Entity:IsValid() then
			if type == "Weapon" and v.Entity:GetOwner() != NULL then
				v.Entity:SetColor( 255, 255, 255, 255 )
				enttable[k] = nil
			end
			local Pause = v.EntryTime + NoFadeTime
			local End = Pause + FadeTime
			local EntColor = v.Entity:GetColor()
			if End <= CurTime() then
				v.Entity:Remove()
				enttable[k] = nil
			end
			if Pause <= CurTime() then
				if type == "Ragdoll" then v.Entity:SetNotSolid(true) end
				local Alpha = 255 * ((End - CurTime())/FadeTime)
				v.Entity:SetColor( 255, 255, 255, Alpha )
			end
		else
			enttable[k] = nil
		end
	end
	return enttable
end

local function DEBUG_PrintTable(pl, command, arg)
	if arg[1] then
		local tabletoprint = {}
		if arg[1] == "Weapons" then tabletoprint = DroppedWeapons end
		if arg[1] == "NPCs" then tabletoprint = NPCRagdolls end
		Msg(table.ToString(tabletoprint,arg[1].." Table",true).."\n")
	end
end
concommand.Add("npcbc_printtable", DEBUG_PrintTable)

local function DEBUG_PrintNPCInfo(pl, command, arg)
	local traceline = {}
	traceline.start = pl:GetShootPos()
	traceline.endpos = pl:GetShootPos() + pl:GetAimVector() * 4096
	local trace = util.TraceLine(traceline)
	if (trace.Hit and trace.Entity and trace.Entity:IsValid()) then
		local Ent = trace.Entity
		Msg("==================================================== Class ["..Ent:GetClass().."]\n")
		Msg("Name: "..Ent:GetName().."\n")
		Msg("Model: "..Ent:GetModel().."\n")
		Msg("Owner: "..Ent:GetOwner():__tostring().."\n")
		Msg("Parent: "..Ent:GetParent():__tostring().."\n")
		Msg("Move Type: "..Ent:GetMoveType().."\n")
		if (Ent:GetTable().OnDieFunctions) then
			Msg("Has Die Functions!\n")
		else
			Msg("Does Not Have Die Functions!\n")
		end
		Msg(table.ToString(Ent:GetTable(),Ent:GetClass().." Functions",true).."\n")
	end
end
concommand.Add("npcbc_printnpcinfo", DEBUG_PrintNPCInfo)