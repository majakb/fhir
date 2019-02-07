CREATE TABLE Appointment
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	cancelationReason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	appointmentType_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),	
	[priority] int CHECK ([priority] >= 0), -- Check constraint for ? se om verdien er st?rre eller lik 0.
	[description] nvarchar (255),
	[start] datetimeoffset,
	[end] datetimeoffset,
	minutesDuration int CHECK (minutesDuration >= 1), -- check constraint for ? se om verdien er st?rre eller like 1. Ikke tillatt med negative verdier
	created datetime,
	comment nvarchar(255),
	patientInstruction nvarchar(255),
	requestedPeriodStart datetime,
	requestedPeriodEnd datetime,
)

CREATE TABLE AppointmentServiceCategory
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AppointmentServiceCategory PRIMARY KEY (id_Appointment, id_CodeableConcept),
)

CREATE TABLE AppointmentServiceType
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AppointmentServiceType PRIMARY KEY (id_Appointment, id_CodeableConcept)
)

CREATE TABLE AppointmentSpeciality
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AppointmentSpeciality PRIMARY KEY (id_Appointment, id_CodeableConcept)
)

CREATE TABLE AppointmentReasonCode
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AppointmentReasonCode PRIMARY KEY (id_Appointment, id_CodeableConcept),
)

CREATE TABLE AppointmentReasonReference
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AppointmentReasonReference PRIMARY KEY (id_Appointment, id_Reference),
)

CREATE TABLE AppointmentSupportingInformation
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AppointmentSupportingInformation PRIMARY KEY (id_Appointment, id_Reference),
)

CREATE TABLE AppointmentSlot
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AppointmentSlot PRIMARY KEY (id_Appointment, id_Reference),
)

CREATE TABLE AppointmentBasedOn
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AppointmentBasedOn PRIMARY KEY (id_Appointment, id_Reference)
)

CREATE TABLE AppointmentRequestedPeriod
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AppointmentRequestedPeriod PRIMARY KEY (id_Appointment, id_Reference),
)

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE AppointmentParticipant_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	actor_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	[required] nvarchar(255),
	[status] nvarchar(255) NOT NULL,
	periodStart datetime,
	periodEnd datetime,
)

CREATE TABLE AppointmentParticipant_HTType
(
	id_AppointmentParticipant_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AppointmentParticipant_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AppointmentParticipant_HTType PRIMARY KEY (id_AppointmentParticipant_HT, id_CodeableConcept),
)

CREATE TABLE AppointmentParticipant
(
	id_Appointment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Appointment(id),
	id_AppointmentParticipant_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AppointmentParticipant_HT(id),
	CONSTRAINT PK_AppointmentParticipant PRIMARY KEY (id_Appointment, id_AppointmentParticipant_HT),
)
