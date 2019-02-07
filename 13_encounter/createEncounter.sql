
CREATE TABLE EncounterHospitalization_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	origin_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	admitSource_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	reAdmission_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	destination_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	dischargeDisposition_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id)
);

CREATE TABLE Encounter
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	class_Coding uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Coding(id),
	serviceType_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	priority_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	periodStart datetime,
	periodEnd datetime,
	[length] int,
	lengthType nvarchar(255),
	serviceProvider_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	partOf_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	encounterHospitalization_EncounterHospitalization_HT uniqueidentifier FOREIGN KEY REFERENCES EncounterHospitalization_HT(id)

	--type
);

CREATE TABLE EncounterType
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EncounterType PRIMARY KEY (id_Encounter, id_CodeableConcept)
);

CREATE TABLE EncounterEpisodeOfCare
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EncounterEpisodeOfCare   PRIMARY KEY (id_Encounter, id_Reference)
);

CREATE TABLE EncounterBasedOn
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EncounterBasedOn PRIMARY KEY (id_Encounter, id_Reference)
);

CREATE TABLE EncounterAppointment
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EncounterAppointment PRIMARY KEY (id_Encounter, id_Reference)
);

CREATE TABLE EncounterReasonCode
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EncounterReasonCode PRIMARY KEY (id_Encounter, id_CodeableConcept)
);

CREATE TABLE EncounterReasonReference
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EncounterReasonReference PRIMARY KEY (id_Encounter, id_Reference)
);

CREATE TABLE EncounterAccount
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EncounterAccount PRIMARY KEY (id_Encounter, id_Reference)
);

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE EncounterClassHistory_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	class_Coding uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Coding(id),
	periodStart datetime NOT NULL,
	periodEnd datetime NOT NULL
);

CREATE TABLE EncounterClassHistory
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_EncounterClassHistory_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterClassHistory_HT(id),
	CONSTRAINT PK_EncounterClassHistory PRIMARY KEY (id_Encounter, id_EncounterClassHistory_HT)
);

CREATE TABLE EncounterDiagnosis_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	condition_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	use_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[rank] int
);

CREATE TABLE EncounterDiagnosis
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_EncounterDiagnosis_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterDiagnosis_HT(id),
	CONSTRAINT PK_EncounterDiagnosis PRIMARY KEY (id_Encounter, id_EncounterDiagnosis_HT)
);

CREATE TABLE EncounterParticipant_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	type_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	periodStart datetime,
	periodEnd datetime,
	individual_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE EncounterParticipant
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_EncounterParticipant_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterParticipant_HT(id),
	CONSTRAINT PK_EncounterParticipant PRIMARY KEY (id_Encounter, id_EncounterParticipant_HT)
);

CREATE TABLE EncounterParticipant_HTType
(
	id_EncounterParticipant_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterParticipant_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EncounterParticipant_HTType PRIMARY KEY (id_EncounterParticipant_HT, id_CodeableConcept)
);

CREATE TABLE EncounterLocation_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	location_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	[status] nvarchar(255),
	physicalType_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	periodStart datetime,
	periodEnd datetime
);

CREATE TABLE EncounterLocation
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_EncounterLocation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterLocation_HT(id),
	CONSTRAINT PK_EncounterLocation PRIMARY KEY (id_Encounter, id_EncounterLocation_HT)
);

CREATE TABLE EncounterHospitalization_HTDietPreference
(
	id_EncounterHospitalization_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterHospitalization_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EncounterHospitalization_HTDietPreference PRIMARY KEY (id_EncounterHospitalization_HT, id_CodeableConcept)
);

CREATE TABLE EncounterHospitalization_HTSpecialCourtesy
(
	id_EncounterHospitalization_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterHospitalization_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EncounterHospitalization_HTSpecialCourtesy PRIMARY KEY (id_EncounterHospitalization_HT, id_CodeableConcept)
);

CREATE TABLE EncounterHospitalization_HTSpecialArrangement
(
	id_EncounterHospitalization_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterHospitalization_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EncounterHospitalization_HTSpecialArrangement PRIMARY KEY (id_EncounterHospitalization_HT, id_CodeableConcept)
);

CREATE TABLE EncounterStatusHistory_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	periodStart datetime,
	periodEnd datetime
);

CREATE TABLE EncounterStatusHistory
(
	id_Encounter uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Encounter(id),
	id_EncounterStatusHistory_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EncounterStatusHistory_HT(id),
	CONSTRAINT PK_EncounterStatusHistory PRIMARY KEY (id_Encounter, id_EncounterStatusHistory_HT)
);
