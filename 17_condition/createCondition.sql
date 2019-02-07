CREATE TABLE Condition
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	clinicalStatus_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	verificationStatus_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	severity_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	--onset[X]
	--abatment[X]
	recordedDate datetime,
	recorder_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	asserter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
);

CREATE TABLE ConditionCategory
(
	id_Condition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Condition(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ConditionCategory PRIMARY KEY (id_Condition, id_CodeableConcept)
);

CREATE TABLE ConditionBodySite
(
	id_Condition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Condition(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ConditionBodySite PRIMARY KEY (id_Condition, id_CodeableConcept)
);

CREATE TABLE ConditionNote
(
	id_Condition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Condition(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_ConditionNote PRIMARY KEY (id_Condition, id_Annotation)
);

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE ConditionStage_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	summary_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	type_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id)
);

CREATE TABLE ConditionStage_HTAssessment
(
	id_ConditionStage_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ConditionStage_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ConditionStage_HTAssessment PRIMARY KEY (id_ConditionStage_HT, id_Reference)
);

CREATE TABLE ConditionStage
(
	id_Condition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Condition(id),
	id_ConditionStage_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ConditionStage_HT(id),
	CONSTRAINT PK_ConditionStage PRIMARY KEY (id_Condition, id_ConditionStage_HT)
);

CREATE TABLE ConditionEvidence_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY
);

CREATE TABLE ConditionEvidence_HTCode
(
	id_ConditionEvidence_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ConditionEvidence_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ConditionEvidence_HTCode PRIMARY KEY (id_ConditionEvidence_HT, id_CodeableConcept)
);

CREATE TABLE ConditionEvidence_HTDetail
(
	id_ConditionEvidence_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ConditionEvidence_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ConditionEvidence_HTDetail PRIMARY KEY(id_ConditionEvidence_HT, id_Reference)
);

CREATE TABLE ConditionEvidence
(
	id_Condition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Condition(id),
	id_ConditionEvidence_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ConditionEvidence_HT(id),
	CONSTRAINT PK_ConditionEvidence PRIMARY KEY (id_Condition, id_ConditionEvidence_HT)
);
