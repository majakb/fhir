CREATE TABLE ClinicalImpression
(	
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	statusReason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	code_COdeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[description] nvarchar(255),
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- effective[x]
	[date] datetime,
	assessor_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	previous_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	uri nvarchar(255),
	summary nvarchar(255),
)

CREATE TABLE ClinicalImpressionProblem
(
	id_ClinicalImpression uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpression(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClinicalImpressionProblem PRIMARY KEY (id_ClinicalImpression, id_Reference)
)

CREATE TABLE ClinicalImpressionPrognosisCodeableConcept
(
	id_ClinicalImpression uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpression(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClinicalImpressionPrognosisCodeableConcept PRIMARY KEY (id_ClinicalImpression, id_CodeableConcept)
)

CREATE TABLE ClinicalImpressionPrognosisReference
(
	id_ClinicalImpression uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpression(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClinicalImpressionPrognosisReference PRIMARY KEY (id_ClinicalImpression, id_Reference),
)

CREATE TABLE ClinicalImpressionSupportingInfo
(
	id_ClinicalImpression uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpression(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClinicalImpressionSupportingInfo PRIMARY KEY (id_ClinicalImpression, id_Reference),
)

CREATE TABLE ClinicalImpressionNote
(
	id_ClinicalImpression uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpression(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClinicalImpressionNote PRIMARY KEY (id_ClinicalImpression, id_Annotation),
)

-- Hjelpetabeller med tilhørende referanser

CREATE TABLE ClinicalImpressionInvestigation_HT
( 
	id uniqueidentifier NOT NULL PRIMARY KEY,
	code uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
)

CREATE TABLE ClinicalImpressionInvestigation_HTItem
(
	id_ClinicalImpressionInvestigation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpressionInvestigation_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClinicalImpressionInvestigation_HTItem PRIMARY KEY (id_ClinicalImpressionInvestigation_HT, id_Reference)
)

CREATE TABLE ClinicalImpressionInvestigation
(
	id_ClinicalImpression uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpression(id),
	id_ClinicalImpressionInvestigation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpressionInvestigation_HT(id),
	CONSTRAINT PK_ClinicalImpressionInvestigation PRIMARY KEY (id_ClinicalImpression, id_ClinicalImpressionInvestigation_HT),
)

CREATE TABLE ClinicalImpressionFinding_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	itemCodeableConcept_CodeableConcept UNIQUEIDENTIFIER FOREIGN KEY REFERENCES CodeableConcept(id),
	itemReference_Reference UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Reference(id),
	basis nvarchar(255),
)

CREATE TABLE ClinicalImpressionFinding
(
	id_ClinicalImpression uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpression(id),
	id_ClinicalImpressionFinding_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClinicalImpressionFinding_HT(id),
	CONSTRAINT PK_ClinicalImpressionFinding PRIMARY KEY (id_ClinicalImpression, id_ClinicalImpressionFinding_HT),
)
