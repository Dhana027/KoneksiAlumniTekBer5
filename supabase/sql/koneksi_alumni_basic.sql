begin;

create table public.departments (
  code text primary key,
  name text not null unique
);

insert into public.departments (code, name)
values ('SI', 'Sistem Informasi');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null default '',
  account_type text not null default 'mahasiswa'
    check (account_type in ('mahasiswa', 'alumni')),
  nrp text unique,
  department_code text references public.departments(code) on delete set null,
  entry_year smallint check (entry_year between 1950 and 2100),
  graduation_year smallint check (graduation_year between 1950 and 2100),
  phone text,
  city text,
  bio text,
  company text,
  job_title text,
  created_at timestamptz not null default now(),
  check (graduation_year is null or entry_year is null
    or graduation_year >= entry_year)
);

create index profiles_department_idx on public.profiles(department_code);

create table public.cv_documents (
  user_id uuid primary key default auth.uid()
    references public.profiles(id) on delete cascade,
  file_name text not null check (btrim(file_name) <> ''),
  storage_path text not null unique,
  file_size bigint check (file_size between 1 and 10485760),
  created_at timestamptz not null default now(),
  check (split_part(storage_path, '/', 1) = user_id::text
    and storage_path not like '%/' and position('/' in storage_path) > 0)
);

create function public.koneksi_create_profile()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  insert into public.profiles (id, full_name, account_type)
  values (
    new.id,
    coalesce(new.raw_user_meta_data ->> 'full_name', ''),
    case when new.raw_user_meta_data ->> 'account_type' = 'alumni'
      then 'alumni' else 'mahasiswa' end
  );
  return new;
end;
$$;

revoke all on function public.koneksi_create_profile()
from public, anon, authenticated;

create trigger koneksi_on_auth_user_created
after insert on auth.users
for each row execute function public.koneksi_create_profile();

insert into public.profiles (id, full_name, account_type)
select id, coalesce(raw_user_meta_data ->> 'full_name', ''),
  case when raw_user_meta_data ->> 'account_type' = 'alumni'
    then 'alumni' else 'mahasiswa' end
from auth.users
on conflict (id) do nothing;

alter table public.departments enable row level security;
alter table public.profiles enable row level security;
alter table public.cv_documents enable row level security;

revoke all on public.departments, public.profiles, public.cv_documents
from anon, authenticated;

grant usage on schema public to anon, authenticated;
grant select on public.departments to anon, authenticated;
grant select, insert, update on public.profiles to authenticated;
grant select, insert, update, delete on public.cv_documents to authenticated;

create policy departments_read on public.departments
for select to anon, authenticated using (true);

create policy profiles_own on public.profiles
for all to authenticated
using ((select auth.uid()) = id)
with check ((select auth.uid()) = id);

create policy cv_documents_own on public.cv_documents
for all to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('cv', 'cv', false, 10485760, array[
  'application/pdf',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
])
on conflict (id) do nothing;

create policy koneksi_cv_files_own on storage.objects
for all to authenticated
using (bucket_id = 'cv'
  and (storage.foldername(name))[1] = (select auth.uid()::text))
with check (bucket_id = 'cv'
  and (storage.foldername(name))[1] = (select auth.uid()::text));

commit;
