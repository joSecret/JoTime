# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
npm run dev       # Dev server at localhost:4321
npm run build     # Production build to ./dist/
npm run preview   # Preview production build locally
npm run astro     # Direct Astro CLI (e.g. astro check, astro add)
```

No test or lint scripts are configured yet.

## Architecture

Astro 6 static site (SSG by default). TypeScript strict mode.

**Routing:** File-based from `src/pages/`. Each `.astro` file becomes a route.

**Component model:**
- `src/layouts/` — HTML shell wrappers (head, body structure)
- `src/components/` — Reusable UI pieces
- `src/pages/` — Route entry points that compose layouts + components
- `src/assets/` — Assets imported directly in components (processed by Astro)
- `public/` — Static files served as-is (no processing)

**Config:** `astro.config.mjs` is currently empty defaults — integrations (React, Tailwind, etc.) go here.

## Behavioral Guidelines

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

### Think Before Coding

Before implementing: state assumptions explicitly, surface tradeoffs, ask if unclear. Don't pick silently between interpretations.

### Simplicity First

Minimum code that solves the problem. No features beyond what was asked, no abstractions for single-use code, no speculative flexibility.

### Surgical Changes

Touch only what you must. Don't improve adjacent code, refactor things that aren't broken, or match a different style. Remove only orphans YOUR changes created.

### Goal-Driven Execution

Transform tasks into verifiable goals. For multi-step tasks, state a brief plan with verify steps before starting.
