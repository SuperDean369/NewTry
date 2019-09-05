
--PatientNextToKin--

SET IDENTITY_INSERT dbo.PatientNextToKin ON
INSERT INTO PatientNextToKin (PatientKinID, FirstName, LastName, MiddleName, Address, Telphone, Relationship)
VALUES 		(1,'James','Phelps','Collnies','145 Rowlands Street palsley, PA2 5F2',01418482211,'Son'),
			(2,'Janes','Twilight','Warning','10899 88th Ave',01418482213,'Uncle'),
			(3,'Frederickson','Selma',,'Bainbridge Island',0142452221,'Son'),
			(4,'Twilight','Tiffany',,'25 South Lafayette',24135545,'Wife');

SET IDENTITY_INSERT dbo.PatientNextToKin OFF


--PatientLocalDoctor--

SET IDENTITY_INSERT dbo.PatientLocalDoctor ON
INSERT INTO PatientLocalDoctor (PatientLocalDoctorID, FirstName, LastName, MiddleName, Address, Sex, Telphone, ClinicID)
VALUES 		(1,'Hellen','Pearson','Happy','22 Cannongate Way, Edinburgh, EH1 6TY','Male',01313320012,'E102'),
			(2,'Janes','David','Canns','343 Tumbleweed Lana','Female',5432345,'E103'),
			(3,'Smith','Jeffery','Kandinsky','763 Tumbleweed Lana','Female',5432345,'E102'),
			(4,'Twilight','Tiffany','Miro','463 Tumble Lana','Male',5445345,'E113'),
			(5,'Smathers','Fred','Spanish','853 Lane weed Lana','Female',5466345,'E103');
			
SET IDENTITY_INSERT dbo.PatientLocalDoctor OFF

--Patient Table--

SET IDENTITY_INSERT dbo.Patient ON
INSERT INTO Patient (PatientNumber, FirstName, LastName, MiddleName, Address, Sex, Telphone, DateOfBirth, DateDeceased, MaritualStatus, DateRegistered, PatientKinID,PatientLocalDoctorID)
VALUES 		('P10011','Anne','Phelps','','44 North Bridges Cannongate, Edinburgh EH1 5GH','Female',01332411,1-12-2002,,'Single',21-07-2006,01,01),
			('P12033','Smathers','Tiffany','Spanish','453','Male',21634581,23-05-1992,,'Married',21-04-2002,02,03),
			('P12035','Hellen','Pearson','Kandinsky','813 Tumbleweed Lana','Male',2165545,23-05-1996,,'Single',25-05-1983,03,03),
			('P12037','Janes','Fred','Miro','813 Tumbleweed Lana','Male',21673453,33-06-1996,,'Married',23-02-1995,04,05);

SET IDENTITY_INSERT dbo.Patient OFF

---

SET IDENTITY_INSERT dbo.Patient ON
INSERT INTO Patient (PatientNumber, FirstName, LastName, MiddleName, Address, Sex, Telphone, DateOfBirth, MaritualStatus, DateRegistered, PatientKinID,PatientLocalDoctorID)
VALUES 		('P10011','Anne','Phelps','Cares','44 North Bridges Cannongate, Edinburgh EH1 5GH','Female',01332411,2002,'Single',2006,01,01),
			('P12033','Smathers','Tiffany','Spanish','453 Holland','Male',21634581,1992,'Married',2002,02,03),
			('P12035','Hellen','Pearson','Kandinsky','813 Tumbleweed Lana','Male',2165545,1996,'Single',1983,03,03),
			('P12037','Janes','Fred','Miro','813 Tumbleweed Lana','Male',21673453,1996,'Married',1995,04,05);

SET IDENTITY_INSERT dbo.Patient OFF

--OutPatient--

SET IDENTITY_INSERT dbo.OutPatient ON
INSERT INTO Patient (OutPatientID, DateNextAppointment, PatientNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();



SET IDENTITY_INSERT dbo.OutPatient OFF


--OutPatient_Patient--

SET IDENTITY_INSERT dbo.OutPatient_Patient ON
INSERT INTO Patient (PatientNumber, OutPatientID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();


SET IDENTITY_INSERT dbo.OutPatient_Patient OFF

--Menu--

SET IDENTITY_INSERT dbo.Menu ON
INSERT INTO Menu (MenuID, Name,Icon,Url,Parent_Id)
VALUES 		(1,'Dashboard','fa fa-dashboard','/',0),
			(2,'Users','fa fa-users','#',0),
			(3,'Create User','fa fa-plus','/Admins/Create',2),
			(4,'Manage User','fa fa-users','/Admins/Index',2),
			(5,'Roles','fa fa-lock','#',0),
			(6,'Create Role','fa fa-lock','/Role/Create',0),
			(7,'Manage Role','fa fa-lock','/Roele/Index',5);

SET IDENTITY_INSERT dbo.Menu OFF


--Roles--

SET IDENTITY_INSERT dbo.Roles ON
INSERT INTO Roles (RoleID, Tittle,Description)
VALUES 		(1,'Adminstrator','Supper Admin with all rights'),
			(2,'IT Support','Can view Dashboard only mange Roles and Admin'),
			(6,'User','Can View Only Dashboard');
SET IDENTITY_INSERT dbo.Roles OFF


--Role_Menu--

SET IDENTITY_INSERT dbo.Role_Menu ON
INSERT INTO Role_Menu (Role_MenuID, RoleID,MenuID)
VALUES 		(1,1,1),
			(2,1,2),
			(3,1,3),
			(4,1,4),
			(5,1,5),
			(6,1,6),
			(7,1,7),
			(8,2,1),
			(9,2,2),
			(10,2,4),
			(11,2,5),
			(12,2,7),
			(13,6,1);


SET IDENTITY_INSERT dbo.Role_Menu OFF


--WorkExperience--
SET IDENTITY_INSERT dbo.WorkExperience ON
INSERT INTO WorkExperience (WorkExperienceID, Position,StartDate,FinishDate,Organistion)
VALUES 		(1,'Staff Nurse',23-01-90,1-05-93,'Western Hospital');
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.WorkExperience OFF



--StaffQualification--

SET IDENTITY_INSERT dbo.StaffQualification ON
INSERT INTO StaffQualification (StaffQualificationID, Type,[Date],Institution)
VALUES 		(1,'BSc Nursing Studies',12-07-87,'Edinburgh University'),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.StaffQualification OFF

--StaffContract--

SET IDENTITY_INSERT dbo.StaffContract ON
INSERT INTO StaffContract (StaffContractID, CurrentSalary,SalaryScale,PaidWeeklyOrMonthly,HoursPerWeek, TypePT)
VALUES 		(1,18760, '1C scale','M',37.50,'P'),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.StaffContract OFF


--Staff--

SET IDENTITY_INSERT dbo.Staff ON
INSERT INTO Staff (StaffNumber, FirstName, LastName, MiddleName, Address, Telphone, DateOfBirth, Sex, Email, Password, NationallnsuranceNumber, WorkExperienceID,StaffQualificationID, StaffContractID, RoleID)
VALUES 		('S001','Wu','Susan','Happy','49 School Road Broxbrun',50645633,1993,'Female','Susan.Wu@some.com',12345,987654321,1,1,1,1),
			('S002','Donald','Gray','Cars','55 Bodega Ave',50234633,1990,'Male','Donald.Gray@some.com',12345,987564321,1,1,1,2),	
			('S003','Lynda','Johnson','Jumps','117 C Street',50234633,1981,'Female','Lynda.Johnson@some.com',12345,987564321,1,1,1,6),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();

SET IDENTITY_INSERT dbo.Staff OFF


--PersonOfficer--

SET IDENTITY_INSERT dbo.PersonOfficer ON
INSERT INTO PersonOfficer (PersonOfficerID, StaffNumber,Email,Password,RoleID)
VALUES 		(1,'S003','Lynda.Johnson@Po.com',54321,1),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.PersonOfficer OFF

--MedicalDirector--

SET IDENTITY_INSERT dbo.MedicalDirector ON
INSERT INTO MedicalDirector (MedicalDirectorID, StaffNumber,Email,Password,RoleID)
VALUES 		(1,'S002','Donald.Gray@Md.com',54321,2),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.MedicalDirector OFF


--ChargeNurse--

SET IDENTITY_INSERT dbo.ChargeNurse ON
INSERT INTO ChargeNurse (ChargeNurseID, StaffNumber,Email,Password,RoleID)
VALUES 		(1,'S001','Susan.Wu@some.com',54321,6),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.ChargeNurse OFF


--Ward--

SET IDENTITY_INSERT dbo.Ward ON
INSERT INTO Ward (WardID, WardName,Location,NumberOfBed,TelExNumber, ChargeNurseID, MedicalDirectorID, PersonOfficerID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Ward OFF


--Clinic--

SET IDENTITY_INSERT dbo.Clinic ON
INSERT INTO Clinic (ClinicID, ClinicName,Location,NumberOfBed,TelExNumber, ChargeNurseID, MedicalDirectorID, PersonOfficerID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Clinic OFF


--Stock--

SET IDENTITY_INSERT dbo.Stock ON
INSERT INTO Stock (ItemNumber, ItemName, ItemDescription, ItemQuantityInStock, ItemReorderLevel, ItemCostPerUnit, DrugName, DrugDescription, DrugDosage, DrugMethodOfAdministration, DrugQuantityInStock, DrugReorderLevel,DrugCostPerUnit, TypeOfStock)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();

SET IDENTITY_INSERT dbo.Stock OFF


--Ward_Requisation--

SET IDENTITY_INSERT dbo.Ward_Requisation ON
INSERT INTO Ward_Requisation (Ward_RequisationID, StaffNumber,WardID,ItemNumber,QuatityRequired, DateOrdered)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Ward_Requisation OFF

--Clinic_Requisation--

SET IDENTITY_INSERT dbo.Clinic_Requisation ON
INSERT INTO Clinic_Requisation (Clinic_RequisationID, StaffNumber,ClinicID,ItemNumber,QuatityRequired, DateOrdered)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Clinic_Requisation OFF


--Supplier--

SET IDENTITY_INSERT dbo.Supplier ON
INSERT INTO Supplier (SupplierNumber, Name,Telphone,Address,FaxNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Supplier OFF


--Stock_Supplier--

SET IDENTITY_INSERT dbo.Stock_Supplier ON
INSERT INTO Stock_Supplier (ItemNumber, SupplierNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Stock_Supplier OFF

--Bed--

SET IDENTITY_INSERT dbo.Bed ON
INSERT INTO Bed (BedNumber, Size, Description)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Bed OFF


--Bed_Clinic--

SET IDENTITY_INSERT dbo.Bed_Clinic ON
INSERT INTO Bed_Clinic (BedNumber, ClinicID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Bed_Clinic OFF


--Bed_Ward--

SET IDENTITY_INSERT dbo.Bed_Ward ON
INSERT INTO Bed_Ward (BedNumber, WardID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Bed_Ward OFF

--AllocationStaffToWard--

SET IDENTITY_INSERT dbo.AllocationStaffToWard ON
INSERT INTO AllocationStaffToWard (StaffNumber, WardID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.AllocationStaffToWard OFF

--AllocationStaffToClinic--

SET IDENTITY_INSERT dbo.AllocationStaffToClinic ON
INSERT INTO AllocationStaffToClinic (StaffNumber, ClinicID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.AllocationStaffToClinic OFF

--WeeklyRotaWard--

SET IDENTITY_INSERT dbo.WeeklyRotaWard ON
INSERT INTO WeeklyRotaWard (StaffNumber, WardID, ShiftTime)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.WeeklyRotaWard OFF

--WeeklyRotaClinic--

SET IDENTITY_INSERT dbo.WeeklyRotaClinic ON
INSERT INTO WeeklyRotaClinic (StaffNumber, ClinicID, ShiftTime)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.WeeklyRotaClinic OFF

--SeniorNurse--

SET IDENTITY_INSERT dbo.SeniorNurse ON
INSERT INTO SeniorNurse (SeniorNurseID, StaffNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.SeniorNurse OFF


--JuniorNurse--

SET IDENTITY_INSERT dbo.JuniorNurse ON
INSERT INTO JuniorNurse (JuniorNurseID, StaffNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.JuniorNurse OFF

--Doctor--

SET IDENTITY_INSERT dbo.Doctor ON
INSERT INTO Doctor (DoctorID, StaffNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Doctor OFF

--Specialist--

SET IDENTITY_INSERT dbo.Specialist ON
INSERT INTO Specialist (SpecialistID, StaffNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Specialist OFF


--Ward_Snurse--

SET IDENTITY_INSERT dbo.Ward_Snurse ON
INSERT INTO Ward_Snurse (WardID, SeniorNurseID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Ward_Snurse OFF

--Ward_Jnurse--

SET IDENTITY_INSERT dbo.Ward_Jnurse ON
INSERT INTO Ward_Jnurse (WardID, JuniorNurseID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Ward_Jnurse OFF


--Ward_Doctor--

SET IDENTITY_INSERT dbo.Ward_Doctor ON
INSERT INTO Ward_Doctor (WardID, DoctorID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Ward_Doctor OFF

--Ward_Specialist--

SET IDENTITY_INSERT dbo.Ward_Specialist ON
INSERT INTO Ward_Specialist (WardID, SpecialistID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Ward_Specialist OFF

--Clinic_Snurse--

SET IDENTITY_INSERT dbo.Clinic_Snurse ON
INSERT INTO Clinic_Snurse (ClinicID, SeniorNurseID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Clinic_Snurse OFF

--Clinic_Jnurse--

SET IDENTITY_INSERT dbo.Clinic_Jnurse ON
INSERT INTO Clinic_Jnurse (ClinicID, JuniorNurseID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Clinic_Jnurse OFF

--Clinic_Doctor--

SET IDENTITY_INSERT dbo.Clinic_Doctor ON
INSERT INTO Clinic_Doctor (ClinicID, DoctorID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Clinic_Doctor OFF


--Clinic_Specialist--

SET IDENTITY_INSERT dbo.Clinic_Specialist ON
INSERT INTO Clinic_Specialist (ClinicID, SpecialistID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Clinic_Specialist OFF

--Inpatient--

SET IDENTITY_INSERT dbo.Inpatient ON
INSERT INTO Inpatient (InpatientID, DatePlacedWaitList,WardRequried, ExpectedDurationStay,DatePlacedWard, DateExpectedLeaveWard,ActualDateLeftWard, PatientNumber, BedNumber )
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Inpatient OFF


--Patient_Inpatient--

SET IDENTITY_INSERT dbo.Patient_Inpatient ON
INSERT INTO Patient_Inpatient(PatientNumber, InpatientID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Patient_Inpatient OFF


--Consultent--

SET IDENTITY_INSERT dbo.Consultent ON
INSERT INTO Consultent(ConsultentID, StaffNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Consultent OFF

--Patient_Consultent--

SET IDENTITY_INSERT dbo.Patient_Consultent ON
INSERT INTO Patient_Consultent(PatientNumber, ConsultentID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Patient_Consultent OFF

--Appointment--

SET IDENTITY_INSERT dbo.Appointment ON
INSERT INTO Appointment (AppointmentID, DateOfAppointment,ExaminationRoom,PatientNumber,StaffNumber)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Appointment OFF


--Patient_Appointment--

SET IDENTITY_INSERT dbo.Patient_Appointment ON
INSERT INTO Patient_Appointment(PatientNumber, AppointmentID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Patient_Appointment OFF


--Examination--

SET IDENTITY_INSERT dbo.Examination ON
INSERT INTO Examination(ExaminationID, ResultType, AppointmentID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Examination OFF

--Patient_Examination--

SET IDENTITY_INSERT dbo.Patient_Examination ON
INSERT INTO Patient_Examination(PatientNumber, ExaminationID)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.Patient_Examination OFF


--MedicationFromWard--

SET IDENTITY_INSERT dbo.MedicationFromWard ON
INSERT INTO MedicationFromWard(MedicationFromWardID, PatientNumber, WardID, Ward_RequisationID, ItemName, UnitsPerDay, MethodOfAdministration, StartDate, FinishDate)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.MedicationFromWard OFF


--MedicationFromClinic--

SET IDENTITY_INSERT dbo.MedicationFromClinic ON
INSERT INTO MedicationFromClinic(MedicationFromClinicID, PatientNumber, WardID, Clinic_RequisationID, ItemName, UnitsPerDay, MethodOfAdministration, StartDate, FinishDate)
VALUES 		(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			(),
			();
SET IDENTITY_INSERT dbo.MedicationFromClinic OFF














