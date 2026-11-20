--@moods: spirit blizzard flat
local T = dofile(wb.dir .. "/tests/_priest.lua")
T.priest({ 1243 })
wb.login({ saved = { SpiritboundDB = { skin = wb.mood } } })
wb.advance(7)
local want = ({ spirit = "Spirit", blizzard = "Blizzard", flat = "Flat" })[wb.mood]
wb.expect("active skin", wb.ns.UI.Active().name, want)
wb.check(wb.shown("SpiritboundFortitudeFrame"), "a card builds in this skin")
wb.slash("/spirit")
wb.check(wb.shown("SpiritboundOptions"), "the options build in this skin")
