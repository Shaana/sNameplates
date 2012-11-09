
sNameplates = LibStub("AceAddon-3.0"):NewAddon("sNameplates", "AceEvent-3.0")
local sNameplates = sNameplates

local LibNameplate = LibStub("LibNameplate-1.0", true)



function sNameplates:OnInizialize()

end

function sNameplates:OnEnable()
	LibNameplate.RegisterCallback(self, "LibNameplate_NewNameplate")
	LibNameplate.RegisterCallback(self, "LibNameplate_RecycleNameplate")
	LibNameplate.RegisterCallback(self, "LibNameplate_FoundGUID")
	LibNameplate.RegisterCallback(self, "LibNameplate_TargetNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_MouseoverNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_CombatChange")
	LibNameplate.RegisterCallback(self, "LibNameplate_HealthChange")
	--LibNameplate.RegisterCallback(self, "LibNameplate_ThreatChange")

end

function sNameplates:OnDisable()

end

function sNameplates:LibNameplate_TargetNameplate(_, plate)
	local plateName = LibNameplate:GetName(plate)
	local health_frame = LibNameplate:GetHealthBar(plate)
	print(plateName)
	print(health_frame)

end

function sNameplates:test()
	for i, plate in LibNameplate:IteratePlates() do 
		print(plate .." belongs to "..LibNameplate:GetName(plate )..".")
	end

end
