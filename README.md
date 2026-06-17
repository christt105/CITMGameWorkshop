# CITM Game Workshop

Materials and source code for a 4-day game development workshop for beginners (ages 12–16), using Unity and Godot.

This year the workshop focuses on **2 games over 4 days** so there is time to learn calmly, add mechanics and let students create their own levels:

- 🐦 **Flappy Bird (Unity)** — 2 days
- 🧱 **3D Platformer (Godot)** — 2 days

Both games follow the same "fill in the `TODO`" format: the project is almost finished and students complete the missing pieces, guided step by step.

## ⬇️ Download (students start here)

Get the ready-to-open starter templates from the **[v2026 release](https://github.com/christt105/CITMGameWorkshop/releases/tag/v2026)** — no git needed, just download and open:

- 🐦 **[FlappyBird-2026.zip](https://github.com/christt105/CITMGameWorkshop/releases/download/v2026/FlappyBird-2026.zip)** → day-1 starter (the `TODO`s). Open the `FlappyBirdWorkshop` folder with **Unity Hub** (Unity 2022.3 LTS).
- 🐦 **[FlappyBird-Dia2.zip](https://github.com/christt105/CITMGameWorkshop/releases/download/v2026/FlappyBird-Dia2.zip)** → day-2 checkpoint (day-1 already finished) for anyone who didn't complete day 1.
- 🧱 **[Platformer3D-2026.zip](https://github.com/christt105/CITMGameWorkshop/releases/download/v2026/Platformer3D-2026.zip)** → import `project.godot` with **Godot 4.6**.

Each ZIP includes its `GUIA.md`; the Flappy ZIPs also include `FUNCIONS.md` (day-2 feature menu).

## This year's games

### 🐦 Flappy Bird (Unity) — Days 1–2
Build a Flappy Bird by completing 7 guided `TODO`s, then personalize it (sprites, sounds, juice, difficulty).

- 📖 Student guide: [`flappy-bird/GUIA.md`](./flappy-bird/GUIA.md)
- Code (scaffold for students): branch `workshop-scaffold` of [FlappyBirdUnityWorkshop](https://github.com/christt105/FlappyBirdUnityWorkshop)
- Solution: branch `main` of the same repo
- License: MIT
- Based on: [FlappyBirdUnityWorkshop](https://github.com/christt105/FlappyBirdUnityWorkshop)
- ➡️ [`flappy-bird/`](./flappy-bird)

### 🧱 3D Platformer (Godot) — Days 3–4
Program the character (move, double jump, coins, falling platforms), then design your own level and play your classmates' levels.

- 📖 Student guide: [`platformer-3d/GUIA.md`](./platformer-3d/GUIA.md)
- 🛠️ Extra mechanics for requests: [`platformer-3d/MECANIQUES.md`](./platformer-3d/MECANIQUES.md)
- License: MIT
- Based on: [KenneyNL/Starter-Kit-3D-Platformer](https://github.com/KenneyNL/Starter-Kit-3D-Platformer)
- ➡️ [`platformer-3d/`](./platformer-3d)

> Workshop materials are in Catalan (code comments and student guides).

---

## Archive (previous editions)

These games were used in past editions and are kept here for reference. They are **not** used in the current 2-game edition.

### 🕹️ Pong (Unity)
Based on: [zigurous/unity-pong-tutorial](https://github.com/zigurous/unity-pong-tutorial) *(no license specified)* — ➡️ [`pong/`](./pong)

### 🪐 Asteroids (Godot)
A simplified, endless version of Asteroids made in Godot 4. Based on: [KaanAlpar/asteroids_tutorial](https://github.com/KaanAlpar/asteroids_tutorial) *(no license specified)* — ➡️ [`asteroids/`](./asteroids)

---

## Licensing Notes

- This repository is for educational purposes only.
- Projects without explicit licenses are used for workshop purposes and attributed accordingly.

---

## Presentations

🌐 **Live site: https://christt105.github.io/CITMGameWorkshop/** — one deck per day, plus download and guide links. Auto-rebuilds on every change to `slides/`.

- **Intro** (general workshop opener): [Google Slides](https://docs.google.com/presentation/d/1JLaIByuc94TJuL3XWGsWRPipyOQUfN87R-Oi_ff_Z3w/edit?usp=sharing)
- **One deck per day** (Catalan, Marp — slides + teacher notes): [`slides/`](./slides)
  - Day 1 — Flappy Bird (build it) · Day 2 — Flappy Bird (personalize)
  - Day 3 — 3D Platformer (mechanics) · Day 4 — 3D Platformer (level design)

The decks show the goal and concepts only — the solution code stays in each game's `GUIA.md` (safety net for students who fall behind), and every deck ends with extra challenges for fast finishers.
