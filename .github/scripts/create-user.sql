CREATE USER migrations_user WITH PASSWORD 'migrations_password';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO migrations_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO migrations_user;
