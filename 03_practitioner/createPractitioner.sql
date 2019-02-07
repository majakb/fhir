

CREATE TABLE Practitioner
(
	-- Mangler Identifier: Identifier (0..*)
	id uniqueidentifier NOT NULL PRIMARY KEY,
	active bit,
	gender nvarchar(255),
	birthDate date,
	-- humanName
	-- telecom
	-- address
	-- attachment
	-- communication
);

CREATE TABLE PractitionerHumanName -- Skal være: PractitionerName
(
	id_Practitioner uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Practitioner(id),
	id_HumanName uniqueidentifier NOT NULL FOREIGN KEY REFERENCES HumanName(id),
	CONSTRAINT PK_PractitionerHumanName PRIMARY KEY (id_Practitioner, id_HumanName)
);

CREATE TABLE PractitionerTelecom
(
	id_Practitioner uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Practitioner(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES contactPoint(id),
	CONSTRAINT PK_PractitionerTelecom PRIMARY KEY (id_Practitioner, id_ContactPoint)
);

CREATE TABLE PractitionerAddress
(
	id_Practitioner uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Practitioner(id),
	id_Address uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Address](id),
	CONSTRAINT PK_PractitionerAddress PRIMARY KEY (id_Practitioner, id_Address)
);

CREATE TABLE PractitionerAttachment
(
	id_Practitioner uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Practitioner(id),
	id_Attachment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Attachment(id),
	CONSTRAINT PK_PractitionerAttachment PRIMARY KEY (id_Practitioner, id_Attachment)
);

CREATE TABLE PractitionerCommunication
(
	id_Practitioner uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Practitioner(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_PractitionerCommunication PRIMARY KEY (id_Practitioner, id_CodeableConcept)
);

--- HJELPETABELL OG TILHØRENDE LINK ---

-- Denne er endret fra master. Het tidligere "Qualification" og var lagret som basetable.
CREATE TABLE PractitionerQualification_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	startPeriod date,
	endPeriod date,
	code_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	issuer_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
);

CREATE TABLE PractitionerQualification
(
	id_Practitioner uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Practitioner(id),
	id_PractitionerQualification_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerQualification_HT(id),
	CONSTRAINT PK_PractitionerQualification PRIMARY KEY (id_Practitioner, id_PractitionerQualification_HT)
);

