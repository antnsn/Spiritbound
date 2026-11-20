-- Every plain-word explanation in one place (tooltips show them while "Explain things" is on).
local _, ns = ...
if ns.disabled then return end

ns.Help = {
	fortitude = "Power Word: Fortitude gives more Stamina, so more health. Keep it on yourself, and on your friends too.",
	innerFire = "Inner Fire gives you armor and attack power for a while. Keep it up, especially when you're hit.",
	divineSpirit = "Divine Spirit gives more Spirit, so your mana comes back faster between fights.",
	shadowProtection = "Shadow Protection reduces shadow damage. Worth it in fights against shadow casters.",
	candles = "Prayer of Fortitude buffs your whole group at once and uses a candle (Holy Candle, later Sacred Candle), sold by reagent vendors.",
	feathers = "Levitate lets you float and fall slowly. It uses a Light Feather, sold by reagent vendors.",
	levitate = "Levitate lets you (or a friend) walk on water and fall slowly for 2 minutes. Uses a Light Feather.",
	hearthstone = "Your Hearthstone takes you back to the inn you set it to. Talk to an innkeeper to change it.",
}
