-- Supabase SQL Editor에서 전체 실행하세요.
create table if not exists public.planup_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"tasks":[],"memos":{},"calendar":{}}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.planup_data enable row level security;
drop policy if exists "Users can read own PLAN UP data" on public.planup_data;
create policy "Users can read own PLAN UP data"
on public.planup_data for select
using (auth.uid() = user_id);
drop policy if exists "Users can insert own PLAN UP data" on public.planup_data;
create policy "Users can insert own PLAN UP data"
on public.planup_data for insert
with check (auth.uid() = user_id);
drop policy if exists "Users can update own PLAN UP data" on public.planup_data;
create policy "Users can update own PLAN UP data"
on public.planup_data for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
