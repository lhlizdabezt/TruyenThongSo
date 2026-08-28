# v1.2.3 - Evidence Layout and Source Boundary Repair

## Changes

- Replaced the two-column result table with a one-image-per-row layout that stays readable on narrow GitHub views.
- Added a source-evidence matrix for AWGN, matched filtering, BER, companding, and LDPC work; it identifies what is source-reviewed, what has a checked-in output, and what requires MATLAB reproduction.
- Added the stored MATLAB command-window captures for the companding and LDPC projects.
- Reflowed the technical-map SVG core-review card into three short lines inside a wider card, eliminating the prior text overflow.
- Retained existing report, presentation, and assignment downloads at their immutable `v1.2.2` links; this release does not republish course handouts.

## Verification

- Confirmed the README image references resolve to tracked files.
- Confirmed the evidence statements map to the named MATLAB source files and do not claim a fresh MATLAB run.
- Confirmed the revised SVG uses English ASCII-safe text and has no dotted, dashed, curved, or connector lines.
- Confirmed the gallery no longer uses a multi-column HTML table.

## Boundary

This remains academic MATLAB coursework. The AWGN, matched-filter, and BER models are source-reviewed in this release; MATLAB execution is required for fresh numerical reproduction.

---

# v1.2.2 - Release Evidence Package

## Changes

- Added a four-image results gallery for uniform quantization, mu-law, A-law, and the LDPC Tanner graph.
- Regenerated the Tanner graph with English labels from the parity-check matrix used by the MATLAB source.
- Added a reproducible Python renderer for future label and spacing corrections.
- Added the complete contact and professional-link block without adding a project-level profile-view counter.
- Preserved MATLAB scripts, report PDFs, slide PDF, audio input, generated figures, and original coursework archives.
- Added direct release downloads for the report, presentation, assignment briefs, visuals, and full tracked source snapshot.

## Verification

- Generated image labels and README captions were checked in US English.
- README local links and visual references were checked against tracked files.
- MATLAB source was reviewed statically; MATLAB execution was not available in the current environment.
- SVG assets were rendered and checked for ASCII safety, clipping, and connector-line interference.

## Boundary

This is academic MATLAB coursework. It demonstrates simulation and report evidence, not a production modem or deployed telecommunications system.
