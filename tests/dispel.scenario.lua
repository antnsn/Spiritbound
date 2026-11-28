--@moods: magic disease abolish none keys page
-- Dispel (LibBound Cleanse.lua): left click Dispel Magic, right click Cure Disease (Abolish Disease
-- once known), a key for each. The stand-in client has no SecureGroupHeader: the frame is the list.
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
local known = { 1243, 588, 527, 528 }
if m == "abolish" then known[#known + 1] = 552 end
if m == "none" then known = { 1243, 588 } end -- level 1: no dispels yet
T.priest(known)
local s = wb.state
wb.login()
local G = wb.G
local bound = {}
G.SetOverrideBindingClick = function(owner, prio, key, button) bound[key] = button end
G.ClearOverrideBindings = function() bound = {} end
wb.join({ { unit = "party1", name = "Friend", classFile = "WARRIOR" } })
local debuff = (m == "disease" or m == "abolish") and { name = "Plague", spellId = 222, dispelName = "Disease", icon = 136127 }
	or { name = "Frost Nova", spellId = 122, dispelName = "Magic", icon = 135848 }
s.auras.party1 = { debuff }
wb.fire("UNIT_AURA", "party1")
wb.advance(2)
local row = wb.frame("SpiritboundDispelRow1") or wb.frame("SpiritboundCleanseRow1")

if m == "none" then
	wb.check(not wb.shown("SpiritboundCleanseFrame"), "no dispel spell yet: no frame")
	return
end
wb.check(row ~= nil and row.data ~= nil, "the afflicted member gets a row")
wb.expect("on them", row:GetAttribute("unit"), "party1")
wb.expect("left click: Dispel Magic", row:GetAttribute("spell1"), "Dispel Magic")
wb.expect("right click: " .. (m == "abolish" and "Abolish Disease" or "Cure Disease"), row:GetAttribute("spell2"),
	m == "abolish" and "Abolish Disease" or "Cure Disease")
wb.expect("both as spells", row:GetAttribute("type2"), "spell")
wb.check(row.data.names[1]:find((m == "disease" or m == "abolish") and "right%-click" or "Magic, click") ~= nil, "the tooltip says which click: " .. row.data.names[1])

if m == "keys" then
	wb.ns.db.clKey, wb.ns.db.clKey2 = "F", "G"
	wb.ns.ApplyCleanseKey()
	wb.expect("F: the Dispel Magic key", bound.F, "SpiritboundCleanseKeyButton")
	wb.expect("G: the Cure Disease key", bound.G, "SpiritboundCleanseKeyButton2")
	wb.expect("which casts Cure Disease on the mouseover", wb.frame("SpiritboundCleanseKeyButton2"):GetAttribute("macrotext"),
		"/cast [@mouseover,help,nodead][help,nodead] Cure Disease")
elseif m == "page" then
	wb.slash("/spirit")
	local page
	local titles = {}
	for _, p in ipairs(wb.ns.optionsState.pages) do
		titles[#titles + 1] = p.title
		if p.title == "Dispel" then page = p.frame end
	end
	wb.expect("pages", table.concat(titles, ", "), "Buffs, Reagents, Dispel, Travel, Extras, Camp, Group, Skin")
	wb.check(page and -page.cleanseBottom <= page:GetHeight(), "the Dispel page fits: " .. tostring(page and page.cleanseBottom))
	wb.slash("/spirit ignore Frost Nova")
	wb.check(wb.saved("SpiritboundDB").clIgnore["frost nova"], "/spirit ignore keeps a debuff name")
end
