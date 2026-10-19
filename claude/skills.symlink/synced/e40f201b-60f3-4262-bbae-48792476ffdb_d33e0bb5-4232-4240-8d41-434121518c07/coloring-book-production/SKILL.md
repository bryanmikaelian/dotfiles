---
name: coloring-book-production
description: Production system for the user's three-book KDP coloring book series — the 24-page kids' book, the Dark Academia adult book, and the Stained Glass Dark Academia edition. Use this skill whenever the user asks to draw, sketch, revise, or generate a coloring page or line art; build or edit a book outline or cover; assemble a print-ready interior or cover PDF; or mentions KDP specs, page sizes, margins, pricing, or any of the three books by name or nickname — even if they don't say the words "coloring book." Also use it when reviewing existing pages for print-readiness.
---

# Coloring Book Production

The user is hand-directing a three-book, print-on-demand coloring book series published through Amazon KDP. The single biggest production risk is drift: 100+ pages drawn across many sessions must look like one artist made them in one sitting, and every page must survive KDP's printing pipeline. This skill exists to make every session enforce the same rules automatically.

## §0 — Brief inference (do this before drawing anything)

Read the request and determine three things:

1. **Which book?** (A) Kids' book, (B) Dark Academia, or (C) Stained Glass edition. If the request doesn't say and context doesn't settle it, ask once — the books have different line weights and detail budgets, and guessing wrong wastes a page.
2. **Which task?** Page art, outline work, cover work, PDF assembly, listing/pricing, or print-readiness review.
3. **Where does it sit?** Check the book's outline (in the project files or conversation) so the page fits its planned slot and doesn't duplicate an existing subject.

Then read the matching reference file before producing anything:

- `references/book-kids.md` — Book A style rules
- `references/book-dark-academia.md` — Book B style rules
- `references/book-stained-glass.md` — Book C style rules
- `references/kdp-specs.md` — canvas sizes, margins, page order, pricing, cover math (read for any assembly, cover, spec, or pricing task; skim its canvas numbers before any page art)

## Page production pipeline

Draw pages as **SVG first**, sized to the live area from `kdp-specs.md`. SVG is the right medium here because it guarantees pure black on pure white, makes stroke widths exact and consistent, scales losslessly to 300 DPI, and lets closed paths be verified rather than eyeballed. Rasterize only at assembly time.

Per page: infer the brief → read the book's reference → draw → run the pre-flight below → show the user → only a passing page enters the book.

## Hard bans (apply to every page, every book)

These exist because each one produces a specific, known failure — bad print output, one-star reviews, or a KDP takedown:

- **No gray, no gradients, no tonal shading.** Interiors print in pure black ink; gray renders as muddy dot patterns and steals the colorist's job. All tone comes from line work.
- **No unclosed shapes.** Gaps in outlines are the signature flaw of low-effort books and the thing reviewers complain about most. Every region a colorist would fill must be a closed path.
- **No text or lettering inside the artwork.** Keeps pages language-neutral and on-spec.
- **No copyrighted or trademarked anything** — characters, logos, brand trade dress, recognizable products, real institutions' crests. KDP suspends accounts for this; "inspired by" must never be "identifiable as."
- **No large solid-black fills.** Heavy ink areas print poorly on KDP paper and leave nothing to color. Black accents stay small.
- **No art in the margin or gutter zones.** Anything outside the live area risks being cut or swallowed by the binding.
- **No style drift.** Line weight, detail density, and rendering approach must match the book's reference file — not the previous request's mood.

## Pre-flight check (every checkbox must honestly pass before a page ships)

- [ ] Correct book identified and its reference file was read this session
- [ ] Canvas matches the live-area dimensions in `kdp-specs.md`
- [ ] All strokes pure #000000 on pure #FFFFFF; no other colors, grays, or opacity < 1
- [ ] Stroke widths within this book's specified range, consistent across the page
- [ ] Every colorable region is a closed shape; no hairline gaps
- [ ] Smallest colorable region meets this book's minimum-size floor
- [ ] Subject is original, unidentifiable as any existing IP
- [ ] Detail level appropriate to this book's audience
- [ ] No text, no gray, no large black fills, nothing outside the live area
- [ ] Style matches the book's previous approved pages

If a box can't honestly pass, fix the page before showing it as final. Never rationalize a failing box.

## Assembly, covers, and listing

For interior PDF assembly, cover construction, spine math, page ordering, page-count ceilings, and pricing strategy, follow `references/kdp-specs.md` exactly — the numbers there are chosen to hit KDP's flat printing-cost tier and the 60% royalty threshold. When assembling PDFs, also consult the environment's built-in PDF skill for file-generation mechanics.

## Working style

Produce one page at a time unless asked for batch work; each page gets its own pre-flight. When the user asks for revisions, re-run the pre-flight on the revised page. When in doubt between "more detail" and "cleaner," choose cleaner — these books compete on line quality, not density.
