---
title: Buff key
parent: Features
nav_order: 2
description: One key that casts what a card asks for, then Fortitude, Divine Spirit and Shadow Protection on the next group member who needs them.
---

# Buff key

Press one key, out of combat, and Spiritbound casts the next buff that is needed: first your own, then the group's.

{: .note }
The buff key is new and not in a CurseForge release yet. It is listed under **Unreleased** in the changelog.

## What it does

- Each press casts **one** spell: the next thing that is needed.
- The order is always the same:
  1. **A Prayer for a whole group.** When at least 3 people in one group need Fortitude (or Divine Spirit, or Shadow Protection) and you have the candle, the key casts Prayer of Fortitude (Prayer of Spirit, Prayer of Shadow Protection) on one of them. In a party that is the whole party, you included; in a raid it is one raid group (1 to 8) at a time.
  2. **What a card asks for.** If a [buff card](buffs.html) is offering a cast (a buff with 2 minutes or less left, or a missing buff with **When missing** on), the key casts that, the same as clicking the card. With several cards up, the order is Fortitude, Inner Fire, Divine Spirit, Shadow Protection.
  3. **Power Word: Fortitude** on the next group member in range who is missing it.
  4. **Divine Spirit** on the next group member in range who is missing it.
  5. **Shadow Protection** on the next group member in range who is missing it.
- It works in a party and in a raid. You are covered by the cards, so the single casts skip you; for a Prayer you count as one of your group.
- **Candles:** Prayer of Fortitude rank 1 uses a Holy Candle, rank 2 and the other Prayers a Sacred Candle. The key uses the best rank you know; without its candle it casts the single buffs instead.
- **How many:** set it on the **Buffs** page, under **Group buffs** (default 3). At 0 the key never casts a Prayer.
- A buff with less than 1 minute left counts as missing.
- **Lower-level players get the rank they can take.** A buff only goes on someone at most 10 levels below the rank's spell level, so a level 22 gets Power Word: Fortitude rank 3, not rank 6. A Prayer is skipped for a group with someone too low for it; they get single casts instead.
- The group version counts: someone with Prayer of Fortitude doesn't get Power Word: Fortitude on top. Single casts use the highest rank you know.
- It skips players who are offline, dead, not friendly, too far away or out of range of the spell.
- Only the buffs you watch go to the group: a buff with **Show** off on the **Buffs** page is skipped. Shadow Protection starts off, so it is skipped until you turn it on. Divine Spirit is skipped until you have the talent.
- When there is nothing to do, a press says `nothing to buff right now.` in chat.

## How to use it

1. Type `/spirit` and open the **Extras** page.
2. Under **Buff key**, click the button next to **Key**, then press the key you want (for example a mouse button). Esc cancels.
3. Out of combat, press the key until it says there is nothing to buff. Each press casts one buff.

## Settings

In `/spirit`, page **Extras**, section **Buff key**:

| Setting | Default | What it does |
| --- | --- | --- |
| Key | Not set | The key itself. **Clear** removes it. |

Which buffs the key casts follows the **Show** switches on the **Buffs** page. See [Buffs](buffs.html#settings).

## Good to know

**Does it work in combat?**
No. The game does not let addons pick targets for you in combat, so the key does nothing until combat ends. Buff before the pull.

**Someone is missing Fortitude but the key says there is nothing to buff.**
Common reasons: the player is out of range, or Spiritbound can't read their buffs. When some of a player's buffs are hidden from addons, Spiritbound counts that player as buffed rather than nag you.

**Does it use Prayer of Fortitude?**
No. The key casts Power Word: Fortitude, Divine Spirit and Shadow Protection one player at a time. Cast the Prayer versions yourself.

**My key does something else in the game too.**
Spiritbound binds the key on top of your normal bindings while it is set. Pick a key you don't use for anything else, or **Clear** it to get the old binding back.
