CREATE TABLE CarePlan
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	intent nvarchar(255) NOT NULL,
	title nvarchar(255),
	[description] nvarchar(1023),
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	periodStart dateTime,
	periodEnd dateTime,
	created dateTime,
	author_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE CarePlanInstantiatesCanonical
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Canonical uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Canonical(id),
	CONSTRAINT PK_CarePlanInstantiatesCanonical			PRIMARY KEY (id_CarePlan, id_Canonical)
);

CREATE TABLE CarePlanInstatiatesUri
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Uri uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Uri(id),
	CONSTRAINT PK_CarePlanInstantiatesUri				PRIMARY KEY (id_CarePlan, id_Uri)
);

CREATE TABLE CarePlanBasedOn
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanBasedOn						PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanReplaces
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanReplaces						PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanPartOf
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanPartOf						PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanCategory
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_CarePlanCategory						PRIMARY KEY (id_CarePlan, id_CodeableConcept)
);

CREATE TABLE CarePlanContributor
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanContributor					PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanCareTeam
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanCareTeam						PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanAddresses
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanAddresses						PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanSupportingInfo
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanSupportingInfo				PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanGoal
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanGoal							PRIMARY KEY (id_CarePlan, id_Reference)
);

CREATE TABLE CarePlanNote
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_CarePlanNote							PRIMARY KEY (id_CarePlan, id_Annotation)
);

-- Hjelpetabeller og tilhørende referanser

CREATE TABLE CarePlanDetail_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	kind nvarchar(255),
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[status] nvarchar(255) NOT NULL,
	statusReason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	doNotPerform bit,
	--	schedule[x]: Type[0..1] 
	location_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	--  product[x]:  Type[0..1]
	dailyAmount_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	quantity_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id), 
	[description] nvarchar(1023)
);

CREATE TABLE CarePlanDetail_HTInstantiatesCanonical
(
	id_CarePlanDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanDetail_HT(id),
	id_Canonical uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Canonical(id),
	CONSTRAINT PK_CarePlanDetail_HTInstantiatesCanonical	PRIMARY KEY (id_CarePlanDetail_HT, id_Canonical)
);

CREATE TABLE CarePlanDetail_HTInstantiatesUri
(
	id_CarePlanDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanDetail_HT(id),
	id_Uri uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Uri(id),
	CONSTRAINT PK_CarePlanDetail_HTInstantiatesUri			PRIMARY KEY (id_CarePlanDetail_HT, id_Uri)
);

CREATE TABLE CarePlanDetail_HTReasonCode
(
	id_CarePlanDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanDetail_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_CarePlanDetail_HTReasonCode				PRIMARY KEY (id_CarePlanDetail_HT, id_CodeableConcept)
);

CREATE TABLE CarePlanDetail_HTReasonReference
(
	id_CarePlanDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanDetail_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanDetail_HTReasonReference			PRIMARY KEY (id_CarePlanDetail_HT, id_Reference)
);

CREATE TABLE CarePlanDetail_HTGoal
(
	id_CarePlanDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanDetail_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanDetail_HTGoal						PRIMARY KEY (id_CarePlanDetail_HT, id_Reference)
);

CREATE TABLE CarePlanDetail_HTPerformer
(
	id_CarePlanDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanDetail_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanDetail_HTPerformer				PRIMARY KEY (id_CarePlanDetail_HT, id_Reference)
);

CREATE TABLE CarePlanActivity_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	reference_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	detail_CarePlanDetail_HT uniqueidentifier FOREIGN KEY REFERENCES CarePlanDetail_HT(id)
);

CREATE TABLE CarePlanActivity_HTOutcomeCodeableConcept
(
	id_CarePlanActivity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanActivity_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_CarePlanActivity_HTOutcomeCodeableConcept PRIMARY KEY (id_CarePlanActivity_HT, id_CodeableConcept)
);

CREATE TABLE CarePlanActivity_HTOutcomeReference
(
	id_CarePlanActivity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanActivity_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CarePlanActivity_HTOutcomeReference		PRIMARY KEY (id_CarePlanActivity_HT, id_Reference)
);

CREATE TABLE CarePlanActivity_HTProgress
(
	id_CarePlanActivity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanActivity_HT(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_CarePlanActivity_HTProgress				PRIMARY KEY (id_CarePlanActivity_HT, id_Annotation)
);

CREATE TABLE CarePlanActivity
(
	id_CarePlan uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlan(id),
	id_CarePlanActivity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CarePlanActivity_HT(id),
	CONSTRAINT PK_CarePlanActivity							PRIMARY KEY (id_CarePlan, id_CarePlanActivity_HT)
);