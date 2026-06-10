#!/usr/bin/env python3
"""Build dist/chatgpt/plot-style.zip from the canonical skill source.

The ChatGPT workspace scanner needs `plot-style/SKILL.md` at the archive top
level with FORWARD-SLASH paths. Windows zip tools emit backslash separators,
which some extractors keep literally and then fail to find SKILL.md — so we
write arcnames explicitly here.

Rendered example PNGs (examples/image_fig/) are excluded: they bloat the
package ~2.7 MB and ChatGPT cannot run MATLAB to use them anyway.

Usage:  python dist/chatgpt/build_zip.py
"""
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "REM2-plugin" / "skills" / "plot-style"
OUT = ROOT / "dist" / "chatgpt" / "plot-style.zip"
EXCLUDE_DIRS = {"image_fig"}

def main() -> None:
    files = sorted(
        p for p in SRC.rglob("*")
        if p.is_file() and not (EXCLUDE_DIRS & set(p.relative_to(SRC).parts))
    )
    with zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED) as z:
        for p in files:
            arc = "plot-style/" + p.relative_to(SRC).as_posix()  # forward slashes
            z.write(p, arc)
    print(f"wrote {OUT} ({OUT.stat().st_size} bytes, {len(files)} files)")
    for f in files:
        print("  plot-style/" + f.relative_to(SRC).as_posix())

if __name__ == "__main__":
    main()
