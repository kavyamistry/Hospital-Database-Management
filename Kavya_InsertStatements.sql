--Insert Values into ADMIN Table
INSERT INTO ADMIN VALUES(1,'Kavya', 'Mehta','1111111111','kavyamehta@gmail.com','General Internal Medicine','112');
INSERT INTO ADMIN VALUES(2,'Mistry', 'Singh','2222222222','mistry@gmail.com','Cardiology','223');
INSERT INTO ADMIN VALUES(3,'Abhinav', 'Goel','3333333333','abhig@gmail.com','Dermatology','334');
INSERT INTO ADMIN VALUES(4,'Dan', 'Cox','4444444444','dannn@yahoo.com','Oncology','445');
INSERT INTO ADMIN VALUES(5,'Sydney', 'Derran','5555555555','derransy@gmail.com','Gastroenterology','556');
INSERT INTO ADMIN VALUES(6,'Sam', 'Downey','6666666666','samjr@gmail.com','Endocrinology','667');
INSERT INTO ADMIN VALUES(7,'Jake', 'Wong','7777777777','wongjake@gmail.com','Pulmonology','778');
INSERT INTO ADMIN VALUES(8,'Katy', 'Nate','8888888888','mskate@gmail.com','Pharmacology','889');
INSERT INTO ADMIN VALUES(9,'Nina', 'Class','9999999999','iamnina@yahoo.com','Nephrology','990');

--Insert Values into PHYSICIAN Table
INSERT INTO PHYSICIAN VALUES(1,'Prince', 'Patel','1234567890','General Internal Medicine','111111111',10,'111',250);
INSERT INTO PHYSICIAN VALUES(2,'Nikita', 'Joshi','1234567678','Cardiology','222222222',2,'222',300);
INSERT INTO PHYSICIAN VALUES(3,'Payal', 'Parmar','1234563783','Dermatology','333333333',4,'333',125);
INSERT INTO PHYSICIAN VALUES(4,'Swapnil', 'Challuri','1234512345','Oncology','444444444',7,'444',260);
INSERT INTO PHYSICIAN VALUES(5,'Anna', 'Carles','1234524680','Gastroenterology','555555555',1,'555',530);
INSERT INTO PHYSICIAN VALUES(6,'Jill', 'Hade','1234590899','Endocrinology','666666666',9,'666',120);
INSERT INTO PHYSICIAN VALUES(7,'Will', 'Smith','12345000','Pulmonology','777777777',8,'777',550);
INSERT INTO PHYSICIAN VALUES(8,'Jeff', 'Carpenter','1234567676','Pharmacology','888888888',23,'888',400);
INSERT INTO PHYSICIAN VALUES(9,'Amy', 'Russ','5432154321','Nephrology','999999999',1,'999',1000);

--Insert Values into PATIENT Table
INSERT INTO PATIENT VALUES(1,'Tommy', 'Hillfigure','1996-10-10',26,'M',123,'Cary Road','Manlius','NY',13104,'3153453651',1,'O',172,180,'B+');
INSERT INTO PATIENT VALUES(2,'Dwayne', 'Jonson','1990-11-15',33,'M',234,'Bridge Avenue','Manlius','NY',13104,'3154256157',3,'I',150,164,'O+');
INSERT INTO PATIENT VALUES(3,'Hugh', 'Jackson','1986-02-09',37,'M',345,'Lorraine Avenue','Syracuse','NY',16802,'6157267893',2,'O',144,220,'O-');
INSERT INTO PATIENT VALUES(4,'Chris', 'Hemsworth','1964-12-19',59,'M',456,'Carrier Drive','Liverpool','NY',16803,'5152620092',5,'O',130,135,'B+');
INSERT INTO PATIENT VALUES(5,'Chris', 'Evans','2001-02-02',22,'M',567,'Taft Lane','Fayetteville','NY',22222,'1236728172',4,'I',190,240,'AB+');
INSERT INTO PATIENT VALUES(6,'Robert', 'Downey','2004-02-04',19,'M',678,'Barksdale Lane','Baldwinsville','NY',31215,'3334125263',6,'I',115,100,'O+');
INSERT INTO PATIENT VALUES(7,'Tom', 'Holland','1997-07-21',25,'M',789,'Trillium Trail','Manlius','NY',13104,'4447267281',9,'I',156,145,'O-');
INSERT INTO PATIENT VALUES(8,'Billie', 'Eilish','1972-01-01',51,'F',890,'Parker Drive','Fayetteville','NY',22222,'7772891827',8,'I',174,210,'O+');
INSERT INTO PATIENT VALUES(9,'Post', 'Malone','1952-04-20',70,'F',012,'Trout Road','Syracuse','NY',16802,'7268880290',7,'O',189,214,'B+'); 

--Insert Values into APPOINTMENT Table
INSERT INTO APPOINTMENT VALUES(100000001,1,1,9,'2023-03-23');
INSERT INTO APPOINTMENT VALUES(100000002,2,3,2,'2023-03-11');
INSERT INTO APPOINTMENT VALUES(100000003,3,6,8,'2023-03-12');
INSERT INTO APPOINTMENT VALUES(100000004,4,5,3,'2023-03-15');
INSERT INTO APPOINTMENT VALUES(100000005,5,4,5,'2023-03-15');
INSERT INTO APPOINTMENT VALUES(100000006,6,2,6,'2023-03-14');
INSERT INTO APPOINTMENT VALUES(100000007,7,8,7,'2023-03-10');
INSERT INTO APPOINTMENT VALUES(100000008,8,7,4,'2023-03-23');
INSERT INTO APPOINTMENT VALUES(100000009,9,9,1,'2023-03-25');

--Insert Values into Diagnosis Table
INSERT INTO DIAGNOSIS VALUES(100000011,1,1,'Hypertension','High Systolic BP. High Salt Diet, must reduce and take ACE Inhibitors','2021-09-08');
INSERT INTO DIAGNOSIS VALUES(100000022,2,3,'Diabetes','Type II Diabetic, must reduce sugar and intake and take Insulin once daily','2022-10-05');
INSERT INTO DIAGNOSIS VALUES(100000033,3,2,'Asthma','Albuterol for a month','2019-10-04');
INSERT INTO DIAGNOSIS VALUES(100000044,4,5,'Anxiety','Reduced levels of Serotonin in the brain, perscribed Alazopram 0.5 mg for three months. Take as needed','2022-08-16');
INSERT INTO DIAGNOSIS VALUES(100000055,5,4,'Allergic rhinitis','Inflamed sinus, stuffy nose for 2 weeks. Take OTC Allegra, Benadryl or Claritin from local pharmacy','2021-04-07');
INSERT INTO DIAGNOSIS VALUES(100000066,6,6,'Obesity','Referred to Dietician. Must reduce sugar intake and exercise regularly','2020-05-11');
INSERT INTO DIAGNOSIS VALUES(100000077,7,9,'Hypothyroidism','Hyperactive thyroid leading to weight gain and lack of hunger. Take Levothyroxine: 10 mg/day for 3 months and schedule an additional appointment within the year.','2019-11-10');
INSERT INTO DIAGNOSIS VALUES(100000088,8,8,'Osteoarthritis','Joint Pain in left knee following lifting boxes. Take X-Ray of joint and increase Calcium intake','2019-11-09');
INSERT INTO DIAGNOSIS VALUES(100000099,9,7,'Acute bronchitis','Severe coughing fits. Prescribed inhaler from nearest pharmacy','2019-11-10');

--Insert Values into Billing Table
INSERT INTO BILLING VALUES(100000111,1,250,40,0,80,'2021-10-08');
INSERT INTO BILLING VALUES(100000222,2,125,400,100,60,'2022-10-06');
INSERT INTO BILLING VALUES(100000333,3,300,80,0,40,'2019-12-05');
INSERT INTO BILLING VALUES(100000444,4,530,0,0,10,'2022-09-19');
INSERT INTO BILLING VALUES(100000555,5,260,90,100,0,'2021-04-08');
INSERT INTO BILLING VALUES(100000666,6,120,0,100,55,'2020-05-12');
INSERT INTO BILLING VALUES(100000777,7,1000,15,100,100,'2019-11-11');
INSERT INTO BILLING VALUES(100000888,8,400,0,100,15,'2019-11-10');
INSERT INTO BILLING VALUES(100000999,9,550,100,0,45,'2020-01-10');

--Insert Values into Inpatient Table
INSERT INTO INPATIENT VALUES(1,'2019-10-04','2019-10-05',1);
INSERT INTO INPATIENT VALUES(2,'2019-08-16','2019-08-17',2);
INSERT INTO INPATIENT VALUES(3,'2019-05-11','2019-05-12',3);
INSERT INTO INPATIENT VALUES(4,'2019-11-10','2019-11-11',4);
INSERT INTO INPATIENT VALUES(5,'2019-11-09','2019-11-10',5);

--Insert Values into Outpatient Table 
INSERT INTO OUTPATIENT VALUES(1,'2019-09-08');
INSERT INTO OUTPATIENT VALUES(2,'2019-10-02');
INSERT INTO OUTPATIENT VALUES(3,'2019-04-06');
INSERT INTO OUTPATIENT VALUES(4,'2019-07-16');

--Insert Values into ROOM Table
INSERT INTO ROOM VALUES(1,'Vacant',100);
INSERT INTO ROOM VALUES(2,'Vacant',100);
INSERT INTO ROOM VALUES(3,'Vacant',100);
INSERT INTO ROOM VALUES(4,'Vacant',100);
INSERT INTO ROOM VALUES(5,'Vacant',100);
INSERT INTO ROOM VALUES(6,'Vacant',100);
INSERT INTO ROOM VALUES(7,'Vacant',100);
INSERT INTO ROOM VALUES(8,'Vacant',100);
INSERT INTO ROOM VALUES(9,'Vacant',100);
INSERT INTO ROOM VALUES(10,'Vacant',100);
INSERT INTO ROOM VALUES(11,'Vacant',100);
INSERT INTO ROOM VALUES(12,'Vacant',100);
INSERT INTO ROOM VALUES(13,'Vacant',100);
INSERT INTO ROOM VALUES(14,'Vacant',100);
INSERT INTO ROOM VALUES(15,'Vacant',100);
INSERT INTO ROOM VALUES(16,'Vacant',100);
INSERT INTO ROOM VALUES(17,'Vacant',100);
INSERT INTO ROOM VALUES(18,'Vacant',100);
INSERT INTO ROOM VALUES(19,'Vacant',100);
INSERT INTO ROOM VALUES(20,'Vacant',100);
