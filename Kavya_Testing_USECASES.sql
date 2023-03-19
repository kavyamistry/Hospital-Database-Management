--Testing USE cases

--1.View vacant rooms
SELECT roomStatus, room_ID, roomCharge
FROM ROOM
GROUP BY roomStatus, room_ID, roomCharge;

--2.Insurance Coverage according to PatientID
SELECT BILLING.patientID, PATIENT.firstName,
PATIENT.lastName, BILLING.insuranceCoveragePercentage
FROM PATIENT INNER JOIN BILLING ON PATIENT.patientID =
BILLING.patientID
ORDER BY BILLING.insuranceCoveragePercentage DESC;

--3.View most experienced Doctors
SELECT PHYSICIAN.doctor_ID, PHYSICIAN.firstName,
PHYSICIAN.lastName, PHYSICIAN.yearsOfPractice,
PHYSICIAN.departmentName
FROM PHYSICIAN
ORDER BY PHYSICIAN.yearsOfPractice DESC;

--4.Get a list of all patients and their corresponding diagnosis
SELECT p.patientID, p.firstName, p.lastName, d.diagnosisCategory
FROM patient p
INNER JOIN diagnosis d
ON p.patientID = d.patientID;

--5.Get a count of how many patients have been diagnosed with each condition:
SELECT d.diagnosisCategory, COUNT(*) AS num_patients
FROM diagnosis d
INNER JOIN patient p
ON p.patientID = d.patientID
GROUP BY d.diagnosisCategory;
