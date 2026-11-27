---
title: Well-Rested and Well Fed
parent: Features
nav_order: 5
description: A warning and a countdown card before Well-Rested or Well Fed runs out.
---

# Well-Rested and Well Fed

Two buffs that help while you level on Forever: Well-Rested from a Cozy Sleeping Bag (more experience), and Well Fed from buff food (better stats, and on Forever more experience too). Spiritbound tells you before they run out.

## What it does

- **Warning.** At a set time left (5 minutes for Well-Rested, 3 for Well Fed), a message shows in the middle of the screen and in chat, for example `Well Fed: 3 min left`, with a sound.
- **Countdown card.** From then on a card counts down the time left.
- **Well Fed is gone.** When Well Fed drops off, a message says so.
- **Rebuff warning.** Optional, off by default: when the buff is gone, a card stays up and, once out of combat and while you are alive, a message says `Well-Rested is gone, rebuff`.

![The Well-Rested card, unlocked]({{ '/screenshots/frames/wrpoint.png' | relative_url }})
![The Well Fed card, unlocked]({{ '/screenshots/frames/wfpoint.png' | relative_url }})

The shots show the cards unlocked, with sample text, in the Blizzard skin.

## How to use it

1. Nothing to set up: both are on by default.
2. Want to hear what the warning sounds like? Click **Test** next to Well-Rested or Well Fed on the **Extras** page.

## Settings

In `/spirit`, page **Extras**. Well-Rested and Well Fed each have the same settings:

| Setting | Default | What it does |
| --- | --- | --- |
| Warn | On | Watches this buff at all. Off means no warning, no card. |
| Sound | On | Plays the raid warning sound with the message. |
| Countdown card | On | The card that counts down the last minutes. Off: only the message. |
| Keep following it after it's gone (rebuff warning) | Off | Keeps a card up while the buff is missing, and warns once to rebuff. |
| Warn with time left | Well-Rested 5 min, Well Fed 3 min | When the warning comes, 1 to 30 minutes. |
| Test | | Shows the warning now, as it will look. |

![The Extras page in the options]({{ '/screenshots/options-extras.png' | relative_url }})

This shot was taken before the [buff key](buff-key.html) was added to the top of the Extras page.

## Good to know

**Well Fed says it's gone, but Well-Rested doesn't.**
That is on purpose. Only Well Fed says so when it drops. Turn on **Keep following it after it's gone** if you want a reminder for Well-Rested too.

**Nothing shows for a few seconds after a loading screen.**
Spiritbound waits about 5 seconds after you enter the world before it trusts your buff list.
