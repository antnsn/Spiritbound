-- Dispel (LibBound Cleanse.lua): group members carrying Magic or a Disease you can remove, one click
-- each (left: Dispel Magic, right: Cure Disease or Abolish Disease), plus a mouseover key for each.
-- The frame, the options page and `/spirit ignore` are LibBound's.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")
local D = ns.DATA

Bound.InstallCleanse(ns, {
	title = "Dispel",
	page = false, -- Options.lua puts it after Reagents
	buttons = {
		{ list = D.dispelMagic, types = { Magic = true } },
		{ list = D.cureDisease, types = { Disease = true } },
	},
})
