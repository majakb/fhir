CREATE TABLE AdverseEvent
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	actuality nvarchar(255),
	event_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	[date] datetime,
	detected datetime,
	recordedDate datetime,
	location_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	seriousness_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	severity_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	outcome_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	recorder_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
)

CREATE TABLE AdverseEventCategory
(
	id_AdverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AdverseEventCategory PRIMARY KEY (id_AdverseEvent, id_CodeableConcept),
)

CREATE TABLE AdverseEventResultingCondition
(
	id_AdverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventResultingCondition PRIMARY KEY (id_AdverseEvent, id_Reference),
)

CREATE TABLE AdverseEventContributor
(
	id_AdverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventContributor PRIMARY KEY (id_AdverseEvent, id_Reference),
)

CREATE TABLE AdverseEventSubjectMedicalHistory
(
	id_AdverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseSubjectMedicalHistory PRIMARY KEY (id_AdverseEvent, id_Reference),
)

CREATE TABLE AdverseEventReferenceDocument
(
	id_AdverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventReferenceDocument PRIMARY KEY (id_AdverseEvent, id_Reference),	
)

CREATE TABLE AdverseEventStudy
(
	id_AdverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventStudy PRIMARY KEY (id_AdverseEvent, id_Reference),
)

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE AdverseEventSuspectEntity_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	instance_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
)

CREATE TABLE AdverseEventSuspectEntity
(
	id_AdverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_AdverseEventSuspectEntity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEventSuspectEntity_HT(id),
	CONSTRAINT PK_AdverseEventSuspectEntity PRIMARY KEY (id_AdverseEvent, id_AdverseEventSuspectEntity_HT)
)

CREATE TABLE AdverseEventCausality_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	assessment_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	productRelatedness nvarchar(255),
	author_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	method_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
)

CREATE TABLE AdverseEventSuspectEntity_HTCausality
(
	id_AdverseEventSuspectEntity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEventSuspectEntity_HT(id),
	id_AdverseEventCausality_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEventCausality_HT(id),
	CONSTRAINT PK_AdverseEventSuspetEntity_HTCausality PRIMARY KEY (id_AdverseEventSuspectEntity_HT, id_AdverseEventCausality_HT),
)
