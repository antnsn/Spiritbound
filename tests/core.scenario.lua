--@moods: priest warlock
local T = dofile(wb.dir .. "/tests/_priest.lua")
if wb.mood == "priest" then
	T.priest({ 1243 })
	wb.login()
	wb.advance(7)
	wb.slash("/spirit")
	wb.check(wb.shown("SpiritboundOptions"), "/spirit opens the options")
	local titles = {}
	for _, p in ipairs(wb.ns.optionsState.pages) do titles[#titles + 1] = p.title end
	wb.expect("pages", table.concat(titles, ", "), "Buffs, Reagents, Travel, Extras, Group, Skin")
else
	wb.state.player.classFile, wb.state.player.class = "WARLOCK", "Warlock"
	wb.login()
	wb.slash("/spirit")
	wb.check(wb.printed("only does something on a priest"), "a warlock is told why")
end
