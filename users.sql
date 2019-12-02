#--------------------------------------------
#
# USERS in GitInsightsDB and their Privileges
#
#--------------------------------------------

# DROP USERS IF THEY EXIST ALREADY
DROP USER 'admin'@'localhost';
DROP USER 'reader'@'localhost';
DROP USER 'reader'@'%';
DROP USER 'writer'@'localhost';

#--------------------------------------------
# Admin USER 
#--------------------------------------------

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON gitinsightdb.*  TO 'admin'@'localhost';
#--------------------------------------------


#--------------------------------------------
# Reader USER 
#--------------------------------------------
CREATE USER 'reader'@'localhost' IDENTIFIED BY 'reader';
CREATE USER 'reader'@'%' IDENTIFIED BY 'reader';
GRANT SELECT, SHOW VIEW ON gitinsightdb.* TO 'reader'@'localhost';

GRANT SELECT, SHOW VIEW ON gitinsightdb.* TO 'reader'@'%';
#--------------------------------------------


#--------------------------------------------
# Writer USER 
#--------------------------------------------
CREATE USER 'writer'@'localhost' IDENTIFIED BY 'writer';
GRANT INSERT, UPDATE ON gitinsightdb.* TO 'writer'@'localhost';
#--------------------------------------------


