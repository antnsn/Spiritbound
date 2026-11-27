---
title: Getting started
nav_order: 2
description: Install Spiritbound and set it up in about two minutes.
---

# Getting started
{: .no_toc }

Two minutes from install to a priest whose buffs never drop unnoticed.
{: .fs-6 .fw-300 }

1. TOC
{:toc}

---

## 1. Install it

Pick one:

- **CurseForge app or WowUp:** search for **Spiritbound** and click Install.
- **By hand:** download it from [CurseForge](https://www.curseforge.com/wow/addons/spiritbound) or from [GitHub Releases](https://github.com/antnsn/Spiritbound/releases) (the `Spiritbound-<version>.zip` file, not the green "Code" button). Unzip it into your `World of Warcraft\_forever_\Interface\AddOns` folder, so you get a folder called `Spiritbound` there.

Start the game (or type `/reload` if it was already running) and log in on your priest.

{: .note }
Spiritbound only loads on priests. On any other character it turns itself off for that character from the next login, and `/spirit` only says that it is a priest addon.

## 2. Open the options

Type `/spirit` in chat, or click the Spiritbound button on your minimap.

The options window has five pages on the left: **Buffs**, **Reagents**, **Travel**, **Extras** and **Skin**. Almost everything is on by default. Shadow Protection is the one buff that starts off.

![The Buffs page in the options]({{ '/screenshots/options-buffs.png' | relative_url }})

The screenshots on this site show the Blizzard skin. The default skin, Spirit, is violet. See [Skins](features/skins.html).

## 3. Let the cards do their job

Play as usual. When one of your buffs has 2 minutes left, or is gone, a card shows up. Click it out of combat and Spiritbound casts the buff on you. See [Buffs](features/buffs.html).

A buff you haven't learned yet never shows a card. Divine Spirit is a Discipline talent, so it only appears once you have it.

## 4. Pick a buff key

Optional, but handy in a group.

1. In `/spirit`, open the **Extras** page.
2. Under **Buff key**, click the button next to **Key** and press the key you want.
3. Out of combat, press it. Each press casts one spell: first what a card asks for, then Fortitude, Divine Spirit or Shadow Protection on the next group member who is missing it.

More in [Buff key](features/buff-key.html).

## 5. Put the frames where you want them

1. Type `/spirit unlock`, Shift-click the minimap button, or click **Unlock frames** at the bottom of the options window.
2. Drag each frame where you want it. Scroll the mouse wheel over a frame to resize it.
3. Type `/spirit lock` to lock them.

`/spirit reset` puts every frame back where it started. More in [Frames and minimap](features/frames-and-minimap.html).

## That's it

Everything else works on its own. When you want to know what a card means or change how something behaves, look it up under [Features](features/).
