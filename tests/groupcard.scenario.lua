--@moods: missing all solo combat off unlocked
-- the group card (LibBound): out of combat in a group, how many lack each group buff, and who
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
T.priest({ 1243, 588, 976 }) -- Fortitude, Inner Fire, Shadow Protection (off by default)
local s = wb.state
local function aura(name) return { name = name, spellId = 1, duration = 1800, expirationTime = 9999999, sourceUnit = "player" } end
s.auras.player = { aura("Power Word: Fortitude"), aura("Inner Fire") }
wb.login()
local G = wb.G
G.UnitCanAssist = function(_, unit) return wb.unit(unit) ~= nil end -- not in the stub
if m == "off" then wb.ns.db.groupCard = false end
if m ~= "solo" then
	wb.join({ { name = "Garrosh" }, { name = "Thrall" }, { name = "Rexxar", far = true } })
	s.auras.party2 = { aura("Prayer of Fortitude") }
	if m == "all" then
		s.auras.party1 = { aura("Power Word: Fortitude") }
		s.auras.party3 = { aura("Power Word: Fortitude") }
	end
end
if m == "combat" then wb.combat(true) end
if m == "unlocked" then wb.slash("/spirit unlock") end
wb.advance(3)
local name = "SpiritboundGroupBuffsFrame"
local card = wb.frame(name)
wb.check(card ~= nil, "the group card exists")

if m == "missing" then
	wb.expect("shown", wb.shown(name), true)
	wb.expect("counts the ones lacking it, far ones too (Shadow Protection is off)", card.statusText:GetText(), "Fortitude 2")
	wb.check(card.explain and card.explain:find("Fortitude: Garrosh, Rexxar", 1, true), "the tooltip names them")
	s.auras.party1 = { aura("Power Word: Fortitude") }
	s.auras.party3 = { aura("Power Word: Fortitude") }
	wb.advance(1)
	wb.expect("hides once all have it", wb.shown(name), false)
elseif m == "unlocked" then
	wb.expect("shown to be moved", wb.shown(name), true)
else
	wb.expect("hidden (" .. m .. ")", wb.shown(name), false)
end

-- the Buffs page has the Group buffs section and still fits in the window (494 px)
if m == "missing" then
	wb.slash("/spirit")
	local page
	for _, p in ipairs(wb.ns.optionsState.pages) do if p.title == "Buffs" then page = p.frame end end
	wb.check(page and -page.y <= 470, "Buffs page fits: " .. (page and -page.y or "?") .. " of 494 px")
	s.auras.party1 = {}
	wb.advance(1)
	wb.expect("back when one lacks it again", wb.shown(name), true)
	wb.ns.db.groupCard = false
	wb.advance(1)
	wb.expect("the toggle hides it", wb.shown(name), false)
end
