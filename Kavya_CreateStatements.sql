/* 
Hospital Management System
Kavya Mistry
*/

--DROP TABLE ADMIN;
CREATE TABLE ADMIN 
(
    admin_ID INT NOT NULL PRIMARY KEY, -- primary key column
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    phoneNo INT(10) NOT NULL,
    emailAddress VARCHAR(25),
    departmentName VARCHAR(100) CHECK( departmentName IN ('General Internal Medicine', 'Cardiology', 'Dermatology', 'Endocrinology', 'Gastroenterology', 'Oncology', 'Epidemiology', 'Nephrology', 'Pharmacology', 'Pulmonology', 'Rheumatology', 'ER')),
    officeNo VARCHAR(3)
);

--DROP TABLE PHYSICIAN;
CREATE TABLE PHYSICIAN
(
    doctor_ID INT NOT NULL PRIMARY KEY, -- primary key column
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    phonenumber INT(10) NOT NULL,
    departmentName VARCHAR(100) NOT NULL CHECK( departmentName IN ('General Internal Medicine', 'Cardiology', 'Dermatology', 'Endocrinology', 'Gastroenterology', 'Oncology', 'Epidemiology', 'Nephrology', 'Pharmacology', 'Pulmonology', 'Rheumatology', 'ER')),
    SSN CHAR(9) NOT NULL,
    yearsOfPractice NUMERIC DEFAULT 1,
    officeNo VARCHAR(3) NOT NULL,
    salary NUMERIC NOT NULL CHECK(salary > 0)-- can be different for each doctor according to experience 
);

--DROP TABLE PATIENT;
CREATE TABLE PATIENT
(
    patientID INT NOT NULL PRIMARY KEY, -- primary key column
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    DOB DATE NOT NULL, --CHECK(DOB <= date('now')), 
    age NUMERIC NOT NULL CHECK(age >= 0),
    gender VARCHAR(2) NOT NULL CHECK(gender IN ('M', 'F', 'None')), -- assigned at birth
    streetNo NUMERIC NOT NULL,
    streetName VARCHAR(100) NOT NULL,
    city VARCHAR(30) NOT NULL,
    stateName CHAR(2) NOT NULL, -- Two letter abbreviation for stateName
    zipcode NUMERIC(5) NOT NULL,
    phoneNo CHAR(10),
    doctor_ID INT NOT NULL,
    patientType CHAR(1) NOT NULL CHECK(patientType IN ('O','I')),
    patientHeight INT CHECK(patientHeight > 0), -- in centimeters (cm)
    patientWeight INT CHECK(patientWeight > 0),
    patientBloodGroup VARCHAR(3), -- in pounds (lbs)
    
    FOREIGN KEY (doctor_ID) REFERENCES PHYSICIAN(doctor_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Trigger function for checking DOB constraint
CREATE TRIGGER check_date_of_birth
BEFORE INSERT ON PATIENT
FOR EACH ROW
BEGIN
  SELECT
    CASE
      WHEN NEW.DOB > date('now')
        THEN RAISE(ABORT, 'Date of birth cannot be in the future.')
      WHEN NEW.DOB < '1900-01-01'
        THEN RAISE(ABORT, 'Date of birth cannot be earlier than January 1st, 1900.')
      ELSE NULL
    END;
END;


--DROP TABLE APPOINTMENT;
CREATE TABLE APPOINTMENT
(
     appointment_ID INT NOT NULL PRIMARY KEY,
     patientID INT NOT NULL,
     doctor_ID INT NOT NULL,
     admin_ID INT NOT NULL,
     appointmentDate DATE NOT NULL, --CHECK(appointmentDate > date()),
     FOREIGN KEY (doctor_ID) REFERENCES PHYSICIAN(doctor_ID) ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY (patientID) REFERENCES PATIENT(patientID) ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY (admin_ID) REFERENCES ADMIN(admin_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Trigger function for Appointment Date constraint
CREATE TRIGGER check_appointment_date
BEFORE INSERT ON APPOINTMENT
FOR EACH ROW
BEGIN
  SELECT
    CASE
      WHEN NEW.appointmentDate <= date('now')
        THEN RAISE(ABORT, 'Appointment date must be in the future.')
      WHEN NEW.appointmentDate > date('now', '+1 month')
        THEN RAISE(ABORT, 'Appointment date cannot be more than one month in the future.')
      ELSE NULL
    END;
END;


--Drop table DIAGNOSIS;
CREATE TABLE DIAGNOSIS
(
    diagnosis_ID INT NOT NULL PRIMARY KEY, -- primary key column
    doctor_ID INT NOT NULL,
    patientID INT NOT NULL,
    diagnosisCategory VARCHAR(100) NOT NULL CHECK(diagnosisCategory IN ('Hypertension','Hyperlipidemia','Diabetes','Back pain','Anxiety','Obesity','Allergic rhinitis','Respiratory problems','Hypothyroidism','Visual refractive errors','Osteoarthritis','Myositis','Pain in joint','Acute maxillary sinusitis','Major depressive disorder','Acute bronchitis','Asthma','Skin Disease','Coronary atherosclerosis','Urinary tract infection','Influenza','Tuberculosis','Viral infection','Seizure Disorder','Cerebral Palsy','Tourette Syndrome','Attention Deficit Disorder','Down Syndrome')),
    diagnosis TEXT,
    diagnosisDate DATE NOT NULL, --CHECK(diagnosisDate <= date())

    FOREIGN KEY (doctor_ID) REFERENCES PHYSICIAN(doctor_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (patientID) REFERENCES PATIENT(patientID) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Trigger for Diagnosis Date constraint
CREATE TRIGGER check_diagnosis_date
BEFORE INSERT ON DIAGNOSIS
FOR EACH ROW
BEGIN
  SELECT
    CASE
      WHEN NEW.diagnosisDate > date('now')
        THEN RAISE(ABORT, 'Diagnosis date cannot be in the future.')
      ELSE NULL
    END;
END;

Drop Table BILLING;
CREATE TABLE BILLING
(
    billing_ID INT NOT NULL PRIMARY KEY, -- primary key column
    patientID INT NOT NULL,
    doctorCharge NUMERIC NOT NULL DEFAULT 0, 
    prescriptionCharge NUMERIC NOT NULL DEFAULT 0, 
    roomCharge NUMERIC NOT NULL DEFAULT 0,
    insuranceCoveragePercentage NUMERIC(3) NOT NULL DEFAULT 0,
    billingDate DATE NOT NULL, --CHECK(billingDate >= date())

    FOREIGN KEY (patientID) REFERENCES PATIENT(patientID) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Trigger for Billing Date Constraint
CREATE TRIGGER check_billing_date
BEFORE INSERT ON BILLING
FOR EACH ROW
BEGIN
  SELECT
    CASE
      WHEN NEW.billingDate > date('now')
        THEN RAISE(ABORT, 'Billing date cannot be in the future.')
      ELSE NULL
    END;
END;

--Drop Table INPATIENT; 
CREATE TABLE INPATIENT
(
    inpatient_ID INT NOT NULL PRIMARY KEY, -- primary key column
    admitDate DATE NOT NULL, --CHECK(admitDate <= date()),--inpatient is a hospital patient who, in most cases, stays in the hospital overnight and meets a set of clinical criteria.
    dischargeDate DATE NULL,
    roomID INT NOT NULL,

    FOREIGN KEY (inpatient_ID) REFERENCES PATIENT(patientID) ON DELETE CASCADE ON UPDATE CASCADE
    FOREIGN KEY (roomID) REFERENCES ROOM(roomID) ON DELETE CASCADE ON UPDATE CASCADE

);
--Create Trigger for AdmitDate and Discharge Date
CREATE TRIGGER check_AdmitDate_date
BEFORE INSERT ON INPATIENT
FOR EACH ROW
BEGIN
  SELECT
    CASE
      WHEN NEW.admitDate > date('now')
        THEN RAISE(ABORT, 'Admit date cannot be in the future.')
      ELSE NULL
    END;
END;


--DROP TABLE OUTPATIENT;
CREATE TABLE OUTPATIENT
(
    outpatient_ID INT NOT NULL PRIMARY KEY, -- primary key column
    consultation_date DATE, --CHECK(consultation_date = date())--Outpatients are people who receive care or hospital services and return home the same day.

    FOREIGN KEY (outpatient_ID) REFERENCES PATIENT(patientID) ON DELETE CASCADE ON UPDATE CASCADE
);
--Create Trigger for Consultation Date
CREATE TRIGGER check_Consultation_date
BEFORE INSERT ON OUTPATIENT
FOR EACH ROW
BEGIN
  SELECT
    CASE
      WHEN NEW.consultation_date = date('now')
        THEN RAISE(ABORT, 'Consultation date can only be the same day as today for outpatient.')
      ELSE NULL
    END;
END;

--DROP TABLE ROOM;
CREATE TABLE ROOM
(
    roomID INT NOT NULL PRIMARY KEY, -- primary key column
    roomStatus VARCHAR(10) NOT NULL, --CHECK(roomStatus IN ('Vacant', 'Occupied')),
    roomCharge NUMERIC NOT NULL --CHECK(roomCharge > 0) 
);

--DROP TABLE ROOM_INPATIENT;
/*CREATE TABLE ROOM_INPATIENT
(
    inpatientID INT NOT NULL, -- primary key column
    roomID INT NOT NULL,
    PRIMARY KEY (inpatientID,roomID),
    FOREIGN KEY (inpatientID) REFERENCES INPATIENT(inpatient_ID),
   FOREIGN KEY (roomID) REFERENCES ROOM(roomID)
);*/