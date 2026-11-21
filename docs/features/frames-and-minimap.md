---
title: Frames and minimap
parent: Features
nav_order: 7
description: Moving and resizing every frame, the grid, and the minimap button.
---

# Frames and minimap

Put every Spiritbound frame exactly where you want it, and open the options from the minimap.

## What it does

### Moving and resizing frames

- Spiritbound has seven frames: the four [buff cards](buffs.html), the [reagents card](reagents.html), and the [Well-Rested and Well Fed](well-rested-and-well-fed.html) cards.
- Unlocking shows **every** frame, with sample content, so you can place frames that are normally hidden.
- Drag a frame to move it. Frames snap to a grid around the center of your screen. Hold **Shift** while dragging to place a frame freely.
- Scroll the **mouse wheel** over a frame to make it bigger or smaller (50% to 250%).
- While unlocked, a small bar at the top of the screen sets the grid size (**-** and **+**, or the mouse wheel; hold Shift for 1 pixel steps), turns **Snap** on or off, and has a **Lock** button.
- **Reset positions** puts every frame back in its default place and size.

### Minimap button and addon menu

| Click | Does |
| --- | --- |
| Left-click | Opens the options (`/spirit`). |
| Shift-click or middle-click | Unlocks the frames (and locks them again). |
| Drag | Moves the button around the minimap. |

Minimap addons such as EllesmereUI, SexyMap, ElvUI, MinimapButtonBag and broker bars can collect the button like any other. Where the game has an addon menu (the puzzle-piece button), Spiritbound is listed there too, with the same clicks. The game's **Settings > AddOns** list also has a Spiritbound entry with an **Open options** button.

## How to use it

1. Type `/spirit unlock`, Shift-click the minimap button, or click **Unlock frames** at the bottom of the `/spirit` window.
2. Drag frames into place. Scroll on a frame to resize it.
3. Click **Lock** on the bar at the top, or type `/spirit lock`.
4. Made a mess? `/spirit reset` (or **Reset positions** in `/spirit`) puts everything back.

## Settings

In `/spirit`, page **Skin**, section **General**:

| Setting | Default | What it does |
| --- | --- | --- |
| Minimap button (left-click options, shift-click unlock) | On | Shows or hides the minimap button. Also `/spirit minimap`. |

The grid has no options page. Change it on the bar shown while frames are unlocked, or with `/spirit grid`:

| Command | Does |
| --- | --- |
| `/spirit grid` | Turns snapping on or off (on by default). |
| `/spirit grid 30` | Sets the grid size (4 to 100, default 20) and turns snapping on. |

## Good to know

**Not in combat.**
Unlocking, locking, moving, resizing and resetting frames all wait until you leave combat.

**Closing the options window** locks the frames again, but only if you unlocked them with the options' own button. Frames unlocked with `/spirit unlock` stay unlocked until you lock them.

**The options window** is moved by dragging its title bar, not with unlock. The [travel panel](travel.html) always sits beside the game menu.
