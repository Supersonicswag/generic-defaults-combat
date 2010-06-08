//this is an example of how to setup the custom filter
//CustomFilter = table.Add(CustomFilter, ents.FindByClass(<ClassName>))
//or
//CustomFilter = table.Add(CustomFilter, <Entity>)
//----

CustomFilter = {}
CustomFilter = table.Add(CustomFilter, ents.FindByClass("weapon_*"))
CustomFilter = table.Add(CustomFilter, ents.FindByClass("gdcw_*"))
CustomFilter = table.Add(CustomFilter, ents.FindByClass("ai_weapon_*"))
CustomFilter = table.Add(CustomFilter, ents.FindByClass("item_ammo_ar2_altfire"))
CustomFilter = table.Add(CustomFilter, ents.FindByClass("item_healthvial"))