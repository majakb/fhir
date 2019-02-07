-- Mangler hjelpetabeller "Position" og "HoursOfOperation"!

CREATE TABLE [Location] 
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	operationalStatus nvarchar(255),
	[name] nvarchar(255),
	alias nvarchar(255), --what to do ? string [0..*]
	[description] nvarchar(255),
	mode nvarchar(255),
	[address] nvarchar(255),
	availabilityExeptions nvarchar(255),
	physicalType_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	managingOrganization_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	partOf_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	endpoint_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
	--type
	--telecom
);

CREATE TABLE LocationType
(
	id_Location uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Location](id),
	id_CodableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_LocationType PRIMARY KEY (id_Location, id_CodableConcept)
);

CREATE TABLE LocationTelecom
(
	id_Location uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Location](id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_LocationTelecom PRIMARY KEY (id_Location, id_ContactPoint)
);
