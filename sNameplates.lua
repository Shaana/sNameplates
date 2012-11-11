
sNameplates = LibStub("AceAddon-3.0"):NewAddon("sNameplates", "AceEvent-3.0")
local sNameplates = sNameplates

local LibNameplate = LibStub("LibNameplate-1.0", true)




function sNameplates:OnInizialize()

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

local function Prepare_HideBlizzardFrames(plate)

	local healthBar, castBar = plate:GetChildren()
	healthBar:Hide()
	castBar:Hide()
	
	local threatGlow, healthBorder, highlight, name, level, bossIcon, raidIcon, eliteIcon = plate:GetRegions()		
	--local _, castbarBorder, castNoInterupt, castIcon = castBar:GetRegions()
	healthBorder:Hide()
	name:Hide()
	
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
	frame.base = CreateFrame("Frame",nil, plate)
	frame.base_aura = CreateFrame("Frame",nil, plate)
	--TODO anchors here
	--maybe some color to see it ?
	--size
end

local function Prepare_HealthBar(plate)
	frame = plate.frame
	parent = plate.frame.base
	if not plate.frame.base then
		--TODO just create baseframes here then? or better let the addon fuck up?
		return
	end
	frame.health_bar = CreateFrame("StatusBar", nil, parent)
	frame.health_bar:SetStatusBarTexture("Interface\\AddOns\\sNameplates\\media\\bar")

	frame.health_bar:ClearAllPoints()
	frame.health_bar:SetSize(300, 50)
	frame.health_bar:SetPoint('BOTTOMLEFT', 20, 100)
	frame.health_bar:SetMinMaxValues(0, LibNameplate:GetHealthMax(plate))
	
	--frame.health_bar:SetValue(LibNameplate:GetHealthMax(plate)/2)
	
end

local function Prepare_NameText(plate)

end

local function Prepare_HealthText(plate)

end

local function Prepare_HealthTextPercent(plate)

end


local function Prepare_CastBar(plate)

end

local function Prepare_CastIcon(plate)

end


function sNameplates:PrepareFrames(plate)
	plate.frame = {}
	plate.text = {}
	plate.parent = LibNameplate:GetHealthBar(plate):GetParent()
	
	--always call Prepare_BaseFrames first!
	Prepare_BaseFrames(plate)
	Prepare_HealthBar(plate)
	
	
end




