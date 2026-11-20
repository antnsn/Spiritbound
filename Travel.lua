-- The travel panel (LibBound) beside the game menu: Levitate and the Hearthstone.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")

local function Known(id)
	local ok, k = pcall(IsPlayerSpell, id)
	return ok and not ns.IsSecret(k) and k and true or false
end

function ns.TravelRows()
	local id = ns.DATA.levitate
	return { { spell = id, label = "Levitate", column = 1, known = Known(id), level = 34,
		tip = "Levitate", help = ns.Help.levitate, learn = "from a priest trainer" } }
end

Bound.InstallTravel(ns, { columns = { "PRIEST" }, rows = ns.TravelRows, hearthHelp = ns.Help.hearthstone })
