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
- **Buff key** (Extras page): out of combat, each press casts the next thing a card asks for, then Fortitude, Divine Spirit and Shadow Protection (when on) on the next group member in range who is missing them.
- **Well Rested and Well Fed**: a countdown before they run out, with a sound if you like.
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
Spiritbound is one of the Bound addons, one per class, built on the same core: Lightbound (paladin), Chronobound (mage), Stormbound (shaman), Packbound (hunter), Spiritbound (priest), Felbound (warlock) and Dreambound (druid). They look like their class but work the same way, so if you know one, you know them all.

## Changelog
<!-- changelog:start -->
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
