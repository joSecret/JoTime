import { createClient } from '@supabase/supabase-js';

export const supabase = createClient(
  import.meta.env.PUBLIC_SUPABASE_URL as string,
  import.meta.env.PUBLIC_SUPABASE_ANON_KEY as string,
);

export interface Task {
  id: string;
  name: string;
  tag: string | null;
  total_time: number;
  is_running: boolean;
  last_start_time: number | null;
  created_at: string;
  completed_at: string | null;
}

export interface Tag {
  id: string;
  name: string;
}

export interface TimeEntry {
  id: string;
  task_id: string;
  started_at: string;
  ended_at: string;
  duration_ms: number;
  tasks: { name: string; tag: string | null } | null;
}
