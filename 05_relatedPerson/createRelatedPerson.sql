CREATE TABLE RelatedPerson
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	active bit,
	patient_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	gender nvarchar(255),		-- av typen Code(0..1). Bør være kodeverk bestående av de ulike typene kjønn.
	birthDate datetime,
	periodStart datetime,
	periodEnd datetime
)

CREATE TABLE RelatedPersonIdentifier 
(
	id_RelatedPerson uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPerson(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_RelatedPersonIdentifier PRIMARY KEY (id_RelatedPerson, id_Identifier)
)
CREATE TABLE RelatedPersonRelationship 
(
	id_RelatedPerson uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPerson(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_RelatedPersonRelationship PRIMARY KEY (id_RelatedPerson, id_CodeableConcept)
)
CREATE TABLE RelatedPersonName 
(
	id_RelatedPerson uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPerson(id),
	id_HumanName uniqueidentifier NOT NULL FOREIGN KEY REFERENCES HumanName(id),
	CONSTRAINT PK_RelatedPersonName PRIMARY KEY (id_RelatedPerson, id_HumanName)
)
CREATE TABLE RelatedPersonTelecom
(
	id_RelatedPerson uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPerson(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_RelatedPersonTelecom PRIMARY KEY (id_RelatedPerson, id_ContactPoint)
)
CREATE TABLE RelatedPersonAddress
(
	id_RelatedPerson uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPerson(id),
	id_Address uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Address](id),
	CONSTRAINT PK_RelatedPersonAddress PRIMARY KEY (id_RelatedPerson, id_Address)
)
CREATE TABLE RelatedPersonPhoto
(
	id_RelatedPerson uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPerson(id),
	id_Attachment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Attachment(id),
	CONSTRAINT PK_RelatedPersonPhoto PRIMARY KEY (id_RelatedPerson, id_Attachment)
)

CREATE TABLE RelatedPersonCommunication_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	language_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	preffered bit
);

CREATE TABLE RelatedPersonCommunication
(
	id_RelatedPerson uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPerson(id),
	id_RelatedPersonCommunication_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatedPersonCommunication_HT(id),
	CONSTRAINT PK_RelatedPersonCommunication PRIMARY KEY (id_RelatedPerson, id_RelatedPersonCommunication_HT)
)