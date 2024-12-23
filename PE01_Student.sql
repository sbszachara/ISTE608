-- Script
DROP DATABASE IF EXISTS studentDB;

CREATE DATABASE studentDB;
USE studentDB;

DROP TABLE IF EXISTS student;

CREATE TABLE student (
   studentID      char(5)       NOT NULL PRIMARY KEY COMMENT "studentID MUST be UNIQUE for every student",
   lastName       varchar(30)   NOT NULL,
   firstName      varchar(30)   NOT NULL,
   class          char(2)       NOT NULL DEFAULT "FR"    COMMENT "MUST be  FR or SO or JR or SR or GR",       
   departmentID   varchar(4)    NOT NULL DEFAULT "4002"  COMMENT "MUST be 4002 or 4003",  
   gpa            decimal(4,2)  NOT NULL                 COMMENT "MUST be greater than 0", 
   CONSTRAINT chk_class        CHECK (class in ("FR" , "SO", "JR", "SR", "GR")),  
   CONSTRAINT chk_departmentID CHECK (departmentID = "4002" or departmentID = "4003"),
   CONSTRAINT chk_gpa          CHECK (gpa > 0.0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = "Created to collect Data for PE01";

-- INSERT INTO student VALUES ('99999','Habermas','Karen','xx','4002',3.50);
    
-- INSERT INTO student VALUES ('99999','Habermas','Karen','JR','9999',3.50);

-- INSERT INTO student VALUES ('99999','Habermas','Karen','JR','4002',-2.0);

INSERT INTO student VALUES ('00001','Habermas','Karen','JR','4002',3.75);

INSERT INTO student VALUES ('12345','Bettinger','Matthew','JR','4002',3.33);

INSERT INTO student VALUES ('12355','Collins','Andrew','FR','4002',3.80),('12365','Kang','Jay','GR','4003',3.99),('12375','Habermas','Jim','GR','4003',3.66),('22222','Holdan','Edward','SR','4002',3.50),('33343','Zilora','Stephen','GR','4002',4.00);
