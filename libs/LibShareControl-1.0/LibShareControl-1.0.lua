local MAJOR, MINOR = "LibShareControl-1.0", 2
if not LibStub then error(MAJOR .. "requires LibStub.") return end

--Create the new library
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end
