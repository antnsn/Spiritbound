--@moods: holy shadow respec migrate
-- the minimap icon (and with it the logo and crest, all through LibBound's ns.SetEmblem) follows
-- the spec: the shadow hood once a shadow talent spell is known, else the holy one
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
T.priest(m == "shadow" and { 1243, 15407 } or { 1243 })
wb.state.spells[15407] = "Mind Flay"
if m ~= "shadow" then wb.state.known[15407] = false end
wb.login(m == "migrate" and { saved = { SpiritboundDB = { minimapAngle = 100 } } } or nil)
wb.advance(3)
local LDB = wb.saved("LibStub")("LibDataBroker-1.1")
local function icon() return (LDB:GetDataObjectByName("Spiritbound").icon or ""):match("[^\\]+$") end
wb.check(wb.frame("LibDBIcon10_Spiritbound"), "the minimap button comes from LibDBIcon (minimap addons collect it)")
wb.expect("minimap icon", icon(), m == "shadow" and "Icon64Shadow" or "Icon64")
if m == "respec" then
	wb.state.known[15407] = nil -- learns Mind Flay: shadow now
	wb.fire("SPELLS_CHANGED")
	wb.expect("minimap icon after the respec", icon(), "Icon64Shadow")
end
if m == "migrate" then
	wb.expect("the old button position carries over", wb.ns.db.minimapIcon.minimapPos, 100)
end
if m == "holy" then
	wb.slash("/spirit minimap")
	wb.expect("/spirit minimap hides it", wb.shown("LibDBIcon10_Spiritbound"), false)
	wb.expect("and LibDBIcon remembers", wb.ns.db.minimapIcon.hide, true)
	wb.slash("/spirit minimap")
	wb.expect("and shows it again", wb.shown("LibDBIcon10_Spiritbound"), true)
end
