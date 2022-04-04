if GetConVar("snow_tf_camo") == nil then
	CreateConVar("snow_tf_camo", 0,  {FCVAR_USERINFO, FCVAR_ARCHIVE, FCVAR_LUA_CLIENT}, "Change your Primary Weapon Camo. 0 is none and 651 is max.", 0, 651)
end

if GetConVar("snow_tf_camo_sec") == nil then
	CreateConVar("snow_tf_camo_sec", 0,  {FCVAR_USERINFO, FCVAR_ARCHIVE, FCVAR_LUA_CLIENT}, "Change your Secondary Weapon Camo. 0 is none and 651 is max.", 0, 651)
end

if GetConVar("snow_tf_camo_ter") == nil then
	CreateConVar("snow_tf_camo_ter", 0,  {FCVAR_USERINFO, FCVAR_ARCHIVE, FCVAR_LUA_CLIENT}, "Change your Tertiary Weapon Camo. 0 is none and 651 is max.", 0, 651)
end

if GetConVar("snow_tf_camo_spec") == nil then
	CreateConVar("snow_tf_camo_spec", 0,  {FCVAR_USERINFO, FCVAR_ARCHIVE, FCVAR_LUA_CLIENT}, "Change your Special Weapon Camo. 0 is none and 651 is max.", 0, 651)
end

if GetConVar("snow_tf_camo_ply") == nil then
	CreateConVar("snow_tf_camo_ply", 0,  {FCVAR_USERINFO, FCVAR_ARCHIVE, FCVAR_LUA_CLIENT}, "Change your Playermodel's Camo. 0 is none and 651 is max.", 0, 651)
end

if SERVER then

	util.AddNetworkString("Snow_Camos")
	util.AddNetworkString("Snow_Camos_Send")
	
	net.Receive("Snow_Camos",function(len, ply)

		print("Camo Received: "..ply:Nick())
		local snow_camo_id = ply:GetInfoNum("snow_tf_camo", 0)
		print(snow_camo_id)
		net.Start("Snow_Camos_Send")
		net.WriteUInt(snow_camo_id, 16)
		net.Send(ply)

	end)
	
end

if CLIENT then
	net.Receive("Snow_Camos_Send",function()
		
		local r_s = net.ReadUInt(16)
		LocalPlayer().SnowTFCamo = r_s
		print("Camo Received (CL)")
		print(r_s)

	end)
end