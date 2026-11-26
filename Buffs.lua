-- Self-buff cards (LibBound buff timers): Power Word: Fortitude, Inner Fire, Divine Spirit (talent)
-- and Shadow Protection (off by default). The group version on you (Prayer of ...) counts. Click
-- a card to cast (out of combat). Nothing shows while the spell isn't learned.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function Name(list) local id = ns.BestRank(list) return id and ns.SpellName(id) end
local function BuffName(list, english) return ns.SpellName(list[1]) or english end

local BUFFS = {
	{ key = "fortitude", frame = "SpiritboundFortitudeFrame", label = "Power Word: Fortitude", short = "Fortitude", icon = 135987,
		list = D.fortitude, group = D.prayerFortitude, groupName = "Prayer of Fortitude",
		levels = D.levels.fortitude, groupLevels = D.levels.prayerFortitude,
		candles = { D.holyCandle, D.sacredCandle } }, -- per rank of the Prayer
	{ key = "innerFire", frame = "SpiritboundInnerFireFrame", label = "Inner Fire", icon = 135926, list = D.innerFire },
	{ key = "divineSpirit", frame = "SpiritboundDivineSpiritFrame", label = "Divine Spirit", short = "Spirit", icon = 135898,
		list = D.divineSpirit, group = D.prayerSpirit, groupName = "Prayer of Spirit", candles = { D.sacredCandle },
		levels = D.levels.divineSpirit, groupLevels = D.levels.prayerSpirit },
	{ key = "shadowProtection", frame = "SpiritboundShadowProtectionFrame", label = "Shadow Protection", short = "Shadow Protection", icon = 136121,
		list = D.shadowProtection, group = D.prayerShadow, groupName = "Prayer of Shadow Protection",
		candles = { D.sacredCandle }, levels = D.levels.shadowProtection, groupLevels = D.levels.prayerShadow },
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

local function Count(id)
	local ok, n = pcall(C_Item.GetItemCount, id)
	return (ok and not ns.IsSecret(n) and n) or 0
end

-- the buff key (LibBound) also gives these to the group, on the next member in range missing them
-- (only the ones turned on: Shadow Protection is off until you want it); the Prayer when enough of
-- one group need it and its candle (for the best rank known) is in the bags
for _, b in ipairs(BUFFS) do
	if b.group then
		ns.groupBuffs[#ns.groupBuffs + 1] = { list = b.list, short = b.short, icon = b.icon, levels = b.levels,
			names = function() return { BuffName(b.list, b.label), BuffName(b.group, b.groupName) } end,
			enabled = function() return ns.db[b.key] ~= false end,
			prayer = function()
				local id, rank = ns.BestRank(b.group)
				local candle = id and b.candles[rank]
				if not (candle and Count(candle) > 0) then return nil end
				return ns.SpellName(id), b.groupLevels and b.groupLevels[rank]
			end }
	end
end
