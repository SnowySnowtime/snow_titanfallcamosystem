if SERVER then return end

list.Set( "DesktopWindows", "Camo Menu", {
	title = "Weapon Camos",
	icon = "icon64/snowtime_camo.png",
	init = function( icon, window )
		SnowCamoMenu(LocalPlayer())
	end
	
} )

surface.CreateFont("SnowCamo_Primary", {
    font = "Arial",
    extended = true,
    size = 20
})

surface.CreateFont("SnowCamo_Secondary", {
    font = "Arial",
    extended = true,
    size = 15
})

function SnowCamoMenu( player )
    local ply = player
	-- i couldnt figure out how to get it to draw like this, so some borrows from draconic base.
    local w2 = ScrW()/2 
    local leftwide = w2
    local leftwidehalf = leftwide / 2
 	      	      	         
    local h2 = ScrH()
    local topwide = h2
    local topwidehalf = topwide / 2
    
    local Derma = vgui.Create("DFrame")
    Derma:SetPos( leftwidehalf/0.725, topwidehalf/6 )
    Derma:SetSize( 600, 400)
    Derma:SetTitle("Snowtime's Titanfall and Apex Camos (WORK IN PROGRESS)")
	Derma:MakePopup()
	Derma:SetBackgroundBlur(true)
	Derma:SetScreenLock(true)
	Derma:SetDraggable(true)
    Derma.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 230))
		draw.SimpleText("Camo Appearance", "SnowCamo_Primary", leftwidehalf/1.6, topwidehalf/7.5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText("*Note: Camos currently only sync locally. Others will not see your camo.", "SnowCamo_Secondary", leftwidehalf/1.6, topwidehalf/1.49, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText("Your camo will be seen on other players weapons. This will be fixed in the future.", "SnowCamo_Secondary", leftwidehalf/1.6, topwidehalf/1.44, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText("!! WORK IN PROGRESS !!", "SnowCamo_Secondary", leftwidehalf/1.6, topwidehalf/1.375, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
	
	local camo_img_bg = vgui.Create("DImage", Derma)	-- Add image to Frame
	camo_img_bg:SetPos(leftwidehalf/2.85, topwidehalf/6.3)	-- Move it into frame
	camo_img_bg:SetSize(270, 270)	-- Size it to 150x150

	-- Set material relative to "garrysmod/materials/"
	camo_img_bg:SetImage("models/props_foliage/oak_tree01")
	
	-- Image panel of Dr. Breen
	local camo_img = vgui.Create("DImage", Derma)	-- Add image to Frame
	camo_img:SetPos(leftwidehalf/2.725, topwidehalf/5.85)	-- Move it into frame
	camo_img:SetSize(256, 256)	-- Size it to 150x150

	-- Set material relative to "garrysmod/materials/"
	camo_img:SetImage("snowysnowtime/camos/camo1")
	
	local bg = vgui.Create( "DPanel", tabs )
	bg:SetBackgroundColor( Color(0, 0, 0, 0) )
	bg:SetPos(-200, 0)
	
	local fg = Derma:Add( "DPanelList" )
	fg:DockPadding( 64, 8, 8, 8 )
	fg:EnableVerticalScrollbar( true )
	fg:Dock( FILL )
	
	local camocount = 651
	local camos = vgui.Create( "DNumSlider", sliders )
	camos:Dock( TOP )
	camos:SetText( "Camos" )
	camos:SetTall( 50 )
	camos:SetDecimals( 0 )
	camos:SetMax( camocount )
	camos:SetConVar( "snow_tf_camo" )
	camos:SetValue( GetConVarNumber( "snow_tf_camo" ) )
	camos:GetValue( r_s )
	camos.type = "camos"
	net.Start("Snow_Camos")
	net.SendToServer()
	fg:AddItem( camos )
	
	local windowwide = Derma:GetWide()
	local windowtall = Derma:GetTall()
	
end

concommand.Add("snow_tf_menu", function()
	SnowCamoMenu(LocalPlayer())
end)