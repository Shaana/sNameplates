local sNameplates_Aura = sNameplates:NewModule("Aura", "AceEvent-3.0")

local LibShareAura = LibStub("LibShareAura-1.0", true)

function sNameplates_Aura:OnEnable()
	print("loaded Aura")
	print(LibShareAura)
end