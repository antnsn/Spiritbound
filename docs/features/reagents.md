---
title: Reagents
parent: Features
nav_order: 3
description: A card when your candles for Prayer of Fortitude or your Light Feathers for Levitate run low.
---

# Reagents

Prayer of Fortitude uses a candle and Levitate uses a Light Feather. Spiritbound tells you before you run out, so you can stock up at the next reagent vendor.

## What it does

- One card, **Reagents running low**, shows when either reagent is at or below its limit.
- **Candles:** once you know Prayer of Fortitude. With the first rank it counts **Holy Candles**; once you know the second rank it counts **Sacred Candles**.
- **Light Feathers:** once you know Levitate.
- The card shows the counts, for example `Holy Candles 3` or `Sacred Candles 2 · Feathers 1`. When one of them is at 0, the text turns red.
- The card is hidden in combat and comes back after the fight.
- It updates when your bags change, so it goes away as soon as you buy more.

![The reagents card, unlocked]({{ '/screenshots/skins/blizzard/frames/rgpoint.png' | relative_url }})

The shot shows the card unlocked, with sample text, in the Blizzard skin.

## How to use it

1. Nothing to set up: both warnings are on by default.
2. When the card shows, visit a reagent vendor and buy candles or feathers.
3. Want more warning? Raise the limits on the **Reagents** page.

Spiritbound does not buy reagents for you.

## Settings

In `/spirit`, page **Reagents**:

| Setting | Default | What it does |
| --- | --- | --- |
| Warn when candles run low | On | The candle part of the card. |
| Candles: warn at | 5 | Warns at this many candles or fewer, 0 to 40. |
| Warn when Light Feathers run low | On | The feather part of the card. |
| Feathers: warn at | 3 | Warns at this many feathers or fewer, 0 to 20. |

![The Reagents page in the options]({{ '/screenshots/skins/blizzard/options-reagents.png' | relative_url }})

## Good to know

**I have Holy Candles but the card says Sacred Candles 0.**
Once you know the second rank of Prayer of Fortitude, Spiritbound counts Sacred Candles, the candle that rank uses. Holy Candles no longer count.

**Set to 0, does it turn the warning off?**
No. At 0 it still warns when you have none left. Use the switch to turn a warning off.

**No card before I learn the spell.**
That is on purpose. The candle warning starts once you know Prayer of Fortitude, the feather warning once you know Levitate.
