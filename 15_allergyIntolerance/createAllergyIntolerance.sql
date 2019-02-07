CREATE TABLE AllergyIntolerance
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	clinicalStatus_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	verificationStatus_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	[type] nvarchar(255),
	category nvarchar(255),
	criticality nvarchar(255),
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	patient_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	onset datetime,
	recordedDate datetime,
	recorder_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	asserter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	lastOccurence datetime,
	note_Annotation uniqueidentifier FOREIGN KEY REFERENCES Annotation(id),
)

CREATE TABLE AllergyIntoleranceNote
(
	id_AllergyIntolerance uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AllergyIntolerance(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id)
		CONSTRAINT PK_AllergyIntoleranceNote PRIMARY KEY (id_AllergyIntolerance, id_Annotation)
)

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE AllergyIntoleranceReaction_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	substance_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[description] nvarchar(255),
	onset datetime,
	severity nvarchar(255),
	exposureRoute_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	note_Annotation uniqueidentifier FOREIGN KEY REFERENCES Annotation(id),
)

CREATE TABLE AllergyIntoleranceReaction_HTManifestation
(
	id_AllergyIntoleranceReaction_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AllergyIntoleranceReaction_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AllergyIntoleranceReaction_HTManifestation PRIMARY KEY (id_AllergyIntoleranceReaction_HT, id_CodeableConcept),
)

Create TABLE AllergyIntoleranceReaction
(
	id_AllergyIntolerance uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AllergyIntolerance(id),
	id_AllergyIntoleranceReaction_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AllergyIntoleranceReaction_HT(id),
	CONSTRAINT PK_AllergyIntoleranceReaction PRIMARY KEY (id_AllergyIntolerance, id_AllergyIntoleranceReaction_HT)
)