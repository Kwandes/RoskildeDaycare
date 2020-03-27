-- nerd
CREATE USER IF NOT EXISTS nerd@'%' IDENTIFIED BY 'yeet';

GRANT ALL PRIVILEGES ON exampleSchema.* TO nerd@'%';
GRANT ALL PRIVILEGES ON tutorial.* TO nerd@'%';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO nerd@'%';


-- Jan
CREATE USER IF NOT EXISTS jan@'%' IDENTIFIED BY '9hZPeaJ2678';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO jan@'%';

-- Alex
CREATE USER IF NOT EXISTS alex@'%' IDENTIFIED BY 'Ez5wF2N3rd9';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO alex@'%';

-- Itai
CREATE USER IF NOT EXISTS itai@'%' IDENTIFIED BY 'BCv6j9h8G7g';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO itai@'%';

-- Niren
CREATE USER IF NOT EXISTS niren@'%' IDENTIFIED BY 'fqUH2B42wFd';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO niren@'%';

-- Frederik
CREATE USER IF NOT EXISTS frederik@'%' IDENTIFIED BY '94Dd8Rkfndh';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO frederik@'%';

-- PD
CREATE USER IF NOT EXISTS pd@'%' IDENTIFIED BY '6eXDzcbRXf2';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO pd@'%';

-- Administrator
CREATE USER IF NOT EXISTS rd_administrator@'%' IDENTIFIED BY '3cf7mnUhaH7';
GRANT ALL PRIVILEGES ON roskilde_daycare.* TO rd_administrator@'%';
-- Administrator
CREATE USER IF NOT EXISTS rd_teacher1@'%' IDENTIFIED BY 'idiot';
GRANT ALL PRIVILEGES ON roskilde_daycare.child TO rd_teacher1@'%';
GRANT ALL PRIVILEGES ON roskilde_daycare.parent TO rd_teacher1@'%';
GRANT ALL PRIVILEGES ON roskilde_daycare.child_has_parent TO rd_teacher1@'%';
GRANT ALL PRIVILEGES ON roskilde_daycare.phone TO rd_teacher1@'%';
GRANT ALL PRIVILEGES ON roskilde_daycare.address TO rd_teacher1@'%';
GRANT SELECT ON roskilde_daycare.schedule TO rd_teacher1@'%';