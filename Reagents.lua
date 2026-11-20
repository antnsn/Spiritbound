-- One reagent card: candles for Prayer of Fortitude (once it is known) and Light Feathers for
-- Levitate (once it is known), each below its threshold. Quiet in combat.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function Count(id)
	local ok, n = pcall(C_Item.GetItemCount, id)
	return (ok and not ns.IsSecret(n) and n) or 0
end
local function Known(id)
	local ok, k = pcall(IsPlayerSpell, id)
	return ok and not ns.IsSecret(k) and k and true or false
end

-- what runs low: list of { text, urgent }
function ns.LowReagents()
	local out = {}
	if ns.db.candles and ns.BestRank(D.prayerFortitude) then
		-- the higher rank uses Sacred Candles, the first Holy Candles
		local item = Known(D.prayerFortitude[2]) and D.sacredCandle or D.holyCandle
		local n = Count(item)
		if n <= ns.db.candleLow then
			out[#out + 1] = { (item == D.sacredCandle and "Sacred Candles " or "Holy Candles ") .. n, n == 0 }
		end
	end
	if ns.db.feathers and Known(D.levitate) then
		local n = Count(D.lightFeather)
		if n <= ns.db.featherLow then out[#out + 1] = { "Feathers " .. n, n == 0 } end
	end
	return out
end

local M = {}
ns.modules[#ns.modules + 1] = M
local card

function M:Update()
	if not card then return end
	if ns.unlocked then card:SetStatus("Holy Candles: 3"); card:Show(); card:Glow(false) return end
	local low = (not ns.InCombat()) and ns.LowReagents() or {}
	if #low > 0 then
		local parts, urgent = {}, false
		for _, r in ipairs(low) do parts[#parts + 1] = r[1]; urgent = urgent or r[2] end
		card:SetStatus(table.concat(parts, " · "), urgent)
		card:Show(); card:Glow(true)
	else
		card:Glow(false); card:Hide()
	end
end

function M:Init()
	card = ns.MakeCard("SpiritboundReagentsFrame", { width = 300 }) -- room for both counts on one line
	card:SetIcon(133749)
	card:SetTitle("Reagents running low")
	card:SetExplain(ns.Help.candles .. " " .. ns.Help.feathers)
	ns.MakeMovable(card, "rgPoint")
	ns.ApplyPoint(card, "rgPoint")
	local f = CreateFrame("Frame")
	for _, e in ipairs({ "BAG_UPDATE_DELAYED", "SPELLS_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED",
		"PLAYER_ENTERING_WORLD" }) do f:RegisterEvent(e) end
	f:SetScript("OnEvent", function() M:Update() end)
	M:Update()
end
