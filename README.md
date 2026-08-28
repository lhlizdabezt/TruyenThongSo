# Digital Communications MATLAB Coursework

<p align="center">
  <a href="https://github.com/lhlizdabezt/TruyenThongSo/releases/latest"><img src="https://img.shields.io/github/v/release/lhlizdabezt/TruyenThongSo?style=for-the-badge&logo=github&label=Release" alt="Latest release for TruyenThongSo" /></a>
  <a href="https://github.com/lhlizdabezt/TruyenThongSo/tags"><img src="https://img.shields.io/github/v/tag/lhlizdabezt/TruyenThongSo?style=for-the-badge&logo=git&label=Tag" alt="Latest tag for TruyenThongSo" /></a>
  <img src="https://img.shields.io/badge/MATLAB-Digital%20Communications-0f766e?style=for-the-badge" alt="MATLAB digital communications coursework" />
  <img src="https://img.shields.io/badge/Portfolio-English%20review%20ready-2563eb?style=for-the-badge" alt="English portfolio ready" />
</p>

<p align="center">
  <img src="assets/portfolio-motion.svg" alt="Line-free animated portfolio visual for Digital Communications MATLAB Coursework" width="100%" />
</p>

## Overview

`TruyenThongSo` is a digital communications coursework repository focused on MATLAB simulation, signal-space reasoning and report-backed engineering evidence. It covers AWGN channels, matched filters, bit-error-rate comparison, passband modulation, speech companding and LDPC decoding exercises.

| Field | Details |
|---|---|
| Repository | [lhlizdabezt/TruyenThongSo](https://github.com/lhlizdabezt/TruyenThongSo) |
| Portfolio category | Digital communications, telecommunications and signal processing |
| Primary stack | MATLAB, Communications Toolbox concepts, AWGN, matched filters, BER, BASK, BPSK, BFSK, QPSK, A-law, mu-law, LDPC |
| Evidence artifacts | MATLAB scripts, generated figures, report PDFs, slide PDF, release snapshots and source archives |
| Latest release | [GitHub Releases](https://github.com/lhlizdabezt/TruyenThongSo/releases/latest) |
| Owner profile | [Luong Hai Long](https://github.com/lhlizdabezt) |

## Reviewer Guide

| Review Goal | Start Here | Evidence |
|---|---|---|
| Understand the technical scope | `README.md`, `Chapter3/`, `Chapter4/`, `Chapter4QPSK/` | MATLAB scripts for binary signalling, passband modulation and QPSK |
| Review coursework reports | `Nhom5_DoAnTTS/Nhom5_DoAnTTS.pdf`, `Nhom5_DoAnTTS/Nhom5_Slide_DoAnTTS.pdf` | Report and slide evidence for companding and LDPC work |
| Inspect generated results | `Nhom5_DoAnTTS/Project1/*.png`, `Nhom5_DoAnTTS/Project4/*.png` | Saved MATLAB figures and command-output captures |
| Download stable snapshots | [Releases](https://github.com/lhlizdabezt/TruyenThongSo/releases/latest) and [tags](https://github.com/lhlizdabezt/TruyenThongSo/tags) | Versioned review points for HR and engineering reviewers |

## Technical Coverage

<p align="center">
  <img src="assets/digital-comms-motion.svg" alt="Line-free visual map for AWGN, BER, QPSK, companding and LDPC" width="100%" />
</p>

| Area | What the Repository Shows |
|---|---|
| Signal-space detection | Binary waveform generation, AWGN injection, matched-filter recovery and threshold decisions |
| BER simulation | Simulated and theoretical error probability for BASK, BPSK, BFSK and QPSK |
| Passband modulation | Carrier-based BASK, BPSK, BFSK and QPSK waveform simulation in MATLAB |
| Speech companding | Uniform quantization, mu-law compression/expansion, A-law compression/expansion and SNR comparison |
| LDPC basics | Tanner graph construction, parity-check matrix reasoning and bit-flipping decoding |

## Evidence Status

The table separates source-reviewed models from checked-in output files. MATLAB is required to reproduce the interactive figures; it was not available in the review environment for this release.

| Topic | Source location | Evidence available now | Review boundary |
|---|---|---|---|
| AWGN channel | `Chapter3/22207056_LuongHaiLong/Question1.m` | Binary waveform construction, `w = sqrt(B*N0_2) * randn`, received waveform `r = s + w`, and interactive plots | Source-reviewed model; the script does not save a figure file |
| Matched filter | `Chapter3/22207056_LuongHaiLong/Question2.m` | Filter convolution, sampling decision, thresholding, and simulated-versus-theoretical error expression | Source-reviewed model; reproduce in MATLAB for numeric results |
| BER comparison | `Chapter4/22207056_LuongHaiLong/Problem1.m` through `Problem4.m`, `Chapter4QPSK/22207056_LuongHaiLong/QPSK.m` | BASK, BPSK, BFSK, and QPSK BER logic and comparison plots | Source-reviewed scripts; no new runtime plot is claimed here |
| Speech companding | `Nhom5_DoAnTTS/Project1/Project1.m` | Checked-in uniform, mu-law, and A-law figure outputs plus a command-window capture | Stored output files are shown below |
| LDPC decoding | `Nhom5_DoAnTTS/Project4/DoAn4.m` | Checked-in Tanner graph and command-window capture for the parity-check and bit-flipping exercise | Stored output files are shown below |

## Result gallery

The gallery uses one image per row so the figures remain readable on narrow GitHub views. These are saved outputs from the named source files, not substitutes for the AWGN, filter, or BER scripts that render interactively.

### Speech companding outputs

<p align="center"><img src="Nhom5_DoAnTTS/Project1/project1_uniform.png" alt="Speech waveform and uniform quantization result" width="100%" /></p>

Uniform quantization of the checked-in speech sample.

<p align="center"><img src="Nhom5_DoAnTTS/Project1/project1_mu.png" alt="Mu-law compression, quantization, and expansion result" width="100%" /></p>

Mu-law compression, quantization, and expansion.

<p align="center"><img src="Nhom5_DoAnTTS/Project1/project1_a.png" alt="A-law compression, quantization, and expansion result" width="100%" /></p>

A-law compression, quantization, and expansion.

### LDPC output

<p align="center"><img src="Nhom5_DoAnTTS/Project4/tanner_ldpc.png" alt="Tanner graph generated from the checked-in LDPC parity-check matrix" width="100%" /></p>

Tanner graph generated from the parity-check matrix used by the checked-in LDPC exercise.

<details>
<summary>Command-window captures for the saved projects</summary>

<p align="center"><img src="Nhom5_DoAnTTS/Project1/project1_cmd.png" alt="MATLAB command-window capture for the companding project" width="100%" /></p>

<p align="center"><img src="Nhom5_DoAnTTS/Project4/project4_cmd.png" alt="MATLAB command-window capture for the LDPC project" width="100%" /></p>

</details>

## Repository Structure

| Path | Purpose |
|---|---|
| `Chapter3/22207056_LuongHaiLong/Question1.m` | Binary signal construction, AWGN channel visualization and received waveform plotting |
| `Chapter3/22207056_LuongHaiLong/Question2.m` | Matched-filter receiver and simulated-versus-theoretical error probability |
| `Chapter4/22207056_LuongHaiLong/Problem1.m` | BASK passband modulation and BER calculation |
| `Chapter4/22207056_LuongHaiLong/Problem2.m` | BPSK passband modulation and BER calculation |
| `Chapter4/22207056_LuongHaiLong/Problem3.m` | BFSK passband modulation and BER calculation |
| `Chapter4/22207056_LuongHaiLong/Problem4.m` | Comparative BER plot for BASK, BPSK and BFSK |
| `Chapter4QPSK/22207056_LuongHaiLong/QPSK.m` | QPSK signal-space detection and BER comparison |
| `Nhom5_DoAnTTS/Project1/Project1.m` | Uniform quantization, mu-law, A-law and speech-signal SNR analysis |
| `Nhom5_DoAnTTS/Project4/DoAn4.m` | LDPC Tanner graph and bit-flipping decoder demonstration |
| `Nhom5_DoAnTTS/*.pdf` | Final report and presentation deck for the digital communications project |
| `*.zip` | Original packaged coursework snapshots preserved for review continuity |

## How to Run

1. Install MATLAB. The scripts use standard MATLAB syntax and communications functions such as `qfunc` and `biterr`; install the Communications Toolbox if your MATLAB distribution does not already provide them.
2. Clone the repository:

   ```powershell
   git clone https://github.com/lhlizdabezt/TruyenThongSo.git
   cd TruyenThongSo
   ```

3. Open MATLAB from the repository root or add the target script folder to the MATLAB path.
4. Run the desired script from its own folder. The Chapter 3 and Chapter 4 scripts display interactive MATLAB figures; `Project1.m` and `DoAn4.m` also save the checked-in project figures beside their source files.

   ```matlab
   cd Chapter4QPSK/22207056_LuongHaiLong
   QPSK
   ```

5. For the companding project, run from `Nhom5_DoAnTTS/Project1` because `Project1.m` loads `MaleSpeech-16-4-mono-20secs.wav` from the same folder.
6. For the LDPC project, run from `Nhom5_DoAnTTS/Project4`; `DoAn4.m` saves `tanner_ldpc.png` in that folder.

## Suggested Review Order

1. `Chapter3/22207056_LuongHaiLong/Question2.m` for matched-filter detection under AWGN.
2. `Chapter4/22207056_LuongHaiLong/Problem1.m` through `Problem4.m` for BASK, BPSK, BFSK and comparative BER.
3. `Chapter4QPSK/22207056_LuongHaiLong/QPSK.m` for two-bit symbol mapping and QPSK decision logic.
4. `Nhom5_DoAnTTS/Project1/Project1.m` for companding and SNR evidence.
5. `Nhom5_DoAnTTS/Project4/DoAn4.m` for LDPC parity-check and decoder reasoning.
6. `Nhom5_DoAnTTS/Nhom5_DoAnTTS.pdf` and `Nhom5_DoAnTTS/Nhom5_Slide_DoAnTTS.pdf` for report-level context.

## Scope and Boundaries

This is an academic digital communications repository. It demonstrates MATLAB modelling, signal-processing foundations and report discipline; it is not a production modem, radio stack or telecom network implementation.

## Release Downloads

| Artifact | Purpose |
|---|---|
| [Digital communications report](https://github.com/lhlizdabezt/TruyenThongSo/releases/download/v1.2.2/Nhom5_DoAnTTS.pdf) | Existing report retained with the original evidence package |
| [Presentation deck](https://github.com/lhlizdabezt/TruyenThongSo/releases/download/v1.2.2/Nhom5_Slide_DoAnTTS.pdf) | Existing course presentation retained with the original evidence package |
| [Project 1 brief](https://github.com/lhlizdabezt/TruyenThongSo/releases/download/v1.2.2/Project1_Brief.pdf) | Existing speech-companding assignment brief |
| [Project 4 brief](https://github.com/lhlizdabezt/TruyenThongSo/releases/download/v1.2.2/DoAn4_Brief.pdf) | Existing LDPC assignment brief |
| [Source snapshot](https://github.com/lhlizdabezt/TruyenThongSo/releases/latest/download/TruyenThongSo-source-v1.2.3.zip) | Full tracked repository state at the evidence-layout release |
| [Portfolio visual](https://github.com/lhlizdabezt/TruyenThongSo/releases/latest/download/portfolio-motion.svg) | Stable English project summary |
| [Technical map](https://github.com/lhlizdabezt/TruyenThongSo/releases/latest/download/digital-comms-motion.svg) | Line-free English topic map |

## Portfolio Context

Luong Hai Long uses this repository as telecommunications evidence within a broader engineering portfolio that also includes computer vision, AI/ML, embedded systems, FPGA/SoC and firmware projects. This repository is strongest as proof of digital communications fundamentals: AWGN analysis, matched filtering, BER reasoning, passband modulation and coding-theory exercises.

<details>
<summary>Contact and professional links</summary>

| Channel | Link |
|---|---|
| GitHub | [lhlizdabezt](https://github.com/lhlizdabezt) |
| LinkedIn | [linkedin.com/in/lhlizdabezt](https://www.linkedin.com/in/lhlizdabezt) |
| Facebook | [facebook.com/wageseadrake](https://www.facebook.com/wageseadrake) |
| Instagram | [instagram.com/lhlizdabezt](https://www.instagram.com/lhlizdabezt) |
| YouTube | [youtube.com/@lhlizdabezt](https://www.youtube.com/@lhlizdabezt) |
| TikTok | [tiktok.com/@wageseadrake](https://www.tiktok.com/@wageseadrake) |
| Email | [22207056@student.hcmus.edu.vn](mailto:22207056@student.hcmus.edu.vn), [luonghailong.work@gmail.com](mailto:luonghailong.work@gmail.com) |
| Phone | [+84 988 114 708](tel:+84988114708) |

</details>

## Visual Asset Policy

The checked-in SVG visuals use English ASCII-safe text. They avoid animated dashed lines, dotted routes and curved connector lines so GitHub README text does not sit behind moving graphics or become unreadable on mobile.

## Release and Tagging Notes

Releases and tags preserve stable review points for HR, academic, and engineering reviewers. Version `v1.2.2` retains the original report, presentation, and assignment downloads. Version `v1.2.3` adds the repaired evidence layout, line-free SVG visuals, and a full tracked source snapshot without republishing course handouts.
