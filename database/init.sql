-- Update host for root user
UPDATE mysql.user SET Host='%' WHERE User='root';
UPDATE mysql.user SET Host='%' WHERE User='notes_admin';

-- Create 'notes_admin' user with privileges
GRANT ALL PRIVILEGES ON 'notes\_db'.* TO 'notes_admin'@'%';
FLUSH PRIVILEGES;