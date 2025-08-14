RESTORE FILELISTONLY 
FROM DISK = '/var/opt/mssql/backup/Northwind.BAK';

RESTORE DATABASE Northwind
FROM DISK = '/var/opt/mssql/backup/Northwind.bak'
WITH 
    MOVE 'Northwind' TO '/var/opt/mssql/data/Northwind.mdf',
    MOVE 'Northwind_log' TO '/var/opt/mssql/data/Northwind_log.ldf',
    REPLACE;

	DROP DATABASE Northwind;

	RESTORE DATABASE Northwind
FROM DISK = '/var/opt/mssql/backup/Northwind.bak'
WITH 
    MOVE 'Northwind' TO '/var/opt/mssql/data/Northwind.mdf',
    MOVE 'Northwind_log' TO '/var/opt/mssql/data/Northwind_log.ldf',
    REPLACE;

	RESTORE FILELISTONLY 
FROM DISK = '/var/opt/mssql/backup/BDEJEMPLO2.bak';

RESTORE DATABASE BDEJEMPLO2
FROM DISK = '/var/opt/mssql/backup/BDEJEMPLO2.bak'
WITH 
    MOVE 'BDEJEMPLO2' TO '/var/opt/mssql/data/BDEJEMPLO2.mdf',
    MOVE 'BDEJEMPLO2_log' TO '/var/opt/mssql/data/BDEJEMPLO2_log.ldf',
    REPLACE;