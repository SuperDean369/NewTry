
Create Database Hospital_Database1;


--PatientNextToKin--

Create table PatientNextToKin(
PatientKinID 	int 		Not Null 	Identity(1,1),
FirstName 		Char(25) 	Not Null,
LastName 		Char(25) 	Not Null,
MiddleName 		char(25) 	Null 		Default 'Unknow_MName',
Address			Varchar(1000)	Null	Default 'Unknow_Address',
Telphone 		Numeric(20)		Null	Default	'0',
Relationship	Char(10)	Null		Default 'Unknown_RS',
CONSTRAINT	PatientNextToKinPK		PRIMARY KEY(PatientKinID),
CONSTRAINT 	PatientNextToKinAK 		UNIQUE(FirstName,LastName)
);


--PatientLocalDoctor--

Create table PatientLocalDoctor(
PatientLocalDoctorID	Int 	Not Null 	Identity(1,1),
FirstName 		Char(25) 		Not Null,
LastName 		Char(25) 		Not Null,
MiddleName		Char(25)		Null		Default 'Unknow_MName',
Address			Varchar(1000)	Null		Default 'Unknow_Address',
Sex 			Char(6) 		Null,
Telphone 		Numeric(20)		Null		Default	'0',
ClinicID		Varchar(10)		Null		Default 'Unknown_Clinic',
CONSTRAINT		PatientLocalDoctorPK	PRIMARY KEY(PatientLocalDoctorID),
CONSTRAINT 		PatientLocalDoctorAK	UNIQUE(FirstName,LastName)
);



--Patient Table--

Create table Patient(
PatientNumber	Varchar(10) 	Not Null,
FirstName 		Char(25) 		Not Null,
LastName 		Char(25) 		Not Null,
MiddleName		Char(25)		Null		Default 'Unknow_MName',
Address			Varchar(1000)	Null		Default 'Unknow_Address',
Sex 			Char(6) 		Null,
Telphone 		Numeric(20)		Null		Default	'0',
DateOfBirth		Numeric(4)		Null,
DateDeceased	Numeric(4)		Null,
MaritualStatus	Char(7)			Null,
DateRegistered	DateTime		Null		Default '1111-11-11 00:00:00',
PatientKinID	int				Not Null,
PatientLocalDoctorID	int		Not Null,
CONSTRAINT		PatientPK	PRIMARY KEY(PatientNumber),
CONSTRAINT		PatientAK	UNIQUE(FirstName,LastName),
CONSTRAINT		SexValuesCheck	CHECK(Sex IN ('Male','Female')),
CONSTRAINT		ValidBirthYear	CHECK(DateOfBirth Like '[1-2][0-9][0-9][0-9]'),
CONSTRAINT		validDeathYear	CHECK(DateDeceased Like '[1-2][0-9][0-9][0-9]'),
CONSTRAINT		BirthValuesCheck CHECK(DateOfBirth < DateDeceased),
CONSTRAINT		StatusCheck		CHECK(MaritualStatus in('Single','Married','Window','Windower')),
CONSTRAINT		PatientFK		FOREIGN KEY(PatientKinID)
									REFERENCES	PatientNextToKin(PatientKinID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
CONSTRAINT		PatientFK1		FOREIGN KEY(PatientLocalDoctorID)
									REFERENCES PatientLocalDoctor(PatientLocalDoctorID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION

);

--OutPatient--

Create table OutPatient(
OutPatientID	Int 	Not Null	Identity(1,1),
DateNextAppointment	DateTime 	Null Default '1111-11-11 00:00:00',
PatientNumber Varchar(10) Not Null,
CONSTRAINT OutPatientPK PRIMARY KEY(OutPatientID),
CONSTRAINT	OutPatientFK FOREIGN KEY(PatientNumber)
							REFERENCES Patient(PatientNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
);


--OutPatient_Patient--

Create table OutPatient_Patient(
OutPatient_PatientID	Int 	Not Null	Identity(1,1),
PatientNumber Varchar(10) Not Null,
OutPatientID	Int 	Not Null,
CONSTRAINT OutPatient_PatientPK PRIMARY KEY(OutPatient_PatientID),
CONSTRAINT OutPatient_PatientFK FOREIGN KEY(PatientNumber)
									REFERENCES Patient(PatientNumber)
										ON UPDATE No ACTION
										ON DELETE No ACTION,
CONSTRAINT OutPatient_PatientFK1 FOREIGN KEY(OutPatientID)
									REFERENCES OutPatient(OutPatientID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION

);

--Menu--

Create table Menu(
MenuID	INT not Null,
Name varchar(20) null Default 'Unknown_Name',
Icon varchar(25) null Default 'Unknown_Icon',
Url varchar(255) null Default 'Unknown_Url',
Parent_Id int null Default '0',
CONSTRAINT MenuPK PRIMARY KEY(MenuID)
);

--Roles--

create table Roles(
RoleID int not Null,
Tittle varchar(20) Null Default 'Unknown_tittle',
Description varchar(1000) null Default 'Unknown Description',
CONSTRAINT RolesPK PRIMARY KEY(RoleID)
);

--Role_Menu--

create table Role_Menu(
Role_MenuID int not null,
RoleID int not Null,
MenuID int not Null,
CONSTRAINT Role_MenuPK PRIMARY KEY(Role_MenuID),
CONSTRAINT Role_MenuFK FOREIGN KEY(RoleID)
						REFERENCES Roles(RoleID)
							ON UPDATE NO ACTION
							ON DELETE NO ACTION,
CONSTRAINT Role_MenuFK2 FOREIGN KEY(MenuID)
							REFERENCES Menu(MenuID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION

);

--WorkExperience--

Create table WorkExperience(
WorkExperienceID int not null Identity(1,1),
Position varchar(1000) null Default 'Unknown Position',
StartDate DateTime null Default '1111-11-11 00:00:00',
FinishDate DateTime Null Default '1111-11-11 00:00:00',
Organistion varchar(1000) null Default 'Unknown_Organisation',
CONSTRAINT WorkExperiencePK PRIMARY KEY(WorkExperienceID)

);

--StaffQualification--

Create table StaffQualification(
StaffQualificationID INT Not Null Identity(100,1),
Type varchar(20) null Default 'Unknown_type',
[Date] DateTime null Default '1111-11-11 00:00:00',
Institution varchar(50) null Default 'Unknown_Institution',
CONSTRAINT StaffQualificationPK PRIMARY KEY(StaffQualificationID)
);



--StaffContract--

Create table StaffContract(
StaffContractID int not Null Identity(1000,1),
CurrentSalary Numeric(8) null Default '0',
SalaryScale varchar(25) Null Default 'unknown_salaryScale',
PaidWeeklyOrMonthly	char(20) null Default 'unknown_p',
HoursPerWeek Numeric(8) null Default '0',
TypePT char(20) null Default 'Unknown',
CONSTRAINT StaffContractPK PRIMARY KEY(StaffContractID)
);


--Staff--

create table Staff(
StaffNumber varchar(10) not Null,
FirstName char(25) not Null,
LastName char(25) not Null,
MiddleName char(25) Null Default 'Unknow_MName',
Address varchar(1000) null Default 'Unknow_Address',
Telphone Numeric(20) null Default '0',
DateOfBirth Numeric(4) Null Default '0',
Sex char(20) null Default 'Unknown',
Email varchar(25) not Null,
Password varchar(25) not Null,
NationallnsuranceNumber varchar(25) Null Default 'unknown',
WorkExperienceID int not null,
StaffQualificationID int not Null,
StaffContractID int not Null,
RoleID int not null,
CONSTRAINT StaffPK PRIMARY KEY(StaffNumber),
CONSTRAINT StaffAK1 UNIQUE(FirstName,LastName),
CONSTRAINT StaffAK2 UNIQUE(Email,Password),
CONSTRAINT StaffFK1 FOREIGN KEY(WorkExperienceID)
						REFERENCES WorkExperience(WorkExperienceID)
							ON UPDATE NO ACTION
							ON DELETE NO ACTION,
CONSTRAINT StaffFK2 FOREIGN KEY(StaffQualificationID)
						REFERENCES StaffQualification(StaffQualificationID)
							ON UPDATE NO ACTION
							ON DELETE NO ACTION,
CONSTRAINT StaffFK3 FOREIGN KEY(RoleID)
						REFERENCES Roles(RoleID)
							ON UPDATE NO ACTION
							ON DELETE NO ACTION,
CONSTRAINT StaffFK4 FOREIGN KEY(StaffContractID)
						REFERENCES StaffContract(StaffContractID)
							on update no action
							on DELETE no action 
);

--PersonOfficer--

create table PersonOfficer(
PersonOfficerID int not Null Identity(1000,1),
StaffNumber Varchar(10) Not Null,
Email varchar(25)  Not Null,
Password varchar(25) Not Null,
RoleID	int Not Null,
CONSTRAINT PersonOfficerPK PRIMARY KEY(PersonOfficerID),
CONSTRAINT PersonOfficerAK UNIQUE(Email,Password),
CONSTRAINT PersonOfficerFK FOREIGN KEY(StaffNumber)
							REFERENCES Staff(StaffNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT PersonOfficerFK1 FOREIGN KEY(RoleID)
							REFERENCES Roles(RoleID)
								on UPDATE NO ACTION
								On DELETE no ACTION
);

--MedicalDirector--

create table MedicalDirector(
MedicalDirectorID int not Null Identity(1000,1),
StaffNumber Varchar(10) Not Null,
Email varchar(25)  Not Null,
Password varchar(25) Not Null,
RoleID	int Not Null,
CONSTRAINT MedicalDirectorPK PRIMARY KEY(MedicalDirectorID),
CONSTRAINT MedicalDirectorAK UNIQUE(Email,Password),
CONSTRAINT MedicalDirectorFK FOREIGN KEY(StaffNumber)
							REFERENCES Staff(StaffNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT MedicalDirectorFK1 FOREIGN KEY(RoleID)
							REFERENCES Roles(RoleID)
								on UPDATE NO ACTION
								On DELETE no ACTION
);



--ChargeNurse--

Create table ChargeNurse(
ChargeNurseID int not Null Identity(1000,1),
StaffNumber Varchar(10) Not Null,
Email varchar(25)  Not Null,
Password varchar(25) Not Null,
RoleID	int Not Null,
CONSTRAINT ChargeNursePK PRIMARY KEY(ChargeNurseID),
CONSTRAINT ChargeNurseAK UNIQUE(Email,Password),
CONSTRAINT ChargeNurseFK FOREIGN KEY(StaffNumber)
							REFERENCES Staff(StaffNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT ChargeNurseFK1 FOREIGN KEY(RoleID)
							REFERENCES Roles(RoleID)
								on UPDATE NO ACTION
								On DELETE no ACTION
);


--Ward--

Create table Ward(
WardID INT Not Null Identity(1000,1),
WardName char(25) not null,
Location Char(25) null Default 'Unknown',
NumberOfBed Numeric(4) null Default '0',
TelExNumber	Numeric(20) null Default '0',
ChargeNurseID int not Null,
MedicalDirectorID int Not Null,
PersonOfficerID int not Null,
CONSTRAINT WardPK PRIMARY KEY(WardID),
CONSTRAINT WardAK	UNIQUE(WardName),
CONSTRAINT wardFk	FOREIGN KEY(ChargeNurseID)
						REFERENCES ChargeNurse(ChargeNurseID)
							on DELETE no ACTION
							on UPDATE no ACTION,
CONSTRAINT wardFk1	FOREIGN KEY(MedicalDirectorID)
						REFERENCES	MedicalDirector(MedicalDirectorID)
							on DELETE no ACTION
							on UPDATE no ACTION,

CONSTRAINT wardFk2	FOREIGN KEY(PersonOfficerID)
						REFERENCES PersonOfficer(PersonOfficerID)
							on DELETE no ACTION
							on UPDATE no ACTION,
);

--Clinic--

create table Clinic(
ClinicID varchar(10) not Null,
ClinicName varchar(10) Not Null,
Location Char(25) null Default 'Unknown',
NumberOfBed Numeric(4) null Default '0',
TelExNumber	Numeric(20) null Default '0',
ChargeNurseID int not Null,
MedicalDirectorID int Not Null,
PersonOfficerID int not Null,
CONSTRAINT ClinicPK PRIMARY KEY(ClinicID),
CONSTRAINT ClinicAK	UNIQUE(ClinicName),
CONSTRAINT ClinicFk	FOREIGN KEY(ChargeNurseID)
						REFERENCES ChargeNurse(ChargeNurseID)
							on DELETE no ACTION
							on UPDATE no ACTION,
CONSTRAINT ClinicFk1	FOREIGN KEY(MedicalDirectorID)
						REFERENCES	MedicalDirector(MedicalDirectorID)
							on DELETE no ACTION
							on UPDATE no ACTION,

CONSTRAINT ClinicFk2	FOREIGN KEY(PersonOfficerID)
						REFERENCES PersonOfficer(PersonOfficerID)
							on DELETE no ACTION
							on UPDATE no ACTION,

);

--Stock--

create table Stock(

ItemNumber int not Null,
ItemName Varchar(25) not Null,
ItemDescription varchar(1000) Null  Default 'No_Description',
ItemQuantityInStock Numeric(8) Null Default '0',
ItemReorderLevel Numeric(1) Null Default '0',
ItemCostPerUnit Numeric(8,2) null Default '0',
DrugName varchar(25) not Null,
DrugDescription varchar(1000) null Default 'No_Description',
DrugDosage varchar(20) null Default 'Unknown_Dosage',
DrugMethodOfAdministration char(10) null Default 'Unknown_MOA',
DrugQuantityInStock Numeric(8) Null Default '0',
DrugReorderLevel Numeric(1) Null Default '0',
DrugCostPerUnit Numeric(8,2) null Default '0',
TypeOfStock char(20) null Default 'Unknown_S',
CONSTRAINT StockPK PRIMARY KEY(ItemNumber),
CONSTRAINT StockAK UNIQUE(DrugName)
);

--Ward_Requisation--

create table Ward_Requisation(
Ward_RequisationID INT NOT NULL Identity(1,1),
StaffNumber varchar(10) not Null,
WardID	int not Null,
ItemNumber int  not null,
QuatityRequired Numeric(8) null Default '0',
DateOrdered DateTime null Default '1111-11-11 00:00:00',
CONSTRAINT Ward_RequisationPK PRIMARY KEY(Ward_RequisationID),
CONSTRAINT Ward_RequisationFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION,
CONSTRAINT Ward_RequisationFK1  FOREIGN KEY(WardID)
									REFERENCES Ward(WardID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
CONSTRAINT Ward_RequisationFK2  FOREIGN KEY(ItemNumber)
									REFERENCES Stock(ItemNumber)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION
);

--Clinic_Requisation--

create table Clinic_Requisation(
Clinic_RequisationID INT NOT NULL Identity(1,1),
StaffNumber varchar(10) not Null,
ClinicID	varchar(10) not Null,
ItemNumber int  not null,
QuatityRequired Numeric(8) null Default '0',
DateOrdered DateTime null Default '1111-11-11 00:00:00',
CONSTRAINT Clinic_RequisationPK PRIMARY KEY(Clinic_RequisationID),
CONSTRAINT Clinic_RequisationFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION,
CONSTRAINT Clinic_RequisationFK1  FOREIGN KEY(ClinicID)
									REFERENCES Clinic(ClinicID)
										ON UPDATE NO ACTION
										ON DELETE NO ACTION,
CONSTRAINT Clinic_RequisationFK2	FOREIGN KEY(ItemNumber)
									REFERENCES Stock(ItemNumber)
										on UPDATE no ACTION
										on DELETE no ACTION
);

--Supplier--

create table Supplier(
SupplierNumber int not null Identity(1,1),
Name varchar(1000) not Null,
Telphone Numeric(10) null Default '0',
Address varchar(1000) null Default 'Unknown_Address',
FaxNumber Numeric(10) Null Default '0',
CONSTRAINT SupplierPK PRIMARY KEY(SupplierNumber),
CONSTRAINT	SupplierAK	UNIQUE(Name)

);

--Stock_Supplier--

Create table Stock_Supplier(
Stock_SupplierID INT NOT NULL Identity(1,1)	
ItemNumber INT NOT NULL,
SupplierNumber INT NOT NULL,
CONSTRAINT Stock_SupplierPK PRIMARY KEY(Stock_SupplierID),
CONSTRAINT Stock_SupplierFK FOREIGN KEY(ItemNumber)
								REFERENCES Stock(ItemNumber)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION,
CONSTRAINT Stock_SupplierFK1 FOREIGN KEY(SupplierNumber)
								REFERENCES Supplier(SupplierNumber)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION

);


--Bed--

Create Table Bed(
BedNumber int not null Identity(1,1),
Size varchar(25) null Default 'Unknown_Size',
Description varchar(1000) Null Default 'Unknow_Description',
CONSTRAINT BedPK PRIMARY KEY(BedNumber)
);

--Bed_Clinic--

create table Bed_Clinic(
Bed_ClinicID int not null Identity(1,1),
BedNumber int not null,
ClinicID varchar(10) not null,
CONSTRAINT Bed_ClinicPK PRIMARY KEY(Bed_ClinicID),
CONSTRAINT Bed_ClinicFK FOREIGN KEY(BedNumber)
							REFERENCES Bed(BedNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT Bed_ClinicFK2 FOREIGN KEY(ClinicID)
							REFERENCES Clinic(ClinicID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION

);

--Bed_Ward--

create table Bed_Ward(
Bed_WardID int not null Identity(1,1),
BedNumber int not null,
WardID Int not null,
CONSTRAINT Bed_WardPK PRIMARY KEY(Bed_WardID),
CONSTRAINT Bed_WardFK FOREIGN KEY(BedNumber)
							REFERENCES Bed(BedNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT Bed_WardFK1 FOREIGN KEY(WardID)
							REFERENCES Ward(WardID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
);

--AllocationStaffToWard--

create table AllocationStaffToWard(
AllocationStaffToWardID int not null Identity(1,1),
StaffNumber varchar(10) Not Null,
WardID  int not Null,
CONSTRAINT AllocationStaffToWardPK PRIMARY KEY(AllocationStaffToWardID),
CONSTRAINT AllocationStaffToWardFK FOREIGN KEY(StaffNumber)
										REFERENCES Staff(StaffNumber)
											on UPDATE no ACTION
											on DELETE no ACTION,
CONSTRAINT AllocationStaffToWardFK1 FOREIGN KEY(WardID)
										REFERENCES Ward(WardID)
											on update no ACTION
											on DELETE no ACTION,
);

--AllocationStaffToClinic--

Create table AllocationStaffToClinic(
AllocationStaffToClinicID int not null Identity(1,1),	
StaffNumber Varchar(10) NOT NULL,
ClinicID Varchar(10) NOT NULL,
CONSTRAINT AllocationStaffToClinicPK PRIMARY KEY(AllocationStaffToClinicID),
CONSTRAINT AllocationStaffToClinicFK FOREIGN KEY(StaffNumber)
										REFERENCES Staff(StaffNumber)
											on UPDATE no ACTION
											on DELETE no ACTION,
CONSTRAINT AllocationStaffToClinicFK1 FOREIGN key(ClinicID)
										REFERENCES Clinic(ClinicID)
											on UPDATE no ACTION
											on DELETE no ACTION,

);

--WeeklyRotaWard--

create table WeeklyRotaWard(
WeeklyRotaWardID int not null Identity(1,1),	
StaffNumber varchar(10) Not Null,
WardID  int not Null,
ShiftTime Char(20) not null,
CONSTRAINT WeeklyRotaWardPK PRIMARY KEY(WeeklyRotaWardID),
CONSTRAINT WeeklyRotaWardFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									on update no ACTION
									on DELETE no action,
CONSTRAINT WeeklyRotaWardFK1 FOREIGN key(WardID)
								REFERENCES Ward(WardID)
									on update no action
									on DELETE no action,
CONSTRAINT ShiftValueCheck	Check (ShiftTime in ('Night','Morning','Afternoon'))
);


--WeeklyRotaClinic--

create table WeeklyRotaClinic(
WeeklyRotaClinicID int not null Identity(1,1),
StaffNumber varchar(10) Not Null,
ClinicID Varchar(10) NOT NULL,
ShiftTime Char(20) not null,
CONSTRAINT WeeklyRotaClinicPK PRIMARY KEY(WeeklyRotaClinicID),
CONSTRAINT WeeklyRotaClinicFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									on update no ACTION
									on DELETE no action,
CONSTRAINT WeeklyRotaClinicFK1 FOREIGN key(ClinicID)
								REFERENCES Clinic(ClinicID)
									on update no action
									on DELETE no action,
CONSTRAINT ShiftValueCheckClinic	Check (ShiftTime in ('Night','Morning','Afternoon'))
);

--SeniorNurse--

create table SeniorNurse(
SeniorNurseID int not null Identity(1000,1),
StaffNumber varchar(10) NOT null,
CONSTRAINT SeniorNursePK PRIMARY KEY(SeniorNurseID),
CONSTRAINT SeniorNurseFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									on update no ACTION
									on DELETE no action

);

--JuniorNurse--

create table JuniorNurse(
JuniorNurseID int not null Identity(1000,1),
StaffNumber varchar(10) NOT null,
CONSTRAINT JuniorNursePK PRIMARY KEY(JuniorNurseID),
CONSTRAINT JuniorNurseFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									on update no ACTION
									on DELETE no action

);

--Doctor--

create table Doctor(
DoctorID int not null Identity(1000,1),
StaffNumber varchar(10) NOT null,
CONSTRAINT DoctorPK PRIMARY KEY(DoctorID),
CONSTRAINT DoctorFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									on update no ACTION
									on DELETE no action

);

--Specialist--

create table Specialist(
SpecialistID int not null Identity(1000,1),
StaffNumber varchar(10) NOT null,
CONSTRAINT SpecialistPK PRIMARY KEY(SpecialistID),
CONSTRAINT SpecialistFK FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									on update no ACTION
									on DELETE no action

);

--Ward_Snurse--

create table Ward_Snurse(
Ward_SnurseID int not null Identity(1,1),	
WardID int not Null,
SeniorNurseID int not null,
CONSTRAINT Ward_SnursePK PRIMARY KEY(Ward_SnurseID),
CONSTRAINT Ward_SnurseFK FOREIGN KEY(WardID)
							REFERENCES Ward(WardID)
								on update no action
								on DELETE no action,
CONSTRAINT Ward_SnurseFK1 FOREIGN KEY(SeniorNurseID)
							REFERENCES SeniorNurse(SeniorNurseID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
);

--Ward_Jnurse--

create table Ward_Jnurse(
Ward_JnurseID int not null Identity(1,1),
WardID int not Null,
JuniorNurseID int not null,
CONSTRAINT Ward_JnursePK PRIMARY KEY(Ward_JnurseID),
CONSTRAINT Ward_JnurseFK FOREIGN KEY(WardID)
							REFERENCES Ward(WardID)
								on update no action
								on DELETE no action,
CONSTRAINT Ward_JnurseFK1 FOREIGN KEY(JuniorNurseID)
							REFERENCES JuniorNurse(JuniorNurseID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
);

--Ward_Doctor--

create table Ward_Doctor(
Ward_DoctorID int not null Identity(1,1),
WardID int not Null,
DoctorID int not null,
CONSTRAINT Ward_DoctorPK PRIMARY KEY(Ward_DoctorID),
CONSTRAINT Ward_DoctorFK FOREIGN KEY(WardID)
							REFERENCES Ward(WardID)
								on update no action
								on DELETE no action,
CONSTRAINT Ward_DoctorFK1 FOREIGN KEY(DoctorID)
							REFERENCES Doctor(DoctorID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
);


--Ward_Specialist--


create table Ward_Specialist(
Ward_SpecialistID int not null Identity(1,1),	
WardID int not Null,
SpecialistID int not null,
CONSTRAINT Ward_SpecialistPK PRIMARY KEY(Ward_SpecialistID),
CONSTRAINT Ward_SpecialistFK FOREIGN KEY(WardID)
							REFERENCES Ward(WardID)
								on update no action
								on DELETE no action,
CONSTRAINT Ward_SpecialistFK1 FOREIGN KEY(SpecialistID)
							REFERENCES Specialist(SpecialistID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
);


--Clinic_Snurse--

create table Clinic_Snurse(
Clinic_SnurseID int not null Identity(1,1),
ClinicID varchar(10) Not Null,
SeniorNurseID int not Null,
CONSTRAINT Clinic_SnursePK PRIMARY KEY(Clinic_SnurseID),
CONSTRAINT Clinic_SnurseFK FOREIGN KEY(ClinicID)
							REFERENCES Clinic(ClinicID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT Clinic_SnurseFK1 FOREIGN key(SeniorNurseID)
								REFERENCES SeniorNurse(SeniorNurseID)
									on UPDATE no action
									on DELETE no action

);


--Clinic_Jnurse--

create table Clinic_Jnurse(
Clinic_JnurseID int not null Identity(1,1),
ClinicID varchar(10) Not Null,
JuniorNurseID int not Null,
CONSTRAINT Clinic_JnursePK PRIMARY KEY(Clinic_JnurseID),
CONSTRAINT Clinic_JnurseFK FOREIGN KEY(ClinicID)
							REFERENCES Clinic(ClinicID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT Clinic_JnurseFK1 FOREIGN key(JuniorNurseID)
								REFERENCES JuniorNurse(JuniorNurseID)
									on UPDATE no action
									on DELETE no action

);


--Clinic_Doctor--

create table Clinic_Doctor(
Clinic_DoctorID int not null Identity(1,1),
ClinicID varchar(10) Not Null,
DoctorID int not Null,
CONSTRAINT Clinic_DoctorPK PRIMARY KEY(Clinic_DoctorID),
CONSTRAINT Clinic_DoctorFK FOREIGN KEY(ClinicID)
							REFERENCES Clinic(ClinicID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT Clinic_DoctorFK1 FOREIGN key(DoctorID)
								REFERENCES Doctor(DoctorID)
									on UPDATE no action
									on DELETE no action

);

--Clinic_Specialist--

create table Clinic_Specialist(
Clinic_SpecialistID int not null Identity(1,1),
ClinicID varchar(10) Not Null,
SpecialistID int not Null,
CONSTRAINT Clinic_SpecialistPK PRIMARY KEY(Clinic_SpecialistID),
CONSTRAINT Clinic_SpecialistFK FOREIGN KEY(ClinicID)
							REFERENCES Clinic(ClinicID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION,
CONSTRAINT Clinic_SpecialistFK1 FOREIGN key(SpecialistID)
								REFERENCES Specialist(SpecialistID)
									on UPDATE no action
									on DELETE no action

);

--Inpatient--

Create table Inpatient(
InpatientID int not null Identity(1,1),
DatePlacedWaitList DateTime null Default '1111-11-11 00:00:00',
WardRequried	Numeric(2) null Default '0',
ExpectedDurationStay Numeric(2) null Default '0',
DatePlacedWard DateTime null Default '1111-11-11 00:00:00',
DateExpectedLeaveWard DateTime null Default '1111-11-11 00:00:00',
ActualDateLeftWard DateTime null Default '1111-11-11 00:00:00',
PatientNumber varchar(10) not null,
BedNumber int not null,
CONSTRAINT InpatientPK PRIMARY KEY(InpatientID),
CONSTRAINT InpatientFK FOREIGN KEY(PatientNumber)
							REFERENCES Patient(PatientNumber)
								on update no action
								on DELETE no action,
CONSTRAINT InpatientFK1 FOREIGN KEY(BedNumber)
							REFERENCES Bed(BedNumber)
								on update no action
								on DELETE no action
);

--Patient_Inpatient--

create table Patient_Inpatient(
Patient_InpatientID int not null Identity(1,1),
PatientNumber  varchar(10) not null,
InpatientID int not null,
CONSTRAINT Patient_InpatientPK PRIMARY KEY(Patient_InpatientID),
CONSTRAINT Patient_InpatientFK FOREIGN KEY(PatientNumber)
								REFERENCES Patient(PatientNumber)
									on update no action
									on DELETE NO ACTION,
CONSTRAINT Patient_InpatientFK1 FOREIGN KEY(InpatientID)
									REFERENCES Inpatient(InpatientID)
										on update no action
										ON DELETE NO ACTION
);



--Consultent--

Create Table Consultent(
ConsultentID int not null Identity(1,1),
StaffNumber varchar(10) not Null,
CONSTRAINT ConsultentPK PRIMARY KEY(ConsultentID),
CONSTRAINT ConsultentFK FOREIGN KEY(StaffNumber)
							REFERENCES Staff(StaffNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
);

--Patient_Consultent--

create table Patient_Consultent(
Patient_ConsultentID int not null Identity(1,1),
PatientNumber  varchar(10) not null,
ConsultentID int not null,
CONSTRAINT Patient_ConsultentPK PRIMARY KEY(Patient_ConsultentID),
CONSTRAINT Patient_ConsultentFK FOREIGN KEY(PatientNumber)
								REFERENCES Patient(PatientNumber)
									on update no action
									on DELETE NO ACTION,
CONSTRAINT Patient_ConsultentFK1 FOREIGN KEY(ConsultentID)
									REFERENCES Consultent(ConsultentID)
										on update no action
										ON DELETE NO ACTION
);

--Appointment--

create Table Appointment(
AppointmentID int not null Identity(1,1),
DateOfAppointment DateTime null Default '1111-11-11 00:00:00',
ExaminationRoom Numeric(4) null Default '0',
PatientNumber varchar(10) not null,
StaffNumber varchar(10) not null,
CONSTRAINT AppointmentPK PRIMARY KEY(AppointmentID),
CONSTRAINT AppointmentFK FOREIGN KEY(PatientNumber)
								REFERENCES Patient(PatientNumber)
									on update no action
									on DELETE NO ACTION,
CONSTRAINT AppointmentFK1 FOREIGN KEY(StaffNumber)
								REFERENCES Staff(StaffNumber)
									on update no ACTION
									on DELETE no action
);

--Patient_Appointment--

Create Table Patient_Appointment(
Patient_AppointmentID int not null Identity(1,1),
PatientNumber  varchar(10) not null,
AppointmentID int not null,
CONSTRAINT Patient_AppointmentPK PRIMARY KEY(Patient_AppointmentID),
CONSTRAINT Patient_AppointmentFK FOREIGN KEY(PatientNumber)
								REFERENCES Patient(PatientNumber)
									on update no action
									on DELETE NO ACTION,
CONSTRAINT Patient_AppointmentFK1 FOREIGN KEY(AppointmentID)
									REFERENCES Appointment(AppointmentID)
										on update no action
										ON DELETE NO ACTION

);


--Examination--

Create Table Examination(
ExaminationID INT NOT NULL Identity(1000,1),
ResultType char(25) not null,
AppointmentID int not null,
CONSTRAINT ExaminationPK PRIMARY KEY(ExaminationID),
CONSTRAINT ExaminationFK FOREIGN KEY(AppointmentID)
									REFERENCES Appointment(AppointmentID)
										on update no action
										ON DELETE NO ACTION,
CONSTRAINT ResultValueCheck CHECK (ResultType in ('Inward_Patient','Outward_Patient'))
);


--Patient_Examination--

create table Patient_Examination(
Patient_ExaminationID INT NOT NULL Identity(1,1),
PatientNumber  varchar(10) not null,
ExaminationID int not null,
CONSTRAINT Patient_ExaminationPK PRIMARY KEY(Patient_ExaminationID),
CONSTRAINT Patient_ExaminationFK FOREIGN KEY(PatientNumber)
								REFERENCES Patient(PatientNumber)
									on update no action
									on DELETE NO ACTION,
CONSTRAINT Patient_ExaminationFK1 FOREIGN KEY(ExaminationID)
									REFERENCES Examination(ExaminationID)
										on update no action
										ON DELETE NO ACTION
);

--MedicationFromWard--

create table MedicationFromWard(
MedicationFromWardID int not null Identity(1,1),
PatientNumber varchar(10) not null,
WardID int Not null,
Ward_RequisationID int Not Null,
ItemName varchar(20) null Default 'unknown_Name',
UnitsPerDay Numeric(8) null Default '0',
MethodOfAdministration varchar(20) not Null,
StartDate DateTime null Default '1111-11-11 00:00:00',
FinishDate DateTime null Default '1111-11-11 00:00:00',
CONSTRAINT MedicationWardPK PRIMARY KEY(MedicationFromWardID),
CONSTRAINT MedicationWardFK FOREIGN KEY(PatientNumber)
								REFERENCES Patient(PatientNumber)
									on update no action
									on DELETE NO ACTION,
CONSTRAINT MedicationWardFK1 FOREIGN KEY(WardID)
							REFERENCES Ward(WardID)
								on update no action
								on DELETE no action,
CONSTRAINT MedicationWardFK2 FOREIGN KEY(Ward_RequisationID)
								REFERENCES Ward_Requisation(Ward_RequisationID)
									on update no action
									on DELETE no action,
CONSTRAINT WDMthdOfAdmistrtionValueCk Check (MethodOfAdministration in ('IV','Oral'))

);

--MedicationFromClinic--

create table MedicationFromClinic(
MedicationFromClinicID int not null Identity(1,1),
PatientNumber varchar(10) not null,
WardID int Not null,
Clinic_RequisationID int Not Null,
ItemName varchar(20) null Default 'unknown_Name',
UnitsPerDay Numeric(8) null Default '0',
MethodOfAdministration varchar(20) not Null,
StartDate DateTime null Default '1111-11-11 00:00:00',
FinishDate DateTime null Default '1111-11-11 00:00:00',
CONSTRAINT MedicationFromClinicPK PRIMARY KEY(MedicationFromClinicID),
CONSTRAINT MedicationFromClinicFK FOREIGN KEY(PatientNumber)
								REFERENCES Patient(PatientNumber)
									on update no action
									on DELETE NO ACTION,
CONSTRAINT MedicationFromClinicFK1 FOREIGN KEY(WardID)
							REFERENCES Ward(WardID)
								on update no action
								on DELETE no action,
CONSTRAINT MedicationFromClinicFK2 FOREIGN KEY(Clinic_RequisationID)
								REFERENCES Clinic_Requisation(Clinic_RequisationID)
									on update no action
									on DELETE no action,
CONSTRAINT ClMthdOfAdmistrtionValueCk Check (MethodOfAdministration in ('IV','Oral'))

);
