<!-- summary (CurseForge "Summary" field, at most 256 characters):
Priest helper for WoW: Forever: one-click cards when Power Word: Fortitude, Inner Fire, Divine Spirit or Shadow Protection is missing or running out, warnings before candles or feathers run out, and Levitate and your Hearthstone beside the Escape menu.
-->

# Spiritbound

**The priest helper for World of Warcraft: Forever: your buffs and reagents, explained.**

Spiritbound keeps your priest buffs up and your reagents stocked: a card when Fortitude, Inner Fire, Divine Spirit or Shadow Protection is missing or running out, and a warning before candles or feathers run out.

**Full guide with screenshots:** https://antnsn.github.io/Spiritbound/

**Beta:** Spiritbound is new. Spell IDs come from Classic and are checked on Forever before 0.1.0; tell us what doesn't work.

## Buffs
- **Power Word: Fortitude, Inner Fire, Divine Spirit** (talent) and **Shadow Protection** (when you turn it on): a card when one is missing or about to run out. Click it to cast.
- A **Prayer** from another priest counts, so you don't overwrite it.

## Reagents
- Says when your **Holy or Sacred Candles** (for Prayer of Fortitude) or **Light Feathers** (for Levitate) run low.

## Travel
- **Press Escape**: beside the game menu you get Levitate and your Hearthstone.

## Also in it
- **Buff key** (Extras page): out of combat, each press casts the next thing a card asks for, then Fortitude, Divine Spirit and Shadow Protection (when on) on the next group member in range who is missing them. When 3 or more in a party or raid group need a buff and you have the candle, it casts the Prayer version on the whole group.
- **Well Rested and Well Fed**: a countdown before they run out, with a sound if you like.
- **Carrot on a Stick** (Extras page, off by default): worn while you ride, in the trinket slot you pick; your own trinket goes back on when you get off. Not in instances, and never in combat.
- **Explained**: hover over a card or button for a plain-word explanation of what it does and why (can be turned off).
- **Your layout**: every frame can be moved, snapped to a grid and scaled (`/spirit unlock`).
- **Three skins**: the priest look, Blizzard and Flat.
- Loads on priests only.

## Commands
- `/spirit`: open the options
- `/spirit help`: list every command
- `/spirit unlock`: show every frame so you can drag it into place
- `/spirit lock`: lock the frames again
- `/spirit reset`: put every frame back where it started
- `/spirit grid [size]`: snap to a grid while moving, or set its size
- `/spirit minimap`: show or hide the minimap button
- `/spirit explain`: turn the plain-word explanations in tooltips on or off

## Ideas and contributions
- **Missing something?** New features are added on request: leave a comment here.
- **Feel free to contribute**: the code is on GitHub, https://github.com/antnsn/Spiritbound (issues and pull requests welcome).
- **Want a Bound addon for another class?** The shared core, LibBound, has a guide and API reference: https://antnsn.github.io/LibBound/

## The Bound family
Spiritbound is one of the Bound addons, one per class, built on the same core: Lightbound (paladin), Chronobound (mage), Stormbound (shaman), Packbound (hunter), Spiritbound (priest), Felbound (warlock), Dreambound (druid), Ragebound (warrior) and Shadowbound (rogue). They look like their class but work the same way, so if you know one, you know them all.

## Changelog
<!-- changelog:start -->
### 0.1.0 beta 6

- **Buff key uses the Prayers on groups and raids**: when 3 or more in a party or raid group need Fortitude, Divine Spirit or Shadow Protection and you have the candle, one press casts the Prayer version on that group. Set how many on the Buffs page (0 turns it off). Without a candle it casts the single buffs as before.
- **Carrot on a Stick** (Extras page, off by default): put it on when you mount, in the trinket slot you pick, and your own trinket back when you get off. Not in instances; in combat it waits until the fight is over. From LibBound, the same as in Lightbound.
- The Extras page is tidier: the Well-Rested and Well Fed switches sit in one row each.

### 0.1.0 beta 5

- **Buff key** (set it under Extras): out of combat, each press casts the next thing a card asks for, then Fortitude, Divine Spirit and Shadow Protection (when on) on the next party member in range who is missing it.
- Built on the latest LibBound, the shared core of the Bound addons, with its small fixes. Published on CurseForge straight from GitHub now.

### 0.1.0 beta 4

- **The emblem follows your spec**: the white hood for holy and discipline, the purple hood once you know a shadow talent spell (Shadowform, Vampiric Embrace, Mind Flay or Silence). It changes by itself when you respec.
- **Minimap button** works with minimap addons (EllesmereUI, SexyMap, ElvUI, MinimapButtonBag, broker bars): it is a LibDBIcon button now. Its place on the minimap is kept.

### 0.1.0 beta 3

- **New icon**: hand-painted class art for the icon, the emblem and the faint crest behind the cards.

### 0.1.0 beta 2

- **New look**: a painted icon and emblem, and a faint class crest behind every card and in the corner of the options window and the travel panel (the Blizzard and Flat skins stay plain).

### 0.1.0 beta 1

- First test build: Fortitude, Inner Fire, Divine Spirit and Shadow Protection cards (click to cast), candle and feather warnings, Levitate beside the Escape menu, Well-Rested and Well Fed, explanations, movable frames, Spirit, Blizzard and Flat skins. Built on LibBound-1.0.
<!-- changelog:end -->
