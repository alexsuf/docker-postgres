
��� ������� ���������� ����������:
I. ���������� Docker
    1. �������������� ���������� Docker
    2. ���������, ��� Docker �������
   	    ��������� ��������� ������ � ������ �������:
   	   	 PS C:\> docker ps
	    �����:
	         CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

II.
    5. ��������� ��������� ������ (win + R) cmd ��� powershell
    6. ����������� ����� � �����, �������� C:\repo\sqlclub\repository
       ������� ����� ����� �������� ������� � ��������� ������
           mkdir 
7. ��������� ������� (���� �� ������� ����� �����, �� ������� �):
          cd C:\repo\sqlclub\Repository\sqlcookbook
8. ��������� �������: docker compose up
          docker compose up
9. ��������� ����������� � ����������
          cd C:\repo\
SQLClub\Repository\sqlcookbook\utils\
          psql.exe  -hlocalhost -p55433 -Usqlclub -dsqlclub 
           ���
	   , -h ������������ �����
           , -p ����� �����, ������� ��������� � ����� ���������
           , -U ������������ ���� ������
           , -d ������������ ���� ������

    ����� ����� �������� ������, ������ sqlclub:
	Password for user sqlclub: sqlclub

10. ����� ����� ����������� ��������� ��������� ��������, ��� �������� ����������������� ���� ������.
	select * from emp;
             
             �����:
                    psql (14.3, server 15.0 (Debian 15.0-1.pgdg110+1))
                    WARNING: psql major version 14, server major version 15.
                             Some psql features might not work.
                    WARNING: Console code page (866) differs from Windows code page (1251)
                             8-bit characters might not work correctly. See psql reference
                             page "Notes for Windows users" for details.
                    Type "help" for help.
                    
                    sqlclub=# select * from emp;
                     empno | ename  |    job    | mgr  |  hiredate  | sal  | comm | deptno
                    -------+--------+-----------+------+------------+------+------+--------
                      7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 |      |     20
                      7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30
                      7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30
                      7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 |      |     20
                      7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250 | 1400 |     30
                      7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 |      |     30
                      7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 |      |     10
                      7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000 |      |     20
                      7839 | KING   | PRESIDENT |      | 1981-11-17 | 5000 |      |     10
                      7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500 |    0 |     30
                      7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100 |      |     20
                      7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 |      |     30
                      7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 |      |     20
                      7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 |      |     10
                    (14 rows)


	select * from emp;
             �����:
                    sqlclub=# select now();
                                  now
                    -------------------------------
                     2022-11-23 11:32:23.671088+00
                    (1 row)

	������ ������ ����� �������� ����� �������:  select * from pg_tables where schemaname = 'public';

                     sqlclub=# select * from pg_tables where schemaname = 'public';
                      schemaname | tablename | tableowner | tablespace | hasindexes | hasrules | hastriggers | rowsecurity
                     ------------+-----------+------------+------------+------------+----------+-------------+-------------
                      public     | emp       | mydb       |            | f          | f        | f           | f
                      public     | dept      | mydb       |            | f          | f        | f           | f
                      public     | t1        | mydb       |            | f          | f        | f           | f
                      public     | t10       | mydb       |            | f          | f        | f           | f
                      public     | t100      | mydb       |            | f          | f        | f           | f
                      public     | ttt_tt    | mydb       |            | f          | f        | f           | f
                     (6 rows)

	��������� ������ ������� ttt_tt - ��� �������, ������� � ������ ��� ���� ��� �� ���������, 
        ��� ��������� ���� ������ ����������� ����� ��������� � �������� ����������




11. ����� �� ������� postgres �������: \q
	sqlclub=# \q
12. ����� �� ������� cmd ��� powershell: exit
	PS c:\> exit

11. ����� ��������� Docker ���������� �������� ���� ����� ��������� � ����� 
	pg_data 
, �������������� � �������� C:\repo\sqlclub\Repository\sqlcookbook.
���������� ����� ��������� �����:
	1. � ���������� docker � ������� containers	
	2. ���� ������� docker compose down
��������� ����� 

12. ����� ����� ������������ � ���� ��� ������ dbeaver


13. ����������� ��� ��������� docker-compose:

services:
  db:
    image: postgres:15                       #������ postgres sql
    environment:
      - POSTGRES_USER=sqlclub                #������������ ����� �������� �� ������, � ����� ���� ��������� � ��� (����������� ��� ��� ������ �������)
      - POSTGRES_PASSWORD=sqlclub            #������ � ���� (����������� ��� ��� ������ �������)
      - POSTGRES_DB=sqlclub                  #������������ ����, ������� ��������� ��� ������.
    ports:
    - 55433:5432
    volumes:
    - ./postgesqlinserts.sql:/docker-entrypoint-initdb.d/postgesqlinserts.sql #DDL ���� � ���������� ������.
    - ./pg_data:/var/lib/postgresql/data


    #������ ��� �� ������ ������ ������������, � ����� ������������ ���� ������� DDL � ������ ��� ������������� ���� ������
## �����������, �� ��������� �������� ����������� ����� postgres ���� �� ���������� 
## Maintained by: [the PostgreSQL Docker Community](https://github.com/docker-library/postgres)
## ��� �� ��� ������� ������� ����� ������� ����� ��� ���������� � ��������� �������:
	git clone https://github.com/docker-library/postgres
## �������������� ���������� ������� �������� ������ GIT  

