-- MANGLER HJELPETABELLER?

CREATE TABLE Patient
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	active bit,
	gender nvarchar(255),
	birthDate date,
	deceased bit,
	maritalStatus_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	managingOrganization_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- address
	-- attachment
	-- generealPractitioner
	-- humanName
	-- identifier
	-- telecom
	-- link
	-- contact
	-- communication
);

CREATE TABLE PatientIdentifier
(
	id_Patient uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Patient(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_PatientIdentitier 								PRIMARY KEY (id_Patient, id_Identifier)
);

CREATE TABLE PatientHumanName
(
	id_Patient uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Patient(id),
	id_HumanName uniqueidentifier NOT NULL FOREIGN KEY REFERENCES HumanName(id),
	CONSTRAINT PK_PatientHumanName 									PRIMARY KEY (id_Patient, id_HumanName)
);

CREATE TABLE PatientTelecom
(
	id_Patient uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Patient(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_PatientTelecom 									PRIMARY KEY (id_Patient, id_ContactPoint)
);

CREATE TABLE PatientAddress
(
	id_Patient uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Patient(id),
	id_Address uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Address](id),
	CONSTRAINT PK_PatientAddress 									PRIMARY KEY (id_Patient, id_Address)
);

CREATE TABLE PatientAttachment
(
	id_Patient uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Patient(id),
	id_Attachment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Attachment(id),
	CONSTRAINT PK_PatientAttachment 								PRIMARY KEY (id_Patient, id_Attachment)
);

CREATE TABLE PatientGeneralPractitioner
(
	id_Patient uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Patient(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_PatientGeneralPractitioner 						PRIMARY KEY (id_Patient, id_Reference)
);

