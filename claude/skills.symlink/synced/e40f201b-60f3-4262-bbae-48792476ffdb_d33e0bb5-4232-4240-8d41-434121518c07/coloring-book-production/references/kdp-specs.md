# KDP Production Specs

All three books share this production target: **8.5" × 11" trim, black-ink interior, white paper, no-bleed layout, single-sided art.** Numbers below were verified mid-2026; KDP shows the authoritative printing cost and file requirements at upload, so treat these as the working spec and re-check on the pricing screen before publishing.

## Page canvas

- Full page at 300 DPI: **2550 × 3300 px** (8.5 × 11 in).
- Safe margins (conservative, above KDP minimums): **0.5 in** top, bottom, and outer edge; **0.75 in** on the gutter (binding) edge. KDP's hard minimums are 0.25 in outside and 0.375 in gutter for books up to 150 pages — the extra headroom keeps art clear of the perfect-bound curl.
- **Live area (where all art lives): 7.25 × 10 in = 2175 × 3000 px.** Draw SVGs to this canvas; center it on the full page at assembly, offset toward the outer edge to respect the gutter.
- Art pages sit on **odd (right-hand) pages** with blank versos — single-sided is the market norm because KDP's ~55 lb paper is not marker-proof and bleed-through is the #1 review complaint. Mirror the gutter offset if any art ever lands on an even page.

## Interior structure and page count

- Front matter: title page, copyright page, then for the kids' book a "This book belongs to" page; for the adult books a short intro plus a **pen-test page** (a small swatch grid inviting the colorist to test their tools — it preempts bleed-through complaints).
- Book A (kids): 24 interior pages — KDP's minimum page count, per the original spec.
- Books B and C: ~50 designs → art + versos + front matter, **keep the total at or under 108 pages.** Black-ink books up to 108 pages pay only KDP's flat fixed printing cost (~$2.84 for this large trim as of mid-2026); page 109 starts per-page charges. Pages 50–108 are effectively free — use them for single-sided layout, not for padding designs.

## Pricing

- Since June 2025 KDP pays a two-tier paperback royalty: **50% below $9.99 list, 60% at $9.99 and above**, minus printing cost. Crossing $9.99 raises both the price and the rate, so it usually pays for itself immediately.
- Books B and C: list **$10.99–$12.99** (the aesthetic-niche band). At $12.99: 0.60 × 12.99 − 2.84 ≈ **$4.95/copy**.
- Book A: kids' books tolerate less, but price at **$9.99 if the market allows** — dropping to $8.99 costs both the dollar and the tier.

## Cover (separate full-wrap PDF)

- Spine width = page count × **0.002252 in** (white paper). Example: 106 pages ≈ 0.239 in.
- Wrap size: height 11 + 0.25 bleed = **11.25 in**; width = 0.125 + 8.5 + spine + 8.5 + 0.125.
- Keep a **2 × 1.2 in** clear zone bottom-right of the back cover for the barcode.
- Cover art direction: show **finished, colored sample pages on a clean background** — colored-sample covers measurably out-click plain line-art covers. Cover may use full color; only interiors are black-ink.
- No spine text under ~80 pages of thickness; at 100+ pages a thin title is fine.

## Export

- Interior: single PDF, pages in final order, art rasterized at 300 DPI (or kept vector), pure K black, fonts embedded/flattened, no crop marks.
- Verify in KDP's previewer, then **order a physical proof** before launch — line weight on screen and line weight on POD paper are different animals.
- KDP cannot print translucent paper, spiral binding, or perforation. Position pages as frame-worthy instead; never promise window-hanging effects.
