---
title: Buff key
parent: Features
nav_order: 2
description: One key that casts what a card asks for, then Fortitude, Divine Spirit and Shadow Protection on the next group member who needs them.
---

# Buff key

Press one key, out of combat, and Spiritbound casts the next buff that is needed: first your own, then the group's.

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

## Sharing the buffs with other priests

With more than one priest in a party or raid, you can split the Prayers between you. Whoever has a buff keeps the whole group on it, and the others leave it alone.

{: .note }
New in 0.1.0 beta 8.

- Open `/spirit`, page **Extras**, section **Who buffs the group**. Each Prayer has a row with who has it and a **Take** or **Release** button.
- **Take** makes the buff yours. The other priests see it at once, and their buff key and group card skip it. Yours keeps the whole group on it, even Shadow Protection while its card is off.
- **Release** gives it back, and everyone buffs it again.
- **It works with Buffy and Priestly.** Spiritbound uses the same assignment messages, so a priest on Buffy sees your choice and you see theirs.
- **Someone goes away:** when the priest with a buff goes offline, leaves, or hasn't been heard from for 3 minutes, the buff counts as nobody's, and your key buffs it again. The assignment comes back when they do.
- To take a buff, you need its Prayer (the group version). Only a priest who can cast the Prayer counts as having it.
- A line in chat tells you when someone else gives you a buff, takes one over, or goes away.
- `/spirit assign` lists who has each Prayer, and `/spirit assign 2` takes or releases the second one.
- Assignments are not saved. After a `/reload` Spiritbound asks the group again.
- You can't change them in combat.

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
Yes, when enough of one group need it and you have the candle. See step 1 above.

**My key does something else in the game too.**
Spiritbound binds the key on top of your normal bindings while it is set. Pick a key you don't use for anything else, or **Clear** it to get the old binding back.
