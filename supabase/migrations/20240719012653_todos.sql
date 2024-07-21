create table
    if not exists public.profiles (
        user_id uuid not null,
        birthday date not null,
        first_name text not null,
        last_name text not null,
        middle_name text null,
        phone text null,
        avatar text null,
        constraint profiles_pkey primary key (user_id),
        constraint profiles_phone_key unique (phone),
        constraint profiles_id_fkey foreign key (user_id) references auth.users (id) on delete cascade
    ) tablespace pg_default;

create table
    if not exists public.todos (
        todo_id bigserial primary key,
        title text not null,
        description text,
        owner uuid not null,
        completed boolean DEFAULT false,
        constraint profiles_fkey foreign key (owner) references public.profiles (user_id) on delete cascade,
        completed_at timestamp,
        created_at timestamp DEFAULT current_timestamp
    ) tablespace pg_default;