--@moods: owned mine away cleared solo
-- assignments (LibBound Assign.lua, the LibGroupBuffs v1 protocol Buffy and Priestly speak): a
-- Prayer another live priest owns is left to them by the buff key; one you own is yours
local T = dofile(wb.dir .. "/tests/_priest.lua")
local m = wb.mood
T.priest({ 1243, 588, 21562 }) -- Fortitude, Inner Fire, Prayer of Fortitude
local s = wb.state
local function aura(name) return { name = name, spellId = 1, duration = 1800, expirationTime = 9999999, sourceUnit = "player" } end
s.auras.player = { aura("Power Word: Fortitude"), aura("Inner Fire") }
wb.login()
local G = wb.G
G.UnitCanAssist = function(_, unit) return wb.unit(unit) ~= nil end -- not in the stub
local function Msg(text) wb.fire("CHAT_MSG_ADDON", "LibGroupBuffs", text, "PARTY", "Pia") end
local function Macro() local k = wb.frame("SpiritboundBuffKey") return k and k:GetAttribute("macrotext") or "" end

if m == "solo" then
	wb.slash("/spirit assign")
	wb.check(wb.printed("Not in a group"), "/spirit assign says you're not in a group")
	wb.slash("/spirit assign 1")
	wb.check(wb.printed("join a group first"), "and taking one asks you to join a group")
	return
end

wb.join({ { unit = "party1", name = "Pia", classFile = "PRIEST" }, { unit = "party2", name = "Tank", classFile = "WARRIOR" } })
wb.advance(5)
wb.expect("before any assignment the key buffs the group", Macro(), "/cast [nocombat,@party1] Power Word: Fortitude")

if m == "owned" or m == "away" or m == "cleared" then
	Msg("1^H^PRIEST^21562,27681^0") -- Pia's hello: she can cast Prayer of Fortitude
	Msg("1^A^1243^1000^Pia^Pia") -- and owns Fortitude
	wb.advance(1)
	wb.expect("Pia owns Fortitude", G.LibStub("LibBound-1.0").AssignOwner(1243), "Pia")
	wb.expect("the key leaves Fortitude to her", Macro(), "")
	wb.check(wb.printed("Pia buffs the group now"), "chat says who has it")
	if m == "away" then
		wb.state.group.members[1].offline = true
		wb.fire("UNIT_CONNECTION", "party1", false)
		wb.advance(1)
		wb.expect("an offline owner doesn't count", Macro(), "/cast [nocombat,@party2] Power Word: Fortitude")
		wb.check(wb.printed("Pia is away"), "chat says she's away")
	elseif m == "cleared" then
		Msg("1^A^1243^2000^Pia^") -- she lets go
		wb.advance(1)
		wb.expect("cleared: the key buffs again", Macro(), "/cast [nocombat,@party1] Power Word: Fortitude")
		wb.check(wb.printed("nobody is assigned now"), "chat says nobody has it")
	end
elseif m == "mine" then
	wb.slash("/spirit assign 1")
	wb.check(wb.printed("yours now"), "taking Fortitude is confirmed")
	wb.advance(1)
	local sent
	for _, c in ipairs(wb.chat) do
		local text = type(c) == "table" and (c.text or c.msg or c[2]) or tostring(c)
		if type(text) == "string" and text:find("^1%^A%^1243%^") then sent = text end
	end
	local me = G.LibStub("LibBound-1.0").AssignMe()
	wb.expect("the claim goes out as a v1 record", sent and sent:match("^1%^A%^1243%^%d+%^(.-)%^"), me)
	wb.expect("naming you as the owner", sent and sent:match("%^([^%^]*)$"), me)
	wb.expect("you own it", select(2, G.LibStub("LibBound-1.0").AssignOwner(1243)), true)
	wb.expect("and the key still buffs the group", Macro(), "/cast [nocombat,@party1] Power Word: Fortitude")
	wb.slash("/spirit assign 1")
	wb.check(wb.printed("released"), "a second time releases it")
end
