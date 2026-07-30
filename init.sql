-- =====================================================
-- Personal OS 数据库初始化脚本
-- 在 Supabase SQL Editor 中执行此脚本
-- =====================================================

-- 1. 创建用户数据表（存储所有模块数据）
create table if not exists user_data (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users on delete cascade not null,
  data_key text not null,
  data_value jsonb not null default '{}'::jsonb,
  updated_at timestamp with time zone default now(),
  unique(user_id, data_key)
);

-- 2. 启用行级安全（RLS）
alter table user_data enable row level security;

-- 3. 创建策略：用户只能读写自己的数据
create policy "Users can only access own data"
  on user_data
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- 4. 创建索引加速查询
create index if not exists idx_user_data_user_key on user_data(user_id, data_key);

-- 5. 自动更新 updated_at 的触发器
create or replace function update_updated_at_column()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger update_user_data_updated_at
  before update on user_data
  for each row
  execute function update_updated_at_column();

-- =====================================================
-- 执行完成后，表就建好了。
-- 之后所有数据都会自动存入此表，无需再操作数据库。
-- =====================================================
