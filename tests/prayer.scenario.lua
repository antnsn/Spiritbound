--@moods: party few nocandle off raid raidself rank2holy lowmember
-- the buff key with the Prayer spells: when enough of one group (party, or raid subgroup) need a
-- buff and you have the candle, one Prayer instead of single casts
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
T.priest({ 1243, 588, 21562, m == "rank2holy" and 21564 or nil })
local s = wb.state
local function aura(name) return { name = name, spellId = 1, duration = 1800, expirationTime = 9999999, sourceUnit = "player" } end
s.auras.player = { aura("Power Word: Fortitude"), aura("Inner Fire") }
if m ~= "nocandle" then s.bags[17028] = 5 end -- Holy Candles
wb.login()
local G = wb.G
G.UnitCanAssist = function(_, unit) return wb.unit(unit) ~= nil end -- not in the stub
if m == "off" then wb.ns.db.prayerMin = 0 end

local function P(name, sub) return { name = name, classFile = "WARRIOR", subgroup = sub } end
if m == "raid" then
	wb.join({ P("A", 1), P("B", 2), P("C", 2), P("D", 2), P("E", 3) }, true)
	s.auras.raid1 = { aura("Power Word: Fortitude") }
elseif m == "raidself" then
	s.auras.player = { aura("Inner Fire") } -- you miss it too: you count for your own group
	wb.join({ P(G.UnitName("player"), 1), P("A", 1), P("B", 1), P("C", 2) }, true)
	s.auras.raid4 = { aura("Power Word: Fortitude") } -- C, in the other group, has it
	G.UnitIsUnit = function(a, b)
		local function me(x) return x == "player" or x == "raid1" end
		return a == b or (me(a) and me(b))
	end
else
	local n = m == "few" and 2 or 3
	local members = {}
	for i = 1, n do members[i] = P("Friend" .. i) end
	if m == "lowmember" then members[3].level = 22 end -- Prayer of Fortitude (level 48) can't reach them
	wb.join(members)
end
wb.advance(7)
local key = wb.frame("SpiritboundBuffKey")
local macro = key and key:GetAttribute("macrotext") or ""

if m == "party" then
	wb.expect("three in the party need it: one Prayer", macro, "/cast [nocombat,@party1] Prayer of Fortitude")
elseif m == "few" then
	wb.expect("two need it: single casts (below the setting)", macro, "/cast [nocombat,@party1] Power Word: Fortitude")
elseif m == "nocandle" then
	wb.expect("no candle: single casts", macro, "/cast [nocombat,@party1] Power Word: Fortitude")
elseif m == "off" then
	wb.expect("Prayer turned off (0): single casts", macro, "/cast [nocombat,@party1] Power Word: Fortitude")
elseif m == "raid" then
	wb.expect("raid: the subgroup with three missing gets a Prayer", macro, "/cast [nocombat,@raid2] Prayer of Fortitude")
	s.auras.raid2 = { aura("Prayer of Fortitude") }
	s.auras.raid3 = { aura("Prayer of Fortitude") }
	s.auras.raid4 = { aura("Prayer of Fortitude") }
	wb.advance(1)
	wb.expect("then a lone member: a single cast", key:GetAttribute("macrotext"), "/cast [nocombat,@raid5] Power Word: Fortitude")
elseif m == "raidself" then
	wb.expect("you and two others in your group: a Prayer, before your own card", macro,
		"/cast [nocombat,@player] Prayer of Fortitude")
elseif m == "lowmember" then
	wb.check(not macro:find("Prayer", 1, true), "one too low for the Prayer: no Prayer on that group: " .. macro)
	wb.expect("single casts instead", macro, "/cast [nocombat,@party1] Power Word: Fortitude")
elseif m == "rank2holy" then
	wb.expect("rank 2 needs Sacred Candles: with Holy Candles only, single casts", macro,
		"/cast [nocombat,@party1] Power Word: Fortitude")
end
