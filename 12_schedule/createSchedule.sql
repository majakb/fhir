CREATE TABLE Schedule
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	active bit,
	planningHorizonStart datetime,
	planningHorizonEnd datetime,
	comment nvarchar(255),
)

CREATE TABLE ScheduleServiceCategory
(
	id_Schedule uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Schedule(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ScheduleServiceCategory PRIMARY KEY (id_Schedule, id_CodeableConcept),
)

CREATE TABLE ScheduleServiceType
(
	id_Schedule uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Schedule(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ScheduleServiceType PRIMARY KEY (id_schedule, id_codeableConcept),
)

CREATE TABLE ScheduleSpecialty
(
	id_Schedule uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Schedule(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ScheduleSpecialty PRIMARY KEY (id_Schedule, id_CodeableConcept),
)

CREATE TABLE ScheduleActor
(
	id_Schedule uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Schedule(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ScheduleActor PRIMARY KEY (id_Schedule, id_Reference),
)