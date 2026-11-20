-- Self-buff cards (LibBound buff timers): Power Word: Fortitude, Inner Fire, Divine Spirit (talent)
-- and Shadow Protection (off by default). The group version on you (Prayer of ...) counts. Click
-- a card to cast (out of combat). Nothing shows while the spell isn't learned.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function Name(list) local id = ns.BestRank(list) return id and ns.SpellName(id) end
local function BuffName(list, english) return ns.SpellName(list[1]) or english end

local BUFFS = {
	{ key = "fortitude", frame = "SpiritboundFortitudeFrame", label = "Power Word: Fortitude", icon = 135987,
		list = D.fortitude, group = D.prayerFortitude, groupName = "Prayer of Fortitude" },
	{ key = "innerFire", frame = "SpiritboundInnerFireFrame", label = "Inner Fire", icon = 135926, list = D.innerFire },
	{ key = "divineSpirit", frame = "SpiritboundDivineSpiritFrame", label = "Divine Spirit", icon = 135898,
		list = D.divineSpirit, group = D.prayerSpirit, groupName = "Prayer of Spirit" },
	{ key = "shadowProtection", frame = "SpiritboundShadowProtectionFrame", label = "Shadow Protection", icon = 136121,
		list = D.shadowProtection, group = D.prayerShadow, groupName = "Prayer of Shadow Protection" },
}
ns.BUFFS = BUFFS

for _, b in ipairs(BUFFS) do
	ns.MakeBuffTimer({
		key = b.key, point = b.key .. "Point", frameName = b.frame,
		label = b.label, icon = b.icon,
		names = function()
			local n = { BuffName(b.list, b.label) }
			if b.group then n[#n + 1] = BuffName(b.group, b.groupName) end
			return n
		end,
		active = function() return ns.BestRank(b.list) ~= nil end,
		cast = function() return Name(b.list) end,
		explain = ns.Help[b.key],
		goneText = "Missing: click to cast",
	})
end
