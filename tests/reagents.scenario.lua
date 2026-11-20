--@moods: none candles sacred feathers both enough
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
local known = ({ none = { 1243 }, candles = { 21562 }, sacred = { 21562, 21564 }, feathers = { 1706 }, both = { 21562, 1706 }, enough = { 21562, 1706 } })[m]
T.priest(known)
local b = wb.state.bags
if m == "candles" then b[17028] = 2 end
if m == "sacred" then b[17028] = 50; b[17029] = 1 end
if m == "feathers" then b[17056] = 0 end
if m == "both" then b[17028] = 1; b[17056] = 0 end
if m == "enough" then b[17028] = 40; b[17056] = 20 end
wb.login()
wb.advance(3)
local card = wb.frame("SpiritboundReagentsFrame")
local shown = wb.shown("SpiritboundReagentsFrame")
if m == "none" or m == "enough" then
	wb.expect("no reagent card", shown, false)
else
	wb.expect("reagent card", shown, true)
	local want = ({ candles = "Holy Candles 2", sacred = "Sacred Candles 1", feathers = "Feathers 0",
		both = "Holy Candles 1 · Feathers 0" })[m]
	wb.expect("says what runs low", card.statusText:GetText(), want)
end
if m == "both" then wb.expect("a wider card for both", card:GetWidth(), 300) end
