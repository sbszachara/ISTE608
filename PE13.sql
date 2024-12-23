-- PE13
DROP DATABASE IF EXISTS PE13;
CREATE DATABASE PE13;
USE PE13;

--
-- Table structure for table zips
--

DROP TABLE IF EXISTS zips;
CREATE TABLE zips (
  Zip varchar(5) NOT NULL default '',
  City varchar(100) NOT NULL default '',
  State char(2) NOT NULL default '',
  PRIMARY KEY  (Zip)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table zips
--

INSERT INTO zips VALUES ('01701','Framingham','MA');
INSERT INTO zips VALUES ('13340','Frankfort','NY');
INSERT INTO zips VALUES ('14450','Fairport','NY');
INSERT INTO zips VALUES ('14551','Sodus','NY'),('14618','Rochester','NY');
INSERT INTO zips VALUES ('14623','Rochester','NY');
INSERT INTO zips VALUES ('14624','Rochester','NY');
INSERT INTO zips VALUES ('14626','Rochester','NY');

--
-- Table structure for table tripcodes
--

DROP TABLE IF EXISTS tripcodes;
CREATE TABLE tripcodes (
  TripType char(1) NOT NULL default '',
  TypeName varchar(20) NOT NULL default '',
  PRIMARY KEY  (TripType)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table tripcodes
--


INSERT INTO tripcodes VALUES ('B','Bus');
INSERT INTO tripcodes VALUES ('P','Plane');
INSERT INTO tripcodes VALUES ('T','Train');

--
-- Table structure for table equipment
--

DROP TABLE IF EXISTS equipment;
CREATE TABLE equipment (
  EquipID int(11) NOT NULL default '0',
  EquipmentName varchar(50) NOT NULL default '',
  EquipmentDescription varchar(100) NOT NULL default '',
  EquipmentCapacity int(11) NOT NULL default '0',
  PRIMARY KEY  (EquipID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table equipment
--


INSERT INTO equipment VALUES (568,'Continental','Passenger and Cargo',400);
INSERT INTO equipment VALUES (894,'Bus 264','Coach',35);
INSERT INTO equipment VALUES (1256,'Airbus 300','Long Range',150);
INSERT INTO equipment VALUES (5634,'Boeing 727','Short Range',100);
INSERT INTO equipment VALUES (7624,'Bus 345','Coach',35);
INSERT INTO equipment VALUES (8596,'Boeing 727','Short Range',100);
INSERT INTO equipment VALUES (3644,'Boeing 767','Long Range',200);

--
-- Table structure for table locations
--

DROP TABLE IF EXISTS locations;
CREATE TABLE locations (
  LocationCode char(3) NOT NULL default '',
  Location varchar(100) NOT NULL default '',
  PRIMARY KEY  (LocationCode)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table locations
--


INSERT INTO locations VALUES ('BOS','Boston');
INSERT INTO locations VALUES ('BUF','Buffalo');
INSERT INTO locations VALUES ('BUR','Burbank');
INSERT INTO locations VALUES ('JFK','New York');
INSERT INTO locations VALUES ('LAS','Las Vegas');
INSERT INTO locations VALUES ('LGA','New York');
INSERT INTO locations VALUES ('NAS','Nassau');
INSERT INTO locations VALUES ('ROC','Rochester');

--
-- Table structure for table passenger
--

DROP TABLE IF EXISTS passenger;
CREATE TABLE passenger (
  PassengerID int(11) NOT NULL default '0',
  FName varchar(50) NOT NULL default '',
  LName varchar(50) NOT NULL default '',
  Street varchar(50) NOT NULL default '',
  Zip varchar(5) NOT NULL default '',
  PRIMARY KEY  (PassengerID),
  KEY Zip (Zip),
  CONSTRAINT passenger_ibfk_1 FOREIGN KEY (Zip) REFERENCES zips (Zip)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table passenger
--


INSERT INTO passenger VALUES (1,'Ken','Bennet','12 Marway Circle','14624');
INSERT INTO passenger VALUES (2,'Patti','Hughes','280 Commerce Dr','14623');
INSERT INTO passenger VALUES (3,'Dale','Payne','34 Foley Dr','14551');
INSERT INTO passenger VALUES (4,'Dan','Callahan','320 West Craig Hill','14626');
INSERT INTO passenger VALUES (5,'Rich','Gleason','232 Industrial Park Dr','13340');
INSERT INTO passenger VALUES (6,'Scott','Kier','150 Highland Ave.','14618');
INSERT INTO passenger VALUES (7,'Mark','Lucas','425 Old Center Macedon Rd','14450');
INSERT INTO passenger VALUES (8,'Scott','Wilson','70 Bermar Park','14624');
INSERT INTO passenger VALUES (9,'Terry','Brown','100 Pennsylvania Ave','01701');
INSERT INTO passenger VALUES (10,'Curtis','Brown','100 Ajax Rd','14624');

--
-- Table structure for table phones
--

DROP TABLE IF EXISTS phones;
CREATE TABLE phones (
  PassengerId int(11) NOT NULL default '0',
  PhoneNum varchar(15) NOT NULL default '',
  PhoneType varchar(50) NOT NULL default '',
  PRIMARY KEY  (PassengerId,PhoneNum),
  CONSTRAINT phones_ibfk_1 FOREIGN KEY (PassengerId) REFERENCES passenger (PassengerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table phones
--


INSERT INTO phones VALUES (1,'585-475-1440','Home');
INSERT INTO phones VALUES (2,'585-874-4956','Home');
INSERT INTO phones VALUES (3,'585-325-6530','Cell');
INSERT INTO phones VALUES (3,'585-454-3290','Home');
INSERT INTO phones VALUES (4,'585-254-8080','Home');
INSERT INTO phones VALUES (5,'585-442-0450','Home');
INSERT INTO phones VALUES (6,'585-461-6898','Home');
INSERT INTO phones VALUES (7,'585-264-3135','Home');
INSERT INTO phones VALUES (8,'585-463-3420','Cell');
INSERT INTO phones VALUES (8,'585-538-6822','Home');
INSERT INTO phones VALUES (9,'612-576-9985','Home');
INSERT INTO phones VALUES (10,'585-263-3905','Cell');
INSERT INTO phones VALUES (10,'585-593-5860','Home');



--
-- Table structure for table trip_directory
--

DROP TABLE IF EXISTS trip_directory;
CREATE TABLE trip_directory (
  TripNum varchar(10) NOT NULL default '',
  TripType char(1) NOT NULL default '',
  ArrivalTime varchar(10) NOT NULL default '',
  ArrivalLocCode char(3) NOT NULL default '',
  DepartureTime varchar(10) NOT NULL default '',
  DepartureLocCode char(3) NOT NULL default '',
  PRIMARY KEY  (TripNum),
  KEY TripType (TripType),
  KEY ArrivalLocCode (ArrivalLocCode),
  KEY DepartureLocCode (DepartureLocCode),
  CONSTRAINT trip_directory_ibfk_1 FOREIGN KEY (TripType) REFERENCES tripcodes (TripType),
  CONSTRAINT trip_directory_ibfk_2 FOREIGN KEY (ArrivalLocCode) REFERENCES locations (LocationCode),
  CONSTRAINT trip_directory_ibfk_3 FOREIGN KEY (DepartureLocCode) REFERENCES locations (LocationCode)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table trip_directory
--


INSERT INTO trip_directory VALUES ('1027','P','2:00 PM','LAS','1:00 PM','BUF');
INSERT INTO trip_directory VALUES ('3030','P','2:00 PM','NAS','1:00 PM','BOS');
INSERT INTO trip_directory VALUES ('4567','T','7:30 AM','BUF','6:00 AM','ROC');
INSERT INTO trip_directory VALUES ('546','B','11:30 PM','ROC','3:00 PM','JFK');
INSERT INTO trip_directory VALUES ('6432','B','8:00 PM','ROC','1:00 PM','JFK');
INSERT INTO trip_directory VALUES ('8794','T','11:00 PM','BUR','8:00 AM','LAS');

--
-- Table structure for table trip
--

DROP TABLE IF EXISTS trip;
CREATE TABLE trip (
  Date date NOT NULL default '0000-00-00',
  TripNum varchar(10) NOT NULL default '',
  ArrivalTime varchar(10) default '',
  ArrivalLocCode char(3) default '',
  DepartureTime varchar(10) default '',
  DepartureLocCode char(3) default '',
  EstArrivalTime varchar(10) default '',
  EstDepartureTime varchar(10) default '',
  EquipId int(11) NOT NULL default '0',
  PRIMARY KEY  (Date,TripNum),
  KEY Date (Date),
  KEY TripNum (TripNum),
  KEY ArrivalLocCode (ArrivalLocCode),
  KEY DepartureLocCode (DepartureLocCode),
  KEY EquipId (EquipId),
  CONSTRAINT trip_ibfk_1 FOREIGN KEY (TripNum) REFERENCES trip_directory (TripNum),
  CONSTRAINT trip_ibfk_2 FOREIGN KEY (ArrivalLocCode) REFERENCES locations (LocationCode),
  CONSTRAINT trip_ibfk_3 FOREIGN KEY (DepartureLocCode) REFERENCES locations (LocationCode),
  CONSTRAINT trip_ibfk_4 FOREIGN KEY (EquipId) REFERENCES equipment (EquipID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table trip
--


INSERT INTO trip VALUES ('2005-08-14','3030','2:15 PM','NAS','1:00 PM','BOS','2:00 PM','1:00 PM',8596);
INSERT INTO trip VALUES ('2005-09-07','546','11:45 PM','ROC','3:00 PM','JFK','11:30 PM','3:00 PM',894);
INSERT INTO trip VALUES ('2005-09-11','4567','8:30 AM','BUF','6:00 AM','ROC','7:30 AM','7:15 AM',568);
INSERT INTO trip VALUES ('2005-10-10','3030',NULL,NULL,'1:00 PM','BOS','2:00 PM','1:00 PM',5634);
INSERT INTO trip VALUES ('2005-10-11','1027',NULL,NULL,'10:00 AM','BUF','2:00 PM','10:00 AM',1256);
INSERT INTO trip VALUES ('2005-11-04','6432',NULL,NULL,'1:00 PM','JFK','8:00 PM','1:00 PM',7624);


--
-- Table structure for table trip_people
--

DROP TABLE IF EXISTS trip_people;
CREATE TABLE trip_people (
  TripNum varchar(10) NOT NULL default '',
  Date date NOT NULL default '0000-00-00',
  PassengerID int(11) NOT NULL default '0',
  PRIMARY KEY  (TripNum,Date,PassengerID),
  KEY Date (Date),
  KEY PassengerID (PassengerID),
  CONSTRAINT trip_people_ibfk_1 FOREIGN KEY (TripNum) REFERENCES trip (TripNum),
  CONSTRAINT trip_people_ibfk_2 FOREIGN KEY (Date) REFERENCES trip (Date),
  CONSTRAINT trip_people_ibfk_3 FOREIGN KEY (PassengerID) REFERENCES passenger (PassengerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table trip_people
--


INSERT INTO trip_people VALUES ('3030','2005-08-14',9);
INSERT INTO trip_people VALUES ('546','2005-09-07',5);
INSERT INTO trip_people VALUES ('4567','2005-09-11',6);
INSERT INTO trip_people VALUES ('4567','2005-09-11',7);
INSERT INTO trip_people VALUES ('3030','2005-10-10',1);
INSERT INTO trip_people VALUES ('3030','2005-10-10',2);
INSERT INTO trip_people VALUES ('1027','2005-10-11',3);
INSERT INTO trip_people VALUES ('1027','2005-10-11',4);
INSERT INTO trip_people VALUES ('1027','2005-10-11',8);
INSERT INTO trip_people VALUES ('6432','2005-11-04',10);

--
-- Table structure for table staff
--

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
  Date date NOT NULL default '0000-00-00',
  TripNum varchar(10) NOT NULL default '0',
  Role varchar(20) NOT NULL default '',
  Name varchar(100) NOT NULL default '',
  PRIMARY KEY  (Date,TripNum,Role),
  KEY TripNum (TripNum),
  CONSTRAINT staff_ibfk_1 FOREIGN KEY (TripNum) REFERENCES trip (TripNum),
  CONSTRAINT staff_ibfk_2 FOREIGN KEY (Date) REFERENCES trip (Date)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table staff
--


INSERT INTO staff VALUES ('2005-08-14','3030','Pilot','Greg Zalewski');
INSERT INTO staff VALUES ('2005-09-07','546','Driver','Brian Page');
INSERT INTO staff VALUES ('2005-09-11','4567','Engineer','Howard Vogel');
INSERT INTO staff VALUES ('2005-10-10','3030','CoPilot','Dan Gnagy');
INSERT INTO staff VALUES ('2005-10-10','3030','Pilot','Brad Raushey');
INSERT INTO staff VALUES ('2005-10-11','1027','CoPilot','Lorraine LeBan');
INSERT INTO staff VALUES ('2005-10-11','1027','Pilot','Molly Connor');
INSERT INTO staff VALUES ('2005-11-04','6432','Driver','Pam Stewart');
