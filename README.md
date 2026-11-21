<p align="center"><img src="Spiritbound-hoods.png" width="180" alt="Spiritbound: the holy hood flickering into the shadow hood"></p>

# Spiritbound

A priest helper for **WoW: Forever**, part of the Bound family: one addon per class on the same
core (Lightbound, Chronobound, Stormbound, Packbound, Spiritbound, Felbound, Dreambound, Ragebound, Shadowbound).
The emblem follows your spec: the white hood for holy and discipline, the purple one once you know
a shadow talent.

Full guide with screenshots: https://antnsn.github.io/Spiritbound/

- **Buffs**: a card when Power Word: Fortitude, Inner Fire, Divine Spirit (talent) or Shadow
  Protection (if you want it) is missing or running out. Click it to cast. A Prayer from another
  priest counts.
- **Reagents**: says when candles for Prayer of Fortitude or Light Feathers for Levitate run low.
- **Travel**: press Escape, and beside the game menu you get Levitate and your Hearthstone.
- **Buff key** (Extras page): out of combat, each press casts the next thing a card asks for, then Fortitude, Divine Spirit and Shadow Protection (when on) on the next group member in range who is missing them.
- **Well-Rested and Well Fed** timers, plain-word explanations in tooltips, movable frames
  (`/spirit unlock`), three skins (Spirit, Blizzard, Flat).

Type `/spirit` for the options, `/spirit help` for the commands.

## Install

1. Open [Releases](https://github.com/antnsn/Spiritbound/releases) and download
   `Spiritbound-<version>.zip` (not the green "Code > Download ZIP" button).
2. Unzip it into `World of Warcraft/_forever_/Interface/AddOns/`, so you get `AddOns/Spiritbound`.
3. Restart the game. Spiritbound only loads on priests.

## Development

Built on [LibBound](https://github.com/antnsn/LibBound), developed in the folder next to it.

```bash
tools/sync-libbound.sh
for f in *.lua; do luac5.1 -p "$f"; done
~/.luarocks/bin/luacheck .
wowbench check . && wowbench test .
wowbench pack . --set-version 0.1.0
python3 tools/make_media.py
```

## License

GPL-3.0-or-later: GNU General Public License, version 3 or (at your option) any later
version; see [LICENSE](LICENSE). LibBound-1.0 (in `Libs/LibBound`) is MIT, see its own LICENSE.
