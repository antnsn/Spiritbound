-- shared setup: a priest with the given spells known (loaded with dofile)
local M = {}
local NAMES = {
	[1243] = "Power Word: Fortitude", [1244] = "Power Word: Fortitude", [1245] = "Power Word: Fortitude",
	[2791] = "Power Word: Fortitude", [10937] = "Power Word: Fortitude", [10938] = "Power Word: Fortitude", [21562] = "Prayer of Fortitude",
	[21564] = "Prayer of Fortitude", [588] = "Inner Fire", [14752] = "Divine Spirit", [27681] = "Prayer of Spirit",
	[976] = "Shadow Protection", [27683] = "Prayer of Shadow Protection", [1706] = "Levitate", [429959] = "Well-Rested",
}
function M.priest(known)
	local s = wb.state
	s.player.classFile, s.player.class, s.player.classId = "PRIEST", "Priest", 5
	for id, n in pairs(NAMES) do s.spells[id] = n; s.known[id] = false end
	for _, id in ipairs(known or {}) do s.known[id] = nil end
	s.known[429959] = nil
end
function M.macroFor(text)
	for _, f in ipairs(wb.frames()) do
		local m = f:GetAttribute("macrotext")
		if m and f.__shown and m:find(text, 1, true) then return f end
	end
end
return M
