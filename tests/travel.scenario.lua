--@moods: low levitate
local T = dofile(wb.dir .. "/tests/_priest.lua")
T.priest(wb.mood == "levitate" and { 1706 } or {})
wb.state.bags[6948] = 1
wb.login()
wb.advance(2)
wb.openGameMenu()
wb.expect("panel with the menu", wb.shown("SpiritboundTravel"), true)
local r = wb.ns.TravelRows()[1]
wb.expect("Levitate", r.label, "Levitate")
wb.expect("known", r.known, wb.mood == "levitate")
