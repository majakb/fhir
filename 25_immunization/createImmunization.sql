CREATE TABLE Immunization
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	statusReason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	vaccineCode_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	patient_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- occurence[x]: Type[1..1]
	recorded datetime,
	primarySource bit,
	reportOrigin_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	location_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	manufacturer_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	lotNumber nvarchar(255),
	expirationDate date,
	site_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	route_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	doseQuantity_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	isSubpotent bit,
	fundingSource_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id)
);

CREATE TABLE ImmunizationNote
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_ImmunizationNote									PRIMARY KEY (id_Immunization, id_Annotation)
);

CREATE TABLE ImmunizationReasonCode
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ImmunizationReasonCode								PRIMARY KEY (id_Immunization, id_CodeableConcept)
);

CREATE TABLE ImmunizationReasonReference
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ImmunizationReasonReference						PRIMARY KEY (id_Immunization, id_Reference)
);

CREATE TABLE ImmunizationSubpotentReason
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ImmunizationSubpotentReason						PRIMARY KEY (id_Immunization, id_CodeableConcept)
);

CREATE TABLE ImmunizationProgramEligibility
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ImmunizationProgramEligibility						PRIMARY KEY (id_Immunization, id_CodeableConcept)
);

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE ImmunizationEducation_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	documentType nvarchar(255),
	reference_Uri uniqueidentifier FOREIGN KEY REFERENCES Uri(id),
	publicationDate dateTime,
	presentationDate dateTime
);

CREATE TABLE ImmunizationEducation
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_ImmunizationEducation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ImmunizationEducation_HT(id),
	CONSTRAINT PK_ImmunizationEducation								PRIMARY KEY (id_Immunization, id_ImmunizationEducation_HT)
);

CREATE TABLE ImmunizationReaction_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[date] dateTime,
	detail_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	reported bit
);

CREATE TABLE ImmunizationReaction
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_ImmunizationReaction_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ImmunizationReaction_HT(id),
	CONSTRAINT PK_ImmunizationReaction								PRIMARY KEY (id_Immunization, id_ImmunizationReaction_HT)
);

CREATE TABLE ImmunizationProtocolApplied_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	series nvarchar(255),
	authority_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
	-- doseNumber[x]					av typen Type(1..1)	NOT NULL
	-- seriesDoses[x]					av typen Type(1..1)
);

CREATE TABLE ImmunizationProtocolApplied_HTTargetDisease
(
	id_ImmunizationProtocolApplied_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ImmunizationProtocolApplied_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ImmunizationProtocolApplied_HTTargetDisease			PRIMARY KEY(id_ImmunizationProtocolApplied_HT, id_CodeableConcept)
);

CREATE TABLE ImmunizationProtocolApplied
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_ImmunizationProtocolApplied_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ImmunizationProtocolApplied_HT(id),
	CONSTRAINT PK_ImmunizationProtocolApplied							PRIMARY KEY (id_Immunization, id_ImmunizationProtocolApplied_HT)
);

CREATE TABLE ImmunizationPerformer_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	function_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	actor_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE ImmunizationPerformer
(
	id_Immunization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Immunization(id),
	id_ImmunizationPerformer_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ImmunizationPerformer_HT(id),
	CONSTRAINT PK_ImmunizationPerformer								PRIMARY KEY (id_Immunization, id_ImmunizationPerformer_HT)
);