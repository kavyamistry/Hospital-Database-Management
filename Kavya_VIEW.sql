--View to show all patient information along with their assigned doctors
CREATE VIEW PatientDoctorView AS
SELECT p.patientID, p.firstName, p.lastName, p.phoneNo, 
       d.firstName,p.lastName, d.departmentName
FROM Patient p
LEFT JOIN PHYSICIAN d ON p.doctor_id = d.doctor_id;

--View to show the average length of stay for each ward
CREATE VIEW RoomAvgStay AS
SELECT r.roomID, AVG((a.dischargeDate) - (a.admitDate)) AS AvgStay
FROM ROOM r
LEFT JOIN INPATIENT a ON r.roomID = a.roomID
GROUP BY a.inpatient_ID;

--View to show the number of appointments per doctor per day
CREATE VIEW DoctorAppointmentCount AS
SELECT d.doctor_ID, d.firstName, d.lastName, a.appointmentDate, COUNT(*) AS AppointmentCount
FROM PHYSICIAN d
LEFT JOIN Appointment a ON d.doctor_ID = a.doctor_ID
GROUP BY d.doctor_ID, a.appointmentDate;

INSERT INTO APPOINTMENT VALUES(1000000010,1,1,9,'2023-03-23');