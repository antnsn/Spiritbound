"""Draws Spiritbound's textures into Media/ (TGA, power-of-two sizes).

Run from the addon folder:  python3 tools/make_media.py
Card textures are white with alpha so the game can tint them; the emblem is drawn in colour.
"""
import math
import random
from PIL import Image, ImageDraw, ImageFilter

import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "LibBound", "tools"))
from paint import Canvas, bar, disc, grow, leaf, lick, mask, minus, poly, radial_disc, rays, ring, sparkle, union  # noqa: E402

S = 1024

OUT = "Media/"


def mist(size=128, seed=9):
    """Soft drifting mist, tileable, white on alpha."""
    rnd = random.Random(seed)
    img = Image.new("L", (size, size), 0)
    d = ImageDraw.Draw(img)
    for _ in range(40):
        x, y = rnd.randrange(size), rnd.randrange(size)
        rx, ry = rnd.randint(14, 34), rnd.randint(5, 12)
        v = rnd.randint(25, 70)
        for dx in (-size, 0, size):
            for dy in (-size, 0, size):
                d.ellipse([x + dx - rx, y + dy - ry, x + dx + rx, y + dy + ry], fill=v)
    img = img.filter(ImageFilter.GaussianBlur(7))
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out


def feather(size=32):
    """A small feather lying out of the top-left corner: a quill and soft barbs."""
    s = size * 4
    img = Image.new("L", (s, s), 0)
    d = ImageDraw.Draw(img)
    x0, y0, x1, y1 = s * 0.06, s * 0.06, s * 0.78, s * 0.78
    d.line([(x0, y0), (x1, y1)], fill=255, width=int(s * 0.025))
    for k in range(1, 9):
        t = k / 10
        cx, cy = x0 + (x1 - x0) * t, y0 + (y1 - y0) * t
        ln = s * 0.13 * (1 - abs(t - 0.45))
        d.line([(cx, cy), (cx + ln, cy - ln * 0.35)], fill=200, width=int(s * 0.018))
        d.line([(cx, cy), (cx - ln * 0.35, cy + ln)], fill=200, width=int(s * 0.018))
    img = img.filter(ImageFilter.GaussianBlur(s * 0.008)).resize((size, size), Image.LANCZOS)
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out


def rim(size=64, width=5):
    img = Image.new("L", (size, size), 0)
    d = ImageDraw.Draw(img)
    for i in range(width * 2):
        v = int(255 * (1 - i / (width * 2)) ** 2)
        d.rectangle([i, i, size - 1 - i, size - 1 - i], outline=v)
    img = img.filter(ImageFilter.GaussianBlur(1.2))
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out


def emblem(size=256):
    """The Spiritbound emblem, painted (tools in LibBound/tools/paint.py)."""
    s = S
    cv = Canvas(s)
    radial_disc(cv, 0.40, (78, 60, 120), (14, 10, 28))
    cv.light(rays(s, 32, 0.06, 0.40, 0.045, cy=0.46 * s).filter(ImageFilter.GaussianBlur(6)), (255, 220, 160), 0.45)
    rg = ring(s, 0.415, 0.372)
    cv.glow(rg, (220, 200, 255), 18, 0.5)
    cv.paint(rg, top=(245, 240, 255), bottom=(120, 105, 160), bevel=8, gloss=0.6)
    # wings: an arm curving up and out from each shoulder, long flight feathers hanging from it,
    # a row of short coverts over their roots; out past the ring
    for side in (-1, 1):
        for row, (n, lmin, lmax, wd, top, bot) in enumerate(((9, 0.12, 0.30, 0.034, (250, 248, 255), (150, 130, 205)),
                                                             (7, 0.07, 0.13, 0.034, (255, 255, 255), (200, 185, 240)))):
            for k in range(n)[::-1]:
                t = (k + (0.5 if row else 0)) / n
                ax = 0.5 + side * (0.07 + 0.38 * t)
                ay = 0.50 - 0.20 * math.sin(t * math.pi * 0.62) - 0.02 * t
                ang = math.radians(100 - 85 * t)       # down near the shoulder, out at the tip
                a = math.pi - ang if side < 0 else ang
                ln = lmin + (lmax - lmin) * t ** 0.8
                f = leaf(s, ax, ay, a, ln, wd * (0.8 + 0.4 * t), bend=-0.012 * side)
                cv.shadow(f, 6, 2, 5, 0.35)
                cv.paint(f, top=top, bottom=bot, bevel=5, gloss=0.35, light=0.6, dark=0.5)
    orb = disc(s, 0.06, 0.5 * s, 0.52 * s)
    cv.glow(orb, (255, 230, 170), 50, 1.0)
    cv.light(orb.filter(ImageFilter.GaussianBlur(14)), (255, 245, 210), 1.0)
    halo = mask(s); d = ImageDraw.Draw(halo)
    d.ellipse([0.33 * s, 0.17 * s, 0.67 * s, 0.31 * s], outline=255, width=int(0.028 * s))
    cv.glow(halo, (255, 220, 140), 30, 0.9)
    cv.paint(halo, top=(255, 250, 220), bottom=(210, 150, 50), bevel=6, gloss=0.8)
    return cv.image(size)


def icon(size):
    bg = Image.new("RGBA", (size, size), (0, 0, 0, 255))
    d = ImageDraw.Draw(bg)
    for y in range(size):
        t = y / size
        d.line([(0, y), (size, y)], fill=(int(26 + 26 * (1 - t)), int(20 + 22 * (1 - t)), int(40 + 40 * (1 - t)), 255))
    e = emblem(size * 2).resize((size, size), Image.LANCZOS)
    return Image.alpha_composite(bg, e)


def _finish(img, size):
    """White line art at 4x: a soft glow under it, down to size, as alpha."""
    glow = img.filter(ImageFilter.GaussianBlur(img.size[0] * 0.012))
    img = Image.composite(img, glow, img).resize((size, size), Image.LANCZOS)
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(img)
    return out

def crest(size=256):
    """The card crest: a halo with wings of light."""
    s = size * 4
    c = s / 2
    img = Image.new("L", (s, s), 0)
    d = ImageDraw.Draw(img)
    w = int(s * 0.02)
    d.ellipse([c - s * 0.16, s * 0.18, c + s * 0.16, s * 0.34], outline=255, width=int(w * 1.4))
    for side in (-1, 1):
        for k in range(5):
            r = s * (0.18 + k * 0.06)
            x0 = c + side * s * 0.06
            box = [x0 - r, s * 0.40 - r * 0.6, x0 + r, s * 0.40 + r * 0.9]
            a0, a1 = (180, 250) if side < 0 else (290, 360)
            d.arc(box, a0, a1, fill=255 - k * 25, width=w)
    for k in range(7):
        a = math.radians(-60 + k * 20)
        d.line([(c + math.sin(a) * s * 0.10, s * 0.50 + math.cos(a) * s * 0.10),
                (c + math.sin(a) * s * 0.36, s * 0.50 + math.cos(a) * s * 0.36)], fill=150, width=int(w * 0.6))
    return _finish(img, size)


def save(img, name):
    img.save(OUT + name + ".tga")
    print("wrote", OUT + name + ".tga", img.size)


if __name__ == "__main__":
    save(mist(), "Mist")
    save(feather(), "Feather")
    save(crest(), "Crest")
    save(rim(), "Rim")
    save(emblem(256), "Logo256")
    save(emblem(64), "Logo64")
    save(icon(64), "Icon64")
    save(icon(128), "Icon128")
    emblem(1024).save("Spiritbound.png")  # the CurseForge project picture
    print("wrote Spiritbound.png (1024, 1024)")
