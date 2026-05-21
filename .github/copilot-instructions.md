# Copilot Instructions

## Think Before Coding

Before implementing: state assumptions explicitly, surface tradeoffs, ask if unclear. Don't pick silently between interpretations.

## Simplicity First

Minimum code that solves the problem. No features beyond what was asked, no abstractions for single-use code, no speculative flexibility. If you write 200 lines and it could be 50, rewrite it.

## Surgical Changes

Touch only what you must. Don't improve adjacent code, refactor things that aren't broken, or change style. Remove only imports/variables/functions that YOUR changes made unused — not pre-existing dead code.

## Goal-Driven Execution

Transform tasks into verifiable goals before starting. For multi-step tasks, state a brief plan with a verify step for each.

---

## Project: Astro 6 Static Site

- File-based routing from `src/pages/`
- Layouts in `src/layouts/`, reusable components in `src/components/`
- Assets imported in components go in `src/assets/` (processed); truly static files go in `public/`
- `astro.config.mjs` is where integrations and adapters are added
- TypeScript strict mode
