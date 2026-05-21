CREATE TABLE tags (
  id         uuid primary key default gen_random_uuid(),
  user_id    uuid references auth.users not null,
  name       text not null,
  created_at timestamptz default now()
);

ALTER TABLE tags ENABLE ROW LEVEL SECURITY;

CREATE POLICY "owner only" ON tags
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
