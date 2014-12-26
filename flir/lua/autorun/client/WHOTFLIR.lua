-- Clientside FLIR Infrared
-- Version 1
-- by Generic Default

if not CLIENT then return end -- Clientside only

local sndOn = Sound( "items/nvg_on.wav" )
local sndOff = Sound( "items/nvg_off.wav" )

local DoXRay = false

local DefMats = {}
local DefClrs = {}

-- A most likely futile attempt to make things faster
local pairs = pairs
local string = string
local render = render

local ColorTab = 
{
	[ "$pp_colour_addr" ] 		= -0.6,
	[ "$pp_colour_addg" ] 		= -0.6,
	[ "$pp_colour_addb" ] 		= -0.2,
	[ "$pp_colour_brightness" ] 	= 0.1,
	[ "$pp_colour_contrast" ] 	= 1.2,
	[ "$pp_colour_colour" ] 	= 0,
	[ "$pp_colour_mulr" ] 		= 0,
	[ "$pp_colour_mulg" ] 		= 0,
	[ "$pp_colour_mulb" ] 		= 0,
}


-- This is where we replace the entities' materials
-- This is so unoptimized it's almost painful : (
local function XRayMat()

	for k,v in pairs( ents.GetAll() ) do
	
		if string.sub( (v:GetModel() or "" ), -3) == "mdl" then -- only affect models
		
			-- Inefficient, but not TOO laggy I hope
			local r = v:GetColor().r
			local g = v:GetColor().g
			local b = v:GetColor().b
			local a = v:GetColor().a
			if (a > 80) then
				
				local entmat = v:GetMaterial()

				if v:IsNPC() or v:IsPlayer() then -- It's alive!
				
					if not (r == 255 and g == 255 and b == 255 and a == 255) then -- Has our color been changed?
						DefClrs[ v ] = Color( r, g, b, a )  -- Store it so we can change it back later
						v:SetColor( 255, 255, 255, 255 ) -- Set it back to what it should be now
					end
					
					if entmat ~= "xray/living" then -- Has our material been changed?
						DefMats[ v ] = entmat -- Store it so we can change it back later
						v:SetMaterial( "xray/living" ) -- The xray matierals are designed to show through walls
					end
					
				else -- It's a prop or something
				
					if not (r == 255 and g == 255 and b == 255 and a == 255) then
						DefClrs[ v ] = Color( r, g, b, a )
						v:SetColor( 255, 255, 255, 255 )
					end
				
					if entmat ~= "xray/prop" then
						DefMats[ v ] = entmat
						v:SetMaterial( "xray/living" )
					end

				end
			end
		
		end

	end
		
end


-- This is where we do the post-processing effects.
local function XRayFX() 

	-- Colormod
	DrawColorModify( ColorTab ) 
	DrawBloom( 0.0, 1, 10, 10, 1, 0.0, 1, 1, 1 )
	//DrawBloom( number Darken, number Multiply, number SizeX, number SizeY, number Passes, number ColorMultiply, number Red, number Green, number Blue )

end 


local function FLIRToggle()
 
	if DoXRay then
	
		hook.Remove( "RenderScene", "XRay_ApplyMats" )
		hook.Remove( "RenderScreenspaceEffects", "XRay_RenderModify" )

		DoXRay = false
		//surface.PlaySound( sndOff )
		
		-- Set colors and materials back to normal
		for ent,mat in pairs( DefMats ) do
			if ent:IsValid() then
				ent:SetMaterial( mat )
			end
		end
		
		for ent,clr in pairs( DefClrs ) do
			if ent:IsValid() then
				ent:SetColor( clr.r, clr.g, clr.b, clr.a )
			end
		end
		
		-- Clean up our tables- we don't need them anymore.
		DefMats = {}
		DefClrs = {}
		
	else
	
		hook.Add( "RenderScene", "XRay_ApplyMats", XRayMat ) -- We need to call this every frame in singleplayer, otherwise the server would make the materials reset
		hook.Add( "RenderScreenspaceEffects", "XRay_RenderModify", XRayFX )

		DoXRay = true
		//surface.PlaySound( sndOn )

	end
 
end
concommand.Add( "WHOTFLIR", FLIRToggle )