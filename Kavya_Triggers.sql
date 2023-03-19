--1.trigger function that updates the room status from "vacant" to "occupied" when a new patient is admitted to the room
CREATE TRIGGER update_room_status12
AFTER INSERT ON INPATIENT
BEGIN
  UPDATE ROOM
  SET roomStatus = 'Occupied'
  WHERE roomID = NEW.roomID;
END;

INSERT INTO INPATIENT VALUES(6,'2023-03-09','',6);

--2.trigger function to check the physician salary is not greater than 1000
CREATE TRIGGER check_physician_salary
BEFORE INSERT ON physician
FOR EACH ROW
WHEN NEW.salary > 1000
BEGIN
  SELECT RAISE(ABORT, 'Error: Physician salary cannot be greater than 1000');
END;
