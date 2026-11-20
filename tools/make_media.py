"""Draws Spiritbound's textures into Media/ (TGA, power-of-two sizes).

Run from the addon folder:  python3 tools/make_media.py
Card textures are white with alpha so the game can tint them; the emblem comes from the painted art.
"""
import random
from PIL import Image, ImageChops, ImageDraw, ImageFilter


OUT = "Media/"
ART = "Spiritbound.png"  # painted by Marius (holy/discipline): the logo, icon and crest are made from it
SHADOW_ART = "Spiritbound-shadow.png"  # the shadow version: "...Shadow" files, shown once you know a shadow talent spell


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


def emblem(size=256, art=ART):
    """The emblem, from the painted art in Spiritbound.png (also the CurseForge project picture)."""
    return Image.open(art).convert("RGBA").resize((size, size), Image.LANCZOS)


def crest(size=256, art=ART):
    """The card crest: the same art as a white shape for the game to tint, its light parts
    brighter, so the faint motif behind the cards matches the icon."""
    art = emblem(size, art)
    lum = art.convert("L").point([int(70 + v * 185 / 255) for v in range(256)])
    alpha = ImageChops.multiply(art.getchannel("A"), lum)
    out = Image.new("RGBA", (size, size), (255, 255, 255, 0))
    out.putalpha(alpha)
    return out

def icon(size, art=ART):
    bg = Image.new("RGBA", (size, size), (0, 0, 0, 255))
    d = ImageDraw.Draw(bg)
    for y in range(size):
        t = y / size
        d.line([(0, y), (size, y)], fill=(int(26 + 26 * (1 - t)), int(20 + 22 * (1 - t)), int(40 + 40 * (1 - t)), 255))
    e = emblem(size * 2, art).resize((size, size), Image.LANCZOS)
    return Image.alpha_composite(bg, e)



def flicker(size=320, seed=5):
    """The README animation (APNG, alpha kept): the holy hood, a flickering glitch, the shadow
    hood, and back. Strips of the picture jump sideways, the colours split, frames drop out."""
    rnd = random.Random(seed)
    holy, shadow = emblem(size), emblem(size, SHADOW_ART)

    def glitch(img, strength):
        out = Image.new("RGBA", img.size, (0, 0, 0, 0))
        y = 0
        while y < size:
            h = rnd.randint(4, 26)
            dx = int(rnd.uniform(-1, 1) * strength * size * 0.08) if rnd.random() < 0.55 else 0
            out.alpha_composite(img.crop((0, y, size, min(size, y + h))), (dx, y))
            y += h
        r, g, b, a = out.split()
        shift = max(1, int(strength * 6))
        r = ImageChops.offset(r, -shift, 0)
        b = ImageChops.offset(b, shift, 0)
        return Image.merge("RGBA", (r, g, b, a))

    def fade(img, k):
        r, g, b, a = img.split()
        return Image.merge("RGBA", (r, g, b, a.point(lambda v: int(v * k))))

    def flash(img, k):
        white = Image.new("RGBA", img.size, (255, 255, 255, 0))
        white.putalpha(img.getchannel("A").point(lambda v: int(v * k)))
        return Image.alpha_composite(img, white)

    def flick(a, b):
        seq = [(glitch(a, 0.4), 60), (fade(a, 0.5), 40), (glitch(b, 0.8), 50), (flash(a, 0.6), 30),
               (glitch(a, 1.0), 40), (fade(b, 0.3), 30), (glitch(b, 0.6), 60), (flash(b, 0.8), 30),
               (fade(a, 0.2), 40), (glitch(b, 1.0), 50), (glitch(b, 0.3), 70)]
        return seq

    frames = [(holy, 2200)] + flick(holy, shadow) + [(shadow, 2200)] + flick(shadow, holy)
    imgs, durs = zip(*frames)
    imgs[0].save("Spiritbound-hoods.png", save_all=True, append_images=list(imgs[1:]), duration=list(durs),
                 loop=0, disposal=1, blend=0, optimize=True)
    print("wrote Spiritbound-hoods.png (%d frames)" % len(imgs))

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
    # the shadow variant (LibBound's ns.SetEmblem adds the suffix)
    save(crest(art=SHADOW_ART), "CrestShadow")
    save(emblem(256, SHADOW_ART), "Logo256Shadow")
    save(emblem(64, SHADOW_ART), "Logo64Shadow")
    save(icon(64, SHADOW_ART), "Icon64Shadow")
    flicker()  # the README animation
