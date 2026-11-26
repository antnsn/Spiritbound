-- Spiritbound's option pages; LibBound adds Extras and Skin, and builds the window.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")

local function BuffPage(UI)
	local p = UI.NewPage("Buffs", "A card when a buff is missing or running out. Click it to cast (out of combat).")
	local W = UI.CONTENT_W
	local third = math.floor(W / 3)
	for _, b in ipairs(ns.BUFFS) do
		p:Add(UI.Section(p, p.y - 2, b.label) + 2)
		UI.DBToggle(p, 0, p.y, third, b.key, "Show")
		UI.DBToggle(p, third, p.y, third, b.key .. "Sound", "Sound")
		UI.DBToggle(p, third * 2, p.y, third, b.key .. "Keep", "When missing", nil, function() ns.UpdateBuffTimers() end)
		p:Add(34)
	end
	p:Add(UI.Note(p, p.y, "Divine Spirit is a Discipline talent; Shadow Protection is off until you turn it on."))
	p:Add(UI.Section(p, p.y - 2, "Group buffs") + 2)
	p:Add(select(2, UI.Slider(p, p.y, "Buff key: a Prayer when this many in a group need it", "prayerMin", 0, 5, 1, "")) + 8)
	p:Add(UI.Note(p, p.y, "The Prayer uses a candle; without one, or at 0, the key casts the single buffs."))
end

local function ReagentPage(UI)
	local p = UI.NewPage("Reagents", "Candles for Prayer of Fortitude and Light Feathers for Levitate.")
	local W = UI.CONTENT_W
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "candles", "Warn when candles run low", "Once you know Prayer of Fortitude.")) + 6)
	p:Add(select(2, UI.Slider(p, p.y, "Candles: warn at", "candleLow", 0, 40, 1, " left")) + 8)
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "feathers", "Warn when Light Feathers run low", "Once you know Levitate.")) + 6)
	p:Add(select(2, UI.Slider(p, p.y, "Feathers: warn at", "featherLow", 0, 20, 1, " left")) + 8)
end

local function TravelPage(UI)
	local p = UI.NewPage("Travel", "Levitate and your Hearthstone beside the game menu (Escape).")
	p:Add(select(2, UI.DBToggle(p, 0, p.y, UI.CONTENT_W, "travel", "Show the travel panel when the game menu opens")) + 8)
end

ns.optionPages[#ns.optionPages + 1] = BuffPage
ns.optionPages[#ns.optionPages + 1] = ReagentPage
ns.optionPages[#ns.optionPages + 1] = TravelPage
Bound.InstallOptions(ns, { header = "Priest helper", launcher = "Priest helper: buffs, reagents, Levitate." })
