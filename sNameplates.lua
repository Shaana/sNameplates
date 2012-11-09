
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


function sNameplates:PrepareFrames(plate)
	plate.frame = {}
	plate.parent = LibNameplate:GetHealthBar(plate):GetParent()
	
end

local function Prepare_HealthBar(plate)
	frame = plate.frame
	
	frame.health_bar = CreateFrame("StatusBar", nil, plate.parent)
	frame.health_bar:SetStatusBarTexture("Interface\\AddOns\\sNameplates\\media\\bar")

	frame.health_bar:ClearAllPoints()
	--frame.health:SetSize(sizes.width-2, sizes.height-2)
	frame.health_bar:SetPoint('BOTTOMLEFT', 20, 100)
	
	
end

local function Prepare_CastBar(plate)

end


