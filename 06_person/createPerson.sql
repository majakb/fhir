CREATE TABLE Person
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	gender nvarchar(255),
	birthDate datetime,
	photo_Attachment uniqueidentifier FOREIGN KEY REFERENCES Attachment(id),
	managingOrganization_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	active bit,
)

CREATE TABLE PersonIdentifier
(
	id_Person uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Person(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_PersonIdentifier PRIMARY KEY (id_Person, id_Identifier)
)
CREATE TABLE PersonName
(
	id_Person uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Person(id),
	id_HumanName uniqueidentifier NOT NULL FOREIGN KEY REFERENCES HumanName(id),
	CONSTRAINT PK_PersonName PRIMARY KEY (id_Person, id_HumanName)
)
CREATE TABLE PersonTelecom
(
	id_Person uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Person(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_PersonTelecom PRIMARY KEY (id_Person, id_ContactPoint)
)
CREATE TABLE PersonAddress 
(
	id_Person uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Person(id),
	id_Address uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Address](id),
	CONSTRAINT PK_PersonAddress PRIMARY KEY (id_Person, id_Address)
)

CREATE TABLE PersonLink_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	target_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	assurance nvarchar(255)
)
CREATE TABLE PersonLink
(
	id_Person uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Person(id),
	id_PersonLink_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PersonLink_HT(id),
	CONSTRAINT PK_PersonLink PRIMARY KEY (id_Person, id_PersonLink_HT)
)