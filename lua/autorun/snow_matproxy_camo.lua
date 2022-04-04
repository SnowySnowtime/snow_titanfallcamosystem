AddCSLuaFile()
if SERVER then return end

matproxy.Add( {
	name = "SnowTFCamo",
	
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
		self.Prefix = values.prefixstring
		self.Strength = values.strength
		self.Darken = values.darken
	end,

	bind = function(self, mat, ent)
		if !IsValid(ent) then return end
		local camo_numeral = GetConVarNumber("snow_tf_camo")
		local camo = (camo_numeral) or 0
		texture = self.Prefix .. camo
		strength = self.Strength
		darken = self.Darken
		local color = Vector( 1 / darken, 1 / darken, 1 / darken )
		local colordef = Vector( 1, 1, 1 )
		
		if digits == 0 then
			texture = "null"
		end

		if texture && camo == 0 then
			mat:SetTexture("$detail", "")
			mat:SetInt("$detailblendmode", 0)
			mat:SetFloat("$detailblendfactor", 0 * strength)
			mat:SetVector("$color2", colordef)
		elseif texture && camo > 0 then
			mat:SetTexture("$detail", texture)
			mat:SetInt("$detailblendmode", 4)
			mat:SetFloat("$detailblendfactor", 1 * strength)
			mat:SetVector("$color2", color)
		end
	end
})

matproxy.Add( {
	name = "SnowTFCamo_FlatlineSpecial",
	
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
		self.Prefix = values.prefixstring
		self.Strength = values.strength
		self.Darken = values.darken
	end,

	bind = function(self, mat, ent)
		if !IsValid(ent) then return end
		local camo_numeral = GetConVarNumber("snow_tf_camo")
		local camo = (camo_numeral) or 0
		texture = self.Prefix .. camo
		strength = self.Strength
		darken = self.Darken
		local color = Vector( 1 / darken, 1 / darken, 1 / darken )
		local colordef = Vector( 2, 2, 2 )
		
		if digits == 0 then
			texture = "null"
		end

		if texture && camo == 0 then
			mat:SetTexture("$detail", "")
			mat:SetInt("$detailblendmode", 0)
			mat:SetFloat("$detailblendfactor", 0 * strength)
			mat:SetVector("$color2", colordef)
		elseif texture && camo > 0 then
			mat:SetTexture("$detail", texture)
			mat:SetInt("$detailblendmode", 4)
			mat:SetFloat("$detailblendfactor", 1 * strength)
			mat:SetVector("$color2", color)
		end
	end
})

matproxy.Add( {
	name = "SnowTFCamoMenu",
	
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
		self.Prefix = values.prefixstring
	end,

	bind = function(self, mat, ent)
		local camo_numeral = GetConVarNumber("snow_tf_camo")
		local digits = (camo_numeral) or 1
		texture = self.Prefix .. digits
		
		if texture then
			mat:SetTexture("$basetexture",  texture)
		else end
	end
})