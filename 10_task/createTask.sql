CREATE TABLE TaskRestriction_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	repetitions int,
	periodStart datetime,
	periodEnd datetime,
	-- recipient																
)

CREATE TABLE Task
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	instantiatesCanonical_Canonical uniqueidentifier FOREIGN KEY REFERENCES Canonical(id),
	instantiatesUri_Uri uniqueidentifier FOREIGN KEY REFERENCES Uri(id),
	groupIdentifier_Identifer uniqueidentifier FOREIGN KEY REFERENCES Identifier(id),
	[status] nvarchar(255) NOT NULL,
	statusReason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	businessStatus_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	intent nvarchar(255) NOT NULL,
	[priority] nvarchar(255),
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[description] nvarchar(255),
	focus_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	for_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	executionPeriodStart datetime,
	executionPeriodEnd datetime,
	authoredOn datetime,
	lastModified datetime,
	requester_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	owner_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	location_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	reasonCode_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	reasonReference_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	restriction_TaskRestriction_HT uniqueidentifier FOREIGN KEY REFERENCES TaskRestriction_HT(id)
)
CREATE TABLE TaskIdentifier
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_TaskIdentifier PRIMARY KEY (id_Task, id_Identifier)
)

CREATE TABLE TaskBasedOn
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_TaskBasedOn PRIMARY KEY (id_Task, id_Reference)
)

CREATE TABLE TaskPartOf
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_TaskPartOf PRIMARY KEY (id_Task, id_Reference)
)

CREATE TABLE TaskPerformerType
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_TaskPerformerType PRIMARY KEY (id_Task, id_CodeableConcept)
)

CREATE TABLE TaskInsurance -- insurance
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_TaskInsurance PRIMARY KEY (id_Task, id_Reference)
)

CREATE TABLE TaskRelevantHistory -- relevantHistory
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_TaskRelevantHistory PRIMARY KEY (id_Task, id_Reference)
)

CREATE TABLE TaskNote -- note ('Annotation' table does already exist in v?)
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_TaskNote PRIMARY KEY (id_Task, id_Annotation)
)

-- Hjelpetabeller og tilhørende relasjon

CREATE TABLE TaskRestriction_HTRecipient
(
	id_TaskRestriction_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES TaskRestriction_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_RestrictionRecipient PRIMARY KEY (id_TaskRestriction_HT, id_Reference)
)

CREATE TABLE TaskParameter_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	type_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	[value] nvarchar(255) NOT NULL													
)

CREATE TABLE TaskInput
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_TaskParameter_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES TaskParameter_HT(id),
	CONSTRAINT PK_TaskInput PRIMARY KEY (id_Task, id_TaskParameter_HT)
)

CREATE TABLE TaskOutput_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	type_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	[value] nvarchar(255) NOT NULL															
)

CREATE TABLE TaskOutput
(
	id_Task uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Task(id),
	id_TaskOutput_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES TaskOutput_HT(id),
	CONSTRAINT PK_TaskOutput PRIMARY KEY (id_Task, id_TaskOutput_HT)
)