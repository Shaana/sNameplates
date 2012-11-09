
sNameplates = LibStub("AceAddon-3.0"):NewAddon("sBuff", "AceEvent-3.0")
local sNameplates = sNameplates

local LibNameplate = LibStub("LibNameplate-1.0", true)



function sNameplates:OnInizialize()

end

function sNameplates:OnEnable()
	LibNameplate.RegisterCallback(self, "LibNameplate_NewNameplate")
	LibNameplate.RegisterCallback(self, "LibNameplate_RecycleNameplate")
	LibNameplate.RegisterCallback(self, "LibNameplate_FoundGUID")
	--LibNameplate.RegisterCallback(self, "LibNameplate_TargetNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_MouseoverNameplate")
	--LibNameplate.RegisterCallback(self, "LibNameplate_CombatChange")
	LibNameplate.RegisterCallback(self, "LibNameplate_HealthChange")
	--LibNameplate.RegisterCallback(self, "LibNameplate_ThreatChange")

end

function sNameplates:OnDisable()

end