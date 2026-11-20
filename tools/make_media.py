"""Draws Spiritbound's textures into Media/ (TGA, power-of-two sizes).

Run from the addon folder:  python3 tools/make_media.py
Card textures are white with alpha so the game can tint them; the emblem comes from the painted art.
"""
import random
from PIL import Image, ImageChops, ImageDraw, ImageFilter


OUT = "Media/"
ART = "Spiritbound.png"  # painted by Marius; the logo, icon and crest are made from it


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
    """The emblem, from the painted art in Spiritbound.png (also the CurseForge project picture)."""
    return Image.open(ART).convert("RGBA").resize((size, size), Image.LANCZOS)


def crest(size=256):
    """The card crest: the same art as a white shape for the game to tint, its light parts
    brighter, so the faint motif behind the cards matches the icon."""
    art = emblem(size)
    lum = art.convert("L").point([int(70 + v * 185 / 255) for v in range(256)])
    alpha = ImageChops.multiply(art.getchannel("A"), lum)
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(alpha)
    return out

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
    save(crest(), "Crest")
    save(rim(), "Rim")
    save(emblem(256), "Logo256")
    save(emblem(64), "Logo64")
    save(icon(64), "Icon64")
    save(icon(128), "Icon128")
