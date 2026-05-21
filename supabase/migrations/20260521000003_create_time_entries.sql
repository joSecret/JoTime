CREATE TABLE time_entries (
  id          uuid primary key default gen_random_uuid(),
  task_id     uuid references tasks(id) on delete cascade not null,
  user_id     uuid references auth.users not null,
  started_at  timestamptz not null,
  ended_at    timestamptz not null,
  duration_ms bigint not null,
  created_at  timestamptz default now()
);

ALTER TABLE time_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "owner only" ON time_entries
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
