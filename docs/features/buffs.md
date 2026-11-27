---
title: Buffs
parent: Features
nav_order: 1
description: A card when Power Word: Fortitude, Inner Fire, Divine Spirit or Shadow Protection is missing or running out. Click it to cast.
---

# Buffs

Your long priest buffs, watched for you. When one runs low or drops off, a card shows up, and one click puts it back.

## What it does

Spiritbound watches four buffs on you:

| Buff | On by default | Group version that also counts |
| --- | --- | --- |
| Power Word: Fortitude | Yes | Prayer of Fortitude |
| Inner Fire | Yes | |
| Divine Spirit | Yes | Prayer of Spirit |
| Shadow Protection | No | Prayer of Shadow Protection |

For each one:

- **Running out.** With 2 minutes left, a message shows in the middle of the screen and in chat, for example `Power Word: Fortitude: 2 min left`, and a card appears with a countdown.
- **Gone.** When the buff is missing, the card shows **Missing: click to cast**, faded. Once, out of combat and while you are alive, a message says `Inner Fire is gone, rebuff`.
- **Click to cast.** Out of combat, click the card and Spiritbound casts the highest rank you know on yourself.
- **Group versions count.** A Prayer of Fortitude from another priest counts as Fortitude, so the card doesn't ask you to overwrite it. The same goes for Prayer of Spirit and Prayer of Shadow Protection.
- **Not learned, not shown.** A buff you don't know yet never shows a card or a warning. Divine Spirit is a Discipline talent, so its card only appears once you have the talent.

The card goes away as soon as the buff is back.

![The Power Word: Fortitude card, unlocked]({{ '/screenshots/frames/fortitudepoint.png' | relative_url }})

The other three cards look the same:

![The Inner Fire card]({{ '/screenshots/frames/innerfirepoint.png' | relative_url }})
![The Divine Spirit card]({{ '/screenshots/frames/divinespiritpoint.png' | relative_url }})
![The Shadow Protection card]({{ '/screenshots/frames/shadowprotectionpoint.png' | relative_url }})

These shots show the cards unlocked, with sample text, in the Blizzard skin.

## How to use it

1. Play as usual. Nothing shows while all your buffs have more than 2 minutes left.
2. When a card shows, click it out of combat. Hover over it first if you want to see which spell it will cast.
3. Want Shadow Protection watched too? Open `/spirit`, page **Buffs**, and tick **Show** under **Shadow Protection**.

To move the cards, see [Frames and minimap](frames-and-minimap.html).

## Settings

In `/spirit`, page **Buffs**. Each buff has its own row with three switches:

| Setting | Default | What it does |
| --- | --- | --- |
| Show | On (Shadow Protection: off) | Watches this buff at all. Off means no card and no messages for it, and the [buff key](buff-key.html) doesn't cast it on the group either. |
| Sound | Off | Plays the raid warning sound with the messages. |
| When missing | On | Shows the **Missing: click to cast** card and the one-time "is gone, rebuff" message when the buff is gone. Off: you only get the warning and countdown before it runs out. For Shadow Protection it only matters once **Show** is on. |

Under **Group buffs** on the same page:

| Setting | Default | What it does |
| --- | --- | --- |
| A card with who in the group lacks a buff | On | In a party or raid, out of combat: a **Group needs buffs** card with how many lack each buff (for example `Fortitude 2 · Spirit 1`). Hover it to see their names. Players too far away to cast on count too; the buff key gets them once they are in range. Gone when everyone has the buffs. |
| Buff key: a Prayer when this many in a group need it | 3 | See [Buff key](buff-key.html). 0: never a Prayer, only single casts. |

![The Group needs buffs card]({{ '/screenshots/frames/gbpoint.png' | relative_url }})

![The Buffs page in the options]({{ '/screenshots/options-buffs.png' | relative_url }})

## Good to know

**Can I click the card in combat?**
No. The game does not let addons cast for you in combat, so the click only works out of combat. The card stays visible, so you know what to do after the fight.

**Can I change the 2 minutes?**
Not for the priest buffs. The time is fixed at 2 minutes. Well-Rested and Well Fed have a slider (see [Well-Rested and Well Fed](well-rested-and-well-fed.html)).

**I turned When missing off and now the card never shows for a missing buff.**
That is what the switch does. With it off, the card only shows for the last 2 minutes of a buff. The [buff key](buff-key.html) also skips a missing buff then, since it casts what the cards ask for.

**Right after login or a loading screen, nothing shows for a few seconds.**
Spiritbound waits about 5 seconds after you enter the world, so it doesn't call a buff missing before the game has filled in your buffs.

**In combat a buff dropped and no card came up.**
Forever hides some buffs from addons in combat. Spiritbound doesn't call a buff missing when it can't see it, and checks again after the fight.
