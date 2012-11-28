
sNameplates = LibStub("AceAddon-3.0"):NewAddon("sNameplates", "AceEvent-3.0")
local sNameplates = sNameplates

local LibNameplate = LibStub("LibNameplate-1.0", true)

--TEMP
local regionOrder = {
	[1] = "threatTexture",
	[2] = "healthBorder",
	[3] = "highlightTexture",
	[4] = "nameText",
	[5] = "levelText",
	[6] = "skullIcon",
	[7] = "raidIcon",
	[8] = "eliteIcon",
}

local childOrder = {
	[1] = "healthBar",
	[2] = "castBar",
}
--TEMP END


function sNameplates:OnInizialize()
	--load all the modules
	for name, module in self:InterateModules() do
		module:Enable()
	end
end

function sNameplates:OnEnable()
	--LibNameplate.RegisterCallback(self, "LibNameplate_NewNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_RecycleNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_FoundGUID")
	LibNameplate.RegisterCallback(self, "LibNameplate_TargetNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_MouseoverNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_CombatChange")
	--LibNameplate.RegisterCallback(self, "LibNameplate_HealthChange")
	--LibNameplate.RegisterCallback(self, "LibNameplate_ThreatChange")

end

function sNameplates:OnDisable()
	--for module_name, module in self:InterateModules() do
	--	LibStub("AceAddon-3.0"):disableAddon(module)
	--end
	--TODO hide own frames, restore blizz shizzle (might be easier to just reload the ui ...)
end

share_plate = nil

function sNameplates:LibNameplate_TargetNameplate(_, plate)
	local plateName = LibNameplate:GetName(plate)
	local parent_frame = LibNameplate:GetHealthBar(plate):GetParent()
	print(plateName)
	print(parent_frame)
	share_plate = plate
	sNameplates:PrepareFrames(plate)
end

function sNameplates:test()
	for i, plate in LibNameplate:IteratePlates() do 
		print(plate .." belongs to "..LibNameplate:GetName(plate )..".")
	end

end











local function AnchorBaseFrame(parent, frame, x_offset, y_offset)
	frame:ClearAllPoints()
	frame:SetHeight(16)
	frame:SetWidth(16)
	frame:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", x_offset, y_offset)
	
	--TEMP just temp to see them
	local t = frame:CreateTexture(nil, "BACKGROUND");
	t:SetAllPoints(frame);
	t:SetTexture("Interface\\AddOns\\sBuff\\textures\\GlossThin");
	t:SetVertexColor(0, 1, 1, 1);
	--END TEMP
end


--NOT USING THIS YET
local function CreateStatusBar(plate, parent)

end




local function Prepare_HideBlizzardNameplate(plate)

	local healthBar, castBar = plate:GetChildren()
	healthBar:Hide()
	castBar:Hide()
	
	local threatGlow, healthBorder, highlight, name, level, bossIcon, raidIcon, eliteIcon = plate:GetRegions()		
	--local _, castbarBorder, castNoInterupt, castIcon = castBar:GetRegions()
	healthBorder:Hide()
	name:Hide()
	
	threatGlow:Hide()
	healthBorder:Hide()
	highlight:Hide()
	name:Hide()
	level:Hide()
	bossIcon:Hide()
	raidIcon:Hide()
	eliteIcon:Hide()
	
	--for v,k in ipairs(plate:GetRegions()) do
	--	local threatGlow, healthBorder, highlight, name, level, bossIcon, raidIcon, eliteIcon = plate:GetRegions()		
	--	local _, castbarBorder, castNoInterupt, castIcon = castBar:GetRegions()
	--	healthBorder:Hide()
	--	name:Hide()
	--end
	

end


--for better handling/displaying we create two seperate frames
--one for the nameplate itself (castbar, healthbar, name, ...)
--the other one aura display on the target (for now we keep it possible to display dots and hots)
local function Prepare_BaseFrames(plate)
	frame = plate.frame
	
	frame.base = CreateFrame("Frame", nil, plate)
	frame.base_aura = CreateFrame("Frame", nil, plate)
	frame.base_cast_bar = CreateFrame("Frame", nil, plate)
	
	AnchorBaseFrame(plate, frame.base, 0, 0)
	AnchorBaseFrame(plate, frame.base_aura, 128, 32)
	AnchorBaseFrame(plate, frame.base_cast_bar, 0, -16)
end


--including the health_bar frames and textures
local function Prepare_HealthBar(plate)
	frame = plate.frame
	parent = plate.frame.base
	
	frame.health_bar = CreateFrame("StatusBar", nil, parent)
	frame.health_bar:SetStatusBarTexture("Interface\\AddOns\\sNameplates\\media\\bar")

	frame.health_bar:ClearAllPoints()
	frame.health_bar:SetSize(180, 20)
	frame.health_bar:SetPoint('BOTTOMLEFT', 0, 0)
	frame.health_bar:SetMinMaxValues(0, LibNameplate:GetHealthMax(plate))
	
	frame.health_bar:SetStatusBarColor()
	--frame.health_bar:SetValue(LibNameplate:GetHealthMax(plate)/2)
	
	
	--background
	frame.health_bar_background = CreateFrame("Frame", nil, parent)
	frame.health_bar_background:SetSize(180, 20)
	--some size, textures, ...
	frame.health_bar_background.texture = frame.health_bar_background:CreateTexture("nil", "BACKGROUND")
	frame.health_bar_background.texture:SetTexture("Interface\\AddOns\\sNameplates\\media\\solid")
	frame.health_bar_background.texture:SetVertexColor(0, 0, 0, 0.8)
	frame.health_bar_background.texture:SetDrawLayer("ARTWORK", 1)
	frame.health_bar_background.texture:SetSize(180, 20)
	frame.health_bar_background.texture:SetPoint("BOTTOMLEFT", 0, 0)
	
	--frame.health_bar.background = 
	
end

local function Prepare_CastBar(plate)
	frame = plate.frame
	parent = plate.frame.base_cast_bar
	
	frame.cast_bar = CreateFrame("StatusBar", nil, parent)
	frame.cast_bar:SetStatusBarTexture("Interface\\AddOns\\sNameplates\\media\\bar")
	
	frame.cast_bar:ClearAllPoints()
	frame.cast_bar:SetSize(180, 8)
	frame.cast_bar:SetPoint('BOTTOMLEFT', 0, 0)
	--frame.health_bar:SetMinMaxValues(0, LibNameplate:GetHealthMax(plate))

end




--currently creating two frames, one for the name and one for the level
local function Prepare_PlayerInfo(plate)

end


local function Prepare_HealthText(plate)

end

local function Prepare_HealthTextPercent(plate)

end




local function Prepare_CastIcon(plate)

end



--
--plate.frame
--plate.text
--plate.prepared
--plate.frame.health_bar = ...
--plate.frame.health_bar.texture = ...
--plate.frame.name.
function sNameplates:PrepareFrames(plate)
	plate.frame = {}
	plate.text = {}
	plate.parent = LibNameplate:GetHealthBar(plate):GetParent()
	
	--always call Prepare_BaseFrames first!
	Prepare_HideBlizzardNameplate(plate)
	Prepare_BaseFrames(plate)
	Prepare_HealthBar(plate)
	--Prepare_CastBar(plate)
	 
	plate.prepared = true
end




