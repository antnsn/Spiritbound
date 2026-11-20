"""Draws Spiritbound's textures into Media/ (TGA, power-of-two sizes).

Run from the addon folder:  python3 tools/make_media.py
Card textures are white with alpha so the game can tint them; the emblem is drawn in colour.
"""
import math
import random
from PIL import Image, ImageDraw, ImageFilter

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
    """The Spiritbound emblem: a halo ring with a candle flame, silver and pale violet."""
    s = size * 4
    c = s / 2
    img = Image.new("RGBA", (s, s), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.ellipse([s * 0.10, s * 0.10, s * 0.90, s * 0.90], outline=(225, 220, 250, 230), width=int(s * 0.035))
    d.ellipse([s * 0.30, s * 0.14, s * 0.70, s * 0.26], outline=(245, 240, 255, 235), width=int(s * 0.02))  # halo
    # the candle
    d.rectangle([c - s * 0.07, s * 0.52, c + s * 0.07, s * 0.80], fill=(235, 230, 250, 255))
    d.line([(c, s * 0.52), (c, s * 0.47)], fill=(120, 110, 140, 255), width=int(s * 0.012))
    # the flame
    flame = [(c, s * 0.28), (c + s * 0.07, s * 0.40), (c + s * 0.045, s * 0.47), (c, s * 0.49),
             (c - s * 0.045, s * 0.47), (c - s * 0.07, s * 0.40)]
    d.polygon(flame, fill=(250, 236, 190, 255))
    inner = [(c, s * 0.35), (c + s * 0.03, s * 0.42), (c, s * 0.46), (c - s * 0.03, s * 0.42)]
    d.polygon(inner, fill=(255, 255, 240, 255))
    glow = img.filter(ImageFilter.GaussianBlur(s * 0.025))
    return Image.alpha_composite(glow, img).resize((size, size), Image.LANCZOS)


def icon(size):
    bg = Image.new("RGBA", (size, size), (0, 0, 0, 255))
    d = ImageDraw.Draw(bg)
    for y in range(size):
        t = y / size
        d.line([(0, y), (size, y)], fill=(int(26 + 26 * (1 - t)), int(20 + 22 * (1 - t)), int(40 + 40 * (1 - t)), 255))
    e = emblem(size * 2).resize((size, size), Image.LANCZOS)
    return Image.alpha_composite(bg, e)


def save(img, name):
    img.save(OUT + name + ".tga")
    print("wrote", OUT + name + ".tga", img.size)


if __name__ == "__main__":
    save(mist(), "Mist")
    save(feather(), "Feather")
    save(rim(), "Rim")
    save(emblem(256), "Logo256")
    save(emblem(64), "Logo64")
    save(icon(64), "Icon64")
    save(icon(128), "Icon128")
