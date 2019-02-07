CREATE TABLE MedicationStatement
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	category_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- medication[x]: Type[1..1]
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	context_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	effectiveStart datetime,
	-- effective (start) (what to do with 'Type'?)
	effectiveEnd datetime,
	-- effective (end) (what to do with 'Type'?)
	dateAsserted datetime,
	informationSource_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
)

CREATE TABLE MedicationStatementIdentifier
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_MedicationStatementIdentifier PRIMARY KEY (id_MedicationStatement, id_Identifier)
)

CREATE TABLE MedicationStatementBasedOn
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_MedicationStatementBasedOn PRIMARY KEY (id_MedicationStatement, id_Reference)
)

CREATE TABLE MedicationStatementPartOf
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_MedicationStatementPartOf PRIMARY KEY (id_MedicationStatement, id_Reference)
)

CREATE TABLE MedicationStatementStatusReason 
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_MedicationStatementStatusReason PRIMARY KEY (id_MedicationStatement, id_CodeableConcept)
)

CREATE TABLE MedicationStatementDerivedFrom
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_MedicationStatementDerivedFrom PRIMARY KEY (id_MedicationStatement, id_Reference)
)

CREATE TABLE MedicationStatementReasonCode
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_MedicationStatementReasonCode PRIMARY KEY (id_MedicationStatement, id_CodeableConcept)
)

CREATE TABLE MedicationStatementReasonReference
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_MedicationStatementReasonReference PRIMARY KEY (id_MedicationStatement, id_Reference)
)

CREATE TABLE MedicationStatementNote
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_MedicationStatementNote PRIMARY KEY (id_MedicationStatement, id_Annotation)
)
CREATE TABLE MedicationStatementDosage
(
	id_MedicationStatement uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationStatement(id),
	id_Dosage uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Dosage(id),
	CONSTRAINT PK_MedicationStatementDosage PRIMARY KEY (id_MedicationStatement, id_Dosage)
)