---
title: Dispel
parent: Features
nav_order: 9
description: A grid of your group that shows who has Magic or a Disease you can remove, with Dispel Magic on a click and Cure Disease on a right-click.
---

# Dispel

See at a glance who has a Magic debuff or a Disease you can remove, and remove it with one click or one key, in combat too.

{: .note }
New in 0.1.0. The same frame as Lightbound's Cleanse, shared through LibBound.

## What it does

- **Click** a cell or row: **Dispel Magic** on that player (Magic).
- **Right-click**: **Cure Disease** (Disease). Once you learn **Abolish Disease**, it uses that instead.
- **Grid** (the default): one small cell per group member, like Decursive. A cell lights up in the debuff's colour (blue Magic, brown Disease) with its icon and stack count.
- **List**: one row per player who has something you can remove.
- **Two keys**: one for Dispel Magic, one for Cure Disease. Each casts on whoever is under your mouse: a grid cell, a list row, or any raid or party frame. With nothing under the mouse, it casts on your target.
- Players out of range are dimmed. A sound plays when someone new needs a dispel.
- An **ignore list** hides debuffs you don't want to see.
- The frame shows up once you know Dispel Magic or Cure Disease.

## How to use it

1. Type `/spirit` and open the **Dispel** page.
2. Under **Keys**, click the button next to **Dispel Magic** and press a key. Do the same for **Cure Disease**. Esc cancels.
3. Pick **Grid** or **List**.
4. In a fight, click a coloured cell (blue: click, brown: right-click), or hover over a player and press the key for that debuff.
5. To hide a debuff you never want to remove, type `/spirit ignore` followed by its full name, for example `/spirit ignore Debuff Name`. The same command again removes it. `/spirit ignore` on its own lists what you ignore.

## Settings

In `/spirit`, page **Dispel**:

| Setting | Default | What it does |
| --- | --- | --- |
| Show the dispel frame | On | The grid or list. |
| Include pets | Off | Adds group pets. |
| Dim players out of range | On | |
| Sound when someone new needs it | On | |
| Show when solo | On | Just you. Off: only in a group. |
| Names in cells (26 px and up) | Off | Three letters of each name, from 26 px cells up. |
| Grid or list | Grid | Grid: a cell per group member that follows the roster in combat. List: a row per afflicted player. |
| Grid: cells per row | 5 | 1 to 10. |
| Grid: cell size | 22 px | 14 to 40 px. |
| List: rows | 5 | 1 to 10. |
| Dispel Magic (key) | Not set | Dispel Magic on the player under your mouse, else your target. Works in combat. |
| Cure Disease (key) | Not set | Cure Disease (or Abolish Disease) the same way. |

The bottom of the page lists your ignored debuffs.

## Good to know

**Does it work in combat?**
Yes. Clicking cells and the keys work in combat. The grid also follows players joining, leaving and moving between raid groups during a fight.

**Layout changes wait for the end of combat.**
Switching between grid and list, cell size, cells per row and pets change after combat. Spiritbound tells you in chat.

**Combat hides debuff details on Forever.**
In the grid, the game itself draws the debuff colour and icon in each cell, so the grid keeps working in combat. The tooltip may say "Debuff details hidden right now". The **list** relies on what the addon can read, so in combat it can miss debuffs.

**Which click?**
The tooltip says it: each debuff has `(Magic, click)` or `(Disease, right-click)` after its name. In combat, when the tooltip can't read the debuff, go by the colour: blue is a click, brown is a right-click.

**Clicking a cell that isn't lit** still casts on that player. That is on purpose: in combat the addon may not see a debuff the game hides.
