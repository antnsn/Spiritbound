--@moods: run combat combatunlocked
-- /spirit shots (LibBound): a screenshot of every options page, the unlocked frames and the travel
-- panel, with where each frame sat saved for LibBound/tools/crop_shots.py; everything put back after
local T = dofile(wb.dir .. "/tests/_priest.lua")
T.priest({ 1243 })
wb.state.bags[6948] = 1
wb.login()
wb.advance(7)

-- the stub has no Screenshot or CVars: count the shots, keep the format setting
local G, taken, cvars = wb.G, 0, { screenshotFormat = "jpeg" }
G.Screenshot = function() taken = taken + 1 end
G.C_CVar = { GetCVar = function(k) return cvars[k] end, SetCVar = function(k, v) cvars[k] = v end }

wb.slash("/spirit help")
wb.check(not wb.printed("shots"), "shots is not in the help (a tool for the docs)")

wb.slash("/spirit shots")
local pages = #wb.ns.optionsState.pages -- built when the run opens the window
wb.check(wb.printed("taking " .. (pages + 2) .. " screenshots"), "says how many and to wait")
if wb.mood == "combatunlocked" then
	-- a fight while the frames are unlocked for their shot: locked again once it's over
	for _ = 1, 60 do if wb.ns.unlocked then break end wb.advance(0.5) end
	wb.expect("the run reached the unlocked frames", wb.ns.unlocked, true)
	wb.combat(true)
	wb.advance(5)
	wb.combat(false)
	wb.advance(1)
	wb.expect("frames locked after the fight", wb.ns.unlocked, false)
	return
end
if wb.mood == "combat" then
	wb.advance(3)
	wb.combat(true)
	wb.advance(30)
	wb.check(wb.printed("stopped"), "a fight stops the run and says so")
	wb.expect("frames locked again", wb.ns.unlocked, false)
	return
end
wb.advance(60)
wb.expect("one shot per page, the unlocked frames and the travel panel", taken, pages + 2)
wb.expect("png while shooting, the old format after", cvars.screenshotFormat, "jpeg")

local db = wb.saved("SpiritboundDB")
local run = db and db.shots and db.shots[wb.ns.db.skin]
wb.check(run ~= nil, "the run is saved under the skin")
local names = {}
for _, s in ipairs(run and run.list or {}) do names[#names + 1] = s.name end
wb.expect("what was shot", table.concat(names, ","),
	"options-buffs,options-reagents,options-dispel,options-travel,options-extras,options-camp,options-group,options-skin,frames-unlocked,travel")
local opt = run.list[1]
wb.check(opt.rects.main and opt.rects.main.w > 0 and opt.rects.main.h > 0, "the options window's place")
wb.check(opt.at:match("^%d%d%d%d%d%d_%d%d%d%d%d%d$") ~= nil, "a time stamp like the screenshot file names")
local frames = run.list[pages + 1]
wb.expect("the whole screen for the unlocked shot", frames.full, true)
local cards = 0
for k, r in pairs(frames.rects) do if k ~= "main" and r.w > 0 then cards = cards + 1 end end
wb.check(cards > 0, "the unlocked cards' places")
wb.check(run.list[pages + 2].rects.main ~= nil, "the travel panel's place")
wb.check(wb.printed("crop_shots.py Spiritbound"), "says what to run next")

wb.expect("options closed after", wb.shown("SpiritboundOptions"), false)
wb.expect("frames locked after", wb.ns.unlocked, false)
wb.expect("game menu closed after", wb.shown("GameMenuFrame"), false)
