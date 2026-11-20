-- Spiritbound's look, "Spirit": deep twilight-violet panels with a soft silver-white edge, holy and
-- shadow in one: a misty light layer, feather marks in the corners, a slow pale rim while a card
-- needs you. LibBound derives the Blizzard and Flat skins from it.
-- Textures: tools/make_media.py.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")
local F = Bound.FONTS

local spirit = {
	name = "Spirit",
	font = { ui = F.friz, title = F.friz, narrow = F.arialn, card = F.morpheus },
	color = {
		bg = { 0, 0, 0, 0 },
		side = { 0.04, 0.03, 0.07, 0.40 },
		header = { 0.04, 0.03, 0.07, 0.35 },
		border = { 0.66, 0.62, 0.80, 0.9 },
		hover = { 0.20, 0.17, 0.30, 1 },
		selected = { 0.18, 0.15, 0.28, 1 },
		text = { 0.96, 0.95, 1.00 },
		dim = { 0.70, 0.68, 0.80 },
		accent = { 0.90, 0.88, 1.00 },
		track = { 0.14, 0.12, 0.22, 1 },
		button = { 0.08, 0.06, 0.12, 1 },
		navGlow = { 0.86, 0.82, 1, 0.60 },
		row = { 0.12, 0.10, 0.18, 0.8 },
		rowWarn = { 0.40, 0.30, 0.05, 0.5 },
		rowBad = { 0.45, 0.08, 0.10, 0.55 },
		highlight = { 0.92, 0.90, 1, 0.08 },
		cell = { 0.12, 0.10, 0.17, 0.85 },
		cdText = { 0.95, 0.94, 1 },
		glow = { 0.90, 0.88, 1 },
		gridLine = { 0.92, 0.90, 1, 0.08 },
		gridCentre = { 0.86, 0.82, 1, 0.45 },
	},
	box = {
		backdrop = {
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 16, edgeSize = 14,
			insets = { left = 3, right = 3, top = 3, bottom = 3 },
		},
		bg = { 0.07, 0.05, 0.10 },
		border = { 0.86, 0.84, 0.96, 1 },
	},
	dialog = {
		backdrop = {
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
			edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 11, right = 11, top = 12, bottom = 11 },
		},
		outset = 10,
		border = { 0.90, 0.88, 1, 1 },
		under = { 0.05, 0.04, 0.08, 1 },
		plate = false,
	},
	tex = Bound.STOCK_TEX,
	card = {
		panel = { 0.09, 0.07, 0.13, 0.94 },
		gilt = { 0.72, 0.70, 0.84, 1 },
		giltFaint = { 0.46, 0.44, 0.58, 0.9 },
		light = { 0.95, 0.93, 1, 0.08 },
		rays = { 0.94, 0.92, 1 },
		raysFaded = { 0.62, 0.60, 0.70 },
		title = { 0.95, 0.93, 1 },
		status = { 0.88, 0.86, 0.96 },
		urgent = { 1, 0.62, 0.42 },
		glowEdge = { 0.96, 0.94, 1, 1 },
		iconEdge = { 0.80, 0.78, 0.92, 0.9 },
		frost = "Mist", frostTint = { 0.86, 0.82, 1, 0.12 },
		crest = "Crest", crestTint = { 0.90, 0.85, 1, 0.15 },
		shards = "Feather", shardTint = { 0.95, 0.94, 1, 0.9 },
		rim = "Rim", breathe = true, breatheTime = 3.2,
		burst = false, studs = false, ring = false, round = false,
	},
	widgets = "blizzard",
}

Bound.InstallSkin(ns, {
	skins = { spirit = spirit },
	order = { "spirit", "blizzard", "flat" },
	default = "spirit",
	about = { spirit = "Twilight violet with a silver edge, mist and feathers." },
})
Bound.InstallBuffTimers(ns)
Bound.InstallMinimap(ns)
