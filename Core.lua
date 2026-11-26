-- Spiritbound: the Priest addon of the Bound family, built on LibBound-1.0 (the shared core).
-- This file sets the addon up; every other file returns at once on a non-priest (ns.disabled).
local addonName, ns = ...
local Bound = LibStub("LibBound-1.0")

-- Spells and items, lowest rank first. Classic IDs; Forever follows Classic content.
-- Checked in game before each release.
ns.DATA = {
	fortitude = { 1243, 1244, 1245, 2791, 10937, 10938 },
	prayerFortitude = { 21562, 21564 },
	innerFire = { 588, 7128, 602, 1006, 10951, 10952 },
	divineSpirit = { 14752, 14818, 14819, 27841 },
	prayerSpirit = { 27681 },
	shadowProtection = { 976, 10957, 10958 },
	prayerShadow = { 27683 },
	levitate = 1706,
	holyCandle = 17028, sacredCandle = 17029, lightFeather = 17056,
}

local function Timer(key, x, y, keep)
	return key, true, key .. "Minutes", 2, key .. "Sound", false, key .. "Icon", true, key .. "Keep", keep,
		key .. "Point", { "CENTER", "UIParent", "CENTER", x, y }
end
local defaults = {
	skin = "spirit",
	candles = true, candleLow = 5, prayerMin = 3, groupCard = true, feathers = true, featherLow = 3,
	rgPoint = { "CENTER", "UIParent", "CENTER", 250, 200 },
	travel = true,
	wrPoint = { "CENTER", "UIParent", "CENTER", 0, 320 },
	wfPoint = { "CENTER", "UIParent", "CENTER", 0, 260 },
}
-- one block of settings per buff card: <key>, <key>Minutes, Sound, Icon, Keep and its place
for _, t in ipairs({ { "fortitude", -250, 200, true }, { "innerFire", -250, 140, true },
	{ "divineSpirit", -250, 80, true }, { "shadowProtection", -250, 20, true } }) do
	local kv = { Timer(t[1], t[2], t[3], t[4]) }
	for i = 1, #kv, 2 do defaults[kv[i]] = kv[i + 1] end
end
defaults.shadowProtection = false -- only when you want it (shadow damage fights)

-- The emblem follows the spec: the shadow hood once a shadow talent spell is known (Shadowform,
-- Vampiric Embrace, Mind Flay, Silence), else the holy one. LibBound asks on login and
-- SPELLS_CHANGED and swaps the logo, minimap icon and crest ("...Shadow" files in Media).
local SHADOW_TALENTS = { 15473, 15286, 15407, 15487 }
function ns.EmblemVariant()
	for _, id in ipairs(SHADOW_TALENTS) do
		local ok, known = pcall(IsPlayerSpell, id)
		if ok and not ns.IsSecret(known) and known then return "Shadow" end
	end
	return nil
end

ns.disabled = Bound:NewAddon(addonName, ns, {
	class = "PRIEST",
	title = "Spiritbound",
	prefix = "e6dcff",
	db = "SpiritboundDB",
	slash = { "/spirit", "/spiritbound" },
	media = "Interface\\AddOns\\Spiritbound\\Media\\",
	defaults = defaults,
})
