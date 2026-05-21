# jotime

Minimal time tracker with authentication and cloud persistence.

## What it does

- Login via magic link (email, no password)
- Add tasks and start/stop timers for each one
- Only one timer runs at a time — starting another auto-pauses the current one
- On refresh, elapsed times are correctly recovered from Supabase
- Export a PDF report with all tasks and their durations

## Stack

- **Astro 6** — SSG, strict TypeScript
- **Supabase** — auth (OTP magic link) + database (`tasks` table)
- **jsPDF** — PDF export, loaded from CDN on demand

## Setup

```bash
npm install
cp .env.example .env
# fill in the Supabase URL and anon key in .env
npm run dev
```

### Environment variables

```
PUBLIC_SUPABASE_URL=https://<project>.supabase.co
PUBLIC_SUPABASE_ANON_KEY=<anon-key>
```

### Supabase schema

The `tasks` table must exist in your Supabase project:

```sql
create table tasks (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid references auth.users not null,
  name            text not null,
  total_time      bigint not null default 0,  -- milliseconds
  is_running      boolean not null default false,
  last_start_time bigint,                     -- Unix timestamp in ms
  created_at      timestamptz default now()
);

-- Row Level Security
alter table tasks enable row level security;
create policy "owner only" on tasks
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
```

## Commands

```bash
npm run dev      # dev server at localhost:4321
npm run build    # production build to ./dist/
npm run preview  # preview build locally
```

## Structure

```
src/
  pages/index.astro   # all app logic (auth, state, render, export)
public/
  app.css             # design system (CSS variables, components)
```

All logic lives in a single `<script>` in `index.astro` — no UI framework, no external bundler, vanilla DOM with TypeScript.
