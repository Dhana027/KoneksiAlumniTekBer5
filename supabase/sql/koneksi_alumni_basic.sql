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