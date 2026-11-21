--@moods: self group groupbuffed far dead shadowoff nothing bind combat unreadable
-- the buff key (LibBound): each press casts the next thing needed: the top card's spell (your own
-- buffs), else a group buff on the next party member in range who is missing it
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
T.priest({ 1243, 588 }) -- Power Word: Fortitude, Inner Fire
local s = wb.state
local function aura(name) return { name = name, spellId = 1, duration = 1800, expirationTime = 9999999, sourceUnit = "player" } end
if m ~= "self" then s.auras.player = { aura("Power Word: Fortitude"), aura("Inner Fire") } end
wb.login()
local G = wb.G
local bound = {}
G.SetOverrideBindingClick = function(owner, prio, key, button) bound[key] = button end
G.ClearOverrideBindings = function() bound = {} end
G.UnitCanAssist = function(_, unit) return wb.unit(unit) ~= nil end -- not in the stub
if m ~= "self" and m ~= "nothing" and m ~= "bind" then
	local p = { unit = "party1", name = "Friend", classFile = "WARRIOR" }
	if m == "far" then p.far = true end
	if m == "dead" then p.dead = true end
	local members = { p }
	if m == "unreadable" then members[2] = { unit = "party2", name = "Other", classFile = "MAGE" } end
	wb.join(members)
	if m == "unreadable" then s.auras.party1 = { { name = nil, spellId = 1 } } end -- names hidden from addons
	if m == "groupbuffed" then s.auras.party1 = { aura("Prayer of Fortitude") } end
	if m == "shadowoff" then
		s.auras.party1 = { aura("Power Word: Fortitude") } -- has Fortitude; Shadow Protection is off by default
		s.known[976] = nil -- Shadow Protection learned
	end
end
wb.advance(7) -- the cards look every few seconds
local key = wb.frame("SpiritboundBuffKey")
wb.check(key ~= nil, "the buff key button exists")
local macro = key and key:GetAttribute("macrotext") or ""

if m == "self" then
	wb.expect("your own missing buff first (the top card)", macro, "/cast [nocombat,@player] Power Word: Fortitude")
elseif m == "group" then
	wb.expect("then the party member missing a group buff", macro, "/cast [nocombat,@party1] Power Word: Fortitude")
elseif m == "groupbuffed" or m == "far" or m == "dead" or m == "shadowoff" or m == "nothing" then
	wb.expect("nothing to cast (" .. m .. ")", macro, "")
	key:GetScript("PostClick")(key, "LeftButton", false)
	wb.check(wb.printed("nothing to buff"), "a press says there's nothing to do")
elseif m == "bind" then
	wb.ns.db.buffKey = "F"
	wb.ns.BindBuffKey()
	wb.expect("the key clicks the button", bound.F, "SpiritboundBuffKey")
	wb.ns.db.buffKey = nil
	wb.ns.BindBuffKey()
	wb.expect("and is let go when cleared", bound.F, nil)
elseif m == "combat" then
	wb.join({ { unit = "party1", name = "Friend", classFile = "WARRIOR" } })
	wb.combat(true)
	wb.advance(2)
	wb.expect("the macro doesn't change in combat", key:GetAttribute("macrotext"), macro)
	wb.check(key:GetAttribute("type") ~= "macro", "and the key casts nothing in combat (a card's macro may have no [nocombat])")
	wb.combat(false)
	wb.advance(1)
	wb.expect("it works again after the fight", key:GetAttribute("type"), "macro")
elseif m == "unreadable" then
	wb.expect("a member whose buffs can't be read is skipped", macro, "/cast [nocombat,@party2] Power Word: Fortitude")
end
