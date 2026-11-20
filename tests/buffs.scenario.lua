--@moods: fresh missing buffed prayer talent shadow foreign
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
local known = ({ fresh = {}, missing = { 1243, 588 }, buffed = { 1243, 588 }, prayer = { 1243, 588 },
	talent = { 1243, 588, 14752 }, shadow = { 1243, 588, 976 }, foreign = {} })[m]
T.priest(known)
local s = wb.state
if m == "buffed" then s.auras.player = { wb.aura("Power Word: Fortitude", 1243, 1800), wb.aura("Inner Fire", 588, 600) } end
if m == "prayer" then s.auras.player = { wb.aura("Prayer of Fortitude", 21562, 3600), wb.aura("Inner Fire", 588, 600) } end
if m == "foreign" then s.auras.player = { wb.aura("Power Word: Fortitude", 1243, 30) } end -- from another priest
local db = {}
if m == "shadow" then db.shadowProtection = true end
wb.login({ saved = { SpiritboundDB = db } })
wb.advance(7)
local fort, inner = wb.shown("SpiritboundFortitudeFrame"), wb.shown("SpiritboundInnerFireFrame")
local ds, sp = wb.shown("SpiritboundDivineSpiritFrame"), wb.shown("SpiritboundShadowProtectionFrame")
if m == "fresh" or m == "foreign" then
	wb.expect("nothing before it's learned", fort or inner or ds or sp, false)
elseif m == "buffed" or m == "prayer" then
	wb.expect("fortitude up (prayer counts too): no card", fort, false)
	wb.expect("inner fire up: no card", inner, false)
else
	wb.expect("fortitude card", fort, true)
	wb.check(T.macroFor("Power Word: Fortitude"), "a click casts Fortitude")
	wb.expect("inner fire card", inner, true)
	wb.expect("divine spirit only with the talent", ds, m == "talent")
	wb.expect("shadow protection only when turned on", sp, m == "shadow")
end
