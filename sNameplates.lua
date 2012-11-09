
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


local function Prepare_HealthBar(plate)
	frame = plate.frame
	
	frame.health_bar = CreateFrame("StatusBar", nil, plate.parent)
	frame.health_bar:SetStatusBarTexture("Interface\\AddOns\\sNameplates\\media\\bar")

	frame.health_bar:ClearAllPoints()
	frame.health_bar:SetSize(300, 50)
	frame.health_bar:SetPoint('BOTTOMLEFT', 20, 100)
	frame.health_bar:SetMinMaxValues(0, LibNameplate:GetHealthMax(plate))
	
	frame.health_bar:SetValue(LibNameplate:GetHealthMax(plate)/2)
	
	local threatGlow, healthBorder, highlight, name, level, bossIcon, raidIcon, eliteIcon = plate:GetRegions()		
	local _, castbarBorder, castNoInterupt, castIcon = castBar:GetRegions()
	healthBorder:Hide()
	name:Hide()
	
	--for v,k in ipairs(plate:GetRegions()) do
	--	local threatGlow, healthBorder, highlight, name, level, bossIcon, raidIcon, eliteIcon = plate:GetRegions()		
	--	local _, castbarBorder, castNoInterupt, castIcon = castBar:GetRegions()
	--	healthBorder:Hide()
	--	name:Hide()
	--end
	
end

local function Prepare_CastBar(plate)

end


function sNameplates:PrepareFrames(plate)
	plate.frame = {}
	plate.parent = LibNameplate:GetHealthBar(plate):GetParent()
	
	Prepare_HealthBar(plate)
	
	
end




